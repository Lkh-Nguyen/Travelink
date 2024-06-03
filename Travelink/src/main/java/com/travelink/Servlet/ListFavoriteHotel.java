/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.travelink.Servlet;

import com.travelink.Database.FavouriteHotelDB;
import com.travelink.Model.Customer;
import com.travelink.Model.Hotel;
import com.travelink.Model.HotelImage;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 *
 * @author HELLO
 */
public class ListFavoriteHotel extends HttpServlet {

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
            out.println("<title>Servlet ListFavoriteHotel</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListFavoriteHotel at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        
        List<Hotel> list_Hotel = FavouriteHotelDB.getHotelFavourite(customer.getCustomer_ID());
        List<HotelImage> list_HotelImage = FavouriteHotelDB.getHotelImageFavourite(customer.getCustomer_ID());
        List<Integer> list_RatingCount = FavouriteHotelDB.getRatingCountFavourite(customer.getCustomer_ID());
        List<Float> list_Average = FavouriteHotelDB.getAverageFavourite(customer.getCustomer_ID());
        request.setAttribute("list_Hotel", list_Hotel);
        request.setAttribute("list_HotelImage", list_HotelImage);
        request.setAttribute("list_RatingCount", list_RatingCount);
        request.setAttribute("list_Average", list_Average);
        
        request.getRequestDispatcher("Favorite_Hotel.jsp").forward(request, response);
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
        int idHotelDelete = Integer.parseInt(request.getParameter("idHotelDelete"));
         HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        if(FavouriteHotelDB.deleteFavouriteHotel(idHotelDelete, customer.getCustomer_ID())){
            request.setAttribute("alterDeleteSuccess", "Delete favorite hotel succesfully.");
        }else{
            request.setAttribute("alterDeleteUnSuccess", "Delete favorite hotel unsuccesfully.");
        }
        
        List<Hotel> list_Hotel = FavouriteHotelDB.getHotelFavourite(customer.getCustomer_ID());
        List<HotelImage> list_HotelImage = FavouriteHotelDB.getHotelImageFavourite(customer.getCustomer_ID());
        List<Integer> list_RatingCount = FavouriteHotelDB.getRatingCountFavourite(customer.getCustomer_ID());
        List<Float> list_Average = FavouriteHotelDB.getAverageFavourite(customer.getCustomer_ID());
        request.setAttribute("list_Hotel", list_Hotel);
        request.setAttribute("list_HotelImage", list_HotelImage);
        request.setAttribute("list_RatingCount", list_RatingCount);
        request.setAttribute("list_Average", list_Average);
        
        request.getRequestDispatcher("Favorite_Hotel.jsp").forward(request, response);
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