/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.travelink.Servlet;

import com.travelink.Database.HotelDB;
import com.travelink.Database.ReservationDB;
import com.travelink.Database.RoomDB;
import com.travelink.Model.Account;
import com.travelink.Model.Hotel;
import com.travelink.Model.Room;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author ASUS
 */
public class CheckoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("Home_Customer.jsp");
    }   
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account)session.getAttribute("account");
        //If user already have not paid online bill
        if (ReservationDB.hasUnpaidReservationWithVietQR(account.getAccount_ID())){
            request.setAttribute("notpaidMessage", "Please finish this payment first!");
            request.getRequestDispatcher("NotPaid_Transaction.jsp").forward(request, response);
            return;
        }
        
        //Get parameter from hotel detail jsp
        String bookingStr = request.getParameter("bookingStr");
        String hotel_IDStr = request.getParameter("hotel_ID");
        int hotel_ID = Integer.parseInt(hotel_IDStr);
        
        //Set Attribute
        Hotel hotel = HotelDB.getHotelByID(hotel_ID);
        Map<Room, Integer> bookingMap = getBookingsFromBookingString(bookingStr);
        int totalPriceInt = calculateTotalPrice(bookingMap);
        String totalPriceStr = Integer.valueOf(totalPriceInt).toString();
        
        //If valid set session and redirect
        session.setAttribute("bookingMap", bookingMap);
        session.setAttribute("bookingHotel", hotel);
        session.setAttribute("bookingTotalPrice", totalPriceStr);
        request.getRequestDispatcher("Checkout.jsp").forward(request, response);
    }

    //Handle the booking string
    public static Map<Room, Integer> getBookingsFromBookingString(String bookingStr) {
        Map<Room, Integer> map = new HashMap<>();
        int totalPrice = 0;
        String[] bookings = bookingStr.split("/");
        for (String s : bookings) {
            String[] detail = s.split(",");
            String room_IDStr = detail[0];
            String quantityStr = detail[1];
            Room room = RoomDB.getRoomByID(takeValue(room_IDStr));
            int quantity = takeValue(quantityStr);
            map.put(room, quantity);
            totalPrice = quantity * room.getPrice();
            System.out.println(totalPrice);
        }
        return map;
    }

    //Take out the value of each parameter in booking string
    public static int takeValue(String valueStr) {
        String[] splitStr = valueStr.split("=");
        String resultStr = splitStr[1];
        int result = Integer.parseInt(resultStr);
        return result;
    }

    public static int calculateTotalPrice(Map<Room, Integer> bookingMap) {
        int totalPrice = 0;

        // Iterate through the map entries
        for (Map.Entry<Room, Integer> entry : bookingMap.entrySet()) {
            Room room = entry.getKey();
            int quantity = entry.getValue();

            // Calculate total price for each room and add it to the running total
            totalPrice += room.getPrice() * quantity;
        }

        return totalPrice;
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
