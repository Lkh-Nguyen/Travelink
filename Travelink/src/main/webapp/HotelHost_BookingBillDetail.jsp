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
        <link rel="stylesheet" href="css/HotelHost_BookingBillDetail.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <body>

        <%@include file="Header_HotelHost.jsp" %>
        <div class="col-md-1" style="margin-left: 50px">
            <button type="button" class="btn btn-outline-secondary mt-3 mb-3 w-50" onclick="history.back()">Back</button>
        </div>
        <div class="container">
            <div class="card mb-5 h-1000 ">
                <div class="card-body ">
                    <div class="row gradient-background m-1" style="height: 5px">
                    </div>
                    <div class="row">
                        <div class="col-md-5">
                            <div class="card border-0">
                                <div class="card-body first">
                                    <h2 class="fw-bold">TRAVELINK</h2>
                                    <p class="text-muted border-bottom">BILLING TO COMPANY</p>

                                    <div class="row info-row mb-2">
                                        <div class="col-3 fw-bold lh-1 ">Name:</div>
                                        <div class="col-8 fw-normal text-muted lh-1 px-0 ">Travelink</div>
                                    </div>
                                    <div class="row info-row mb-2">
                                        <div class="col-3 fw-bold lh-1">Contact:</div>
                                        <div class="col-8 fw-normal text-muted lh-1 px-0">+123456789</div>
                                    </div>
                                    <div class="row info-row mb-2">
                                        <div class="col-3 fw-bold lh-1">Email:</div>
                                        <div class="col-8 fw-normal text-muted lh-1 px-0">group1swp391@fpt.edu.vn</div>
                                    </div>
                                    <div class="row info-row mb-2">
                                        <div class="col-3 fw-bold lh-1">Address:</div>
                                        <div class="col-8 fw-normal text-muted lh-1 px-0">Khu đô thị FPT, TP Đà Nẵng</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <!-- Container trống -->
                        </div>
                        <div class="col-md-4 justify-content-end align-items-end">
                            <div class="card border-0">
                                <div class="card-body" style="margin-top: 20px;
                                     padding: 0;">
                                    <p class="fw-bold lh-1">Reservation ID:<span class="fw-normal text-muted lh-1"> 17</span>
                                    <p class="fw-bold lh-1">Date Booking: 
                                        <span class="fw-normal text-muted lh-1">
                                            17/04/2024
                                        </span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div> 
                    <div class="row">
                        <div class="container">
                            <div class="card border-0">
                                <div class="card-body justify-content-center align-items-center text-center">
                                    <table class="table table-striped table-hover text-center">
                                        <thead>
                                            <tr>
                                                <th scope="col" class="col-1">NO</th>
                                                <th scope="col" class="col-3">Room Name</th>
                                                <th scope="col" class="col-1">Quantity</th>
                                                <th scope="col" class="col-3">Price</th>
                                                <th scope="col" class="col-2">Check In</th>
                                                <th scope="col" class="col-2">Check Out</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th scope="row" class="col-1">1</th>
                                                <td class="col-3">Deluxe Suite</td>
                                                <td class="col-1">2</td>
                                                <td class="col-3">150.000 VND</td>
                                                <td class="col-2">12/06/2024</td>
                                                <td class="col-2">14/06/2024</td>
                                            </tr>
                                            <tr>
                                                <th scope="row" class="col-1">2</th>
                                                <td class="col-3">Family Room</td>
                                                <td class="col-1">1</td>
                                                <td class="col-3">150.000 VND</td>
                                                <td class="col-2">11/06/2024</td>
                                                <td class="col-2">15/06/2024</td>
                                            </tr>
                                            <tr>
                                                <th scope="row" class="col-1">3</th>
                                                <td class="col-3">Standard Room</td>
                                                <td class="col-1">3</td>
                                                <td class="col-3">350.000 VND</td>
                                                <td class="col-2">12/06/2024</td>
                                                <td class="col-2">15/06/2024</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="card border-0">
                            <div class="card-body">
                                <!-- Phần dưới bên phải -->
                                <div class="row">
                                    <div class="col-md-6 ">
                                        <h3 class="fw-bold">Information Customer:</h3>
                                        <div class="card-body p-2">
                                            <p class="fw-bold lh-1">Name: <span class="fw-normal text-muted lh-1">Lê Kim Hoàng Nguyên</span></p>
                                            <p class="fw-bold lh-1">Contact: <span class="fw-normal text-muted lh-1">46412395202</span></p>
                                            <p class="fw-bold lh-1">Contact: <span class="fw-normal text-muted lh-1">0934726073</span></p>
                                            <p class="fw-bold lh-1">Email: <span class="fw-normal text-muted lh-1">lkhnguyen3006@gmail.com</span></p>
                                            <p class="fw-bold lh-1">Address: <span class="fw-normal text-muted lh-1">650 Trần Cao Vân, Thanh Khê, Đà Nẵng.</span></p>
                                        </div>
                                    </div>
                                    <div class="col-md-6 mt-2">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <p class="fw-bold lh-1">Sub Total:</p>
                                                <p class="fw-bold lh-1">Tax:</p>
                                            </div>
                                            <div class="col-md-4">
                                                <p class="text-muted fw-normal lh-1 ps-4">550.000 VND</p>
                                                <p class="text-muted fw-normal lh-1 ps-4">0%</p>
                                            </div>
                                            <hr>
                                            <div class="row mt-2">
                                                <div class="col-md-3">
                                                    <p class="fw-bold lh-1">Grand Total:</p>
                                                </div>
                                                <div class="col-md-4">
                                                    <p class="text-muted fw-normal lh-1 ps-4">550.000 VND</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row gradient-background" style="height: 20px">
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
