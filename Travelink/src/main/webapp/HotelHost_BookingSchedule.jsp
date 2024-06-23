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
                        <div class="card-header text-center">STATUS</div>
                        <div class="card-body">
                            <div class="form-check d-flex justify-content-between">
                                <div>
                                    <label class="form-check-label" for="reserved">All</label>
                                </div>
                                <label>5</label>
                            </div>
                            <div class="form-check d-flex justify-content-between">
                                <div>
                                    <input class="form-check-input" type="checkbox" id="reserved" checked>
                                    <label class="form-check-label" for="reserved">Reserved</label>
                                </div>
                                <label>2</label>
                            </div>
                            <div class="form-check d-flex justify-content-between">
                                <div>
                                    <input class="form-check-input" type="checkbox" id="available" checked>
                                    <label class="form-check-label" for="available">Available</label>
                                </div>
                                <label>3</label>
                            </div>
                        </div>
                    </div>
                    <div class="card mt-3">
                        <div class="card-header text-center">TYPE</div>
                        <div class="card-body">
                            <div class="form-check d-flex justify-content-between">
                                <div>
                                    <label class="form-check-label" for="all">All</label>
                                </div>
                                <label>7</label>
                            </div>
                            <div class="form-check d-flex justify-content-between">
                                <div>
                                    <input class="form-check-input" type="checkbox" id="single" checked>
                                    <label class="form-check-label" for="single">Deluxe Suite</label>
                                </div>
                                <label>2</label>
                            </div>
                            <div class="form-check d-flex justify-content-between">
                                <div>
                                    <input class="form-check-input" type="checkbox" id="double" checked>
                                    <label class="form-check-label" for="double">Family Room</label>
                                </div>
                                <label>1</label>
                            </div>
                            <div class="form-check d-flex justify-content-between">
                                <div>
                                    <input class="form-check-input" type="checkbox" id="triple" checked>
                                    <label class="form-check-label" for="triple">Standard Room</label>
                                </div>
                                <label>4</label>
                            </div>
                        </div>
                    </div>
                    <button type="button" class="btn btn-outline-secondary mt-3">Search</button>
                </div>
                <div class="col-md-10">
                    <div class="row mb-3">
                        <div class="col-md-4">
                            <div class="input-group">
                                <label style="font-size: 20px">Select Date:</label>
                                <input type="date" name="startDate" value="${requestScope.startDate}" style="margin-right: 10px;margin-left: 10px" class="form-control w-25" placeholder="Start Date" required> 
                                <button type="submit" class="btn btn-primary">Search</button>
                            </div>
                        </div>
                        <div class="col-md-2">

                        </div>
                        <div class="col-md-6">
                            <form action="HotelHost_BookingHistoryBillServlet" method="post" onsubmit="return validateDates()">
                                <div class="input-group">
                                    <label style="font-size: 20px">Start Date: </label>
                                    <input type="date" name="startDate" value="${requestScope.startDate}" style="margin-right: 10px;margin-left: 10px" class="form-control" placeholder="Start Date" required> 
                                    <label style="font-size: 20px">End Date: </label>
                                    <input type="date" name="endDate" value="${requestScope.endDate}" style="margin-left: 10px" class="form-control" placeholder="End Date" required>
                                    <button type="submit" class="btn btn-primary" style="margin-left: 10px">Search</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div><h4>Search date: 15/03/2024</h4></div>
                    <!-- Single Rooms Section -->
                    <div class="section-header mb-3" style="color: rgb(63,81,181); font-size: 20px;font-weight: bold">Deluxe Suite</div>
                    <div class="row mb-5">
                        <div class="col-md-3 room-card">
                            <div class="card" style="background-color: rgb(63,81,181);color: white;border: none">
                                <div class="card-header">Amount: 4 Rooms <span style="float:right">Available</span></div>
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
                                <div class="card-header">Amount: 0 Rooms <span style="float:right">Reserved</span></div>
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
