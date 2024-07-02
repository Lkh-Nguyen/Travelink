/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.travelink.Servlet;

import com.travelink.Database.BedDB;
import com.travelink.Database.RoomDB;
import com.travelink.Model.Bed;
import com.travelink.Model.Room;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 *
 * @author admin
 */
public class UpdateHotelBedServlet extends HttpServlet {

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
            out.println("<title>Servlet UpdateHotelBedServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateHotelBedServlet at " + request.getContextPath() + "</h1>");
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
        String roomid = request.getParameter("room_ID");
        int roomID = Integer.parseInt(roomid);

        String hotelid = request.getParameter("hotel_ID");
        int hotelID = Integer.parseInt(hotelid);

        List<Bed> list_beds = BedDB.getBedsByRoomID(roomID);
        request.setAttribute("beds_list", list_beds);
        request.setAttribute("hotel_ID", hotelID);
        request.setAttribute("room_ID", roomID);

//        PrintWriter pw = response.getWriter();
//        pw.print(list_beds.size());
//        for(Bed b : list_beds){
//            pw.print(b.toString());
//        }
        request.getRequestDispatcher("HotelHost_BedInformation.jsp").forward(request, response);
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
        String roomid = request.getParameter("room_ID");
        int roomID = Integer.parseInt(roomid);

        String hotelid = request.getParameter("hotel_ID");
        int hotelID = Integer.parseInt(hotelid);

        Bed newBed = new Bed();
        newBed.setName(request.getParameter("name-bed"));
        newBed.setDescription(request.getParameter("description"));
        newBed.setUrl(request.getParameter("url"));
//        PrintWriter pw = response.getWriter();
//        pw.print(newBed.toString());

        boolean added = BedDB.insertBedByRoomID(newBed, roomID);

        if (added) {
            response.sendRedirect("UpdateHotelBedServlet?room_ID=" + roomID + "&hotel_ID=" + hotelID);
        } else {
            request.setAttribute("error", "exist");
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
