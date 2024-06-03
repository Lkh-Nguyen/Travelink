<%
    if (request.getAttribute("NotPaid_Transaction") == null) {
        request.getRequestDispatcher("NotPaid_Hotel_Service").forward(request, response);
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="com.travelink.Model.Customer" %>
<%@page import="java.util.List" %>
<%@page import="com.travelink.Model.HotelService" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NOT PAID</title>
        <link rel="stylesheet" href="css/Right_My_Account.css">
        <link rel="stylesheet" href="css/Left_My_Account.css">
        <link rel="icon" href="img_Home/logo.png">
        <link rel="stylesheet" href="css/Alter.css">
        <link rel="stylesheet" href="css/Loader.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link href='bootstrap_css/bootstrap.min.css' rel='stylesheet'>
        <!-- Dùng để đăng xuất-->
        <style>
            /* Định dạng chung cho card */
            .hotel-card {
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }

            .hotel-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            /* Định dạng nội dung trong card */
            .hotel-card .card-body {
                height: 100%;
                display: flex;
                flex-direction: column;
            }

            .hotel-card .card-title {
                font-size: 1.25rem;
                font-weight: bold;
                margin-bottom: 0.5rem;
            }

            .hotel-card .card-text {
                margin-bottom: 0.5rem;
            }

            .hotel-card .btn-primary {
                margin-top: auto;
                /* Đưa button xuống dưới nếu nội dung ngắn */
                align-self: center;
            }

            .card {
                width: 300px;
                /* Đặt chiều rộng cố định cho card */
                border: 1px solid rgb(0, 0, 0);

            }

            .card-body {
                padding: 1rem;
                /* Đặt padding cho card-body */
            }

            .card-title {
                font-size: 1.25rem;
                /* Kích thước tiêu đề cố định */
                font-weight: bold;
                /* Font-weight cho tiêu đề */
            }

            .card-text {
                font-size: 1rem;
                /* Kích thước văn bản cố định */
            }

            .card-text {
                overflow: hidden;
                /* Ẩn văn bản dư thừa */
                text-overflow: ellipsis;
                /* Hiển thị dấu elipsis cho văn bản dài */
                display: -webkit-box;
                /* Sử dụng display -webkit-box để có thể sử dụng line-clamp */
                -webkit-line-clamp: 3;
                /* Đặt số dòng hiển thị cụ thể (ví dụ 3 dòng) */
                -webkit-box-orient: vertical;
                /* Chiều dọc cho box */
            }

            .card:hover {
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
                /* Bóng đổ khi active */
                transform: scale(1.1);
                transition: transform 0.5s ease;
            }

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
                display: none;
                /* Ẩn mặc định */
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

            #logoutConfirm h2 {
                margin-top: -10px;
            }

            #logoutConfirm p {
                font-size: 20px;
                color: grey;
            }

            #logoutConfirm button {
                background-color: rgb(247, 249, 250);
                border: 0px;
                margin-bottom: 15px;
                width: 280px;
                height: 40px;
            }

            #logoutConfirm button:hover {
                background-color: rgb(242, 243, 243);
            }

            #logoutConfirm button:active {
                border: 3px solid rgb(1, 148, 243);
            }

            #logoutConfirm button a {
                font-size: 17px;
                user-select: none;
                color: rgb(1, 148, 243);
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

            button,
            input[type="submit"] {
                cursor: not-allowed;
            }

            .enabled {
                pointer-events: auto;
                opacity: 1;
            }

            button.enabled,
            input[type="submit"].enabled {
                cursor: pointer;
            }

            .loader {
                position: fixed;
                top: 0;
                left: 0;
                width: 100vw;
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                background-color: #f7f9fb;
                transition: opacity 0.75s, visibility 0.75s;
                z-index: 999;
            }

            .loader-hidden {
                opacity: 0;
                visibility: hidden;
            }

            .loader::after {
                content: "";
                width: 95px;
                height: 95px;
                border: 14px solid #dddddd;
                border-top-color: rgb(1, 148, 243);
                border-radius: 50%;
                animation: loading 0.75s ease infinite;
            }

            @keyframes loading {
                from {
                    transform: rotate(0turn);
                }

                to {
                    transform: rotate(1turn);
                }
            }

            .btn-primary:active {
                background-color: rgb(247, 249, 250);
            }
            .btn-primary:hover {
                background-color: rgb(247,249,250);
                cursor: pointer;
            }
            .list0_r{
                justify-content: center;
                user-select: none; /* Ngăn chặn người dùng bôi đậm nội dung */
                display: flex;
                justify-items: center;
                align-items: center;
                width: 100px;
                height: 50px;
                padding-left: 20px;
            }
            .list0_r i{
                font-size: 23px;
                margin-right: 15px;
                color: rgb(1,148,243);
                font-weight: 400;
            }
            .list0_r b{
                font-size: 23px;
                color: black;
                font-weight: 400;
            }
            .list0_r a{
                text-decoration: none;
            }
            .list0_r:hover{
                background-color: rgb(247,249,250);
                cursor: pointer;
            }
            .list0_r:active, .list0_r:active b {
                background-color: rgb(247, 249, 250);
                color: grey;
            }


            .list1_r{
                user-select: none; /* Ngăn chặn người dùng bôi đậm nội dung */
                pointer-events: none;
                display: flex;
                justify-items: center;
                align-items: center;
                width: 100px;
                height: 50px;
                padding-left: 20px;
                background-color: rgb(1,148,243);
                color: white;
            }
            .list1_r i{
                font-size: 23px;
                margin-right: 15px;
                color: white;
                font-weight: 400;
            }
            .list1_r b{
                font-size: 23px;
                color: white;
                font-weight: 400;
            }
            .list1_r a{
                text-decoration: none;
            }
            .list1_r a:hover {
                color:white;
            }
            #header_list_right{
                padding-top: 10px;
                display: flex;
            }
            .btn-history:hover {
                background-color: #0d6efd;
                color: white;
                transition: transform 1.0s ease;
            }
            .container {
                width: 700px;
            }
            .custom-bg {
                background-color: #fafafa; /* Màu xám rất nhạt */
                background-image: linear-gradient(to right, #fafafa, #f5f5f5); /* Gradient từ #fafafa đến #f5f5f5 */
                border-radius: 5px;
            }
        </style>
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
                        <img src="${customer.avatarURL}" alt="alt" />
                    </div>
                    <div style="margin-left: 10px">
                        <h1>${customer.name}</h1>
                        <p>Google</p>
                    </div>
                </div>
                <div id="header_list">
                    <div class="list0">
                        <a href="My_Account_Update.jsp"><i class='bx bx-cog'></i> <b>My Account</b></a>
                    </div>
                    <div class="list0">
                        <a href="View_Avatar.jsp"><i class='bx bx-image-add'></i> <b>View Avatar</b></a>
                    </div>
                    <div class="list0">
                        <a href="#"><i class='bx bx-calendar'></i> <b>Process Booking</b></a>
                    </div>
                    <div class="list1">
                        <a href="My_Card_Payment_History.jsp"><i class='bx bx-money-withdraw'></i>
                            <b>Booking History</b></a>
                    </div>
                    <div class="list0">
                        <a href="ListFavoriteHotel"><i class='bx bx-heart-circle'></i> <b>Favorite Hotel</b></a>
                    </div>
                    <div class="list0">
                        <a href="#"><i class='bx bx-log-out'></i><b id="logoutButton">Logging
                                Out</b></a>
                    </div>
                </div>
            </div>
            <div id="right">
                <!-- Card History -->
                <!-- Change -->
                <div class="container mb-5">
                    <h1 class="fw-bold fs-1">History</h1>
                    <div class="card-body">
                        <div class="row mb-3">
                            <div class="col-md-3 d-flex align-items-center justify-content-center">
                                <a href="My_Card_Payment_History.jsp" class="list0_r btn-history w-100 text-center py-2 btn-history d-inline-flex focus-ring py-1 px-2 text-decoration-none border rounded-2" style="--bs-focus-ring-x: 10px; --bs-focus-ring-y: 10px; --bs-focus-ring-blur: 4px">ALL</a>
                            </div>

                            <div class="col-md-3 d-flex align-items-center justify-content-center">
                                <a class="list0_r btn-history w-100 text-center py-2 btn-history d-inline-flex focus-ring py-1 px-2 text-decoration-none border rounded-2" style="--bs-focus-ring-x: 10px; --bs-focus-ring-y: 10px; --bs-focus-ring-blur: 4px"" href="Paid_Transaction.jsp">PAID</a>
                            </div>
                            <div class="col-md-3  d-flex align-items-center justify-content-center">
                                <a class="list0_r btn-history w-100 text-center py-2 btn-history d-inline-flex focus-ring py-1 px-2 text-decoration-none border rounded-2" style="--bs-focus-ring-x: 10px; --bs-focus-ring-y: 10px; --bs-focus-ring-blur: 4px"" href="#">NOT PAID</a>
                            </div>
                            <div class="col-md-3  d-flex align-items-center justify-content-center">
                                <a class="list0_r btn-history w-100 text-center py-2 btn-history d-inline-flex focus-ring py-1 px-2 text-decoration-none border rounded-2" style="--bs-focus-ring-x: 10px; --bs-focus-ring-y: 10px; --bs-focus-ring-blur: 4px"" href="Cancel_Transaction.jsp">CANCEL</a>
                            </div>
                        </div>
                    </div>
                    <div id="noHistory" class="alert alert-danger text-center" style="display: none;">
                        You don't have any transaction !
                    </div>
                    <div id="hotelList">
                        <c:if test="${requestScope.NotPaid_Transaction == null}">
                            <div class="container">
                                <div id="noHistory" class="alert alert-danger text-center w-100">
                                    You don't have any transaction !
                                </div>
                            </div>
                        </c:if>
                        <div class ="row">
                            <c:forEach var="h" items="${requestScope.NotPaid_Transaction}">
                                <div class="col-md-6 mb-4 hotel-card">
                                    <div class="card h-100 border rounded shadow">
                                        <div class="card-body d-flex flex-column custom-bg">
                                            <h5 class="card-title">
                                                <i class='bx bxs-hotel'></i> ${h.hotel.name} - ${h.hotelServiceID}
                                            </h5>
                                            <p class="card-text mb-3">
                                                <i class='bx bx-support'></i> ${h.service.name}
                                            </p>
                                            <p class="card-text">
                                                <i class='bx bxs-x-square'></i>
                                                <span class="badge text-bg-warning">${h.reservation.status}</span>
                                            </p>
                                            <p class="card-text mb-2">
                                                <i class='bx bx-calendar-check'></i> ${h.reservation.checkInDate}
                                            </p>
                                            <p class="card-text mb-2">
                                                <i class='bx bx-calendar-x'></i> ${h.reservation.checkOutDate} 
                                            </p>
                                            <p class="card-text mb-2">
                                                <i class='bx bx-dollar-circle'></i> ${h.reservation.totalPrice}
                                            </p>
                                            <a href="hotelServiceDetail?hsID=${h.hotelServiceID}" target="_blank" class="btn btn-outline-primary mt-auto">
                                                <i class='bx bx-detail'> </i> View Details
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <nav class="justify-content-center align-items-center bg-white">
                        <ul class="pagination"></ul>
                    </nav>
                </div>
            </div>
        </div>
<!--        <div class="loader">

        </div>-->
        <script>
            //Logout confirmation
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

            // Pagination
            let thisPage = 1;
            let limit = 2; // 2 items per page
            let list = document.querySelectorAll(".hotel-card");

            function loadItem() {
                let beginGet = limit * (thisPage - 1);
                let endGet = limit * thisPage - 1;

                list.forEach((item, key) => {
                    if (key >= beginGet && key <= endGet) {
                        item.style.display = "block";
                    } else {
                        item.style.display = "none";
                    }
                });

                listPage();
            }

            loadItem();

            function listPage() {
                let count = Math.ceil(list.length / limit);
                document.querySelector('.pagination').innerHTML = '';

                if (thisPage != 1) {
                    let prev = document.createElement('li');
                    prev.classList.add('page-item');
                    prev.innerHTML = '<a class="page-link" href="#" onclick="changePage(' + (thisPage - 1) + ')">Previous</a>';
                    document.querySelector('.pagination').appendChild(prev);
                }

                for (let i = 1; i <= count; i++) {
                    let li = document.createElement('li');
                    li.classList.add('page-item');
                    if (i == thisPage) {
                        li.classList.add('active');
                    }
                    li.innerHTML = '<a class="page-link" href="#" onclick="changePage(' + i + ')">' + i + '</a>';
                    document.querySelector('.pagination').appendChild(li);
                }

                if (thisPage != count) {
                    let next = document.createElement('li');
                    next.classList.add('page-item');
                    next.innerHTML = '<a class="page-link" href="#" onclick="changePage(' + (thisPage + 1) + ')">Next</a>';
                    document.querySelector('.pagination').appendChild(next);
                }
            }

            function changePage(page) {
                thisPage = page;
                loadItem();
            }

            // Initially load the first page
            window.onload = function () {
                loadItem();
            };

        </script>
    </div>
</body>

</html>