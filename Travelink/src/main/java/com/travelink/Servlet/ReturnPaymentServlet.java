/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.travelink.Servlet;

import com.travelink.Database.ReservationDB;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 *
 * @author ASUS
 */
public class ReturnPaymentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get data from session
        HttpSession session = request.getSession();
        Integer pendingReservationID = (Integer) session.getAttribute("pendingReservationID");

        String paymentLinkId = (String) session.getAttribute("paymentLinkId");
        String pendingReservationIDStr = pendingReservationID.toString();
        // Get parameters from URL
        String code = request.getParameter("code");
        String id = request.getParameter("id");
        String cancel = request.getParameter("cancel");
        String status = request.getParameter("status");
        String orderCode = request.getParameter("orderCode");

        // Print parameter values for debugging
        System.out.println("code: " + code);
        System.out.println("id: " + id);
        System.out.println("cancel: " + cancel);
        System.out.println("status: " + status);
        System.out.println("orderCode: " + orderCode);

        // Print session details
        System.out.println("Session - pendingReservationID: " + pendingReservationID);
        System.out.println("Session - paymentLinkId: " + paymentLinkId);

        // Check if all parameters match
        if ("00".equals(code) && paymentLinkId.equals(id) && "false".equals(cancel) && "PAID".equals(status) && pendingReservationIDStr.equals(orderCode)) {
            // Change status of reservation
            ReservationDB.changedReservationStatusByReservationID(pendingReservationID, "PAID");
        }

        //Remove all reservation related session
        session.removeAttribute("pendingReservationID");
        session.removeAttribute("paymentLinkId");
        session.removeAttribute("bookingHotel");
        session.removeAttribute("bookingMap");
        session.removeAttribute("bookingTotalPrice");
        session.removeAttribute("checkInDate");
        session.removeAttribute("checkOutDate");
        session.removeAttribute("checkoutUrl");
        //Redirect to cancel successful page!
        response.sendRedirect("ReturnPaymentSuccess.jsp");
    }
}
