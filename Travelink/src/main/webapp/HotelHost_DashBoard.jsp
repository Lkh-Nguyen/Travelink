<%-- 
    Document   : HotelHostDashBoard
    Created on : Jun 14, 2024, 9:49:27 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@page import="com.travelink.Model.*" %>
<%@page import="com.travelink.Database.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dash Board</title>
        <link rel="icon" href="img_Home/logo.png">
        <link rel="stylesheet" href="bootstrap_css/bootstrap.min.css">
        <link rel="stylesheet" href="css/HotelHost_DashBoard.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <style>
            @import url('https://fonts.googleapis.com/css?family=Montserrat:400,800');
            * {
                font-family: Montserrat, sans-serif;
            }
            .row-compact {
                margin-bottom: 1rem; /* Adjust as needed */
            }
            #pieChart, #myChart {
                width: 100% !important;
                height: 100% !important;
            }
            .equal-height {
                display: flex;
                flex-direction: column;
                justify-content: space-between;
            }
            .card-flex {
                display: flex;
                flex: 1 1 auto;
                flex-direction: column;
            }
        </style>
    </head>
    <body>
        <%@include file="Header_HotelHost.jsp" %>
        <div class="container-fluid py-0">
            <form action="DashboardServlet" method="GET">
                <input type="hidden" name="hotel_ID" value="${hotel_ID}">
                <div class="input-group">
                    <select id="month" name="month">
                        <%
                            int selectedMonth = request.getParameter("month") != null ? Integer.parseInt(request.getParameter("month")) : 0;
                            String[] monthNames = {"January", "February", "March", "April", "May", "June", 
                                                   "July", "August", "September", "October", "November", "December"};
        
                            for (int i = 1; i <= 12; i++) {
                                if (i == selectedMonth) {
                                    out.println("<option value=\"" + i + "\" selected>" + monthNames[i - 1] + "</option>");
                                } else {
                                    out.println("<option value=\"" + i + "\">" + monthNames[i - 1] + "</option>");
                                }
                            }
                        %>
                    </select>

                    <select id="year" name="year">
                        <%
                            int currentYear = java.util.Calendar.getInstance().get(java.util.Calendar.YEAR);
                            int selectedYear = request.getParameter("year") != null ? Integer.parseInt(request.getParameter("year")) : currentYear;
                            for (int year = 2000; year <= currentYear; year++) {
                                if (year == selectedYear) {
                                    out.println("<option value=\"" + year + "\" selected>" + year + "</option>");
                                } else {
                                    out.println("<option value=\"" + year + "\">" + year + "</option>");
                                }
                            }
                        %>
                    </select>

                    <button type="submit" class="btn btn-primary" style="margin-left: 10px">Search</button>
                </div>
            </form>
            <!-- row chính 1 -->
            <div class="row p-4 m-3 d-flex justify-content-center align-items-center row-compact">
                <div class="col-md-3">
                    <div class="card justify-content-center align-items-center shadow p-3 bg-body-tertiary  border-0 h-100" id="cardFirst">
                        <div class="card-body" >
                            <div class="row">
                                <div class="col-md-3 mt-4">
                                    <img src="img_Hotel/document.svg" alt="Invoice Icon" style="width: 2rem; height: 2rem;">
                                </div>
                                <div class="col-md-9 mt-2 px-3">
                                    <h3>${totalReservations}</h3>
                                    <p class="fs-6">Total Reservations</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card justify-content-center align-items-center shadow p-3  bg-body-tertiary  border-0 h-100" id="cardFirst">
                        <div class="card-body " >
                            <div class="row">
                                <div class="col-md-3 mt-4">
                                    <img src="img_Hotel/paid_invoice.svg" alt="Invoice Icon" style="width: 2rem; height: 2rem; color: white">
                                </div>
                                <div class="col-md-9 mt-2 px-3">
                                    <h3>${finishedReservations}</h3>
                                    <p class="fs-6">Finished Reservations</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card justify-content-center align-items-center shadow p-3  bg-body-tertiary  border-0 h-100" id="cardFirst">
                        <div class="card-body" >
                            <div class="row">
                                <div class="col-md-3 mt-4">
                                    <img src="img_Hotel/cancel_invoice.svg" alt="Invoice Icon" style="width: 2rem; height: 2rem;">
                                </div>
                                <div class="col-md-9 mt-2 px-3">
                                    <h3>${cancelReservations}</h3>
                                    <p class="fs-6">Cancel Reservations</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card justify-content-center align-items-center shadow p-3  bg-body-tertiary border-0 h-100" id="cardFirst">
                        <div class="card-body" >
                            <div class="row">
                                <div class="col-md-3 mt-4">
                                    <img src="img_Hotel/sent_invoice.svg" alt="Invoice Icon" style="width: 2rem; height: 2rem;">
                                </div>
                                <div class="col-md-9 mt-2 px-3">
                                    <h3>${refundReservations}</h3>
                                    <p class="fs-6">Refund Reservations</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- row chính 2 -->
            <div class="row p-4 m-3 py-0 my-0 mt-0 d-flex justify-content-center align-items-center row-compact">
                <div class="col-md-9">
                    <div class="card bg-secondary-subtle h-100 shadow p-lg-4 mb-5 bg-body-tertiary border-0 equal-height" style="border-radius: 30px;" >
                        <div class="row p-4">
                            <div class="col-md-6">
                                <div class="card border-0 mt-3 card-flex" id="cardFirst">
                                    <div class="card-body d-flex flex-column justify-content-end">
                                        <div class="row">
                                            <div class="col-md-7 p-lg-5">
                                                <h3>$824,571.93</h3>
                                                <div class="text-bottom">
                                                    <p class="text-muted mb-0">Wallet Balance</p>
                                                </div>
                                            </div>
                                            <div class="col-md-5">
                                                <div class="btn-change">
                                                    <p class="rotate-text text-dark-emphasis">Change</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="card text-center py-2 px-2"><h4>Hotel Overview</h4>
                                            <p class="text-muted">Show chart overview</p></div>
                                        <div class="row align-items-center hover-row" id="title-chart">
                                            <div class="col-md-9 d-flex align-items-center">
                                                <span><img src="img_Hotel/account.svg" alt="Invoice Icon" style="width: 1rem; height: 1rem;"></span>
                                                <p class="mb-0 ms-2 py-2">Account</p>
                                            </div>
                                            <div class="col-md-3 d-flex justify-content-end align-items-center">
                                                <p class="mb-0 py-2 px-0 text-end">20%</p>
                                            </div>
                                        </div>
                                        <div class="row align-items-center hover-row">
                                            <div class="col-md-9 d-flex align-items-center">
                                                <span><img src="img_Hotel/hotel.svg" alt="Invoice Icon" style="width: 1rem; height: 1rem;"></span>
                                                <p class="mb-0 ms-2 py-2">Hotel</p>
                                            </div>
                                            <div class="col-md-3 d-flex align-items-center justify-content-end">
                                                <p class="mb-0 py-2 px-0 text-end">40%</p>
                                            </div>
                                        </div>

                                        <div class="row align-items-center hover-row">
                                            <div class="col-md-9 d-flex align-items-center">
                                                <span><img src="img_Hotel/service.svg" alt="Invoice Icon" style="width: 1rem; height: 1rem;"></span>
                                                <p class="mb-0 ms-2 py-2">Service</p>
                                            </div>
                                            <div class="col-md-3 align-items-center">
                                                <p class="mb-0 py-2 px-0 text-end">15%</p>
                                            </div>
                                        </div>
                                        <div class="row align-items-center hover-row">
                                            <div class="col-md-9 d-flex align-items-center">
                                                <span><img src="img_Hotel/other.svg" alt="Invoice Icon" style="width: 1rem; height: 1rem;"></span>
                                                <p class="mb-0 ms-2 py-2">Account</p>
                                            </div>
                                            <div class="col-md-3 align-items-center">
                                                <p class="mb-0 py-2 px-0 text-end">15%</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="card card-flex">
                                            <div class="card-body">
                                                <canvas id="myChart" width="500" height="550"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="card bg-secondary-subtle h-100 shadow p-lg-4 mb-5 bg-body-tertiary border-0 equal-height" style="border-radius: 30px" >
                        <div class="card-body card-flex">
                            <canvas id="pieChart" width="300" height="300"></canvas>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row mt-3 p-4 m-3 py-0 my-0 mt-0 d-flex justify-content-center align-items-center row-compact">
                <div class="col-md-6">
                    <div class="card bg-secondary-subtle h-100 shadow p-lg-4 mb-5 bg-body-tertiary border-0 equal-height" style="border-radius: 30px;">
                        <div class="row  align-items-center">
                            <div class="col-md-2">
                            </div>
                            <div class="col-md-8">
                                <div class="card custom-card border border-0 align-items-center" style="border-radius: 30px;">
                                    <div class="card-body d-flex flex-column align-items-center">
                                        <img src="img_Hotel/staff.svg" alt="Hotel Service Image" class="img-fluid mb-3" style="max-width: 50px;">
                                        <div class="row d-flex align-items-center">
                                            <div class="col-md-6">
                                                <h6 class="card-title text-center mt-1">Members Overview</h6>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="card text-center align-items-center justify-content-center" id="average">5.0</div>
                                            </div>
                                        </div>
                                        <p class="card-text text-muted text-center">Description of the hotel service overview.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                            </div>
                        </div>
                        <div class="card mt-5 bg-secondary-subtle h-100 shadow p-lg-4 mb-2 bg-body-tertiary border-0 equal-height" style="border-radius: 30px;" id="containTable">
                            <table class="table-hover caption-top table" >
                                <caption class="mb-2"><img src="img_Hotel/account.svg" alt="Star" style="width: 2rem;"><span>From 5 users latest:</span></caption>
                                <thead>
                                    <tr>
                                        <th scope="col">No.</th>
                                        <th scope="col">Requests</th>
                                        <th scope="col">Star</th>
                                        <th scope="col">Notes</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>Service Attitude</td>
                                        <td>
                                            <img src="img_Hotel/star.svg" alt="Star" style="width: 10px;">
                                            <img src="img_Hotel/star.svg" alt="Star" style="width: 10px;">
                                            <img src="img_Hotel/star.svg" alt="Star" style="width: 10px;">
                                            <img src="img_Hotel/star.svg" alt="Star" style="width: 10px;">
                                            <img src="img_Hotel/star.svg" alt="Star" style="width: 10px;">
                                        </td>
                                        <td>Very Good</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>Skills</td>
                                        <td>
                                            <img src="img_Hotel/star.svg" alt="Star" style="width: 10px;">
                                            <img src="img_Hotel/star.svg" alt="Star" style="width: 10px;">
                                            <img src="img_Hotel/star.svg" alt="Star" style="width: 10px;">
                                            <img src="img_Hotel/none-star.svg" alt="Star" style="width: 10px;">
                                            <img src="img_Hotel/none-star.svg" alt="Star" style="width: 10px;">
                                        </td>
                                        <td>Training More</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">3</th>
                                        <td>Clean</td>
                                        <td>
                                            <img src="img_Hotel/star.svg" alt="Star" style="width: 10px;">
                                            <img src="img_Hotel/star.svg" alt="Star" style="width: 10px;">
                                            <img src="img_Hotel/star.svg" alt="Star" style="width: 10px;">
                                            <img src="img_Hotel/star.svg" alt="Star" style="width: 10px;">
                                            <img src="img_Hotel/star.svg" alt="Star" style="width: 10px;">
                                        </td>
                                        <td>Very clean</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">3</th>
                                        <td>Attendance</td>
                                        <td>
                                            <img src="img_Hotel/star.svg" alt="Star" style="width: 10px;">
                                            <img src="img_Hotel/star.svg" alt="Star" style="width: 10px;">
                                            <img src="img_Hotel/star.svg" alt="Star" style="width: 10px;">
                                            <img src="img_Hotel/star.svg" alt="Star" style="width: 10px;">
                                            <img src="img_Hotel/star.svg" alt="Star" style="width: 10px;">
                                        </td>
                                        <td>I will come back</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card bg-secondary-subtle h-100 shadow p-lg-4 mb-5 bg-body-tertiary border-0 equal-height" style="border-radius: 30px;" >
                        <div class="row  align-items-center">
                            <div class="col-md-2">
                            </div>
                            <div class="col-md-8">
                                <div class="card custom-card border border-0 align-items-center" style="border-radius: 30px;">
                                    <div class="card-body d-flex flex-column align-items-center">
                                        <img src="img_Hotel/hotel-feedbacl.svg" alt="Hotel Service Image" class="img-fluid mb-3" style="max-width: 50px;">
                                        <div class="row d-flex align-items-center">
                                            <div class="col-md-6">
                                                <h6 class="card-title text-center mt-1">Service Overview</h6>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="card text-center align-items-center justify-content-center" id="average">4.2</div>
                                            </div>
                                        </div>
                                        <p class="card-text text-muted text-center">Description of the hotel service overview.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                            </div>
                        </div>
                        <div class="card mt-5 bg-secondary-subtle h-100 shadow p-lg-4 mb-2 bg-body-tertiary border-0 equal-height" style="border-radius: 30px;" id="containTable">
                            <table class="table-hover caption-top table">
                                <caption class="mb-2">
                                    <img src="img_Hotel/account.svg" alt="Star" style="width: 2rem;">
                                    <span>From 5 users latest:</span>
                                </caption>
                                <thead>
                                    <tr>
                                        <th scope="col">No.</th>
                                        <th scope="col">Amenity</th>
                                        <th scope="col">Rating</th>
                                        <th scope="col">Feedback</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>Food Quality</td>
                                        <td>
                                            <img src="img_Hotel/star.svg" alt="Star" style="width: 10px;">
                                            <img src="img_Hotel/star.svg" alt="Star" style="width: 10px;">
                                            <img src="img_Hotel/star.svg" alt="Star" style="width: 10px;">
                                            <img src="img_Hotel/star.svg" alt="Star" style="width: 10px;">
                                            <img src="img_Hotel/star.svg" alt="Star" style="width: 10px;">
                                        </td>
                                        <td>Excellent food quality</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>Bed Quality</td>
                                        <td>
                                            <img src="img_Hotel/star.svg" alt="Star" style="width: 10px;">
                                            <img src="img_Hotel/star.svg" alt="Star" style="width: 10px;">
                                            <img src="img_Hotel/star.svg" alt="Star" style="width: 10px;">
                                            <img src="img_Hotel/none-star.svg" alt="Star" style="width: 10px;">
                                            <img src="img_Hotel/none-star.svg" alt="Star" style="width: 10px;">
                                        </td>
                                        <td>Comfortable beds, could be softer</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">3</th>
                                        <td>Breakfast</td>
                                        <td>
                                            <img src="img_Hotel/star.svg" alt="Star" style="width: 10px;">
                                            <img src="img_Hotel/star.svg" alt="Star" style="width: 10px;">
                                            <img src="img_Hotel/star.svg" alt="Star" style="width: 10px;">
                                            <img src="img_Hotel/star.svg" alt="Star" style="width: 10px;">
                                            <img src="img_Hotel/star.svg" alt="Star" style="width: 10px;">
                                        </td>
                                        <td>Delicious and varied breakfast options</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">4</th>
                                        <td>Pool</td>
                                        <td>
                                            <img src="img_Hotel/star.svg" alt="Star" style="width: 10px;">
                                            <img src="img_Hotel/star.svg" alt="Star" style="width: 10px;">
                                            <img src="img_Hotel/star.svg" alt="Star" style="width: 10px;">
                                            <img src="img_Hotel/star.svg" alt="Star" style="width: 10px;">
                                            <img src="img_Hotel/none-star.svg" alt="Star" style="width: 10px;">
                                        </td>
                                        <td>Great pool area, could be cleaner</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script>
            // Khởi tạo biểu đồ tròn
            var pieCtx = document.getElementById('pieChart').getContext('2d');
            var pieChart = new Chart(pieCtx, {
                type: 'pie',
                data: {
                    labels: ['Paid', 'Cancel'],
                    datasets: [{
                            data: [10, 20, 30],
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(75, 192, 192, 0.2)'
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(75, 192, 192, 1)'
                            ],
                            borderWidth: 1
                        }]
                },
                options: {
                    responsive: false, // Disable responsiveness to control the size manually
                    maintainAspectRatio: false, // Disable aspect ratio to allow custom width and height
                }
            });

            // Khởi tạo biểu đồ khác
            var ctx = document.getElementById('myChart').getContext('2d');
            var myChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
                    datasets: [{
                            label: 'Monthly Revenue Report 2024',
                            data: [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120],
                            backgroundColor: 'rgba(255, 99, 132, 0.2)',
                            borderColor: 'rgba(255, 99, 132, 1)',
                            borderWidth: 1
                        }]
                },
                options: {
                    responsive: false,
                    maintainAspectRatio: false
                }
            });
        </script>
    </body>
</html>
