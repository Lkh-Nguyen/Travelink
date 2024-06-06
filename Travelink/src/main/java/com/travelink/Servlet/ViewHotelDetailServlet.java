/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.travelink.Servlet;

import com.travelink.Database.FavouriteHotelDB;
import com.travelink.Database.FeedbackDB;
import com.travelink.Database.HotelDB;
import com.travelink.Database.HotelFacilityDB;
import com.travelink.Database.HotelImageDB;
import com.travelink.Database.RoomBedDB;
import com.travelink.Database.RoomDB;
import com.travelink.Database.RoomImageDB;
import com.travelink.Model.Bed;
import com.travelink.Model.Account;
import com.travelink.Model.Facility;
import com.travelink.Model.Feedback;
import com.travelink.Model.Hotel;
import com.travelink.Model.HotelImage;
import com.travelink.Model.Room;
import com.travelink.Model.RoomImage;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author MSI
 */
public class ViewHotelDetailServlet extends HttpServlet {
   
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
            out.println("<title>Servlet ViewHotelDetailServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewHotelDetailServlet at " + request.getContextPath () + "</h1>");
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
        int hotel_ID = Integer.parseInt(request.getParameter("hotel_ID"));
        
        Hotel hotel = HotelDB.getHotelByID(hotel_ID);
        request.setAttribute("hotel_view", hotel);
        List<HotelImage> hotelImgList = HotelImageDB.getHotelImagesByHotelID(hotel_ID);
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
        List<Facility> hotelFacilityList = HotelFacilityDB.getFacilitiesByHotelID(hotel_ID);
        request.setAttribute("hotelFacilityList", hotelFacilityList);
        // list room hotel
        List<Room> listRoom = RoomDB.getRoomsByHotel_ID(hotel_ID);
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
        RoomBedDB.getRoomBedsByBedID(hotel_ID);
        //checkFavorite
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            boolean checkFavorite = FavouriteHotelDB.getFavoriteHotel(hotel_ID, account.getAccount_ID());
            request.setAttribute("checkFavorite", checkFavorite);
        }
        List<Feedback> feedbacks = new ArrayList<>();
        try {
            feedbacks =FeedbackDB.getFeedbacksByHotelID(hotelId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("feedbacks", feedbacks);
        //checkFavorite
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
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        String statusFav = request.getParameter("statusFav");
        String idHotelFavor = request.getParameter("idHotelFavor");
        int hotelId = Integer.parseInt(idHotelFavor);
        String checkedFavorite = request.getParameter("checkedFavorite");
        if (statusFav.equalsIgnoreCase("yes")) {
            if (checkedFavorite != null) {
                request.setAttribute("alterDeleteUnSuccess", "Favourite hotel is already existing !");
            } else {
                if (FavouriteHotelDB.deleteFavouriteHotel(Integer.parseInt(idHotelFavor), account.getAccount_ID())) {
                    request.setAttribute("alterDeleteSuccess", "Delete favorite hotel succesfully.");
                }
            }
        } else if (statusFav.equalsIgnoreCase("no")) {
            if(checkedFavorite == null){
                request.setAttribute("alterDeleteUnSuccess", "Delete favorite hotel unsuccesfully.");
            }else{
                if (FavouriteHotelDB.addFavouriteHotel(Integer.parseInt(idHotelFavor), account.getAccount_ID())) {
                    request.setAttribute("alterDeleteSuccess", "Add favorite hotel succesfully.");
                }
            }
        }
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
        //checkFavorite
        if (account != null) {
            boolean checkFavorite = FavouriteHotelDB.getFavoriteHotel(hotelId, account.getAccount_ID());
            request.setAttribute("checkFavorite", checkFavorite);
        }
        //checkFavorite
        request.getRequestDispatcher("Hotel_Detail.jsp").forward(request, response);
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
