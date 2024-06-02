/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.travelink.Servlet;

import com.travelink.Database.BedDB;
import com.travelink.Database.HotelDB;
import com.travelink.Database.HotelFacilityDB;
import com.travelink.Database.HotelImageDB;
import com.travelink.Database.RoomBedDB;
import com.travelink.Database.RoomDB;
import com.travelink.Database.RoomImageDB;
import com.travelink.Model.Bed;
import com.travelink.Model.Facility;
import com.travelink.Model.Hotel;
import com.travelink.Model.HotelFacility;
import com.travelink.Model.HotelImage;
import com.travelink.Model.Room;
import com.travelink.Model.RoomBed;
import com.travelink.Model.RoomImage;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author MSI
 */
public class ViewHotelServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet ViewHotelServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewHotelServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        int hotelId = Integer.parseInt(request.getParameter("hotelId"));
        int hotelId = 1;
        
        Hotel hotel = HotelDB.getHotelByID(hotelId);
        request.setAttribute("hotel_view", hotel);
        List<HotelImage> hotelImgList = HotelImageDB.getHotelImagesByHotelID(hotelId);
        // image center
        String urlHotelImgCenter = hotelImgList.get(0).getUrl();
        request.setAttribute("hotelImgCenter", urlHotelImgCenter);
        // image 4 image
        String urlHotelImg1 = hotelImgList.get(1).getUrl();
        String urlHotelImg2 = hotelImgList.get(2).getUrl();
        String urlHotelImg3 = hotelImgList.get(3).getUrl();
        String urlHotelImg4 = hotelImgList.get(4).getUrl();
        request.setAttribute("hotelImg1", urlHotelImg1);
        request.setAttribute("hotelImg2", urlHotelImg2);
        request.setAttribute("hotelImg3", urlHotelImg3);
        request.setAttribute("hotelImg4", urlHotelImg4);
        // list facibility 
        List<Facility> hotelFacilityList = HotelFacilityDB.getFacilitiesByHotelID(hotelId);
        request.setAttribute("hotelFacilityList", hotelFacilityList);
        // list room hotel
        List<Room> listRoom = RoomDB.getRoomsByHotel_ID(hotelId);
        request.setAttribute("roomList", listRoom);
        // list img room hotel 
        List<RoomImage> roomImgList = new ArrayList<>();
        for(Room room : listRoom){
            roomImgList.add(RoomImageDB.getRoomImagesByRoom_ID(room.getRoom_ID()).get(0));
        }
        request.setAttribute("roomImgList", roomImgList);
        // List bed number      
        // request jsp
        List<Bed> bedList = new ArrayList<>();
        RoomBedDB.getRoomBedsByBedID(hotelId);
        request.getRequestDispatcher("Hotel_Detail.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
