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
        <link rel="stylesheet" href="../css/Right_My_Account.css">
        <link rel="stylesheet" href="../css/Left_My_Account.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
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

        </style>
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
                        <li id="li2"><a href="My_Account_Update.jsp">Account Information</a></li>
                        <li id="li1">Password & Security</li>
                    </ul>
                </div>

                <div id="person_data1">
                    <div id="pd_h2">
                        <h2>Change Password</h2>
                    </div>
                    <div id="pd_data">
                        <form>
                            <div class="pd_flex">
                                <div class="flex1">
                                    <p>Old Password</p>
                                    <input type="password" name="password"  placeholder="Enter Old Password In Here" required minlength="8">
                                    <h5 style="color: red">${requestScope.pass_error}</h5>
                                </div>
                            </div>
                            <div class="pd_flex">
                                <div class="flex1"> 
                                    <p>New Password</p>
                                    <input type="password" name="newpassword" placeholder="Enter New Password In Here" required minlength="8">
                                    <h5 style="color: red">${requestScope.newpass_error}</h5>
                                </div>
                                <div class="flex1">
                                    <p>Enter Again New Password</p>
                                    <input type="password" name="re_newpassword" placeholder="Enter Again New Password In Here" required minlength="8">
                                    <h5 style="color: red">${requestScope.re_newpass_error}</h5>
                                </div>
                            </div>
                            <div class="pd_button">
                                <button onclick="cancel()">Cancel</button>
                                <input type="submit" value="Save"/>
                            </div>
                        </form>
                    </div>
                </div>
                <div id="person_data2" style="display: none">
                    <div id="pd_h2">
                        <h2>Delete Account</h2>             
                    </div>
                    <div id="pd_h2_content">
                        <p>Once your account is deleted, you won't be able to get your data back. This operation cannot be undone.</p>
                        <form>
                            <input type="submit" value="Delete">
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
                logoutConfirm.classList.remove("active");
                setTimeout(function () {
                    logoutConfirm.style.display = "none"; // Ẩn khung xác nhận
                    document.getElementById("overlay").style.display = "none";
                }, 500);
            });

        </script>
    </body>
</html>
