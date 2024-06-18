<%-- 
    Document   : Header_HotelHost
    Created on : Jun 14, 2024, 9:29:44 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="icon" href="img_Home/logo.png">
        <link rel="stylesheet" href="bootstrap_css/bootstrap.min.css">
        <link rel="stylesheet" href="css/Home_HotelHost.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <style>
            @import url('https://fonts.googleapis.com/css?family=Montserrat:400,800');
            * {
                font-family: Montserrat, sans-serif;
            }

        </style>
    </head>
    <body>
        <!-- Phần navbar -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light justify-content-md-around">
            <div class="card bg-light border-0" id="titleHotel">
                <div class="row justify-content-center align-items-center">
                    <div class="col-auto">
                        <img src="img_Home/logo.png" width="50" height="60" class="d-inline-block align-top" alt="">
                    </div>
                    <div class="col-auto">
                        <div class="nav__logo"><a href="Home_Customer.jsp">Trave<span>link</span></a></div>
                    </div>
                </div>
            </div>
            <div class="ml-2 justify-content-end align-content-end align-items-end">
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle d-flex align-items-center btn btn-outline-secondary p-2" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img src="${account.avatarURL}" width="30" height="30" class="rounded-circle m-1" alt="">
                            <span class="ml-2">${account.name}<i class='bx bxs-check-shield px-1' style="font-size: 1rem; color: green;"></i></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="#">Show Profile</a>
                            <a class="dropdown-item" href="#">Logout</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>

        <!-- Phần hàng thứ nhì -->
        <div class="row bg-light border-top p-3">
            <div class="col-md-1 d-flex justify-content-around align-items-center" id="containIcon">
                <i class='bx bx-home' style='font-size: 2rem;'></i>
            </div>
            <div class="col-md-7 d-flex align-items-center">
                Welcome back, <span class="px-1 fw-semibold">${account.name}<i class='bx bxs-check-shield px-1' style="font-size: 1rem; color: green;"></i></span>
            </div>
            <div class="col-md-4 d-flex align-items-center justify-content-end">
                <i class="bx bx-signal-4" style="font-size: 2rem; color: #007bff;"></i>
                <span>15 new features updated successfully</span>
            </div>
        </div>
    </body>
</html>



