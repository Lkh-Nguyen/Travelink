/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.travelink.Servlet;

import com.travelink.Database.RoomDB;
import com.travelink.Database.RoomImageDB;
import com.travelink.Model.Room;
import com.travelink.Model.RoomImage;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author admin
 */
public class UpdateHotelRoomServlet extends HttpServlet {

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
            out.println("<title>Servlet UpdateHotelRoomServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateHotelRoomServlet at " + request.getContextPath() + "</h1>");
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
        String hotelid = request.getParameter("hotel_ID");
        int hotelID = Integer.parseInt(hotelid);

        //Phân Trang
        int page = 1;
        int recordsPerPage = 2;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        List<Room> list_rooms = RoomDB.getRoomsByHotel_ID(hotelID);
        int noOfRecords;
        noOfRecords = list_rooms.size();
        // Calculate total number of pages
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);

        // Calculate the start and end indices for the current page
        int start = (page - 1) * recordsPerPage;
        int end = Math.min(start + recordsPerPage, noOfRecords);
        // Get the sublist for the current page

        list_rooms = list_rooms.subList(start, end);

        request.setAttribute("room_list", list_rooms);
        request.setAttribute("hotel_id", hotelID);
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);
        request.getRequestDispatcher("HotelHost_RoomInformation.jsp").forward(request, response);
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
        String action = request.getParameter("action");

        switch (action) {
            case "update":
                updateRoom(request, response);
                break;
            case "add":
                addRoom(request, response);
                break;
            default:
                break;
        }
    }

    private void updateRoom(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int hotelID = Integer.parseInt(request.getParameter("hotelid"));
        int roomID = Integer.parseInt(request.getParameter("roomid"));
        // Retrieve room details from the form
        Room room = new Room();
        room.setName(request.getParameter("name"));
        room.setRoomDescription(request.getParameter("description"));
        room.setCapacity(Integer.parseInt(request.getParameter("capacity")));
        room.setTotalRooms(Integer.parseInt(request.getParameter("totalRooms")));
        room.setPrice(Integer.parseInt(request.getParameter("price")));
        room.setStatus(request.getParameter("status"));

        boolean updated = RoomDB.updateRoom(hotelID, roomID, room);

        if (updated) {
            // Update successful
            response.sendRedirect("UpdateHotelRoomServlet?hotel_ID=" + hotelID);
        } else {
            // Update failed
            response.sendRedirect("HotelHost_RoomInformation.jsp");
        }
    }

    private void addRoom(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int hotel_ID = Integer.parseInt(request.getParameter("hotel_ID"));
        System.out.println("Hotel ID: " + hotel_ID);  // Add this line

        Room room = new Room();
        room.setName(request.getParameter("name"));
        room.setRoomDescription(request.getParameter("description"));
        room.setCapacity(Integer.parseInt(request.getParameter("capacity")));
        room.setTotalRooms(Integer.parseInt(request.getParameter("totalRooms")));
        room.setPrice(Integer.parseInt(request.getParameter("price")));
        room.setStatus(request.getParameter("status"));

        boolean added = RoomDB.addRoom(hotel_ID, room);

        if (added) {
            response.sendRedirect("UpdateHotelRoomServlet?hotel_ID=" + hotel_ID);
        } else {
            response.sendRedirect("Error.jsp");
        }
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
