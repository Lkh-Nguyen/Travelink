/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.travelink.Servlet;

import com.travelink.Database.HotelDB;
import com.travelink.Database.OwnedHotelDB;
import com.travelink.Database.RoomDB;
import com.travelink.Model.Account;
import com.travelink.Model.Hotel;
import com.travelink.Model.Reservation;
import com.travelink.Model.Room;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author MSI
 */
public class HotelHost_AvailableSerlvet extends HttpServlet {

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
            out.println("<title>Servlet HotelHost_AvailableSerlvet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HotelHost_AvailableSerlvet at " + request.getContextPath() + "</h1>");
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
        String startDay = request.getParameter("startDate");
        String endDay = request.getParameter("endDate");
        java.sql.Date checkInDate = null;
        java.sql.Date checkOutDate = null;
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            checkInDate = new java.sql.Date(dateFormat.parse(startDay).getTime());
            checkOutDate = new java.sql.Date(dateFormat.parse(endDay).getTime());
        } catch (ParseException e) {
            e.printStackTrace(); // Xử lý ngoại lệ phân tích cú pháp một cách thích hợp
        }
        int hotelID = Integer.parseInt(request.getParameter("hotelID"));
        // hotel
        request.setAttribute("hotel", HotelDB.getHotelByID(hotelID));
        List<Room> roomList = RoomDB.getActiveRoomsByHotel_ID(hotelID);
        // roomList
        request.setAttribute("roomList", roomList);
        // numberOfRoom
        List<Integer> availableList = new ArrayList<>();
        List<Integer> reservedList = new ArrayList<>();
        List<Reservation> reservationCoincide = RoomDB.reservationCoincide(checkInDate, checkOutDate);
        int numberRoomOfHotel = 0;
        for (Room room : roomList) {
            numberRoomOfHotel += room.getTotalRooms();
            int available = RoomDB.numberOfRoomAvailableByTime(room.getRoom_ID(), checkInDate, checkInDate, reservationCoincide);
            availableList.add(available);
            reservedList.add(room.getTotalRooms() - available);
        }
        request.setAttribute("startDate", checkInDate);
        request.setAttribute("endDate", checkOutDate);
        request.setAttribute("availableList", availableList);
        request.setAttribute("reservedList", reservedList);
        // number rooms of hotel
        request.setAttribute("numberRoomOfHotel", numberRoomOfHotel);
        request.setAttribute("status", 1);
        //==================================================================================
        HttpSession session = request.getSession();
        Account hotelHostAccount = (Account) session.getAttribute("account");
        // check hotel is own of hotelHostAccount
        List<Hotel> hotelAccountList = OwnedHotelDB.getHotelsByAccountID(hotelHostAccount.getAccount_ID());
        request.setAttribute("hotel_list", hotelAccountList);
        //==================================================================================
        // search filter
        List<Integer> roomCheck = new ArrayList<>();
        for (int i = 0; i < roomList.size(); i++) {
            roomCheck.add(Integer.parseInt(request.getParameter("room" + i)));
        }
        request.getRequestDispatcher("HotelHost_BookingSchedule.jsp").forward(request, response);
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
        List<Integer> checkBoxList = (List<Integer>) session.getAttribute("checkBoxList");
        String startDay = request.getParameter("startDate");
        String endDay = request.getParameter("endDate");
        java.sql.Date checkInDate = null;
        java.sql.Date checkOutDate = null;
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            checkInDate = new java.sql.Date(dateFormat.parse(startDay).getTime());
            checkOutDate = new java.sql.Date(dateFormat.parse(endDay).getTime());
        } catch (ParseException e) {
            e.printStackTrace(); // Xử lý ngoại lệ phân tích cú pháp một cách thích hợp
        }
        int hotelID = Integer.parseInt(request.getParameter("hotelID"));
        // hotel
        request.setAttribute("hotel", HotelDB.getHotelByID(hotelID));
        List<Room> roomList = new ArrayList<>();
        List<Room> roomList1 = RoomDB.getActiveRoomsByHotel_ID(hotelID);

        if (request.getParameter("all") == null) {
            roomList =roomList1;
            
        }else if(request.getParameter("all").equals("all")){
            roomList =roomList1;
        }
        else{
            for (Room room : roomList1) {
                for (Integer i : checkBoxList) {
                    if (i == room.getRoom_ID()) {
                        roomList.add(room);
                    }
                }
            }
        }
        int numberRoomOfHotel = 0;
        for (Room room : roomList1) {
            numberRoomOfHotel += room.getTotalRooms();
        }

        // roomList
        request.setAttribute("roomList", roomList1);
        request.setAttribute("checkBoxList", checkBoxList);
        // numberOfRoom
        List<Integer> availableList = new ArrayList<>();
        List<Integer> reservedList = new ArrayList<>();
        List<Reservation> reservationCoincide = RoomDB.reservationCoincide(checkInDate, checkOutDate);

        for (Room room : roomList) {

            int available = RoomDB.numberOfRoomAvailableByTime(room.getRoom_ID(), checkInDate, checkInDate, reservationCoincide);
            availableList.add(available);
            reservedList.add(room.getTotalRooms() - available);
        }
        request.setAttribute("startDate", checkInDate);
        request.setAttribute("endDate", checkOutDate);
        request.setAttribute("availableList", availableList);
        request.setAttribute("reservedList", reservedList);
        // number rooms of hotel
        request.setAttribute("numberRoomOfHotel", numberRoomOfHotel);
        request.setAttribute("status", 1);
        //==================================================================================
        Account hotelHostAccount = (Account) session.getAttribute("account");
        // check hotel is own of hotelHostAccount
        List<Hotel> hotelAccountList = OwnedHotelDB.getHotelsByAccountID(hotelHostAccount.getAccount_ID());
        request.setAttribute("hotel_list", hotelAccountList);
        //==================================================================================
        // search day 
        request.getRequestDispatcher("HotelHost_BookingSchedule.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
