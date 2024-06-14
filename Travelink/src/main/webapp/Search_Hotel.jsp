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
        <link href="https://cdn.jsdelivr.net/npm/remixicon@3.4.0/fonts/remixicon.css" rel="stylesheet">
        <link rel="stylesheet" href="css/Search_Hotel.css">
        <link rel="stylesheet" href="css/listPage.css"/>
        <style>
            @import url('https://fonts.googleapis.com/css?family=Montserrat:400,800');
            * {
                box-sizing: border-box;
                font-family: 'Montserrat', sans-serif;
            }
            .booking__container select{
                width: 100%;
                padding: 10px 0;
                font-size: 1rem;
                outline: none;
                border: none;
                border-bottom: 1px solid var(--primary-color);
                color: var(--text-dark);
            }
            .booking__container select:focus~label{
                font-size: 0.8rem;
                top: 0;
            }
            .input__group input:focus + label,
            .input__group input:not(:placeholder-shown) + label,
            .input__group select:focus + label,
            .input__group select:not(:placeholder-shown) + label {
                top: 0;
                font-size: 0.8rem;
                color: #333;
            }
            .loader {
                position: fixed;
                top:0;
                left: 0;
                width: 100vw;
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                background-color: #f7f9fb;
                transition: opacity 0.75s, visibility 0.75s;
            }

            .loader-hidden {
                opacity: 0;
                visibility: hidden;
            }

            .loader::after{
                content: "";
                width: 75px;
                height: 75px;
                border: 15px solid #dddddd;
                border-top-color: rgb(1, 148, 243);
                border-radius: 50%;
                animation: loading 0.75s ease infinite;
            }

            @keyframes loading {
                from{
                    transform: rotate(0turn);
                }
                to{
                    transform: rotate(1turn);
                }
            }
        </style>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <div class="container mt-2">
            <section class="section__container booking__container">
                <form method="post" action="search">

                    <div class="form__group">
                        <span><i class="ri-map-pin-line"></i></span>
                        <div class="input__content">
                            <div class="input__group">
                                <select name="location">
                                    <c:if test="${requestScope.location != null}">
                                        <option >${requestScope.location}</option>
                                    </c:if>
                                    <c:if test="${requestScope.location == null}">
                                        <option>Location</option>
                                    </c:if>
                                    <c:forEach var="location" items="${requestScope.locationList}">
                                        <option value="${location.name}">${location.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <p>Where are you going?</p>
                        </div>
                    </div>
                    <div class="form__group">
                        <span><i class="ri-user-3-line"></i></span>
                        <div class="input__content">
                            <div class="input__group">
                                <c:if test="${requestScope.people != null}">
                                    <input id="numberInput" value="${requestScope.people}"type="number" name="number_of_people" min="1" required=""/>
                                </c:if>
                                <c:if test="${requestScope.people == null}">
                                    <input id="numberInput" value="0"type="number" name="number_of_people" min="1" required=""/>
                                </c:if>
                                <label id="number_label">No of people</label>
                            </div>
                            <p>Add guests</p>
                        </div>
                    </div>
                    <div class="form__group">
                        <span><i class="ri-calendar-line"></i></span>
                        <div class="input__content">
                            <div class="input__group">
                                <input type="date" name="check_in_date" value="${sessionScope.checkInDate}"required=""/>
                                <label>Departure</label>
                            </div>
                            <p style="margin-bottom: 0px">Add date</p>
                            <p style="color: red"> ${requestScope.statusBeginDate}</p>
                        </div>
                    </div>
                    <div class="form__group">
                        <span><i class="ri-calendar-line"></i></span>
                        <div class="input__content">
                            <div class="input__group">
                                <input type="date" value="${sessionScope.checkOutDate}" name="check_out_date" required=""/>
                                <label>Return</label>
                            </div>
                                <p style="margin-bottom: 0px">Add date</p> 
                                <p style="color: red"> ${requestScope.statusDate}</p>
                        </div>
                    </div>
                    <div class="form__group">
                        <span><i class="ri-home-5-line"></i></span>  <div class="input__content">
                            <div class="input__group">
                                <c:if test="${requestScope.room != null}">
                                    <input type="number" min="1" value="${requestScope.room}" name="number_of_rooms" required=""/> 
                                </c:if>
                                <c:if test="${requestScope.room == null}">
                                    <input type="number" min="1" value="0" name="number_of_rooms" required=""/> 
                                </c:if>  
                                <label>Rooms</label>
                            </div>
                            <p style="margin-bottom: 0px">Number of rooms</p>
                            <p style="color: red"> ${requestScope.statusRoomAndPeople}</p>
                        </div>
                    </div>
                    <div></div>
                    <div></div>

                    <div class="text-center mb-2">
                        <button class="btn btn-primary" type="submit"><i class="ri-search-line text-light">Search</button>
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
                        <c:if test="${requestScope.hotelList != null}">
                            <div class="col-md-12 mt-5">
                                <c:forEach var="hotel" items="${requestScope.hotelList}" varStatus="status">
                                    <div class="card mb-3">
                                        <div class="row g-0">
                                            <div class="col-md-4">
                                                <img src="${requestScope.hotelImgList[status.index]}" class="img-fluid h-100 rounded-start" alt="Hotel 1">
                                            </div>
                                            <div class="col-md-8">
                                                <div class="card-body h-100">
                                                    <h5 class="card-title d-flex justify-content-between align-items-center">
                                                        ${hotel.name}
                                                        <span class="px-0">
                                                            <c:if test="${hotel.star == 5}">
                                                                <i class="bi bi-star-fill stars"></i><i class="bi bi-star-fill stars"></i><i class="bi bi-star-fill stars"></i><i class="bi bi-star-fill stars"></i><i class="bi bi-star-fill stars"></i>
                                                                </c:if>
                                                                <c:if test="${hotel.star == 4}">
                                                                <i class="bi bi-star-fill stars"></i><i class="bi bi-star-fill stars"></i><i class="bi bi-star-fill stars"></i><i class="bi bi-star-fill stars"></i><i class="bi bi-star stars"></i>
                                                                </c:if>
                                                                <c:if test="${hotel.star == 3}">
                                                                <i class="bi bi-star-fill stars"></i><i class="bi bi-star-fill stars"></i><i class="bi bi-star-fill stars"></i><i class="bi bi-star stars"></i><i class="bi bi-star stars"></i>
                                                                </c:if>
                                                                <c:if test="${hotel.star == 2}">
                                                                <i class="bi bi-star-fill stars"></i><i class="bi bi-star-fill stars"></i><i class="bi bi-star stars"></i><i class="bi bi-star stars"></i><i class="bi bi-star stars"></i>
                                                                </c:if>
                                                                <c:if test="${hotel.star == 1}">
                                                                <i class="bi bi-star-fill stars"></i><i class="bi bi-star stars"></i><i class="bi bi-star stars"></i><i class="bi bi-star stars"></i><i class="bi bi-star stars"></i>
                                                                </c:if>
                                                        </span>
                                                    </h5>
                                                    <div class="row">
                                                        <p><i class="bi bi-location"></i>Đà Nẵng - <a href="https://maps.app.goo.gl/g2auqYTqpbokyX3E7">Show on map</a></p>
                                                    </div>
                                                    <p class="card-text"><i class="bi bi-geo-alt"></i> Địa điểm: ${hotel.address}</p>
                                                    <p class="card-text text-success fw-medium"><i class="bi bi-check"></i> Free canellation</p>
                                                    <p class="card-text text-success fw-medium"><i class="bi bi-check"></i> No prepayment needed <span class="text-muted text-success">- pay at property</span></p>
                                                    <div class="card-divider"></div>
                                                    <form action="viewHotelDetailServlet" method="get">
                                                        <button class="btn btn-primary">Đặt Phòng</button>
                                                        <input type="hidden" name="hotel_ID"value="${hotel.hotel_ID}">
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="listPage"></div>
                        </c:if>

                        <c:if test="${requestScope.status == null}">
                            <c:if test="${requestScope.hotelList == null}">
                                <div class="col-md-12 mt-5 text-center">
                                    <div class="alert alert-success" role="alert">
                                        Không có khách sạn hợp lệ !
                                    </div>
                                </div>
                            </c:if>
                        </c:if>
                        <div class="col-md-12">
                            <p>${requestScope.status}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--        <div class="loader">
        
                </div>-->
        <%@include file="Footer.jsp"%>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/15.7.0/nouislider.min.js"></script>
        <script src="js/Search_Hotel.js"></script>
        <script>
                                /* 
                                 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
                                 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
                                 */
                                let thisPage = 1;
                                let limit = 6;
                                let list = document.querySelectorAll(".card");
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
                                    document.querySelector('.listPage').innerHTML = '';

                                    if (thisPage != 1) {
                                        let prev = document.createElement('li');
                                        prev.innerText = 'PREV';
                                        prev.setAttribute('onclick', "changePage(" + (thisPage - 1) + ")");
                                        document.querySelector('.listPage').appendChild(prev);
                                    }
                                    for (i = 1; i <= count; i++) {
                                        let newPage = document.createElement('li');
                                        newPage.innerText = i;
                                        if (i == thisPage) {
                                            newPage.classList.add('active');
                                        }
                                        newPage.setAttribute('onclick', "changePage(" + i + ")");
                                        document.querySelector('.listPage').appendChild(newPage);
                                    }

                                    if (thisPage != count) {
                                        let next = document.createElement('li');
                                        next.innerText = 'NEXT';
                                        next.setAttribute('onclick', "changePage(" + (thisPage + 1) + ")");
                                        document.querySelector('.listPage').appendChild(next);
                                    }
                                }
                                function changePage(i) {
                                    thisPage = i;
                                    loadItem();
                                    let scrollPosition = window.scrollY;
                                    window.scrollTo(0, scrollPosition);
                                }

//                                window.addEventListener("load", () => {
//                                    const loader = document.querySelector(".loader");
//
//                                    loader.classList.add("loader-hidden");
//
//                                    loader.addEventListener("transitioned", () => {
//                                        document.body.removeChild("loader");
//                                    });
//                                });


        </script>
    </body>
</html>


