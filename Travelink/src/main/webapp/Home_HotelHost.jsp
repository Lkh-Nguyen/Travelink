<%-- 
    Document   : Home_HotelHost
    Created on : May 26, 2024, 8:12:20 PM
    Author     : DUYAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      href="https://cdn.jsdelivr.net/npm/remixicon@3.4.0/fonts/remixicon.css"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <title>Travelink</title>
    <!-- ---------------------Link------------------------------------------------ -->
    <link rel="icon" href="img_Home/logo.png">
    <link rel="stylesheet" href="css/Home_HotelHost.css"/>
</head>
<body>
    <nav>
        <div class="nav__logo">Trave<span>link</span></div>
        <ul class="nav__links">
          <li class="link"><a href="#">Home</a></li>
          <li class="link"><a href="#">About</a></li>
          <li class="link"><a href="#">Booking</a></li>
          <li class="link"><a href="#">Seats</a></li>
          <li class="link"><a href="#">Destinations</a></li>
        </ul>
        <div class="profile">
            <img src="img_Home/logo.png">
            <div class="profile-name">Hotel</div>
            <div class="dropdown-menu" id="dropdownMenu">
                <ul>
                    <li><a href="#">Profile</a></li>
                    <li><a href="#">Settings</a></li>
                    <li><a href="#">Logout</a></li>
                </ul>
            </div>
        </div>        
      </nav>
      <div class="body">
        <div class="sidebar">
          <h2>Menu</h2>
          <ul>
              <li>
                  <i class="fas fa-hotel"></i>
                  <a href="#">Thông tin khách sạn</a>
                  <ul>
                      <li>
                          <i class="fas fa-calendar-alt"></i>
                          <a href="#">Số phòng theo ngày</a>
                      </li>
                      <ul>
                          <li>
                              <i class="fas fa-star"></i>
                              <a href="#">Phòng VIP</a>
                          </li>
                          <li>
                              <i class="fas fa-bed"></i>
                              <a href="#">Phòng thường</a>
                          </li>
                      </ul>
                  </ul>
              </li>
              <li>
                  <i class="fas fa-concierge-bell"></i>
                  <a href="#">Đặt phòng</a>
                  <ul>
                      <li>
                          <i class="fas fa-calendar-check"></i>
                          <a href="#">Lịch đặt phòng</a>
                      </li>
                      <li>
                          <i class="fas fa-file-invoice"></i>
                          <a href="#">Hoá đơn đặt phòng</a>
                      </li>
                  </ul>
              </li>
              <li>
                  <i class="fas fa-tachometer-alt"></i>
                  <a href="#">Dashboard</a>
              </li>
          </ul>
      </div>
      <div class="content">
        <i class="fas fa-hotel icon"></i>
        <div class="welcome-text">Welcome hotel's boss ^^</div>
      </div>
      </div>   
      </div>
      <!-- ---------------------Javascript------------------------------------------------ -->
      <script src="js/Home_HotelHost.js"></script>
</body>
</html>
