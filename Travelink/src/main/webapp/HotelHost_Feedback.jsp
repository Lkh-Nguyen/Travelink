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
        <link rel="stylesheet" href="css/HotelHost_Feedback.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <body>

        <%@include file="Header_HotelHost.jsp" %>
        <div class="col-md-1" style="margin-left: 50px">
            <button type="button" class="btn btn-outline-secondary mt-3 w-50" onclick="history.back()">Back</button>
        </div>
        <div class="container mt-5">
            <div class="card"> 
                <div class="card-body">
                    <h5 class="card-title mb-3" style="font-weight: bold">More Reviews from Other Guests in Davue Hotel Da Nang</h5>
                    <h6 class="card-subtitle mb-2 text-muted" style="font-weight: bold">Overall Rating & Reviews</h6>
                    <h6 style="font-size: 12px;margin-top: -5px;margin-left: 5px;margin-bottom: 10px">From 150 verified guests reviews</h6>
                    <div class="row mb-4">
                        <div class="col-md-3">
                        </div>
                        <div class="col-md-1 rating-circle me-4">
                            <span>4.3</span>
                        </div>
                        <div class= "col-md-6">
                            <div class="rating-details">
                                <div class="rating-bar mb-1">
                                    <div class="col-md-2">Fantastic</div>
                                    <div class="col-md-4 progress flex-grow-1 ms-2">
                                        <div class="progress-bar bg-primary" role="progressbar" style="width: 50%;"></div>
                                    </div>
                                    <div class="col-md-3 ms-2">45</div>
                                </div>
                            </div>
                            <div class="rating-details">
                                <div class="rating-bar mb-1">
                                    <div class="col-md-2">Very Good</div>
                                    <div class="col-md-4 progress flex-grow-1 ms-2">
                                        <div class="progress-bar bg-primary" role="progressbar" style="width: 30%;"></div>
                                    </div>
                                    <div class="col-md-3 ms-2">34</div>
                                </div>
                                <div class="rating-bar mb-1">
                                    <div class="col-md-2">Satisfying</div>
                                    <div class="col-md-4 progress flex-grow-1 ms-2">
                                        <div class="progress-bar bg-primary" role="progressbar" style="width: 25%;"></div>
                                    </div>
                                    <div class="col-md-3 ms-2">12</div>
                                </div>
                                <div class="rating-bar mb-1">
                                    <div class="col-md-2">Average</div>
                                    <div class="col-md-4 progress flex-grow-1 ms-2">
                                        <div class="progress-bar bg-primary" role="progressbar" style="width: 15%;"></div>
                                    </div>
                                    <div class="col-md-3 ms-2">5</div>
                                </div>
                                <div class="rating-bar mb-1">
                                    <div class="col-md-2">Poor</div>
                                    <div class="col-md-4 progress flex-grow-1 ms-2">
                                        <div class="progress-bar bg-primary" role="progressbar" style="width: 2%;"></div>
                                    </div>
                                    <div class="col-md-3 ms-2">3</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="d-flex mb-3 justify-content-between">
                        <div class="d-flex align-items-center">
                            <span>Filter</span>
                            <select class="form-select ms-2" style="width: auto;">
                                <option selected>Most Recent</option>
                                <option selected>Score (Low to High)</option>
                                <option selected>Score (High to Low)</option>
                            </select>
                        </div>
                    </div>
                    <div class="review mb-3" style="border: 1px solid rgb(227,227,227);border-radius: 5px">
                        <div class="d-flex">
                            <div class="avatar"><img src="img_Avatar/avatar_default.jpg"></div>
                            <div class="ms-3">
                                <div class="row">
                                    <h6 class="mb-0">Nguyen Xuan Linh</h6>
                                    <span class="text-muted" style="float: right">04-06-2025</span>
                                </div>
                                <div class="rating mt-1">                                            
                                    <i class='bx bxs-star'></i>
                                    <i class='bx bxs-star'></i>
                                    <i class='bx bxs-star'></i>
                                    <i class='bx bx-star'></i>
                                    <i class='bx bx-star'></i>
                                </div>
                                <p>Không thông báo lịch cho khách hàng</p>
                                <div><span class="badge bg-light text-dark">3 liked this view</span> <span class="badge bg-light text-dark">2 disliked this view</span></div>
                            </div>
                        </div>
                    </div>
                    <div class="review mb-3" style="border: 1px solid rgb(227,227,227);border-radius: 5px">
                            <div class="d-flex">
                                <div class="avatar"><img src="img_Home/hotel-1.webp"></div>
                                <div class="ms-3">
                                    <div class="row">
                                        <h6 class="mb-0">Nguyen Xuan Linh</h6>
                                        <span class="text-muted" style="float: right">04-06-2025</span>
                                    </div>
                                    <div class="rating mt-1">                                            
                                        <i class='bx bxs-star'></i>
                                        <i class='bx bxs-star'></i>
                                        <i class='bx bxs-star'></i>
                                        <i class='bx bx-star'></i>
                                        <i class='bx bx-star'></i>
                                    </div>
                                    <p>I got an upgraded room so definitely not complaining. The hotel is strategic and near to the beach. The staff is friendly and willing to try to communicate.</p>
                                    <div><span class="badge bg-light text-dark">3 liked this view</span> <span class="badge bg-light text-dark">2 disliked this view</span></div>
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
