<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="bootstrap_css/bootstrap.min.css">
        <link rel="stylesheet" href="css/HotelHost_BookingSchedule.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <body>
        <%@include file="Header_HotelHost.jsp" %>

        <div class="container-fluid mt-5 mb-5">
            <a href="homeHotelHostServlet"_Hot class="btn btn-outline-primary mt-2 mb-4">
                <img src="img_Hotel/back.svg" alt="Back Icon" style="width: 1rem; height: 1rem;" class="me-2">Back
            </a>
            <div class="row">
                <div class="col-md-2 mx-auto" style="background: white">
                    <div class="card">
                        <div class="card-header text-center">Choose Hotel</div>
                        <div class="card-body" style=" padding-left: 0px">
                            <form action="HotelHost_BookingScheduleServlet" method="post">
                                <div class="form-check d-flex justify-content-between">
                                    <select name="hotelID"class="form-select" id="statusSelect">
                                        <c:if test="${hotel == null}">
                                            <option>Selection hotel</option>
                                        </c:if>
                                        <c:if test="${hotel != null}">
                                            <option value="${hotel.hotel_ID}">${hotel.name}</option>
                                        </c:if>
                                        <c:if test="${requestScope.hotelList != null}">
                                            <c:forEach var="hotel" items="${requestScope.hotelList}" varStatus="status">
                                                <option value="${hotel.hotel_ID}">${status.index +1}.${hotel.name}</option>
                                            </c:forEach>
                                        </c:if>
                                    </select>
                                </div>
                                <button class="btn btn-outline-secondary mt-3">Search</button>
                                <c:if test="${check != null}">
                                    <p>${check}</p>
                                </c:if>
                            </form>
                        </div>
                    </div>
                    <form action="HotelHost_SearchAvailableServlet" method="post" onsubmit="return validateDates()">
                        <div class="card mt-3">
                            <div class="card-header text-center">TYPE</div>
                            <div class="card-body">
                                <c:if test="${roomList != null}">
                                    <c:forEach var="room" items="${roomList}" varStatus="status">
                                        <div class="form-check d-flex justify-content-between">
                                            <div>
                                                <input class="form-check-input" type="checkbox" id="single" value="${room.room_ID}" name="${status.index}"
                                                       <c:forEach var="check" items="${requestScope.checkBoxList}">
                                                           <c:if test="${check eq room.room_ID}">
                                                               checked=""
                                                           </c:if>
                                                       </c:forEach>
                                                       >          
                                                <label class="form-check-label" for="single">${room.name}</label>
                                            </div>
                                            <label>${room.totalRooms}</label>
                                        </div>
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>

                </div>
                <div class="col-md-10">                    
                    <div class="row mb-3">
                        <div class="col-md-6">                            
                            <div class="input-group">
                                <label style="font-size: 20px">Start Date: </label>
                                <input type="date" name="startDate" value="${requestScope.startDate}" style="margin-right: 10px;margin-left: 10px" class="form-control" placeholder="Start Date" required> 
                                <label style="font-size: 20px">End Date: </label>
                                <input type="date" name="endDate" value="${requestScope.endDate}" style="margin-left: 10px" class="form-control" placeholder="End Date" required>

                                <c:if test="${status == 1}">
                                    <button type="submit" class="btn btn-primary" style="margin-left: 10px">Search</button>
                                </c:if>
                                <c:if test="${hotel != null}">
                                    <input type="hidden" name="hotelID" value="${hotel.hotel_ID}">
                                </c:if>
                            </div>
                            </form>
                        </div>
                    </div>
                    <!-- Single Rooms Section -->
                    <c:if test="${status_1 != 2}">
                        <c:forEach var="room" items="${newroomList}" varStatus="status">
                            <div class="section-header mb-3" style="color: rgb(63,81,181); font-size: 20px;font-weight: bold">${room.name}</div>
                            <div class="row mb-5">
                                <div class="col-md-3 room-card">
                                    <div class="card" style="background-color: rgb(63,81,181);color: white;border: none">
                                        <div class="card-header">Amount: ${requestScope.availableList[status.index]} Rooms <span style="float:right"></span></div>
                                        <div class="card-body d-flex text-center">
                                            <i class='bx bxs-check-circle' style="font-size: 80px;margin-right: 10px"></i><h5 class="card-title mt-3" style="font-size: 30px">Free Room</h5>
                                        </div>
                                        <a href="InsertOfflineBookingServlet" class="btn btn btn-outline-light mt-auto" style="border-radius: 0px;border: none">
                                            <i class='bx bx-plus-medical' ></i> Add Booking
                                        </a>
                                        <p class="card-text p-2"><label style="font-weight:bold">Status:</label>  Room is currently empty</p>
                                    </div>
                                </div>

                                <div class="col-md-3 room-card">
                                    <div class="card" style="background-color: rgb(247,247,247);border:1px solid black;color: black">
                                        <div class="card-header">Amount: ${requestScope.reservedList[status.index]} Rooms <span style="float:right">Reserved</span></div>
                                        <div class="card-body d-flex text-center">
                                            <i class='bx bx-user-circle' style="font-size: 80px;margin-right: 10px;color: orange"></i>
                                            <h5 class="card-title mt-3" style="font-size: 30px;color:black">Customer</h5>
                                        </div>
                                        <a href="HotelHost_BookingScheduleDetail.jsp" class="btn btn-outline-secondary mt-auto" style="border-radius: 0px;border: none">
                                            <i class='bx bx-detail'></i> View Details
                                        </a>
                                        <p class="card-text p-2"><label style="font-weight:bold ">Status:</label> A room has been booked</p>
                                    </div>
                                </div>   
                            </div>
                        </c:forEach>
                    </c:if>

                </div>
            </div>
        </div>
        <%@include file="Footer.jsp" %>


        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="bootstrap_css/bootstrap.min.js"></script>

    </body>
</html>
