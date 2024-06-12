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
import com.travelink.Model.RoomImage;
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
import java.time.LocalDate;
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
        HttpSession session = request.getSession();
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
        
        LocalDate currentDate = LocalDate.now();
        LocalDate checkInDateLocal = checkInDate.toLocalDate();
        System.out.println("Checkin: " + checkInDate );
        System.out.println(currentDate);
        // check điều kiện ngày hiện tại và ngày check in
        if (currentDate.isAfter(checkInDateLocal)) {
            request.setAttribute("location", location);
            request.setAttribute("people", people);
            request.setAttribute("room", roomSize);
            session.setAttribute("checkInDate", checkInDate);
            session.setAttribute("checkOutDate", checkOutDate);
            request.setAttribute("statusBeginDate", "Date checkin is disable");
            List<Province> locationList = ProvinceDB.getAllProvince();
            request.setAttribute("locationList", locationList);
            request.getRequestDispatcher("Search_Hotel.jsp").forward(request, response);
        }
        // check điều kiệu số phòng và số người 
         int max = 0;
        for (Room room : RoomDB.getAllRooms()) {
            if (room.getCapacity() >= max) {
                max = room.getCapacity();
            }
        }
        if (roomSize > people || (roomSize * max) < people ) {
            request.setAttribute("location", location);
            request.setAttribute("people", people);
            request.setAttribute("room", roomSize);
            session.setAttribute("checkInDate", checkInDate);
            session.setAttribute("checkOutDate", checkOutDate);
            request.setAttribute("statusRoomAndPeople", "Room and People is disable");
            List<Province> locationList = ProvinceDB.getAllProvince();
            request.setAttribute("locationList", locationList);
            request.getRequestDispatcher("Search_Hotel.jsp").forward(request, response);
        }


        
        // kiểm tra điều kiện ngày bắt đầu và ngày kết thúc
        if (checkInDate.after(checkOutDate) || checkInDate.equals(checkOutDate)) {
            request.setAttribute("location", location);
            request.setAttribute("people", people);
            request.setAttribute("room", roomSize);
            session.setAttribute("checkInDate", checkInDate);
            session.setAttribute("checkOutDate", checkOutDate);
            request.setAttribute("statusDate", "Date checkout is disable");
            List<Province> locationList = ProvinceDB.getAllProvince();
            request.setAttribute("locationList", locationList);
            request.getRequestDispatcher("Search_Hotel.jsp").forward(request, response);
        } else {
            List<Hotel> newHotelList = new ArrayList<>();
            List<Hotel> hotelList = new ArrayList<>();
            try {
                hotelList = HotelDB.filterProvince(location);
            } catch (SQLException ex) {
                Logger.getLogger(SearchHotelServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            List<Reservation> check1 = RoomDB.reservationCoincide(checkInDate, checkOutDate);
            List<Date> dateList = RoomDB.getDateRange(checkInDate, checkOutDate);
            List<Integer> hotelSizeList = new ArrayList<>();
            List<Integer> capacitySizeList = new ArrayList<>();
            for (Hotel hotel : hotelList) {
                int roomHotelAvailable = 0;
                int capacityHotelList = 0;
                for (Room room : RoomDB.getRoomsByHotel_ID(hotel.getHotel_ID())) {
                    roomHotelAvailable = roomHotelAvailable + RoomDB.numberOfRoomAvailableByTime(room.getRoom_ID(), checkInDate, checkOutDate, check1);
                    capacityHotelList = capacityHotelList + room.getCapacity() * roomHotelAvailable;
                }
                hotelSizeList.add(roomHotelAvailable);
                capacitySizeList.add(capacityHotelList);

            }
            for (int i = 0; i < hotelList.size(); i++) {
//                PrintWriter printWriter = response.getWriter();
//                printWriter.println(hotelSizeList.get(i));
//                printWriter.println(capacitySizeList.get(i));
//                 printWriter.println("=================================================");
                if (hotelSizeList.get(i) >= roomSize && capacitySizeList.get(i) >= people) {
                    newHotelList.add(hotelList.get(i));
                }
            }
            List<String> hotelImageList = new ArrayList<>();
            for (int i = 0; i < newHotelList.size(); i++) {
                List<HotelImage> hotelImgList = HotelImageDB.getHotelImagesByHotelID(newHotelList.get(i).getHotel_ID());
                PrintWriter printWriter = response.getWriter();

                String img = hotelImgList.get(0).getUrl();
                hotelImageList.add(img);
            }

            List<Province> locationList = ProvinceDB.getAllProvince();
            request.setAttribute("locationList", locationList);
            session.setAttribute("checkInDate", checkInDate);
            session.setAttribute("checkOutDate", checkOutDate);
            request.setAttribute("hotelList", newHotelList);
            request.setAttribute("location", location);
            request.setAttribute("people", people);
            request.setAttribute("room", roomSize);
            request.setAttribute("hotelImgList", hotelImageList);
            PrintWriter printWriter = response.getWriter();
            printWriter.print(location);
            request.getRequestDispatcher("Search_Hotel.jsp").forward(request, response);
        }

    }

}

/**
 * Returns a short description of the servlet.
 *
 * @return a String containing servlet description
 */
