/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.travelink.Servlet;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.travelink.Database.ReservationDB;
import com.travelink.Database.ReservedRoomDB;
import com.travelink.Database.RoomDB;
import com.travelink.Model.Account;
import com.travelink.Model.Hotel;
import com.travelink.Model.Reservation;
import com.travelink.Model.ReservedRoom;
import com.travelink.Model.Room;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.time.Instant;
import java.sql.Date;
import java.time.LocalDateTime;
import java.util.Formatter;
import java.util.List;
import java.util.Map;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

/**
 *
 * @author ASUS
 */
public class PaymentServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        //If payment has been created
        String checkoutUrl = (String) session.getAttribute("checkoutUrl");
        if (checkoutUrl != null) {
            response.sendRedirect(checkoutUrl);
            return;
        }
        //Else check again available room
        Date checkInDate = (Date) session.getAttribute("checkInDate");
        Date checkOutDate = (Date) session.getAttribute("checkOutDate");
        
        //
        List<Reservation> check1 = RoomDB.reservationCoincide(checkInDate, checkOutDate);
        //
        Map<Room, Integer> bookingMap = (Map<Room, Integer>) session.getAttribute("bookingMap");
        for (Map.Entry<Room, Integer> entry : bookingMap.entrySet()) {
            Room room = entry.getKey();
            int amount = entry.getValue();
            int availableRoom = RoomDB.numberOfRoomAvailableByTime(room.getRoom_ID(), checkInDate, checkOutDate, check1);
            if (availableRoom >= amount) {
                continue;
            } else {
                response.sendRedirect("Error.jsp");
                return;
            }

        }

        //Get booking details from session
        Account account = (Account) session.getAttribute("account");
        String totalPriceStr = (String) session.getAttribute("bookingTotalPrice");

        LocalDateTime now = LocalDateTime.now();

        // Parse the total price (assuming totalPriceStr is a valid string)
        int totalPrice;
        try {
            totalPrice = Integer.parseInt(totalPriceStr);
        } catch (NumberFormatException e) {
            // Handle the exception (e.g., redirect to an error page)
            response.sendRedirect("Error.jsp");
            return;
        }

        // Example values (replace with actual data)
        int number_Of_Guests = (int) session.getAttribute("people");
        String paymentMethod = "VIETQR";
        String status = "NOT PAID";

        //Create temporary reservation
        Reservation pendingReservation = new Reservation();
        pendingReservation.setReservationDate(now);
        pendingReservation.setNumber_of_guests(number_Of_Guests);
        pendingReservation.setCheckInDate(checkInDate);
        pendingReservation.setCheckOutDate(checkOutDate);
        pendingReservation.setTotalPrice(totalPrice);
        pendingReservation.setPaymentMethod(paymentMethod);
        pendingReservation.setStatus(status);
        pendingReservation.setAccount_ID(account.getAccount_ID());
        int pendingReservationID = ReservationDB.insertReservationAndGetID(pendingReservation);

        //Create temporary reserved room
        for (Map.Entry<Room, Integer> entry : bookingMap.entrySet()) {
            Room room = entry.getKey();
            int amount = entry.getValue();
            ReservedRoom reservedRoom = new ReservedRoom();
            reservedRoom.setAmount(amount);
            reservedRoom.setReservation_ID(pendingReservationID);
            System.out.println("Room ID: " + room.getRoom_ID());
            reservedRoom.setRoom_ID(room.getRoom_ID());

            ReservedRoomDB.insertReservedRoom(reservedRoom);
        }

        //Save temporary reservation ID to session 
        session.setAttribute("pendingReservationID", (Integer) pendingReservationID);

        //Data parameter
        String cancelUrl = "http://localhost:8080/Travelink/CancelPaymentServlet";
        String description = "Payment for Travelink";
        String orderCode = Integer.toString(pendingReservationID);

        String returnUrl = "http://localhost:8080/Travelink/ReturnPaymentServlet";

        //Make data string
        String data = "amount=" + totalPriceStr + "&cancelUrl=" + cancelUrl + "&description=" + description + "&orderCode=" + orderCode + "&returnUrl=" + returnUrl;
        System.out.println("Data: " + data);
        //Get signature
        String checksumKey = "1cb06ce5e9814e9d8956ad2f8c62041709b47b877b4ad9c95847521601dfc7ab";
        String signature = "";
        try {
            signature = calculateHMAC(data, checksumKey);
        } catch (NoSuchAlgorithmException | InvalidKeyException e) {
            e.printStackTrace();
            ReservationDB.deleteReservationByReservationID(pendingReservationID);
            session.removeAttribute("pendingReservationID");
            response.sendRedirect("Error.jsp");
            return;
        }

        //Send json
        String[] result = null;
        try {
            result = sendJsonToCreatePayment(orderCode, totalPriceStr, description, account, bookingMap, cancelUrl, returnUrl, signature);
        } catch (Exception ex) {
            ex.printStackTrace();
            ReservationDB.deleteReservationByReservationID(pendingReservationID);
            session.removeAttribute("pendingReservationID");
            response.sendRedirect("Error.jsp");
            return;
        }

        //Response fail
        if (result == null) {
            ReservationDB.deleteReservationByReservationID(pendingReservationID);
            session.removeAttribute("pendingReservationID");
            response.sendRedirect("Error.jsp");
            return;
        }

        //Delete not needed payment related session
        //Save checkoutURL and paymentLinkId to session and redirect to checkoutUrl
        session.setAttribute("checkoutUrl", result[0]);
        Cookie checkoutUrlCookie = new Cookie("checkoutUrl", result[0]);
        checkoutUrlCookie.setMaxAge(60*5);
        response.addCookie(checkoutUrlCookie);
        session.setAttribute("paymentLinkId", result[1]);
        response.sendRedirect(result[0]);
        return;
    }

    //Get back the checkoutUrl + paymentLinkId
    private String[] sendJsonToCreatePayment(String orderCode, String totalPriceStr, String description, Account account, Map<Room, Integer> bookingMap, String cancelUrl, String returnUrl, String signature) throws Exception {
        String[] result = new String[2];
        HttpClient client = HttpClient.newHttpClient();
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create("https://api-merchant.payos.vn/v2/payment-requests"))
                .header("x-client-id", "c6e68cd7-610a-4101-b5b5-f3ca78bf941d")
                .header("x-api-key", "e58f1aaf-d6e0-48e9-b509-35ea882655b6")
                .header("Content-Type", "application/json")
                .POST(HttpRequest.BodyPublishers.ofString(createJsonBody(orderCode, totalPriceStr, description, account, bookingMap, cancelUrl, returnUrl, signature)))
                .build();

        HttpResponse<String> httpResponse = client.send(request, HttpResponse.BodyHandlers.ofString());
        String responseBody = httpResponse.body();
        System.out.println(responseBody);
        // Parse the JSON response to get the checkoutUrl
        JsonObject jsonObject = JsonParser.parseString(responseBody).getAsJsonObject();
        JsonObject data = jsonObject.getAsJsonObject("data");
        result[0] = data.get("checkoutUrl").getAsString();
        result[1] = data.get("paymentLinkId").getAsString();
        return result;
    }

    //Return the json body
    private String createJsonBody(String orderCode, String totalPriceStr, String description, Account account, Map<Room, Integer> bookingMap, String cancelUrl, String returnUrl, String signature) {
        JsonObject jsonBody = new JsonObject();
        jsonBody.addProperty("orderCode", Integer.valueOf(orderCode));
        jsonBody.addProperty("amount", Integer.valueOf(totalPriceStr));
        jsonBody.addProperty("description", description);
        jsonBody.addProperty("buyerName", account.getName());
        jsonBody.addProperty("buyerEmail", account.getEmail());
        String phoneNumber = account.getPhoneNumber();
        if (!(phoneNumber == null || phoneNumber.isEmpty())) {
            jsonBody.addProperty("buyerPhone", phoneNumber);
        }
        String address = account.getAddress();
        if (!(address == null || address.isEmpty())) {
            jsonBody.addProperty("buyerAddress", address);
        }

        //Item buying
        JsonArray items = new JsonArray();

        for (Map.Entry<Room, Integer> entry : bookingMap.entrySet()) {
            Room room = entry.getKey();
            int quantity = entry.getValue();

            JsonObject item = new JsonObject();
            item.addProperty("name", room.getName());
            item.addProperty("quantity", quantity);
            item.addProperty("price", room.getPrice()); // Assuming Room has a getPrice() method
            items.add(item);
        }

        jsonBody.add("items", items);
        jsonBody.addProperty("cancelUrl", cancelUrl);
        jsonBody.addProperty("returnUrl", returnUrl);
        jsonBody.addProperty("expiredAt", getUnixTimestampPlusMinutes(5));
        jsonBody.addProperty("signature", signature);

        return jsonBody.toString();
    }

    //Return signature
    private String calculateHMAC(String data, String key) throws NoSuchAlgorithmException, InvalidKeyException {
        SecretKeySpec secretKeySpec = new SecretKeySpec(key.getBytes(), "HmacSHA256");
        Mac mac = Mac.getInstance("HmacSHA256");
        mac.init(secretKeySpec);
        byte[] rawHmac = mac.doFinal(data.getBytes());
        Formatter formatter = new Formatter();
        for (byte b : rawHmac) {
            formatter.format("%02x", b);
        }
        return formatter.toString();
    }

    //Return unix stamp after adding x minutes
    public static long getUnixTimestampPlusMinutes(int minutesToAdd) {
        Instant now = Instant.now();
        Instant future = now.plusSeconds(minutesToAdd * 60);
        return future.getEpochSecond();
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
