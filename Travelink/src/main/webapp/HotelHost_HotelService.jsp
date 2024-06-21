<%-- 
    Document   : HotelHost_HotelService
    Created on : Jun 15, 2024, 3:35:18 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dash Board</title>
        <link rel="icon" href="img_Home/logo.png">
        <link rel="stylesheet" href="bootstrap_css/bootstrap.min.css">
        <link rel="stylesheet" href="css/HotelHost_HotelService.css">
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
        <div class="container-fluid">
            <a href="Home_HotelHost.jsp" class="btn btn-outline-primary mt-2"><img src="img_Hotel/back.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">Back</a>
            <div class="row p-4 d-flex align-items-center row-compact">
                <div class="col-md-2">
                    <div class="card">
                        <div class="card-header fw-bolder">
                            Hotel Headquarters 
                        </div>
                        <div class="card-body">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                <label class="form-check-label" for="flexCheckDefault">
                                    Hồ Chí Minh
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" >
                                <label class="form-check-label" for="flexCheckChecked">
                                    Đà Nẵng
                                </label>
                            </div>      
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" >
                                <label class="form-check-label" for="flexCheckChecked">
                                    Hà Nội
                                </label>
                            </div>

                        </div>
                    </div>
                    <div class="card mt-4">
                        <div class="card-header fw-bolder">
                            Hotel Service 
                        </div>
                        <div class="card-body">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                <label class="form-check-label" for="flexCheckDefault">
                                    BreakFast
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" >
                                <label class="form-check-label" for="flexCheckChecked">
                                    Buffet
                                </label>
                            </div>      
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" >
                                <label class="form-check-label" for="flexCheckChecked">
                                    Tour 
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" >
                                <label class="form-check-label" for="flexCheckChecked">
                                    Love Room 
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" >
                                <label class="form-check-label" for="flexCheckChecked">
                                    Waterfall Shower 
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" >
                                <label class="form-check-label" for="flexCheckChecked">
                                    Others 
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="card mt-4">
                        <button type="button" class="btn btn-outline-primary position-relative" data-mdb-ripple-init>
                            <img src="img_Hotel/search.svg" alt="Search Icon" class="me-2" style="width: 1rem;">
                            Search
                        </button>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="card">
                        <h5 class="card-header">
                            <div class="d-flex align-items-center">
                                <img src="img_Hotel/list.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">
                                <h5 class="card-title mb-0">List Hotel Service</h5>
                            </div>
                        </h5>
                        <div class="card-body">
                            <table class="table-hover table align-items-center justify-content-center">
                                <thead>
                                    <tr>
                                        <th scope="col">No.</th>
                                        <th scope="col">HOTEL NAME</th>
                                        <th scope="col">SERVICE</th>
                                        <th scope="col">LOCATION</th>
                                        <th scope="col">PRICE</th>
                                        <th scope="col">HOTEL INFORMATION</th>
                                        <th scope="col">UPDATE & DELETE & ADD</th>
                                    </tr>
                                </thead>
                                <tbody class="table-group-divider">
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>Mường Thanh Hotel</td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <img src="img_Hotel/breakfast.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">
                                                <p class="card-title mb-0">Breakfast</p>
                                            </div>
                                            <div class="d-flex align-items-center">
                                                <img src="img_Hotel/buffet.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">
                                                <p class="card-title mb-0">Buffet</p>
                                            </div>
                                            <div class="d-flex align-items-center">
                                                <img src="img_Hotel/karaoke.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">
                                                <p class="card-title mb-0">Karaoke</p>
                                            </div>
                                        </td>
                                        <td>Bắc Giang - <a href="#"><img src="img_Hotel/map.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2"></a></td>
                                        <td>
                                            <div>$20</div>
                                            <div>$30</div>
                                            <div>$50</div>
                                        </td>
                                        <td><a class="btn btn-outline-primary"><img src="img_Hotel/view.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">View</a></td>
                                        <td>
                                            <a class="btn btn-success"><img src="img_Hotel/update.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">Update</a>
                                            <a class="btn btn-danger"><img src="img_Hotel/delete.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">Delete</a>
                                            <a class="btn btn-secondary"><img src="img_Hotel/create.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">Add</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>Novotel</td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <img src="img_Hotel/breakfast.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">
                                                <p class="card-title mb-0">Breakfast</p>
                                            </div>
                                            <div class="d-flex align-items-center">
                                                <img src="img_Hotel/buffet.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">
                                                <p class="card-title mb-0">Buffet</p>
                                            </div>
                                            <div class="d-flex align-items-center">
                                                <img src="img_Hotel/karaoke.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">
                                                <p class="card-title mb-0">Karaoke</p>
                                            </div>
                                        </td>
                                        <td>Hồ Chí Minh - <a href="#"><img src="img_Hotel/map.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2"></a></td>
                                        <td>
                                            <div>$25</div>
                                            <div>$35</div>
                                            <div>$55</div>
                                        </td>
                                        <td><a class="btn btn-outline-primary"><img src="img_Hotel/view.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">View</a></td>
                                        <td>
                                            <a class="btn btn-success"><img src="img_Hotel/update.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">Update</a>
                                            <a class="btn btn-danger"><img src="img_Hotel/delete.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">Delete</a>
                                            <a class="btn btn-secondary"><img src="img_Hotel/create.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">Add</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">3</th>
                                        <td>Furama Hotel</td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <img src="img_Hotel/breakfast.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">
                                                <p class="card-title mb-0">Breakfast</p>
                                            </div>
                                            <div class="d-flex align-items-center">
                                                <img src="img_Hotel/buffet.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">
                                                <p class="card-title mb-0">Buffet</p>
                                            </div>
                                            <div class="d-flex align-items-center">
                                                <img src="img_Hotel/karaoke.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">
                                                <p class="card-title mb-0">Karaoke</p>
                                            </div>
                                        </td>
                                        <td>Hà Nội - <a href="#"><img src="img_Hotel/map.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2"></a></td>
                                        <td>
                                            <div>$22</div>
                                            <div>$32</div>
                                            <div>$52</div>
                                        </td>
                                        <td><a class="btn btn-outline-primary"><img src="img_Hotel/view.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">View</a></td>
                                        <td>
                                            <a class="btn btn-success"><img src="img_Hotel/update.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">Update</a>
                                            <a class="btn btn-danger"><img src="img_Hotel/delete.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">Delete</a>
                                            <a class="btn btn-secondary"><img src="img_Hotel/create.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">Add</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">4</th>
                                        <td>Furama Hotel</td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <img src="img_Hotel/breakfast.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">
                                                <p class="card-title mb-0">Breakfast</p>
                                            </div>
                                            <div class="d-flex align-items-center">
                                                <img src="img_Hotel/buffet.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">
                                                <p class="card-title mb-0">Buffet</p>
                                            </div>
                                            <div class="d-flex align-items-center">
                                                <img src="img_Hotel/karaoke.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">
                                                <p class="card-title mb-0">Karaoke</p>
                                            </div>
                                        </td>
                                        <td>Đà Nẵng - <a href="#"><img src="img_Hotel/map.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2"></a></td>
                                        <td>
                                            <div>$24</div>
                                            <div>$34</div>
                                            <div>$54</div>
                                        </td>
                                        <td><a class="btn btn-outline-primary"><img src="img_Hotel/view.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">View</a></td>
                                        <td>
                                            <a class="btn btn-success"><img src="img_Hotel/update.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">Update</a>
                                            <a class="btn btn-danger"><img src="img_Hotel/delete.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">Delete</a>
                                            <a class="btn btn-secondary"><img src="img_Hotel/create.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">Add</a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="Footer.jsp" %>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
