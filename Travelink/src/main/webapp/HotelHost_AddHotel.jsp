<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Hotel</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            max-width: 600px;
            margin-top: 50px;
            background: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .form-control::placeholder {
            color: #6c757d;
            opacity: 1; /* Firefox */
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="mb-4 text-center">Add New Hotel</h2>
        <form action="HotelHost_AddHotelServlet" method="post">
            <div class="form-group">
                <label for="name">Hotel Name</label>
                <input value="${hotel.name}"type="text" class="form-control" id="name" name="name" placeholder="Enter hotel name" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input value="${hotel.email}"type="email" class="form-control" id="email" name="email" placeholder="Enter hotel email" required>
            </div>
                <c:if test="${status != null}">
                    <p>${status}</p>
                </c:if>
            <div class="form-group">
                <label for="star">Star Rating</label>
                <input value="${hotel.star}"type="number" class="form-control" id="star" name="star" min="1" max="5" placeholder="Enter star rating" required>
            </div>
            <div class="form-group">
                <label for="rating">Rating</label>
                <input value="${hotel.rating}"type="number" class="form-control" id="rating" name="rating" step="0.1" min="0" max="5" placeholder="Enter rating">
            </div>
            <div class="form-group">
                <label for="phoneNumber">Phone Number</label>
                <input value="${hotel.phoneNumber}"type="tel" class="form-control" id="phoneNumber" name="phoneNumber" placeholder="Enter phone number" required>
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea class="form-control" id="description" name="description" rows="4" placeholder="Enter description">${hotel.description}</textarea>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="checkInTimeStart">Check-In Time Start</label>
                    <input value="${hotel.checkInTimeStart}" type="time" class="form-control" id="checkInTimeStart" name="checkInTimeStart" required>
                </div>
                <div class="form-group col-md-6">
                    <label for="checkInTimeEnd">Check-In Time End</label>
                    <input value="${hotel.checkInTimeEnd}"type="time" class="form-control" id="checkInTimeEnd" name="checkInTimeEnd" required>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="checkOutTimeStart">Check-Out Time Start</label>
                    <input value="${hotel.checkOutTimeStart}"type="time" class="form-control" id="checkOutTimeStart" name="checkOutTimeStart" required>
                </div>
                <div class="form-group col-md-6">
                    <label for="checkOutTimeEnd">Check-Out Time End</label>
                    <input value="${hotel.checkOutTimeEnd}" type="time"class="form-control" id="checkOutTimeEnd" name="checkOutTimeEnd" required>
                </div>
            </div>
            <div class="form-group">
                <label for="address">Address</label>
                <input value="${hotel.address}"type="text" class="form-control" id="address" name="address" placeholder="Enter address" required>
            </div>
            <div class="form-group">
                <label for="ward_ID">Ward ID</label>
                <input value="${ward}"type="number" class="form-control" id="ward_ID" name="ward_ID" placeholder="Enter ward ID" required>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Add Hotel</button>
        </form>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>