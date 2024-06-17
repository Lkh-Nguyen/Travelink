<%-- 
    Document   : HotelHost_BookingRevenue
    Created on : Jun 15, 2024, 11:27:08 PM
    Author     : HELLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="bootstrap_css/bootstrap.min.css">
        <link rel="stylesheet" href="css/Right_My_Account.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <body>

        <%@include file="Header_HotelHost.jsp" %>
        <div class="container-fluid" id="right" >
            <!-- Card History -->
            <!-- Change -->
            <div class="row">
                <div class="col-md-2 mx-auto" style="background: white;margin-top: 40px">
                  
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
                    
                    <div class="card mt-3">
                        <div class="card-header text-center">Revenue</div>
                        <div class="card-body">
                            <div class="form-check d-flex justify-content-between">
                                <div>
                                    <label class="form-check-label" for="single">All</label>
                                </div>
                                <label>150</label>
                            </div>
                            <div class="form-check d-flex justify-content-between">
                                <div>
                                    <input class="form-check-input" type="checkbox" id="double" checked>
                                    <label class="form-check-label" for="double">Finish</label>
                                </div>
                                <label>35</label>
                            </div>
                            <div class="form-check d-flex justify-content-between">
                                <div>
                                    <input class="form-check-input" type="checkbox" id="double" checked>
                                    <label class="form-check-label" for="triple">Processing</label>
                                </div>
                                <label>15</label>
                            </div>
                            <div class="form-check d-flex justify-content-between">
                                <div>
                                    <input class="form-check-input" type="checkbox" id="double" checked>
                                    <label class="form-check-label" for="triple">Cancel</label>
                                </div>
                                <label>15</label>
                            </div>
                            <div class="form-check d-flex justify-content-between">
                                <div>
                                    <input class="form-check-input" type="checkbox" id="double" checked>
                                    <label class="form-check-label" for="triple">Pending Cancel</label>
                                </div>
                                <label>2</label>
                            </div>
                        </div>
                    </div>
                    <button type="button" class="btn btn-outline-secondary mt-3">Search</button>
                </div>
                <div class="col-md-10">
                    <div class="container-fluid">
                        <h1 class="fw-bold fs-1">History Bill</h1>
                        <div class="row mb-4">
                            <div class="col-md-3"></div>
                            <div class="col-md-6">
                                <form action="SearchHistoryServlet" method="get">
                                    <div class="input-group">
                                        <input type="date" name="startDate" style="margin-right: 10px" class="form-control" placeholder="Start Date" required> 
                                        <input type="date" name="endDate" style="margin-left: 10px" class="form-control" placeholder="End Date" required>
                                        <button type="submit" class="btn btn-primary" style="margin-left: 10px">Search</button>
                                    </div>
                                </form>
                            </div>
                            <div class="col-md-3"></div>
                        </div>
                    </div>
                    <div id="hotelList">
                        <div class ="row p-4">
                            <div class="col-md-3 mb-4 hotel-card">
                                <div class="card h-100 border rounded shadow">
                                    <div class="card-body d-flex flex-column custom-bg">
                                        <div class="row mb-2">
                                            <div class="col">
                                                <p class="card-text">
                                                    Reservation: 17
                                                </p>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col">
                                                <p class="card-text mb-2">
                                                    <i class='bx bx-calendar-check'></i> 17/06/2024
                                                </p>
                                            </div>
                                            <div class="col">
                                                <p class="card-text mb-2">
                                                    <i class='bx bx-calendar-x'></i> 18/06/2024
                                                </p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <p class="card-text mb-2">
                                                    <i class='bx bx-dollar-circle'></i> 1.500.000 VND
                                                </p>
                                            </div>
                                            <div class="col">
                                                <p class="card-text">
                                                    <i class='bx bx-check-square'></i>
                                                    <span class="badge text-bg-success">PAID</span>
                                                </p>
                                            </div>
                                        </div>
                                        <a href="MyBillPaymentServlet?reservation_ID=${h.reservationID}" class="btn btn-outline-primary mt-auto">
                                            <i class='bx bx-detail'></i> View Details
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 mb-4 hotel-card">
                                <div class="card h-100 border rounded shadow">
                                    <div class="card-body d-flex flex-column custom-bg">
                                        <div class="row mb-2">
                                            <div class="col">
                                                <p class="card-text">
                                                    Reservation: 17
                                                </p>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col">
                                                <p class="card-text mb-2">
                                                    <i class='bx bx-calendar-check'></i> 17/06/2024
                                                </p>
                                            </div>
                                            <div class="col">
                                                <p class="card-text mb-2">
                                                    <i class='bx bx-calendar-x'></i> 18/06/2024
                                                </p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <p class="card-text mb-2">
                                                    <i class='bx bx-dollar-circle'></i> 1.500.000 VND
                                                </p>
                                            </div>
                                            <div class="col">
                                                <p class="card-text">
                                                    <i class='bx bx-check-square'></i>
                                                    <span class="badge text-bg-primary">FINISH</span>
                                                </p>
                                            </div>
                                        </div>
                                        <a href="MyBillPaymentServlet?reservation_ID=${h.reservationID}" class="btn btn-outline-primary mt-auto">
                                            <i class='bx bx-detail'></i> View Details
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3 mb-4 hotel-card">
                                <div class="card h-100 border rounded shadow">
                                    <div class="card-body d-flex flex-column custom-bg">
                                        <div class="row mb-2">
                                            <div class="col">
                                                <p class="card-text">
                                                    Reservation: 17
                                                </p>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col">
                                                <p class="card-text mb-2">
                                                    <i class='bx bx-calendar-check'></i> 17/06/2024
                                                </p>
                                            </div>
                                            <div class="col">
                                                <p class="card-text mb-2">
                                                    <i class='bx bx-calendar-x'></i> 18/06/2024
                                                </p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <p class="card-text mb-2">
                                                    <i class='bx bx-dollar-circle'></i> 1.500.000 VND
                                                </p>
                                            </div>
                                            <div class="col">
                                                <p class="card-text">
                                                    <i class='bx bx-check-square'></i>
                                                    <span class="badge text-bg-danger">CANCEL</span>
                                                </p>
                                            </div>
                                        </div>
                                        <a href="MyBillPaymentServlet?reservation_ID=${h.reservationID}" class="btn btn-outline-primary mt-auto">
                                            <i class='bx bx-detail'></i> View Details
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 mb-4 hotel-card">
                                <div class="card h-100 border rounded shadow">
                                    <div class="card-body d-flex flex-column custom-bg">
                                        <div class="row mb-2">

                                            <div class="col">
                                                <p class="card-text">
                                                    Reservation: 17
                                                </p>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col">
                                                <p class="card-text mb-2">
                                                    <i class='bx bx-calendar-check'></i> 17/06/2024
                                                </p>
                                            </div>
                                            <div class="col">
                                                <p class="card-text mb-2">
                                                    <i class='bx bx-calendar-x'></i> 18/06/2024
                                                </p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <p class="card-text mb-2">
                                                    <i class='bx bx-dollar-circle'></i> 1.500.000 VND
                                                </p>
                                            </div>
                                            <div class="col">
                                                <p class="card-text">
                                                    <i class='bx bx-check-square'></i>
                                                    <span class="badge text-bg-warning">PENDING CACEL</span>
                                                </p>
                                            </div>
                                        </div>
                                        <a href="MyBillPaymentServlet?reservation_ID=${h.reservationID}" class="btn btn-outline-primary mt-auto">
                                            <i class='bx bx-detail'></i> View Details
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 mb-4 hotel-card">
                                <div class="card h-100 border rounded shadow">
                                    <div class="card-body d-flex flex-column custom-bg">
                                        <div class="row mb-2">
                                            <div class="col">
                                                <p class="card-text">
                                                    Reservation: 20
                                                </p>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col">
                                                <p class="card-text mb-2">
                                                    <i class='bx bx-calendar-check'></i> 17/06/2024
                                                </p>
                                            </div>
                                            <div class="col">
                                                <p class="card-text mb-2">
                                                    <i class='bx bx-calendar-x'></i> 18/06/2024
                                                </p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <p class="card-text mb-2">
                                                    <i class='bx bx-dollar-circle'></i> 500.000 VND
                                                </p>
                                            </div>
                                            <div class="col">
                                                <p class="card-text">
                                                    <i class='bx bx-check-square'></i>
                                                    <span class="badge text-bg-warning">PENDING CACEL</span>
                                                </p>
                                            </div>
                                        </div>
                                        <a href="MyBillPaymentServlet?reservation_ID=${h.reservationID}" class="btn btn-outline-primary mt-auto">
                                            <i class='bx bx-detail'></i> View Details
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 mb-4 hotel-card">
                                <div class="card h-100 border rounded shadow">
                                    <div class="card-body d-flex flex-column custom-bg">
                                        <div class="row mb-2">
                                            <div class="col">
                                                <p class="card-text">
                                                    Reservation: 18
                                                </p>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col">
                                                <p class="card-text mb-2">
                                                    <i class='bx bx-calendar-check'></i> 17/06/2024
                                                </p>
                                            </div>
                                            <div class="col">
                                                <p class="card-text mb-2">
                                                    <i class='bx bx-calendar-x'></i> 18/06/2024
                                                </p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <p class="card-text mb-2">
                                                    <i class='bx bx-dollar-circle'></i> 2.500.000 VND
                                                </p>
                                            </div>
                                            <div class="col">
                                                <p class="card-text">
                                                    <i class='bx bx-check-square'></i>
                                                    <span class="badge text-bg-primary">FINISH</span>
                                                </p>
                                            </div>
                                        </div>
                                        <a href="MyBillPaymentServlet?reservation_ID=${h.reservationID}" class="btn btn-outline-primary mt-auto">
                                            <i class='bx bx-detail'></i> View Details
                                        </a>
                                    </div>
                                </div>
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
