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

            /*            .loginBtn1 a{
                            color: white;
                        }*/

            .button {
                position: relative;
                transition: all 0.3s ease-in-out;
                box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.2);
                padding-block: 0.5rem;
                padding-inline: 1.25rem;
                background-color: rgb(0 107 179);
                border-radius: 9999px;
                display: flex;
                align-items: center;
                justify-content: center;
                color: #ffff;
                gap: 10px;
                font-weight: bold;
                border: 3px solid #ffffff4d;
                outline: none;
                overflow: hidden;
                font-size: 15px;
            }

            .icon {
                width: 24px;
                height: 24px;
                transition: all 0.3s ease-in-out;
            }

            .button:hover {
                transform: scale(1.05);
                border-color: #fff9;
            }

            .button:hover .icon {
                transform: translate(4px);
            }

            .button:hover::before {
                animation: shine 1.5s ease-out infinite;
            }

            .button::before {
                content: "";
                position: absolute;
                width: 100px;
                height: 100%;
                background-image: linear-gradient(
                    120deg,
                    rgba(255, 255, 255, 0) 30%,
                    rgba(255, 255, 255, 0.8),
                    rgba(255, 255, 255, 0) 70%
                    );
                top: 0;
                left: -100px;
                opacity: 0.6;
            }

            @keyframes shine {
                0% {
                    left: -100px;
                }

                60% {
                    left: 100%;
                }

                to {
                    left: 100%;
                }
            }
            body {
                background: #fbfbfd;
            }

            .new_footer_area {
                background: #fbfbfd;
            }
            .new_footer_area a {
                text-decoration: none;
            }

            .new_footer_top a {
                text-decoration: none;
            }

            .new_footer_top {
                padding: 120px 0px 270px;
                position: relative;
                overflow-x: hidden;
            }
            .new_footer_area .footer_bottom {
                padding-top: 5px;
                padding-bottom: 50px;
            }
            .new_footer_top .company_widget p {
                font-size: 16px;
                font-weight: 300;
                line-height: 28px;
                color: #6a7695;
                margin-bottom: 20px;
            }
            .new_footer_top .company_widget .f_subscribe_two .btn_get {
                border-width: 1px;
                margin-top: 20px;
            }
            .btn_get_two:hover {
                background: transparent;
                color: #5e2ced;
            }
            .btn_get:hover {
                color: #fff;
                background: #6754e2;
                border-color: #6754e2;
                -webkit-box-shadow: none;
                box-shadow: none;
            }
            a:hover, a:focus, .btn:hover, .btn:focus, button:hover, button:focus {
                text-decoration: none;
                outline: none;
            }
            .new_footer_top .f_widget.about-widget .f_list li a:hover {
                color: #5e2ced;
            }
            .new_footer_top .f_widget.about-widget .f_list li {
                margin-bottom: 11px;
            }
            .f_widget.about-widget .f_list li:last-child {
                margin-bottom: 0px;
            }
            .f_widget.about-widget .f_list li {
                margin-bottom: 15px;
            }
            .f_widget.about-widget .f_list {
                margin-bottom: 0px;
            }
            .new_footer_top .f_social_icon a {
                width: 44px;
                height: 44px;
                line-height: 43px;
                background: transparent;
                border: 1px solid #e2e2eb;
                font-size: 24px;
            }
            .f_social_icon a {
                text-decoration: none;
                width: 46px;
                height: 46px;
                border-radius: 50%;
                font-size: 14px;
                line-height: 45px;
                color: #858da8;
                display: inline-block;
                background: #ebeef5;
                text-align: center;
                -webkit-transition: all 0.2s linear;
                -o-transition: all 0.2s linear;
                transition: all 0.2s linear;
            }
            .ti-facebook:before {
                content: "\e741";
            }
            .ti-twitter-alt:before {
                content: "\e74b";
            }
            .ti-vimeo-alt:before {
                content: "\e74a";
            }
            .ti-pinterest:before {
                content: "\e731";
            }

            .btn_get_two {
                -webkit-box-shadow: none;
                box-shadow: none;
                background: #5e2ced;
                border-color: #5e2ced;
                color: #fff;
            }

            .btn_get_two:hover {
                background: transparent;
                color: #5e2ced;
            }

            .new_footer_top .f_social_icon a:hover {
                background: #5e2ced;
                border-color: #5e2ced;
                color:white;
            }
            .new_footer_top .f_social_icon a + a {
                margin-left: 4px;
            }
            .new_footer_top .f-title {
                margin-bottom: 30px;
                color: #263b5e;
            }
            .f_600 {
                font-weight: 600;
            }
            .f_size_18 {
                font-size: 18px;
            }
            h1, h2, h3, h4, h5, h6 {
                color: #4b505e;
            }
            .new_footer_top .f_widget.about-widget .f_list li a {
                color: #6a7695;
            }


            .new_footer_top .footer_bg {
                position: absolute;
                bottom: 0;
                background: url("https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEigB8iI5tb8WSVBuVUGc9UjjB8O0708X7Fdic_4O1LT4CmLHoiwhanLXiRhe82yw0R7LgACQ2IhZaTY0hhmGi0gYp_Ynb49CVzfmXtYHUVKgXXpWvJ_oYT8cB4vzsnJLe3iCwuzj-w6PeYq_JaHmy_CoGoa6nw0FBo-2xLdOPvsLTh_fmYH2xhkaZ-OGQ/s16000/footer_bg.png") no-repeat scroll center 0;
                width: 100%;
                height: 266px;
            }

            .new_footer_top .footer_bg .footer_bg_one {
                background: url("https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEia0PYPxwT5ifToyP3SNZeQWfJEWrUENYA5IXM6sN5vLwAKvaJS1pQVu8mOFFUa_ET4JuHNTFAxKURFerJYHDUWXLXl1vDofYXuij45JZelYOjEFoCOn7E6Vxu0fwV7ACPzArcno1rYuVxGB7JY6G7__e4_KZW4lTYIaHSLVaVLzklZBLZnQw047oq5-Q/s16000/volks.gif") no-repeat center center;
                width: 330px;
                height: 105px;
                background-size:100%;
                position: absolute;
                bottom: 0;
                left: 30%;
                -webkit-animation: myfirst 22s linear infinite;
                animation: myfirst 22s linear infinite;
            }

            .new_footer_top .footer_bg .footer_bg_two {
                background: url("https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhyLGwEUVwPK6Vi8xXMymsc-ZXVwLWyXhogZxbcXQYSY55REw_0D4VTQnsVzCrL7nsyjd0P7RVOI5NKJbQ75koZIalD8mqbMquP20fL3DxsWngKkOLOzoOf9sMuxlbyfkIBTsDw5WFUj-YJiI50yzgVjF8cZPHhEjkOP_PRTQXDHEq8AyWpBiJdN9SfQA/s16000/cyclist.gif") no-repeat center center;
                width: 88px;
                height: 100px;
                background-size:100%;
                bottom: 0;
                left: 38%;
                position: absolute;
                -webkit-animation: myfirst 30s linear infinite;
                animation: myfirst 30s linear infinite;
            }



            @-moz-keyframes myfirst {
                0% {
                    left: -25%;
                }
                100% {
                    left: 100%;
                }
            }

            @-webkit-keyframes myfirst {
                0% {
                    left: -25%;
                }
                100% {
                    left: 100%;
                }
            }

            @keyframes myfirst {
                0% {
                    left: -25%;
                }
                100% {
                    left: 100%;
                }
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
                <button class="btn-title">
                    <a class="a-title" href="#"><span>Button</span></a> 
                </button>
                <ul class="nav__links">
                    <li class="link"><a href="Home_Customer.jsp">Home</a></li>
                    <li class="link"><a href="#">About</a></li>
                    <li class="link"><a href="#">My booking</a></li>
                    <li class="link"><a href="All_Hotel_Service">Transaction History</a></li>
                    <li class="link"><a href="ListFavoriteHotel">Favorite Hotels</a></li>
                </ul>
                <c:set var="account" value="${sessionScope.account}"></c:set>
                <c:if test="${not empty account}">
                    <div class="btns">
                        <a class="btn loginBtn" style="margin-right: 40px;" onclick="toggleDropdown()"><img src="${account.avatarURL}" alt="alt"/>${account.name}</a>
                        <div id="dropdownMenu" class="dropdown" >
                            <a href="My_Account_Update.jsp"><i class='bx bx-user'></i>Edit Profile</a>
                            <a href="#" id="logoutButton1"><i class='bx bx-log-out' ></i>Logging Out</a>
                        </div>
                    </div>
                </c:if>
                <c:if test="${empty account}">
                    <button class="button" onclick="location.href = 'Form_Login.jsp'">
                        Apply Now
                        <svg fill="currentColor" viewBox="0 0 24 24" class="icon">
                        <path clip-rule="evenodd" d="M12 2.25c-5.385 0-9.75 4.365-9.75 9.75s4.365 9.75 9.75 9.75 9.75-4.365 9.75-9.75S17.385 2.25 12 2.25zm4.28 10.28a.75.75 0 000-1.06l-3-3a.75.75 0 10-1.06 1.06l1.72 1.72H8.25a.75.75 0 000 1.5h5.69l-1.72 1.72a.75.75 0 101.06 1.06l3-3z" fill-rule="evenodd"></path>
                        </svg>
                    </button>
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