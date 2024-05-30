<%-- 
    Document   : Search_Hotel
    Created on : May 30, 2024, 1:02:02 PM
    Author     : DUYAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="bootstrap_css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
        <link
            href="https://cdn.jsdelivr.net/npm/remixicon@3.4.0/fonts/remixicon.css"
            rel="stylesheet"
            />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/15.7.0/nouislider.min.css">
        <link rel="stylesheet" href="css/Search_Hotel.css">
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <div class="container mt-2">
            <section class="section__container booking__container">
                <form method="get" action="search">
                    <form>
                        <div class="form__group">
                            <span><i class="ri-map-pin-line"></i></span>
                            <div class="input__content">
                                <div class="input__group">
                                    <input type="text" name="location"/>
                                    <label>Location</label>
                                </div>
                                <p>Where are you going?</p>
                            </div>
                        </div>
                        <div class="form__group">
                            <span><i class="ri-user-3-line"></i></span>
                            <div class="input__content">
                                <div class="input__group">
                                    <input id="numberInput" type="text" name="number_of_people"/>
                                    <label id="number_label">No of people</label>
                                </div>
                                <p>Add guests</p>
                            </div>
                        </div>
                        <div class="form__group">
                            <span><i class="ri-calendar-line"></i></span>
                            <div class="input__content">
                                <div class="input__group">
                                    <input type="text" name="check_in_date"/>
                                    <label>Departure</label>
                                </div>
                                <p>Add date</p>
                            </div>
                        </div>
                        <div class="form__group">
                            <span><i class="ri-calendar-line"></i></span>
                            <div class="input__content">
                                <div class="input__group">
                                    <input type="text" name="check_out_date"/>
                                    <label>Return</label>
                                </div>
                                <p>Add date</p>
                            </div>
                        </div>
                        <div class="form__group">
                            <span><i class="ri-home-5-line"></i></span>  <div class="input__content">
                                <div class="input__group">
                                    <input type="number" min="1" name="number_of_rooms"/>  <label>Rooms</label>
                                </div>
                                <p>Number of rooms</p>
                            </div>
                        </div>
                    </form>
                    <div class="text-center mb-2">
                        <button class="btn btn-primary fw-bold w-25"><i class="ri-search-line text-dark">  Search</i></button>
                    </div>
                </form>
            </section>        
            <div class="row">
                <!-- Phần bên trái -->
                <div class="col-md-3">
                    <div class="mb-3 mt-5">
                        <div style="border: 1px solid #ccc; height: 200px; position: relative;">
                            <!-- Đây là Google Map -->
                            <div id="googleMap" style="width: 100%; height: 100%;"></div>
                            <!-- Button mở bản đồ -->
                            <button class="btn btn-primary" style="position: absolute; top: 10px; right: 10px;" onclick="openMap()">Mở bản đồ</button>
                        </div>
                    </div>
                    <h4 style="color: #2c97d2;">Lọc khách sạn</h4>
                    <form id="filterForm">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="star" value="1" id="star1">
                            <label class="form-check-label" for="star1">
                                <i class="bi bi-star-fill stars"></i>
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="star" value="2" id="star2">
                            <label class="form-check-label" for="star2">
                                <i class="bi bi-star-fill stars"></i><i class="bi bi-star-fill stars"></i>
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="star" value="3" id="star3">
                            <label class="form-check-label" for="star3">
                                <i class="bi bi-star-fill stars"></i><i class="bi bi-star-fill stars"></i><i class="bi bi-star-fill stars"></i>
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="star" value="4" id="star4">
                            <label class="form-check-label" for="star4">
                                <i class="bi bi-star-fill stars"></i><i class="bi bi-star-fill stars"></i><i class="bi bi-star-fill stars"></i><i class="bi bi-star-fill stars"></i>
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="star" value="5" id="star5">
                            <label class="form-check-label" for="star5">
                                <i class="bi bi-star-fill stars"></i><i class="bi bi-star-fill stars"></i><i class="bi bi-star-fill stars"></i><i class="bi bi-star-fill stars"></i><i class="bi bi-star-fill stars"></i>
                            </label>
                        </div>                                   
                    </form>

                    <div class="container mt-3">
                        <div class="slidecontainer">
                            <span>min</span> <span>max</span>
                            <input type="range" min="1" max="100" value="50" class="slider" id="myRange">
                            <p><b>Value: <span id="demo"></span>$</b></p>
                        </div>
                    </div>

                </div>
                <!-- Phần bên phải -->
                <div class="col-md-9">
                    <div class="row">
                        <c:if test="${not empty hotels}">
                            <div class="col-md-12">
                                <h2>Danh sách khách sạn: </h2>
                                <c:forEach var="hotel" items="${hotels}">
                                    <div class="card mb-3">
                                        <div class="row g-0">
                                            <div class="col-md-4">
                                                <img src="hotel1.jpg" class="img-fluid rounded-start" alt="Hotel 1">
                                            </div>
                                            <div class="col-md-8">
                                                <div class="card-body">
                                                    <h5 class="card-title">${hotel.name}</h5>
                                                    <p class="card-text"><i class="bi bi-star-fill stars"></i><i class="bi bi-star-fill stars"></i><i class="bi bi-star-fill stars"></i><i class="bi bi-star-fill stars"></i><i class="bi bi-star-fill stars"></i> (${hotel.starRating} stars)</p>
                                                    <p class="card-text"><i class="bi bi-geo-alt"></i> Địa điểm: ${hotel.location}</p>
                                                    <p class="card-text price-info">Giá: $${hotel.price}/đêm</p>
                                                    <div class="card-divider"></div>
                                                    <a href="#" class="btn btn-primary float-end">Đặt phòng</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:if>

                        <c:if test="${empty hotels}">
                            <div class="col-md-12">
                                <p>Không tìm thấy khách sạn nào phù hợp với tiêu chí của bạn.</p>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/15.7.0/nouislider.min.js"></script>
        <script src="js/Search_Hotel.js"></script>
    </body>
</html>


