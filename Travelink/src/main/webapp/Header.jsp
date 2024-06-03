<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP 1</title>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="icon" href="img_Home/logo.png">
        <style>


            @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap");

            :root {
                --primary-color: #3d5cb8;
                --primary-color-dark: #334c99;
                --text-dark: #0f172a;
                --text-light: #64748b;
                --extra-light: #f1f5f9;
                --white: #ffffff;
                --max-width: 1200px;
            }


            .btns {
                cursor: pointer;
                user-select: none;
                position: relative;
            }

            .btn {
                display: flex;
                align-items: center;
                text-decoration: none;
                color: #333;
                background-color: #fff;
                padding: 10px 15px;
                border: 1px solid #ddd;
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                transition: background-color 0.3s, box-shadow 0.3s;
            }
            .loginBtn {
                font-size: 17px;
                white-space: nowrap;         /* Prevent line breaks */
                overflow: hidden;            /* Hide overflow content */
                text-overflow: ellipsis;     /* Display "..." when content overflows */
                max-width: 400px;            /* Set a maximum width */
            }
            .btn:hover {
                background-color: #f0f0f0;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            }

            .btn img {
                border-radius: 50%;
                margin-right: 10px;
                width: 30px;
                height: 30px;
            }

            .dropdown {
                display: none;
                position: absolute;
                top: 50px;
                left: 0;
                background-color: #fff;
                border: 1px solid #ddd;
                border-radius: 5px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                z-index: 1;
                min-width: 200px;
            }

            .dropdown a {
                display: flex;
                align-items: center;
                padding: 10px 15px;
                text-decoration: none;
                color: #333;
                font-size: 1.2rem;
                transition: background-color 0.3s;
            }

            .dropdown a:hover {
                background-color: #f0f0f0;
            }

            .dropdown a i {
                margin-right: 10px;
            }

            .show {
                display: block;
            }


            nav {
                max-width: 100%;
                margin: auto;
                padding: 1rem;
                display: flex;
                align-items: center;
                justify-content: space-between;
                gap: 1rem;
                background-color: rgba(0, 0, 0, 0.05);
            }

            .nav__logo {
                font-size: 1.8rem;
                font-weight: 600;
                color: var(--text-dark);
            }
            .nav__logo a:active{

                color:blue;
            }
            span{
                color:var(--primary-color-dark)
            }
            a{
                text-decoration: none;
            }
            .nav__links {
                list-style: none;
                display: flex;
                align-items: center;
                gap: 4rem;
                margin: 0 2rem 0 12rem;
            }

            .link a {
                font-size: 1.2rem;
                font-weight: 550;
                color: var(--text-light);
                transition: 0.3s;
            }

            .link a:hover {
                color: var(--text-dark);
            }

            #overlay1 {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5)    ;
                display: none;
                z-index: 999;
            }

            #logoutConfirm1 {
                display: none; /* Ẩn mặc định */
                border-radius: 10px;
                width: 280px;
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
            #logoutConfirm1 h2{
                margin-top:-10px;
            }
            #logoutConfirm1 p{
                font-size: 20px;
                color: grey;
            }
            #logoutConfirm1 button{
                background-color:rgb(247,249,250);
                border: 0px;
                margin-bottom: 15px;
                width: 100%;
                height: 40px;
            }
            #logoutConfirm1 button:hover{
                background-color:rgb(242,243,243);
            }
            #logoutConfirm1 button:active{
                border: 3px solid rgb(1,148,243);
            }
            #logoutConfirm1 button a{
                font-size: 17px;
                user-select: none;
                color: rgb(1,148,243);
                text-decoration: none;
            }

            #logoutConfirm1.active {
                bottom: 50%;
                transform: translate(-50%, 50%);
            }

            .btn1 {
                padding: 0.75rem 2rem;
                outline: none;
                border: none;
                font-size: 1rem;
                font-weight: 600;
                color: var(--white);
                background-color: var(--primary-color);
                border-radius: 2rem;
                cursor: pointer;
                transition: 0.3s;
            }

            .btn1:hover {
                background-color: var(--primary-color-dark);
            }

            .loginBtn1 a{
                color: white;
            }
        </style>
    </head>
    <body>

        <!-- Dùng để đăng xuất-->
        <div id="overlay1"></div>
        <div id="logoutConfirm1">
            <h2>Logging Out</h2>
            <p>Oh, no! You’ll miss a lot of things by logging out: Travelink Points, 
                Passenger Quick Pick, Price Alerts, and other member-only benefits.
                Are you sure want to log out?</p>
            <button id="confirmYes1"><a href="logout">Yes</a></button>
            <button id="confirmNo1"><a href="#">No</a></button>
        </div>
        <!-- Dùng để đăng xuất-->
        <header>
            <nav>
                <div class="nav__logo"><a href="Home_Customer.jsp">Trave<span>link</span></a></div>
                <ul class="nav__links">
                    <li class="link"><a href="#">Home</a></li>
                    <li class="link"><a href="#">About</a></li>
                    <li class="link"><a href="#">My booking</a></li>
                    <li class="link"><a href="#">Transaction History</a></li>
                    <li class="link"><a href="#">Favorite Hotels</a></li>
                </ul>
                <c:set var="customer" value="${sessionScope.customer}"></c:set>
                <c:if test="${not empty customer}">
                    <div class="btns">
                        <a class="btn loginBtn" style="margin-right: 40px;" onclick="toggleDropdown()"><img src="${customer.avatarURL}" alt="alt"/>${customer.name}</a>
                        <div id="dropdownMenu" class="dropdown" >
                            <a href="My_Account_Update.jsp"><i class='bx bx-user'></i>Edit Profile</a>
                            <a href="#" id="logoutButton1"><i class='bx bx-log-out' ></i>Logging Out</a>
                        </div>
                    </div>
                </c:if>
                <c:if test="${empty customer}">
                    <div class="btns">
                        <button class="btn1 loginBtn1"><a href="Form_Login.jsp">GET STARTED</a></button>

                    </div>
                </c:if>

            </nav>
        </header>
        <script>
            function toggleDropdown() {
                document.getElementById("dropdownMenu").classList.toggle("show");
            }

