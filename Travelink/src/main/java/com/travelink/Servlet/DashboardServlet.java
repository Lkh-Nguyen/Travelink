/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.travelink.Servlet;

import com.travelink.Database.RefundingReservationDB;
import com.travelink.Database.ReservationDB;
import com.travelink.Model.RefundingReservation;
import com.travelink.Model.Reservation;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class DashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String hotel_IDStr = request.getParameter("hotel_ID");
        String monthStr = request.getParameter("month");
        String yearStr = request.getParameter("year");
        int hotel_ID = -1;
        int month = -1;
        int year = -1;
        try{
            hotel_ID = Integer.parseInt(hotel_IDStr);
            month = Integer.parseInt(monthStr);
            year = Integer.parseInt(yearStr);
        }
        catch(Exception ex){
            ex.printStackTrace();
            response.sendRedirect("Error.jsp");
            return;
        }
        
        List<Reservation> reservationList = ReservationDB.getVietQRReservationsByHotelID(hotel_ID);
        //Filtered the reservation
        List<Reservation> filteredReservations = ReservationDB.filterByCheckoutMonthAndYear(reservationList, month, year);
        List<Reservation> finishedReservations = ReservationDB.filterByStatus(filteredReservations, "FINISHED");
        List<Reservation> cancelReservations = ReservationDB.filterByStatus(filteredReservations, "CANCEL");
        //Reservation waiting for refund
        List<Reservation> refundingReservations = ReservationDB.filterByStatus(filteredReservations, "REFUNDING");
        //Reservation that already + waiting for refund
        List<RefundingReservation> refundingReservations2 = RefundingReservationDB.getRefundingReservationsByReservations(filteredReservations);
        
        //Return the reservation statistics
        request.setAttribute("hotel_ID", hotel_ID);
        request.setAttribute("totalReservations", filteredReservations.size());
        request.setAttribute("finishedReservations", finishedReservations.size());
        request.setAttribute("cancelReservations", cancelReservations.size() + refundingReservations.size());
        request.setAttribute("refundReservations", refundingReservations2.size());
        request.getRequestDispatcher("HotelHost_DashBoard.jsp").forward(request, response);
        
        //Calculate the money 
        int sum = 0; 
    }


}
