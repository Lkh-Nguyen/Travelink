<%-- 
    Document   : HotelHost_ViewHotelInformation
    Created on : Jul 5, 2024, 3:13:54 PM
    Author     : MSI
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <head>
        <meta charset="UTF-8">
        <title>Hotel Information</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f9;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .container {
                background: #fff;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                max-width: 500px;
                width: 100%;
            }
            h1 {
                text-align: center;
                color: #333;
            }
            form {
                display: flex;
                flex-direction: column;
            }
            label {
                margin-top: 10px;
                color: #555;
            }
            input[type="text"] {
                padding: 8px;
                margin-top: 5px;
                border: 1px solid #ccc;
                border-radius: 4px;
                background-color: #f9f9f9;
                box-sizing: border-box;
            }
            input[readonly] {
                background-color: #e9ecef;
            }
            .form-group {
                margin-bottom: 15px;
            }
            .form-group:last-child {
                margin-bottom: 0;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Hotel Information</h1>
            <form>
                <div class="form-group">
                    <label for="hotel_ID">Hotel ID:</label>
                    <input type="text" id="hotel_ID" name="hotel_ID" value="${hotel.hotel_ID}" readonly>
                </div>
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" value="${hotel.name}" readonly>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="text" id="email" name="email" value="${hotel.email}" readonly>
                </div>
                <div class="form-group">
                    <label for="star">Star:</label>
                    <input type="text" id="star" name="star" value="${hotel.star}" readonly>
                </div>
                <div class="form-group">
                    <label for="rating">Rating:</label>
                    <input type="text" id="rating" name="rating" value="${hotel.rating}" readonly>
                </div>
                <div class="form-group">
                    <label for="phoneNumber">Phone Number:</label>
                    <input type="text" id="phoneNumber" name="phoneNumber" value="${hotel.phoneNumber}" readonly>
                </div>
                <div class="form-group">
                    <label for="description">Description:</label>
                    <input type="text" id="description" name="description" value="${hotel.description}" readonly>
                </div>
                <div class="form-group">
                    <label for="checkInTimeStart">Check-In Time Start:</label>
                    <input type="text" id="checkInTimeStart" name="checkInTimeStart" value="${hotel.checkInTimeStart}" readonly>
                </div>
                <div class="form-group">
                    <label for="checkInTimeEnd">Check-In Time End:</label>
                    <input type="text" id="checkInTimeEnd" name="checkInTimeEnd" value="${hotel.checkInTimeEnd}" readonly>
                </div>
                <div class="form-group">
                    <label for="checkOutTimeStart">Check-Out Time Start:</label>
                    <input type="text" id="checkOutTimeStart" name="checkOutTimeStart" value="${hotel.checkOutTimeStart}" readonly>
                </div>
                <div class="form-group">
                    <label for="checkOutTimeEnd">Check-Out Time End:</label>
                    <input type="text" id="checkOutTimeEnd" name="checkOutTimeEnd" value="${hotel.checkOutTimeEnd}" readonly>
                </div>
                <div class="form-group">
                    <label for="address">Address:</label>
                    <input type="text" id="address" name="address" value="${hotel.address}" readonly>
                </div>
                <div class="form-group">
                    <label for="status">Status:</label>
                    <input type="text" id="status" name="status" value="${hotel.status}" readonly>
                </div>
                <div class="form-group">
                    <label for="ward_ID">Ward</label>
                    <input type="text" id="ward_ID" name="ward_ID" value="${ward.name}" readonly>
                </div>
                <div class="form-group">
                    <label for="ward_ID">Facility</label>
                    <ul>
                        <c:forEach var="facility" items="${facilityList}">
                            <li>${facility.name}</li>
                        </c:forEach>
                    </ul>
                </div>
            </form>
        </div>
    </body>
</body>
</html>
