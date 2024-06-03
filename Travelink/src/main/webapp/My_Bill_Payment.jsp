<%-- 
    Document   : My_Bill_Payment
    Created on : May 30, 2024, 8:55:15 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="com.travelink.Model.Customer" %>
<%@page import="java.util.List" %>
<%@page import="com.travelink.Model.HotelService" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Customer</title>
        <link rel="stylesheet" href="css/Right_My_Account.css">
        <link rel="stylesheet" href="css/Left_My_Account.css">
        <link rel="icon" href="img_Home/logo.png">
        <link rel="stylesheet" href="css/Alter.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link href='bootstrap_css/bootstrap.min.css' rel='stylesheet'>
        <style>
            .custom-bg {
                background-color: #fafafa; /* Màu xám rất nhạt */
                background-image: linear-gradient(to right, #fafafa, #f5f5f5); /* Gradient từ #fafafa đến #f5f5f5 */
                border-radius: 5px;
            }
        </style>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <div class="container">
            <div class="row mt-5 justify-content-center align-items-center">
                <div class="col-md-5">
                    <div class="card mb-5">
                        <img src="img_Home/hotel-1.webp" class="img-thumbnail border-0" alt="...">
                        <div class="card-body">
                            <div class="container custom-bg">
                                <div class="row p-lg-2">
                                    <div class="col-md-4">
                                        <p class="fw-bold">Hotel Brand</p>
                                        <p>Get Hotel's Name</p>
                                    </div>
                                    <div class="col-md-4">
                                        <p class="fw-bold">Check in time</p>
                                        <p>Get Check In Time Start</p>
                                    </div>
                                    <div class="col-md-4">
                                        <p class="fw-bold">Check in date</p>
                                        <p>Get Check Out Date</p>
                                    </div>
                                </div>
                                <div class="row p-lg-2">
                                    <div class="col-md-4">
                                        <p class="fw-bold">Type Room</p>
                                        <p>Get Type Room</p>
                                    </div>
                                    <div class="col-md-4">
                                        <p class="fw-bold">Check out time</p>
                                        <p>Get Check Out Time Start</p>
                                    </div>
                                    <div class="col-md-4">
                                        <p class="fw-bold">Check out date</p>
                                        <p>Get Check Out Date</p>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-md-7">
                    <div class="card mb-3 h-1000">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-5">
                                    <div class="card border-0">
                                        <div class="card-body">
                                            <p class="fw-bold lh-1">${customer.name}</p>
                                            <p class="fw-bold lh-1">Invoice # <span class="fw-normal text-muted lh-1"> getCustomerID</span></p>
                                            <p class="text-muted">BILLING TO</p>
                                            <p class="fw-bold border-bottom">NAME COMPANY</p>
                                            <p class="fw-bold lh-1">Contact: <span class="fw-normal text-muted lh-1"> getPhoneNumber</span></p>
                                            <p class="fw-bold lh-1">Email: <span class="fw-normal text-muted lh-1"> getCustomerEmail</span></p>
                                            <p class="fw-bold lh-1">Address: <span class="fw-normal text-muted lh-1"> getAddress</span></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <!-- Container trống -->
                                </div>
                                <div class="col-md-4 justify-content-end align-items-end">
                                    <div class="card border-0">
                                        <div class="card-body">
                                            <p class="fw-bold lh-1">INVOICE</p>
                                            <p class="fw-bold lh-1">Date: <span class="fw-normal text-muted lh-1"> getDateForBill</span></p>
                                        </div>
                                    </div>
                                </div>
                            </div> 
                            <!<!-- Table -->
                            <div class="row">
                                <div class="container">
                                    <div class="card border-0">
                                        <div class="card-body">
                                            <table class="table table-striped table-hover">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">#</th>
                                                        <th scope="col">Name</th>
                                                        <th scope="col">Email</th>
                                                        <th scope="col">Phone Number</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <th scope="row">1</th>
                                                        <td>${customer.name}</td>
                                                        <td>${customer.email}</td>
                                                        <td>${customer.phoneNumber}</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">2</th>
                                                        <td>Trần Thị B</td>
                                                        <td>tranthib@example.com</td>
                                                        <td>0987654321</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">3</th>
                                                        <td>Lê Văn C</td>
                                                        <td>levanc@example.com</td>
                                                        <td>0234567891</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="card border-0">
                                    <div class="card-body">
                                        <!-- Phần dưới bên phải -->
                                        <div class="row">
                                            <div class="col-md-6"></div>
                                            <div class="col-md-6">
                                                <div class="row border-bottom">
                                                    <div class="col">
                                                        <p class="fw-bold lh-1">Sub Total:</p>
                                                        <p class="fw-bold lh-1">Tax:</p>
                                                    </div>
                                                    <div class="col">
                                                        <p class="text-muted fw-normal lh-1 ps-4">getTotalPrice</p>
                                                        <p class="text-muted fw-normal lh-1 ps-4">getTotalPrice</p>
                                                    </div>
                                                </div>
                                                <div class="row mt-3">
                                                    <div class="col">
                                                        <p class="fw-bold lh-1">Grand Total: </p>
                                                    </div>
                                                    <div class="col">
                                                        <p class="text-muted fw-normal lh-1 ps-4"> getTotalPrice</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Phần dưới bên trái -->
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="row border-bottom">
                                                    <div class="col">
                                                        <p class="fw-bold lh-1">Sub Total:</p>
                                                        <p class="fw-bold lh-1">Tax:</p>
                                                    </div>
                                                    <div class="col">
                                                        <p class="text-muted fw-normal lh-1 ps-4">getTotalPrice</p>
                                                        <p class="text-muted fw-normal lh-1 ps-4">getTotalPrice</p>
                                                    </div>
                                                </div>
                                                <div class="row mt-3">
                                                    <div class="col">
                                                        <p class="fw-bold lh-1">Grand Total: </p>
                                                    </div>
                                                    <div class="col">
                                                        <p class="text-muted fw-normal lh-1 ps-4"> getTotalPrice</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6"></div>
                                        </div>
                                        
                                    </div>
                                </div> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="/bootstrap_js/js/bootstrap.bundle.js"></script>
</body>
</html>
