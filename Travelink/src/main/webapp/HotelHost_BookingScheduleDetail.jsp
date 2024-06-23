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

        <div class="col-md-1" style="margin-left: 50px">
            <button type="button" class="btn btn-outline-secondary mt-3 mb-3 w-50" onclick="history.back()">Back</button>
        </div>
        <div class="container">
            <div class="card mb-5 h-1000 ">
                <div class="card-body ">
                    <div class="row gradient-background m-1" style="height: 5px">
                    </div>

                    <div class="row">
                        <div class="container">
                            <div class="card border-0">
                                <h3 style="margin-left: 20px">Check Room Date: 13/06/2024</h3>
                                <div class="card-body justify-content-center align-items-center text-center">
                                    <table class="table table-striped table-hover text-center">
                                        <thead>
                                            <tr>
                                                <th scope="col" class="col-1">No</th>
                                                <th scope="col" class="col-3">Room Name</th>
                                                <th scope="col" class="col-2">Checkin Date</th>
                                                <th scope="col" class="col-2">CheckoutDate</th>
                                                <th scope="col" class="col-1">Total Day</th>
                                                <th scope="col" class="col-2">ID Reservation</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th scope="row" class="col-1">1</th>
                                                <td scope="row" class="col-3">Deluxe Suite</td>
                                                <td scope="row" class="col-2">12/03/2024</td>
                                                <td scope="row" class="col-2">15/03/2024</td>
                                                <td scope="row" class="col-1">2 Days</td>
                                                <td scope="row" class="col-2">
                                                    <a href="HotelHost_BookingHistoryBillDetailServlet?reservationID=3" class="btn btn-outline-secondary w-50">
                                                        3   
                                                    </a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row" class="col-1">2</th>
                                                <td scope="row" class="col-3">Deluxe Suite</td>
                                                <td scope="row" class="col-2">12/03/2024</td>
                                                <td scope="row" class="col-2">16/03/2024</td>
                                                <td scope="row" class="col-1">3 Days</td>
                                                <td scope="row" class="col-2">
                                                    <a href="HotelHost_BookingHistoryBillDetailServlet?reservationID=3" class="btn btn-outline-secondary w-50">
                                                        4  
                                                    </a>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
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
