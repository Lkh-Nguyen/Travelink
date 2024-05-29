/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.travelink.Servlet;

import com.travelink.Database.HotelDB;
import com.travelink.Database.ReservationDB;
import com.travelink.Database.ReservedRoomDB;
import com.travelink.Database.RoomDB;
import com.travelink.Model.Hotel;
import com.travelink.Model.Reservation;
import com.travelink.Model.ReservedRoom;
import com.travelink.Model.Room;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

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
        String location = request.getParameter("location");
        int numberOfPeople;
        try {
            numberOfPeople = Integer.parseInt(request.getParameter("number_of_people"));
        } catch (NumberFormatException e) {
            // Handle parsing error (e.g., invalid number format)
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid number of people!");
            return;
        }

        String checkInDate = request.getParameter("check_in_date");
        String checkOutDate = request.getParameter("check_out_date");
        int numberOfRooms;
        try {
            numberOfRooms = Integer.parseInt(request.getParameter("number_of_rooms"));
        } catch (NumberFormatException e) {
            // Handle parsing error (e.g., invalid number format)
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid number of rooms!");
            return;
        }

        // Handle potential null values for date parameters
        LocalDate checkInDateLocalDate = null;
        if (checkInDate != null) {
            try {
                checkInDateLocalDate = LocalDate.parse(checkInDate);
            } catch (Exception e) {
                // Handle parsing error (e.g., invalid date format)
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid check-in date!");
                return;
            }
        }

        LocalDate checkOutDateLocalDate = null;
        if (checkOutDate != null) {
            try {
                checkOutDateLocalDate = LocalDate.parse(checkOutDate);
            } catch (Exception e) {
                // Handle parsing error (e.g., invalid date format)
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid check-out date!");
                return;
            }
        }

        // Perform hotel search with proper date handling
        List<Hotel> hotelFirstFilter = filterHotelByLocation(location);
        List<Hotel> hotels = filterHotelByNumber(hotelFirstFilter, numberOfPeople, numberOfRooms, checkInDateLocalDate, checkOutDateLocalDate);
        // Lưu danh sách khách sạn vào request
        request.setAttribute("hotels", hotels);
        // Chuyển hướng đến trang Search_Hotel.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("Search_Hotel.jsp");
        dispatcher.forward(request, response);
    }

    //Filter by Location
    private List<Hotel> filterHotelByLocation(String location) {
        List<Hotel> filteredHotels = new ArrayList<>();

        // 1. Filter hotels by location
            List<Hotel> hotels = HotelDB.getHotelsByProvince(location);
            filteredHotels.addAll(hotels);

        // 2. Filter hotels by number of rooms and capacity

        return filteredHotels;
    }

    //Filter by number
    private List<Hotel> filterHotelByNumber(List<Hotel> filteredHotels, int numberOfGuests, int numberOfRooms, LocalDate checkInDate, LocalDate checkOutDate) {
        List<Hotel> filteredHotels2 = new ArrayList<>();
        //Case 1: Find only 1 room
        if (numberOfRooms == 1) {
            //Loop over the first filteredHotel
            for (Hotel hotel : filteredHotels) {
                //Get all the room type in that hotel
                List<Room> roomList = RoomDB.getRoomsByHotel_ID(hotel.getHotel_ID());
                //Loop over each room in the room list
                for (Room room : roomList) {
                    // If the room capacity == required guest
                    if (room.getCapacity() == numberOfGuests) {
                        // Check amount of available room of that room type each day
                        for (LocalDate date = checkInDate; date.isBefore(checkOutDate) || date.equals(checkOutDate); date = date.plusDays(1)) {
                            if (amoutOfRoomsByDate(date, room.getRoom_ID()) >= 1) {
                                //Add suitable hotel to filter2 list
                                filteredHotels2.add(hotel);
                            }
                        }
                    }
                    else if (room.getCapacity() > numberOfGuests){
                        
                    }
                }
            }
        }
        return filteredHotels2;
    }

    //Calculate amount of rooms
    private int amoutOfRoomsByDate(LocalDate date, int room_ID) {
        List<ReservedRoom> reservedRooms = ReservedRoomDB.getReservedRoomsByRoomID(room_ID);
        Room room = RoomDB.getRoomByID(room_ID);
        int availableRooms = room.getTotalRooms();
        for (ReservedRoom reservedRoom : reservedRooms) {
            Reservation reservation = ReservationDB.getReservationByReservationID(reservedRoom.getReservation_ID());
            if (checkBetweenReservedDate(reservation.getCheckInDate(), reservation.getCheckOutDate(), date)) {
                availableRooms -= reservedRoom.getAmount();
            }
        }
        return availableRooms;
    }

    //Check between reserved date
    private boolean checkBetweenReservedDate(LocalDate checkinDate, LocalDate checkoutDate, LocalDate date) {
        return (date.isAfter(checkinDate) || date.equals(checkinDate)) && date.isBefore(checkoutDate) || date.equals(checkoutDate);
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
        processRequest(request, response);
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
