    <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@page import="com.travelink.Model.*" %>
<%@page import="com.travelink.Database.*" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="img_Home/logo.png">
        <link rel="stylesheet" href="bootstrap_css/bootstrap.min.css">
        <link rel="stylesheet" href="css/Hotel_Detail.css">
        <link rel="stylesheet" href="css/listPage.css">
        <title>Hotel</title>
        <style>
            table {
                width: 100%;
                border-collapse: collapse;
            }
            th, td {
                border: 1px solid #dddddd;
                text-align: left;
                padding: 8px;
            }
            th {
                background-color: #f2f2f2;
            }
            tfoot th {
                background-color: #4CAF50;
                color: white;
            }
        </style>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <div class="container" id="detail">
            <div id="detail_header">
                <h2>${requestScope.hotel_view.name}</h2>
                <button disabled>Hotel</button>
                <c:if test="${requestScope.hotel_view.star eq 1}">
                    <i class='bx bxs-star'></i>
                </c:if>
                <c:if test="${requestScope.hotel_view.star eq 2}">
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                </c:if>
                <c:if test="${requestScope.hotel_view.star eq 3}">
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                </c:if>
                <c:if test="${requestScope.hotel_view.star eq 4}">
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                </c:if>
                <c:if test="${requestScope.hotel_view.star eq 5}">
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                </c:if>
            </div>
            <div id="detail_address">
                <i class='bx bxs-location-plus' ></i> ${requestScope.hotel_view.address}
            </div>
            <div class="row" style="margin-top: 2%" id="img_Hotel">
                <div class="col-md-8" id="left_img">
                    <img class="thumbnail1" style="width: 102%" src="${requestScope.hotelImgCenter}" alt="alt"/>
                </div>
                <div class="col-md-4" id="right_img">
                    <div class="row" style="margin-bottom: 10px;">
                        <div class="col-6">
                            <img class="thumbnail1" style="width: 108%; height: 195px; object-fit: cover;" src="${requestScope.hotelImg1}" alt="image1"/>
                        </div>
                        <div class="col-6">
                            <img class="thumbnail1" style="width: 100%; height: 195px; object-fit: cover;" src="${requestScope.hotelImg2}" alt="image2"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <img class="thumbnail1" style="width: 108%; height: 195px; object-fit: cover;" src="${requestScope.hotelImg3}" alt="image3"/>
                        </div>
                        <div class="col-6" id="lastImg" style="position: relative;">
                            <img style="width: 100%; height: 195px; object-fit: cover; filter: brightness(50%);" src="${requestScope.hotelImg4}" alt="image4"/>
                            <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 1;">
                                <form action="viewHotel" method="get">
                                    <button id="btn_show_more" style="background-color: rgba(255, 255, 255, 0.5); padding: 10px 25px; border: none; border-radius: 5px">More images</button>
                                    <input type="hidden" name="hotelId" value="${requestScope.hotel_view.hotel_ID}">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="myModal1" class="modal1">
                <span class="close1">&times;</span>
                <img class="modal-content1" id="img01">
            </div>
            <div class="row" style="margin-top:1%;padding-bottom: 3%;border-bottom: 1px solid grey" id="content">
                <div class="col-md-8" id="left_content" >
                    <h5 style="font-weight: 550">Introducing the accommodation</h5>
                    <c:set var="description" value="${requestScope.hotel_view.description}" />
                    <%
                    String description = (String) pageContext.getAttribute("description");
                    if (description != null) {
                        description = description.replace("\n", "<br><br>");
                        // Set the modified description back to the page context
                        pageContext.setAttribute("description", description);
                    }
                    %>
                    <p><%= description %></p>
                    <h5 style="font-weight: 550">Favorite amenities</h5>
                    <div style="width: 100%; display: flex; flex-wrap: wrap;" id="amenities">
                        <c:forEach items="${requestScope.hotelFacilityList}" var="facility">
                            <div style="display: flex; align-items: center; margin-right: 20px;">
                                <i class='${facility.url}' style="color: green;"></i><span style="color: black;">${facility.name}</span>
                            </div>
                        </c:forEach>                       
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card" style="width: 100%; background-color: rgb(240,246,255)">
                        <div class="card-body">
                            <h5 class="card-title" style="font-weight: bold">Highlights of the property</h5>
                            <h6>Perfect for a 1 night stay!</h6>
                            <p class="card-text">Located in the top-rated area in VietNam. This is the best choice for you in holiday. Try it !!!</p>
                            <a href="#idBooking" class="btn btn-primary" style="background-color: blue;  color:white">Booking Now</a><br>
                            <!-- Favorite Hotel -->
                            <c:if test="${requestScope.checkFavorite eq 'true'}">
                                <form action="viewHotelDetailServlet" method="post">
                                    <h6>Add to favorites hotel</h6>
                                    <div class="form-check form-switch">
                                        <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault" name="checkedFavorite" checked>
                                        <label class="form-check-label" for="flexSwitchCheckDefault">Add to favorites hotel</label>
                                        <input type="hidden" name="statusFav" value="yes">
                                    </div>
                                    <button class="btn btn-success w-100 favorButton">Save</button>
                                    <input type="hidden" name="idHotelFavor" value="${requestScope.hotel_view.hotel_ID}"/>
                                </form>
                            </c:if>
                            <c:if test="${requestScope.checkFavorite eq 'false'}">
                                <form action="viewHotelDetailServlet" method="post">
                                    <h6>Add to favorites hotel</h6>
                                    <div class="form-check form-switch">
                                        <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault" name="checkedFavorite">
                                        <label class="form-check-label" for="flexSwitchCheckDefault">Add to favorites hotel</label>
                                        <input type="hidden" name="statusFav" value="no">
                                    </div>
                                    <button class="btn btn-success w-100 favorButton">Save</button>
                                    <input type="hidden" name="idHotelFavor" value="${requestScope.hotel_view.hotel_ID}"/>
                                </form>
                            </c:if>
                            <c:if test="${requestScope.alterDeleteSuccess != null}">
                                <div id="status-message" style="background-color: rgb(233,251,233);height: 70px;" class="hidden">
                                    <div style="display: flex">
                                        <div style="width: 20%">
                                            <i class='bx bxs-check-circle' style="font-size: 50px;color:green;margin-top: 0px"></i>
                                        </div>
                                        <div style="width: 80%; text-align: start">
                                            <h3 style="color:green;margin-top: 5px; margin-bottom: -2px;font-weight:550">Success</h3>
                                            <p style="color: black;font-size: 14px">${alterDeleteSuccess}</p>
                                        </div>
                                    </div>           
                                </div>
                            </c:if>
                            <c:if test="${requestScope.alterDeleteUnSuccess != null}">
                                <div id="status-message" style="background-color: rgb(253,233,231);height: 70px;" class="hidden">
                                    <div style="display: flex">
                                        <div style="width: 20%">
                                            <i class='bx bxs-error-circle' style="font-size: 50px;color: red;margin-top: 0px"></i>
                                        </div>
                                        <div style="width: 80%;text-align: start">
                                            <h3 style="color: red;margin-top: 5px;font-weight: 550 ">Error</h3>
                                            <p style="color: black;margin-top: -10px;font-size: 14px">${alterDeleteUnSuccess}</p>
                                        </div>
                                    </div>           
                                </div>
                            </c:if>
                            <!-- Favorite Hotel -->
                        </div>
                    </div>
                </div>
            </div>

            <div class="row" style="margin-top:2%;padding-bottom: 2%;border-bottom: 1px solid grey">
                <h5 style="font-weight: 550" id="idBooking">Introducing the accommodation</h5>              
                <div class="row">
                    <div class="col-md-12">
                        <c:forEach var="roomHotel" items="${requestScope.roomList}" varStatus="status">
                            <div class="card mb-3">
                                <div class="row g-0" id="images_rom">
                                    <div class="col-md-3">
                                        <img src="${requestScope.roomImgList[status.index].url}" class="img-fluid rounded-start" alt="...">
                                        <div id="show_detail">
                                            <form action="viewRoom" method="get">
                                                <button><i class='bx bx-folder-plus' style="margin-right:5px"></i>Xem chi tiết phòng</button>
                                                <input type="hidden" name="roomId" value="${roomHotel.room_ID}">
                                                <input type="hidden" name="hotelId" value="${requestScope.hotel_view.hotel_ID}">
                                            </form>
                                        </div>
                                    </div>
                                    <div class="col-md-9">
                                        <div class="card-body1">
                                            <h4 class="card-title">${roomHotel.name}</h4>
                                            <table id="roomTable">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 250px;">Choose Type Room</th>
                                                        <th>Number people</th>
                                                        <th>Price/Room/Night</th>
                                                        <th>Amount</th>
                                                        <th style="width: 250px;">Price</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr data-price="${roomHotel.price}" data-room-name="${roomHotel.name}" data-id-hotel="${roomHotel.room_ID}">
                                                        <td style="width: 250px;">
                                                            <%
                                                                Room roomHotel = (Room)pageContext.getAttribute("roomHotel");
                                                                for(RoomBed roomBed : RoomBedDB.getRoomBedsByRoomID(roomHotel.getRoom_ID())){
                                                                   Bed bed = BedDB.getBedByRoomBedID(roomBed.getRoom_Bed_ID()); 
                                                            %>
                                                            <p style=" margin-bottom:0px"><i class='bx bxs-bed' style="font-size: 20px;"></i> <%= roomBed.getAmount()%> <%=bed.getName() %></p>
                                                            <%
                                                                }
                                                            %>

                                                            <% 
                                                                
                                                            %> 
                                                            <h4 id="service">Breakfast Included</h4>
                                                            <a id="numberRoom">Only 4 rooms left on our site</a>
                                                        </td>
                                                        <td>
                                                            <div id="amount_People">
                                                                <%
                                                                     int n = roomHotel.getCapacity();
                                                                     for (int i = 0; i < n; i++) {
                                                                %>
                                                                <i class='bx bxs-user'></i>
                                                                <%
                                                                    }
                                                                %>


                                                            </div>
                                                        </td>
                                                        <td>
                                                            <p id="save">Tiết kiệm 3,5%</p><br>
                                                            <a id="price_real"><s>62.540 VND</s></a>
                                                            <h4 id="price_save">${roomHotel.price}</h4>
                                                        </td>
                                                        <td>
                                                            <select style="width:50px">
                                                                <option value="0">0</option>
                                                                <option value="1">1</option>
                                                                <option value="2">2</option>
                                                                <option value="3">3</option>
                                                                <option value="4">4</option>
                                                            </select>
                                                            <input type="hidden" id="infor" value=""/>
                                                        </td>
                                                        <td rowspan="3" style="width: 300px;" id="message">No room selected</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <input type="hidden" id="infor" value=""/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <form action="CheckoutServlet" method="post">
                        <input type="text" value="" name="bookingStr" id="bookingStr">
                        <input type="text" value="${param.hotel_ID}" name="hotel_ID">
                        <input type="submit" value="Continue" id="continue">
                    </form>
                </div>
            </div>

            <div class="row" style="margin-top:2%">
                <h5 style="font-weight: bold">Other reviews from travelers about My Villa Airport Hotel</h5>
                <h6>Rating & Overall Review Score</h6>
                <div class="row">
                    <div class="col-md-3" id="left_rate">
                        <p id="rating">4.2</p>
                        <div style="display: flex" id="rate">
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                            <i class='bx bx-star' ></i>
                            <i class='bx bx-star' ></i>
                        </div>
                    </div>

                    <div class="col-md-9">
                        <div class="card w-100 mb-3">
                            <div class="card-body" style="border-bottom: 1px solid grey">
                                <h5 class="card-title">
                                    <img src="${account.avatarURL}" alt="alt"/><label style="font-size: 16px">${account.name}</label>
                                </h5>
                                <div>
                                    <i class='bx bxs-star'></i>
                                    <i class='bx bxs-star'></i>
                                    <i class='bx bxs-star'></i>
                                    <i class='bx bx-star' ></i>
                                    <i class='bx bx-star' ></i>
                                </div>
                                <p class="card-text">Phòng mới nhân viên Ok mà vệ sinh bẩn. Ly trà bẩn,ấm siêu tốc bụi dơ. Phòng tắm bẩn, nói chung vệ sinh khá bẩn</p>                         
                                <!-- <i id="likeButton" class='bx bx-like' onclick="toggleLike()"></i><span id="sumLike">4 likes this comment</span>-->
                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </div>
        <ul class="listPage"></ul>
        <%@include file="Footer.jsp" %>
        <script src="js/Hotel_Detail.js"></script>
    </body>
</html>
