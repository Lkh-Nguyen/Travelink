/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.travelink.Servlet;

import com.travelink.Database.HotelDB;
import com.travelink.Database.HotelImageDB;
import com.travelink.Database.ProvinceDB;
import com.travelink.Database.ReservationDB;
import com.travelink.Database.ReservedRoomDB;
import com.travelink.Database.RoomDB;
import com.travelink.Model.Hotel;
import com.travelink.Model.HotelImage;
import com.travelink.Model.Province;
import com.travelink.Model.Reservation;
import com.travelink.Model.ReservedRoom;
import com.travelink.Model.Room;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DUYAN
 */
public class SearchHotelServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SearchHotelServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchHotelServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Province> locationList = ProvinceDB.getAllProvince();
        request.setAttribute("locationList", locationList);
        request.getRequestDispatcher("Search_Hotel.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String location = request.getParameter("location");
        int people = Integer.parseInt(request.getParameter("number_of_people"));
        int roomSize = Integer.parseInt(request.getParameter("number_of_rooms"));
        String start_date = request.getParameter("check_in_date");
        String end_date = request.getParameter("check_out_date");
        java.sql.Date checkInDate = null;
        java.sql.Date checkOutDate = null;
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            checkInDate = new java.sql.Date(dateFormat.parse(start_date).getTime());
            checkOutDate = new java.sql.Date(dateFormat.parse(end_date).getTime());
        } catch (ParseException e) {
            e.printStackTrace(); // Xử lý ngoại lệ phân tích cú pháp một cách thích hợp
        }
// kiểm tra điều kiện ngày bắt đầu và ngày kết thúc
        if (checkInDate.after(checkOutDate)) {
            request.setAttribute("statusDate", "Ngày trả phòng không hợp lệ!");
            request.getRequestDispatcher("Search_Hotel.jsp").forward(request, response);
        } else {
            // kiểm tra vị trí
            List<Hotel> hotelList = null;
            try {
                hotelList = HotelDB.filterProvince(location);
            } catch (SQLException ex) {
                Logger.getLogger(SearchHotelServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            List<Hotel> newHotelList = new ArrayList<>();

            List<Reservation> check1 = RoomDB.reservationCoincide(checkInDate, checkOutDate);
            List<Date> dateList = RoomDB.getDateRange(checkInDate, checkOutDate);

            // Bộ nhớ đệm tất cả các phòng và đặt chỗ
            Map<Integer, Room> roomCache = new HashMap<>();
            for (Room room : RoomDB.getAllRooms()) {
                roomCache.put(room.getRoom_ID(), room);
            }

            Map<Integer, List<ReservedRoom>> reservedRoomsByReservation = new HashMap<>();
            for (Reservation reservation : ReservationDB.getAllReservations()) {
                reservedRoomsByReservation.put(reservation.getReservationID(), ReservedRoomDB.getReservedRoomsByReservationID(reservation.getReservationID()));
            }

            // Tính trước tình trạng phòng trống cho mỗi ngày
            Map<Integer, Map<Date, Integer>> roomAvailability = new HashMap<>();
            for (Room room : roomCache.values()) {
                Map<Date, Integer> availabilityByDate = new HashMap<>();
                for (Date date : dateList) {
                    availabilityByDate.put(date, RoomDB.numberOfRoomAvailableByDate(room.getRoom_ID(), date, check1, reservedRoomsByReservation));
                }
                roomAvailability.put(room.getRoom_ID(), availabilityByDate);
            }

            // Tính công suất khách sạn
            Map<Integer, Map<Date, Integer>> hotelCapacity = new HashMap<>();
            for (Hotel hotel : hotelList) {
                Map<Date, Integer> capacityByDate = new HashMap<>();
                for (Date date : dateList) {
                    int totalCapacity = 0;
                    for (Room room : RoomDB.getRoomsByHotel_ID(hotel.getHotel_ID())) {
                        totalCapacity += roomAvailability.get(room.getRoom_ID()).get(date) * room.getCapacity();
                    }
                    capacityByDate.put(date, totalCapacity);
                }
                hotelCapacity.put(hotel.getHotel_ID(), capacityByDate);
            }

            // Lọc các khách sạn dựa trên tình trạng phòng trống
            for (Hotel hotel : hotelList) {
                boolean isAvailable = true;
                for (Date date : dateList) {
                    if (hotelCapacity.get(hotel.getHotel_ID()).get(date) < people) {
                        isAvailable = false;
                        break;
                    }
                }
                if (isAvailable) {
                    newHotelList.add(hotel);
                }
            }

            List<String> hotelImmageList = new ArrayList<>();
            for (int i = 0; i < newHotelList.size(); i++) {
                List<HotelImage> hotelImgList = HotelImageDB.getHotelImagesByHotelID(newHotelList.get(i).getHotel_ID());
                String img = hotelImgList.get(0).getUrl();
                hotelImmageList.add(img);
            }
            HttpSession session = request.getSession();
            session.setAttribute("checkInDate", checkInDate);
            session.setAttribute("checkOutDate", checkOutDate);
            request.setAttribute("hotelList", newHotelList);
            request.setAttribute("hotelImgList", hotelImmageList);
            request.getRequestDispatcher("Search_Hotel.jsp").forward(request, response);
        }

    }

}

/**
 * Returns a short description of the servlet.
 *
 * @return a String containing servlet description
 */
