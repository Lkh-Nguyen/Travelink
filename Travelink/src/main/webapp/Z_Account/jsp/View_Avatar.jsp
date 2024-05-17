<%-- 
    Document   : account
    Created on : May 15, 2024, 8:59:13 PM
    Author     : HELLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../css/Left_My_Account.css">
        <link rel="stylesheet" href="../css/View_Avata.css">
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
                height: 300px;
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


            /*Image*/
            #ImgAvatar {
                display: none; /* Ẩn mặc định */
                border-radius: 10px;
                position: fixed;
                bottom: 250px;
                left: 50%;
                transform: translateX(-50%);
                background-color: #fff;
                padding: 20px;
                border: 1px solid #ccc;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                z-index: 1000;
                transition: bottom 0.5s ease;
            }
            #ImgAvatar img{
                width: 500px;
                height: 500px;
                cursor: pointer;
            }
            #logoutConfirm.active {
                bottom: 50%;
                transform: translate(-50%, 50%);
            }
        </style>
        <!-- Dùng để đăng xuất-->
    </head>
    <body>
        <%@include file="../../header.jsp" %>
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

        <div id="ImgAvatar">
            <img src="../img_Avatar/logo.png" alt="alt"/>
        </div>


        <div id="mid_container">
            <div id="left">
                <div id="header_left">
                    <div>
                        <img src="../img_Avatar/logo.png" alt="alt"/>
                    </div>
                    <div style="margin-left: 10px">
                        <h1>Le Kim Hoang Nguyen(K17)</h1>
                        <p>Google</p>
                    </div>
                </div>
                <div id="header_list">
                    <div class="list0">
                        <a href="My_Account_Update.jsp"><i class='bx bx-cog'></i> <b>My Account</b></a>
                    </div>
                    <div class="list1">
                        <a href="#"><i class='bx bx-image-add' ></i> <b>View Avatar</b></a>
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
                <div id="data_img">
                    <div id="pd_h2">
                        <h2>View Avatar</h2>
                    </div>
                    <div id="edit_img">
                        <img src="../img_Avatar/logo.png" alt="alt"/><br>
                        <button id="seeAvatar" onclick="hello()">View Avatar</button>
                        <form method="post" action="UploadFile" enctype="multipart/form-data">
                            <input type="file" name="file" size="60"/><br/>
                            <p>Maximum file size is 1 MB.<br>Format: .JPEG, .PNG</p>
                            <input id="submit_Input" style="margin-top:10px" type="submit" value="Upload"/>
                        </form>

                    </div>
                </div>
            </div>
        </div>
        <script>
            function cancel() {
                location.reload();
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
                var ImgAvatar = document.getElementById("ImgAvatar");
                ImgAvatar.classList.remove("active");
                logoutConfirm.classList.remove("active");
                setTimeout(function () {
                    ImgAvatar.style.display = "none"; // Ẩn khung xác nhận
                    document.getElementById("overlay").style.display = "none";
                }, 500);
                setTimeout(function () {
                    logoutConfirm.style.display = "none"; // Ẩn khung xác nhận
                    document.getElementById("overlay").style.display = "none";
                }, 500);
            });


            document.getElementById("seeAvatar").addEventListener("click", function () {
                document.getElementById("overlay").style.display = "block";
                var ImgAvatar = document.getElementById("ImgAvatar");
                ImgAvatar.style.display = "block"; // Hiển thị khung xác nhận
                setTimeout(function () {
                    ImgAvatar.classList.add("active");
                }, 50);
            });


        </script>
    </body>
</html>
