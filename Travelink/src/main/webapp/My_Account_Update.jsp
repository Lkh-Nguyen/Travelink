<%-- 
    Document   : account
    Created on : May 15, 2024, 8:59:13 PM
    Author     : HELLO
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.travelink.Model.Customer" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Informtion Customer</title>
        <link rel="stylesheet" href="css/Right_My_Account.css">
        <link rel="stylesheet" href="css/Left_My_Account.css">
        <link rel="icon" href="img_Home/logo.png">
        <link rel="stylesheet" href="css/Alter.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <!-- Dùng để đăng xuất-->
        <style>
            #overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                display: none;
                z-index: 999;
            }

            #logoutConfirm {
                display: none; /* Ẩn mặc định */
                border-radius: 10px;
                width: 280px;
                height: 320px;
                position: fixed;
                bottom: -300px;
                left: 50%;
                transform: translateX(-50%);
                background-color: #fff;
                padding: 20px;
                border: 1px solid #ccc;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                z-index: 1000;
                transition: bottom 0.5s ease;
            }
            #logoutConfirm h2{
                margin-top:-10px;
            }
            #logoutConfirm p{
                font-size: 20px;
                color: grey;
            }
            #logoutConfirm button{
                background-color:rgb(247,249,250);
                border: 0px;
                margin-bottom: 15px;
                width: 280px;
                height: 40px;
            }
            #logoutConfirm button:hover{
                background-color:rgb(242,243,243);
            }
            #logoutConfirm button:active{
                border: 3px solid rgb(1,148,243);
            }
            #logoutConfirm button a{
                font-size: 17px;
                user-select: none;
                color: rgb(1,148,243);
                text-decoration: none;
            }

            #logoutConfirm.active {
                bottom: 50%;
                transform: translate(-50%, 50%);
            }



            /*Change*/
            .disabled {
                pointer-events: none;
                opacity: 0.6;
            }
            button, input[type="submit"] {
                cursor: not-allowed;
            }
            .enabled {
                pointer-events: auto;
                opacity: 1;
            }
            button.enabled, input[type="submit"].enabled {
                cursor: pointer;
            }
        </style>
        <!-- Dùng để đăng xuất-->
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <!-- Dùng để đăng xuất-->
        <div id="overlay"></div>
        <div id="logoutConfirm">
            <h2>Logging Out</h2>
            <p>Oh, no! You’ll miss a lot of things by logging out: Traveloka Points, 
                Passenger Quick Pick, Price Alerts, and other member-only benefits.
                Are you sure want to log out?</p>
            <button id="confirmYes"><a href="logout">Yes</a></button>
            <button id="confirmNo"><a href="#">No</a></button>
        </div>
        <!-- Dùng để đăng xuất-->




        <div id="mid_container">
            <div id="left">
                <div id="header_left">
                    <div>
                        <img src="${customer.avatarURL}" alt="alt"/>
                    </div>
                    <div style="margin-left: 10px">
                        <h1>${customer.name}</h1>
                        <p>Google</p>
                    </div>
                </div>
                <div id="header_list">
                    <div class="list1">
                        <a href="#"><i class='bx bx-cog'></i> <b>My Account</b></a>
                    </div>
                    <div class="list0">
                        <a href="View_Avatar.jsp"><i class='bx bx-image-add' ></i> <b>View Avatar</b></a>
                    </div>
                    <div class="list0">
                        <a href="#"><i class='bx bx-calendar' ></i> <b>My Booking</b></a>
                    </div>
                    <div class="list0">
                        <a href="#"><i class='bx bx-money-withdraw'></i> <b>Purchase List</b></a>
                    </div>
                    <div class="list0">
                        <a href="#"><i class='bx bx-heart-circle' ></i> <b>Favorite Hotel</b></a>
                    </div>
                    <div class="list0">
                        <a href="#"><i class='bx bx-log-out' ></i><b id="logoutButton">Logging Out</b></a>
                    </div>
                </div>
            </div>
            <div id="right">
                <h1>Settings</h1>
                <div id="list_right">
                    <ul>
                        <li id="li1">Account Information</li>
                            <c:if test="${sessionScope.customer.password != null}">
                            <li id="li2"><a href="My_Account_Change.jsp">Password & Security</a></li>
                            </c:if>
                    </ul>
                </div>
                <!-- Change -->
                <div id="person_data">
                    <form id="customerForm" action="UpdateCustomerServlet" method="post">
                        <div id="pd_h2">
                            <h2>Personal Data</h2>
                        </div>                    
                        <div id="pd_data">
                            <div class="pd_flex">
                                <div class="flex1">
                                    <p>Full Name</p>
                                    <input type="text" name="name"  placeholder="Enter Full Name In Here" value="${customer.name}" required>
                                </div>

                                <div class="flex2">
                                    <p>Gender</p>
                                    <input type="radio" name="gender" value="Male"

                                           <%
                                               Customer customer = (Customer) session.getAttribute("customer");
                                               if (customer.getGender() == 'M') {
                                           %>
                                           checked
                                           <%
                                               }
                                           %>
                                           > Male
                                    <input type="radio" name="gender" value="Female"
                                           <%
                                               if (customer.getGender() == 'F') {
                                           %>
                                           checked
                                           <%
                                               }
                                           %>
                                           > Female


                                </div>
                            </div>
                            <div class="pd_flex">
                                <div class="flex1"> 
                                    <p>Birthdate</p>
                                    <input type="date" name="DOB" style="font-size: 15px" placeholder="Enter BirthDate In Here" value="${customer.dateOfBirth}" >
                                </div>
                                <div class="flex1">
                                    <p>CMND</p>
                                    <input type="text" name="CMND" placeholder="Enter CMND In Here" value="${customer.cmnd}" pattern="[0-9]{12}" title="CMND number must consist of 12 digits.">
                                </div>
                            </div>
                            <div class="pd_flex">
                                <div class="flex1">
                                    <p>Number Phone</p>
                                    <input type="text" name="phone" placeholder="Enter Number Phone In Here"  value="${customer.phoneNumber}" pattern="[0-9]{10}" title="Phone number must contain 10 digits.">
                                </div>
                                <div class="flex1">
                                    <p>Email</p>
                                    <input type="email" name="email" placeholder="Enter Email In Here" required pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" title="Please enter a valid email address. For example: example@example.com" value="${customer.email}" readonly>

                                </div>
                            </div>
                            <div class="pd_flex">
                                <div class="flex1"  >
                                    <p>Address</p>
                                    <textarea id="address" name="address" rows="8" cols="37"  style="resize: none;font-size: 15px">${customer.address}</textarea>
                                </div>
                            </div>
                        </div>
                        <c:if test="${requestScope.statusUpdate != null}">
                            <div id="status-message" style="background-color: rgb(233,251,233)" class="hidden">
                                <div style="display: flex">
                                    <div style="width: 20%">
                                        <i class='bx bxs-check-circle' style="font-size: 50px;color:green;margin-top: 0px"></i>
                                    </div>
                                    <div style="width: 80%; text-align: start">
                                        <h3 style="color:green;margin-top: 5px;font-weight: 550 ">Success</h3>
                                        <p style="color: black;margin-top: -15px;font-size: 14px">${statusUpdate}</p>
                                    </div>
                                </div>           
                            </div>
                        </c:if>
                        <div class="pd_button">
                            <button type="button" id="cancelButton" class="disabled" onclick="cancel()">Cancel</button>
                            <input  type="submit" id="saveButton" class="disabled" value="Save"/>
                        </div>
                    </form>
                </div>
                <!-- Change -->
            </div>
        </div>
        <%@include file="Footer.jsp" %>
        <script src="js/Alter.js"></script>
        <script>
                                function cancel() {
                                    location.reload();
                                    event.preventDefault();
                                }
                                document.getElementById("logoutButton").addEventListener("click", function () {
                                    document.getElementById("overlay").style.display = "block";
                                    var logoutConfirm = document.getElementById("logoutConfirm");
                                    logoutConfirm.style.display = "block"; // Hiển thị khung xác nhận
                                    setTimeout(function () {
                                        logoutConfirm.classList.add("active");
                                    }, 50);
                                });

                                document.getElementById("confirmNo").addEventListener("click", function () {
                                    var logoutConfirm = document.getElementById("logoutConfirm");
                                    logoutConfirm.classList.remove("active");
                                    setTimeout(function () {
                                        logoutConfirm.style.display = "none"; // Ẩn khung xác nhận
                                        document.getElementById("overlay").style.display = "none";
                                    }, 500);
                                });

                                document.getElementById("overlay").addEventListener("click", function () {
                                    var logoutConfirm = document.getElementById("logoutConfirm");
                                    logoutConfirm.classList.remove("active");
                                    setTimeout(function () {
                                        logoutConfirm.style.display = "none"; // Ẩn khung xác nhận
                                        document.getElementById("overlay").style.display = "none";
                                    }, 500);
                                });



                                /*Change*/
                                document.addEventListener('DOMContentLoaded', function () {
                                    const inputs = document.querySelectorAll('#customerForm input, #customerForm textarea');
                                    const saveButton = document.getElementById('saveButton');
                                    const cancelButton = document.getElementById('cancelButton');
                                    let isChanged = false;

                                    inputs.forEach(input => {
                                        input.addEventListener('input', () => {
                                            if (!isChanged) {
                                                saveButton.classList.remove('disabled');
                                                saveButton.classList.add('enabled');
                                                cancelButton.classList.remove('disabled');
                                                cancelButton.classList.add('enabled');
                                                isChanged = true;
                                            }
                                        });
                                    });

                                    cancelButton.addEventListener('click', function (event) {
                                        if (isChanged) {
                                            window.location.reload();
                                        }
                                    });
                                })
        </script>
    </body>
</html>
