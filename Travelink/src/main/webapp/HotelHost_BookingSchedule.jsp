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
                                    <input class="form-check-input" type="checkbox" id="reserved" checked>
                                    <label class="form-check-label" for="reserved">Reserved</label>
                                </div>
                                <label>2</label>
                            </div>
                            <div class="form-check d-flex justify-content-between">
                                <div>
                                    <input class="form-check-input" type="checkbox" id="occupied" checked>
                                    <label class="form-check-label" for="occupied">Occupied</label>
                                </div>
                                <label>3</label>
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
                                    <input class="form-check-input" type="checkbox" id="single" checked>
                                    <label class="form-check-label" for="single">Single</label>
                                </div>
                                <label>2</label>
                            </div>
                            <div class="form-check d-flex justify-content-between">
                                <div>
                                    <input class="form-check-input" type="checkbox" id="double" checked>
                                    <label class="form-check-label" for="double">Double</label>
                                </div>
                                <label>1</label>
                            </div>
                            <div class="form-check d-flex justify-content-between">
                                <div>
                                    <input class="form-check-input" type="checkbox" id="triple" checked>
                                    <label class="form-check-label" for="triple">Triple</label>
                                </div>
                                <label>4</label>
                            </div>
                        </div>
                    </div>
                    <button type="button" class="btn btn-outline-secondary mt-3">Search</button>
                </div>
                <div class="col-md-10">
                    <div class="row mb-3">
                        <div class="col-md-12 d-flex justify-content-between align-items-center">
                            <h5>
                                <form>
                                    <label style="font-size: 20px;font-weight: bold">Select date: </label> <input type="date" style="width: 200px;height: 47px">
                                    <button class="btn btn-outline-success" type="submit"><i class='bx bx-search-alt-2' style="font-size: 30px"></i></button>
                                </form>
                            </h5>
                            <input type="text" class="form-control w-25" placeholder="Search by number room or customer name"> 
                        </div>
                    </div>

                    <!-- Single Rooms Section -->
                    <div class="section-header mb-3" style="color: rgb(63,81,181); font-size: 20px;font-weight: bold">Single</div>
                    <div class="row mb-5">
                        <div class="col-md-3 room-card">
                            <div class="card" style="background-color: rgb(63,81,181);color: white;border: none">
                                <div class="card-header">Room 101 <span style="float:right">Available</span></div>
                                <div class="card-body d-flex text-center">
                                    <i class='bx bxs-check-circle' style="font-size: 80px;margin-right: 10px"></i><h5 class="card-title mt-3" style="font-size: 30px">Free Room</h5>
                                </div>

                                <p class="card-text p-2"><label style="font-weight:bold">Total:</label>  0 days</p>
                            </div>
                        </div>

                        <div class="col-md-3 room-card">
                            <div class="card" style="background-color: rgb(247,247,247);color: black;border: none">
                                <div class="card-header">Room 102 <span style="float:right">Reserved</span></div>
                                <div class="card-body d-flex text-center">
                                    <i class='bx bx-user-circle' style="font-size: 80px;margin-right: 10px;color: orange"></i><h5 class="card-title mt-3" style="font-size: 30px;color:black">Hoang Nguyen</h5>
                                </div>
                                <p class="card-text p-2"><label style="font-weight:bold ">Total:</label> 2 days (12/03/2024 - 15/04/2024)</p>
                            </div>
                        </div>
                        <div class="col-md-3 room-card">
                            <div class="card" style="background-color: rgb(247,247,247);color: black;border: none">
                                <div class="card-header">Room 103 <span style="float:right">Occupied</span></div>
                                <div class="card-body d-flex text-center">
                                    <i class='bx bx-user-circle' style="font-size: 80px;margin-right: 10px;color: orange"></i><h5 class="card-title mt-3" style="font-size: 30px;color:black">Nhat Thuan</h5>
                                </div>
                                <p class="card-text p-2"><label style="font-weight:bold ">Total:</label> 2 days (12/03/2024 - 15/04/2024)</p>
                            </div>
                        </div>
                        <div class="col-md-3 room-card">
                            <div class="card" style="background-color: rgb(63,81,181);color: white;border: none">
                                <div class="card-header">Room 104 <span style="float:right">Available</span></div>
                                <div class="card-body d-flex text-center">
                                    <i class='bx bxs-check-circle' style="font-size: 80px;margin-right: 10px"></i><h5 class="card-title mt-3" style="font-size: 30px">Free Room</h5>
                                </div>

                                <p class="card-text p-2"><label style="font-weight:bold">Total:</label>  0 days</p>
                            </div>
                        </div>
                    </div>

                    <div class="section-header mb-3" style="color: rgb(63,81,181); font-size: 20px;font-weight: bold">Double</div>
                    <div class="row mb-5">
                        <div class="col-md-3 room-card">
                            <div class="card" style="background-color: rgb(63,81,181);color: white;border: none">
                                <div class="card-header">Room 201 <span style="float:right">Available</span></div>
                                <div class="card-body d-flex text-center">
                                    <i class='bx bxs-check-circle' style="font-size: 80px;margin-right: 10px"></i><h5 class="card-title mt-3" style="font-size: 30px">Free Room</h5>
                                </div>

                                <p class="card-text p-2"><label style="font-weight:bold">Total:</label>  0 days</p>
                            </div>
                        </div>

                        <div class="col-md-3 room-card">
                            <div class="card" style="background-color: rgb(247,247,247);color: black;border: none">
                                <div class="card-header">Room 202 <span style="float:right">Reserved</span></div>
                                <div class="card-body d-flex text-center">
                                    <i class='bx bx-user-circle' style="font-size: 80px;margin-right: 10px;color: orange"></i><h5 class="card-title mt-3" style="font-size: 30px;color:black">Hoang Nguyen</h5>
                                </div>
                                <p class="card-text p-2"><label style="font-weight:bold ">Total:</label> 2 days (12/03/2024 - 15/04/2024)</p>
                            </div>
                        </div>
                        <div class="col-md-3 room-card">
                            <div class="card" style="background-color: rgb(247,247,247);color: black;border: none">
                                <div class="card-header">Room 203 <span style="float:right">Occupied</span></div>
                                <div class="card-body d-flex text-center">
                                    <i class='bx bx-user-circle' style="font-size: 80px;margin-right: 10px;color: orange"></i><h5 class="card-title mt-3" style="font-size: 30px;color:black">Nhat Thuan</h5>
                                </div>
                                <p class="card-text p-2"><label style="font-weight:bold ">Total:</label> 2 days (12/03/2024 - 15/04/2024)</p>
                            </div>
                        </div>
                        <div class="col-md-3 room-card">
                            <div class="card" style="background-color: rgb(63,81,181);color: white;border: none">
                                <div class="card-header">Room 204 <span style="float:right">Available</span></div>
                                <div class="card-body d-flex text-center">
                                    <i class='bx bxs-check-circle' style="font-size: 80px;margin-right: 10px"></i><h5 class="card-title mt-3" style="font-size: 30px">Free Room</h5>
                                </div>

                                <p class="card-text p-2"><label style="font-weight:bold">Total:</label>  0 days</p>
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