// Close the dropdown menu if the user clicks outside of it
            window.onclick = function (event) {
                if (!event.target.matches('.loginBtn')) {
                    var dropdowns = document.getElementsByClassName("dropdown");
                    for (var i = 0; i < dropdowns.length; i++) {
                        var openDropdown = dropdowns[i];
                        if (openDropdown.classList.contains('show')) {
                            openDropdown.classList.remove('show');
                        }
                    }
                }
            }
            document.getElementById("logoutButton1").addEventListener("click", function () {
                document.getElementById("overlay1").style.display = "block";
                var logoutConfirm = document.getElementById("logoutConfirm1");
                logoutConfirm.style.display = "block"; // Hiển thị khung xác nhận
                setTimeout(function () {
                    logoutConfirm.classList.add("active");
                }, 50);
            });

            document.getElementById("confirmNo1").addEventListener("click", function () {
                var logoutConfirm = document.getElementById("logoutConfirm1");
                logoutConfirm.classList.remove("active");
                setTimeout(function () {
                    logoutConfirm.style.display = "none"; // Ẩn khung xác nhận
                    document.getElementById("overlay1").style.display = "none";
                }, 500);
            });

            document.getElementById("overlay1").addEventListener("click", function () {
                var logoutConfirm = document.getElementById("logoutConfirm1");
                logoutConfirm.classList.remove("active");
                setTimeout(function () {
                    logoutConfirm.style.display = "none"; // Ẩn khung xác nhận
                    document.getElementById("overlay1").style.display = "none";
                }, 500);
            });
        </script>
    </body>
</html>