/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.travelink.Servlet;

import com.travelink.Database.ReservationDB;
import com.travelink.Model.PendingCancelReservation;
import com.travelink.Model.Reservation;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;

/**
 *
 * @author ASUS
 */
public class CancelBookingServlet extends HttpServlet {

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
        String reservation_IDStr = request.getParameter("reservation_ID");
        //Null bill_ID or invalid ID
        int reservation_ID;
        try {
            reservation_ID = Integer.parseInt(reservation_IDStr);
        } catch (Exception e) {
            response.sendRedirect("Error.jsp");
            return;
        }
      
        //Setting pending cancel reservation attribute
        PendingCancelReservation pendingCancelReservation = new PendingCancelReservation();
        pendingCancelReservation.setReservationID(reservation_ID);
        pendingCancelReservation.setCancelDate(LocalDateTime.now());
        //Change status of that reservation
        ReservationDB.changedReservationStatusByReservationID(reservation_ID, "REFUNDING");
        response.sendRedirect("Cancel_Hotel_Service");
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
