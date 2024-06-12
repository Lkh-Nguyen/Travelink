/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.travelink.Servlet;

import com.travelink.Database.FeedbackDB;
import com.travelink.Model.Account;
import com.travelink.Model.Feedback;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;

/**
 *
 * @author DUYAN
 */
public class SubmitFeedbackServlet extends HttpServlet {
   
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
            out.println("<title>Servlet SubmitFeedbackServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SubmitFeedbackServlet at " + request.getContextPath () + "</h1>");
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
        processRequest(request, response);
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
        try {
            
        } catch (Exception e) {
        }
        // Get parameters from the request
        String description = request.getParameter("description");
        byte rating = Byte.parseByte(request.getParameter("rating"));
        // Assuming the date is already set in the hidden input field
        String dateStr = request.getParameter("date");
        // Assuming the reservation ID is passed from the previous page
        int reservationID = Integer.parseInt(request.getParameter("reservationID"));

        // Assuming you have the Account ID and Hotel ID from the session or elsewhere
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        int accountID = account.getAccount_ID();
        int hotelID = Integer.parseInt(request.getParameter("hotel_ID"));

        // Create a Feedback object
        Feedback feedback = new Feedback();
        feedback.setDescription(description);
        feedback.setRating(rating);
        feedback.setDate(java.sql.Date.valueOf(dateStr)); 
        feedback.setAccount_ID(accountID);
        feedback.setHotelID(hotelID);

        try {
            // Insert the feedback into the database
            FeedbackDB.insertFeedback(feedback);
            request.getRequestDispatcher("Paid_Hotel_Service").forward(request, response);
        } catch (SQLException ex) {
            // Handle database errors
            ex.printStackTrace();
            response.sendRedirect("Error.jsp");
        }
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