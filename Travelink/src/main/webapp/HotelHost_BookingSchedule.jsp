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

            <div class="row">

                <div class="col-md-2 mx-auto" style="background: white">
                    <div class="card">
                        <div class="card-header text-center">Choose Hotel</div>
                        <div class="card-body" style=" padding-left: 0px">
                            <div class="form-check d-flex justify-content-between">                               
                                <form action="${hotelHost_BookingScheduleServlet}" method="post">
                                    <select name="hotelID"class="form-select" id="statusSelect">

                                        <c:if test="${requestScope.hotel == null}">
                                            <option>Hotel</option>
                                        </c:if>
                                        <c:if test="${requestScope.hotel != null}">
                                            <option value="${requestScope.hotel.hotel_ID}">${requestScope.hotel.name}</option>
                                        </c:if>
                                        <c:forEach var="hotel" items="${requestScope.hotel_list}" varStatus="status">
                                            <option value="${hotel.hotel_ID}"> ${status.index + 1}.${hotel.name}</option>
                                        </c:forEach>
                                    </select>
                            </div>
                        </div>
                    </div>
                    <div class="card mt-3">
                        <div class="card-header text-center">TYPE</div>
                        <div class="card-body">
                            <div class="form-check d-flex justify-content-between">
                                <c:if test="${requestScope.hotel != null}">
                                    <div>
                                        <input class="form-check-input" type="checkbox" id="single" name="all" value="all"
                                               <c:if test="${sessionScope.checkBoxList.size() == 0}">
                                                   checked=""
                                               </c:if>>
                                        <label class="form-check-label" for="all">All</label>
                                    </div>
                                    <label>${requestScope.numberRoomOfHotel}</label>
                                </c:if>
                            </div>

                            <c:if test="${requestScope.hotel != null}">
                                <c:forEach var="room" items="${requestScope.roomList}" varStatus="status">

                                    <div class="form-check d-flex justify-content-between">
                                        <div>
                                            <input class="form-check-input" type="checkbox" id="single" value="${room.room_ID}" name="${status.index}"
                                                   <c:forEach var="check" items="${sessionScope.checkBoxList}">
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
                    <button class="btn btn-outline-secondary mt-3">Search</button>
                    <c:if test="${requestScope.hotel != null}">
                        <input type="hidden" name="hotelID" value="${requestScope.hotel.hotel_ID}">
                    </c:if>
                    <c:if test="${requestScope.startDate != null}">
                        <input type="hidden" name="startDate" value="${requestScope.startDate}">
                        <input type="hidden" name="endDate" value="${requestScope.endDate}">
                    </c:if>

                </div>

                <div class="col-md-10">
                    <div class="row mb-3">

                        </form>
                        <div class="col-md-6">
                            <form action="hotelHost_AvailableSerlvet" method="post" onsubmit="return validateDates()">
                                <div class="input-group">
                                    <label style="font-size: 20px">Start Date: </label>
                                    <input type="date" name="startDate" value="${requestScope.startDate}" style="margin-right: 10px;margin-left: 10px" class="form-control" placeholder="Start Date" required> 
                                    <label style="font-size: 20px">End Date: </label>
                                    <input type="date" name="endDate" value="${requestScope.endDate}" style="margin-left: 10px" class="form-control" placeholder="End Date" required>
                                    <button type="submit" class="btn btn-primary" style="margin-left: 10px">Search</button>
                                    <c:if test="${requestScope.hotel != null}">
                                        <input type="hidden" name="hotelID" value="${requestScope.hotel.hotel_ID}">
                                    </c:if>

                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- Single Rooms Section -->
                    <c:forEach var="room" items="${requestScope.roomList}" varStatus="status">
                        <c:if test="${sessionScope.checkBoxList.size() == 0}">
                            <div class="section-header mb-3" style="color: rgb(63,81,181); font-size: 20px;font-weight: bold">${room.name}</div>
                            <div class="row mb-5">
                                <div class="col-md-3 room-card">
                                    <div class="card" style="background-color: rgb(63,81,181);color: white;border: none">
                                        <div class="card-header">Amount: <c:if test="${requestScope.hotel != null}">${requestScope.availableList[status.index]}</c:if>
                                            <c:if test="${requestScope.status == null}">${room.totalRooms}</c:if>
                                                Rooms <span style="float:right">Available</span></div>
                                            <div class="card-body d-flex text-center">
                                                <i class='bx bxs-check-circle' style="font-size: 80px;margin-right: 10px"></i><h5 class="card-title mt-3" style="font-size: 30px">Free Room</h5>
                                            </div>
                                            <a href="#" class="btn btn btn-outline-light mt-auto" style="border-radius: 0px;border: none">
                                                <i class='bx bx-plus-medical' ></i> Add Booking
                                            </a>
                                            <p class="card-text p-2"><label style="font-weight:bold">Status:</label>  Room is currently empty</p>
                                        </div>
                                    </div>

                                    <div class="col-md-3 room-card">
                                        <div class="card" style="background-color: rgb(247,247,247);border:1px solid black;color: black">
                                            <div class="card-header">Amount: <c:if test="${requestScope.hotel != null}">${requestScope.reservedList[status.index]}</c:if>
                                            <c:if test="${requestScope.status == null}">0</c:if>
                                                Rooms <span style="float:right">Reserved</span></div>
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
                        </c:if>
                        <c:forEach var="check" items="${sessionScope.checkBoxList}">
                            <c:if test="${check eq room.room_ID}">
                                <div class="section-header mb-3" style="color: rgb(63,81,181); font-size: 20px;font-weight: bold">${room.name}</div>
                                <div class="row mb-5">
                                    <div class="col-md-3 room-card">
                                        <div class="card" style="background-color: rgb(63,81,181);color: white;border: none">
                                            <div class="card-header">Amount: <c:if test="${requestScope.hotel != null}">${requestScope.availableList[status.index]}</c:if>
                                                <c:if test="${requestScope.status == null}">${room.totalRooms}</c:if>
                                                    Rooms <span style="float:right">Available</span></div>
                                                <div class="card-body d-flex text-center">
                                                    <i class='bx bxs-check-circle' style="font-size: 80px;margin-right: 10px"></i><h5 class="card-title mt-3" style="font-size: 30px">Free Room</h5>
                                                </div>
                                                <a href="#" class="btn btn btn-outline-light mt-auto" style="border-radius: 0px;border: none">
                                                    <i class='bx bx-plus-medical' ></i> Add Booking
                                                </a>
                                                <p class="card-text p-2"><label style="font-weight:bold">Status:</label>  Room is currently empty</p>
                                            </div>
                                        </div>

                                        <div class="col-md-3 room-card">
                                            <div class="card" style="background-color: rgb(247,247,247);border:1px solid black;color: black">
                                                <div class="card-header">Amount: <c:if test="${requestScope.hotel != null}">${requestScope.reservedList[status.index]}</c:if>
                                                <c:if test="${requestScope.status == null}">0</c:if>
                                                    Rooms <span style="float:right">Reserved</span></div>
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
                            </c:if>
                        </c:forEach>

                    </c:forEach>
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
