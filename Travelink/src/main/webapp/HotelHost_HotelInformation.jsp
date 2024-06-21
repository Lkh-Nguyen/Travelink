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
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" >
                                <label class="form-check-label" for="flexCheckChecked">
                                    Others
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
                        <div class="card-header fw-bolder">
                            Hotel Room 
                        </div>
                        <div class="card-body">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                <label class="form-check-label" for="flexCheckDefault">
                                    King Room
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" >
                                <label class="form-check-label" for="flexCheckChecked">
                                    Luxury Room
                                </label>
                            </div>      
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" >
                                <label class="form-check-label" for="flexCheckChecked">
                                    VIP Room 
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" >
                                <label class="form-check-label" for="flexCheckChecked">
                                    Casual Room 
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
                                <h5 class="card-title mb-0">Hotel Information</h5>
                            </div>
                        </h5>
                        <div class="card-body">
                            <table class="table-hover table align-items-center justify-content-center">
                                <thead>
                                    <tr>
                                        <th scope="col">No.</th>
                                        <th scope="col">HOTEL NAME</th>
                                        <th scope="col">ROOM</th>
                                        <th scope="col">BED</th>
                                        <th scope="col">FACILITY</th>
                                        <th scope="col">LOCATION</th>
                                        <th scope="col">UPDATE & DELETE & ADD</th>
                                    </tr>
                                </thead>
                                <tbody class="table-group-divider">
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>Mường Thanh Hotel</td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <img src="img_Hotel/card-hotel.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">
                                                <p class="card-title mb-0">Casual Room</p>
                                            </div>
                                            <div class="d-flex align-items-center">
                                                <img src="img_Hotel/card-hotel.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">
                                                <p class="card-title mb-0">VIP Room</p>
                                            </div>
                                            <div class="d-flex align-items-center">
                                                <img src="img_Hotel/card-hotel.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">
                                                <p class="card-title mb-0">King Room</p>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <img src="img_Hotel/single.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">
                                                <p class="card-title mb-0">Single Bed</p>
                                            </div>
                                            <div class="d-flex align-items-center">
                                                <img src="img_Hotel/double.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">
                                                <p class="card-title mb-0">Double Bed</p>
                                            </div>
                                            <div class="d-flex align-items-center">
                                                <img src="img_Hotel/King.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">
                                                <p class="card-title mb-0">Super-King Bed</p>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <img src="img_Hotel/wifi.svg" alt="Biểu tượng Gym" style="width: 1rem; height: 1rem;" class="me-2">
                                                <p class="card-title mb-0">Wifi 5G</p>
                                            </div>
                                            <div class="d-flex align-items-center">
                                                <img src="img_Hotel/gym.svg" alt="Biểu tượng Gym" style="width: 1rem; height: 1rem;" class="me-2">
                                                <p class="card-title mb-0">Coffee Area</p>
                                            </div>
                                        </td>
                                        <td>Bắc Giang - <a href="#"><img src="img_Hotel/map.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2"></a></td>
                                        <td>
                                            <a class="btn btn-success"><img src="img_Hotel/update.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">Update</a>
                                            <a class="btn btn-danger"><img src="img_Hotel/delete.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">Delete</a>
                                            <a class="btn btn-secondary"><img src="img_Hotel/create.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">Add</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>Novotel </td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <img src="img_Hotel/card-hotel.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">
                                                <p class="card-title mb-0">Casual Room</p>
                                            </div>
                                            <div class="d-flex align-items-center">
                                                <img src="img_Hotel/card-hotel.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">
                                                <p class="card-title mb-0">VIP Room</p>
                                            </div>
                                            <div class="d-flex align-items-center">
                                                <img src="img_Hotel/card-hotel.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">
                                                <p class="card-title mb-0">King Room</p>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <img src="img_Hotel/single.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">
                                                <p class="card-title mb-0">Single Bed</p>
                                            </div>
                                            <div class="d-flex align-items-center">
                                                <img src="img_Hotel/King.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">
                                                <p class="card-title mb-0">Super-King Bed</p>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <img src="img_Hotel/air.svg" alt="Biểu tượng Gym" style="width: 1rem; height: 1rem;" class="me-2">
                                                <p class="card-title mb-0">Super Air-condition</p>
                                            </div>
                                            <div class="d-flex align-items-center">
                                                <img src="img_Hotel/bake.svg" alt="Biểu tượng Gym" style="width: 1rem; height: 1rem;" class="me-2">
                                                <p class="card-title mb-0">Bake Kitchen</p>
                                            </div>
                                        </td>
                                        <td>Hồ Chí Minh -<a href="#"><img src="img_Hotel/map.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2"></a></td>
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
                                                <img src="img_Hotel/card-hotel.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">
                                                <p class="card-title mb-0">Casual Room</p>
                                            </div>
                                            <div class="d-flex align-items-center">
                                                <img src="img_Hotel/card-hotel.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">
                                                <p class="card-title mb-0">VIP Room</p>
                                            </div>
                                            <div class="d-flex align-items-center">
                                                <img src="img_Hotel/card-hotel.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">
                                                <p class="card-title mb-0">King Room</p>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <img src="img_Hotel/single.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">
                                                <p class="card-title mb-0">Single Bed</p>
                                            </div>
                                            <div class="d-flex align-items-center">
                                                <img src="img_Hotel/double.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">
                                                <p class="card-title mb-0">Double Bed</p>
                                            </div>
                                            <div class="d-flex align-items-center">
                                                <img src="img_Hotel/King.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">
                                                <p class="card-title mb-0">Super-King Bed</p>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <img src="img_Hotel/gym.svg" alt="Biểu tượng Gym" style="width: 1rem; height: 1rem;" class="me-2">
                                                <p class="card-title mb-0">Gym Room</p>
                                            </div>
                                            <div class="d-flex align-items-center">
                                                <img src="img_Hotel/pool.svg" alt="Biểu tượng Gym" style="width: 1rem; height: 1rem;" class="me-2">
                                                <p class="card-title mb-0">Big Pool</p>
                                            </div>
                                            <div class="d-flex align-items-center">
                                                <img src="img_Hotel/love.svg" alt="Biểu tượng Gym" style="width: 1rem; height: 1rem;" class="me-2">
                                                <p class="card-title mb-0">Love chair</p>
                                            </div>
                                        </td>
                                        <td>Hà Nội - <a href="#"><img src="img_Hotel/map.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2"></a></td>

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
                                                <img src="img_Hotel/card-hotel.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">
                                                <p class="card-title mb-0">Casual Room</p>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <img src="img_Hotel/single.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">
                                                <p class="card-title mb-0">Single Bed</p>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <img src="img_Hotel/wifi.svg" alt="Biểu tượng Gym" style="width: 1rem; height: 1rem;" class="me-2">
                                                <p class="card-title mb-0">Wifi 5G</p>
                                            </div>
                                        </td>
                                        <td>Đà Nẵng -<a href="#"><img src="img_Hotel/map.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2"></a></td>

                                        <td>
                                            <a class="btn btn-success"><img src="img_Hotel/update.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">Update</a>
                                            <a class="btn btn-danger"><img src="img_Hotel/delete.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">Delete</a>
                                            <a class="btn btn-secondary"><img src="img_Hotel/create.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">Add</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">5</th>
                                        <td>Marie Curie Hotel</td>
                                        <td>
                                            <!-- Thêm các loại phòng của khách sạn A -->
                                            <div class="d-flex align-items-center">
                                                <img src="img_Hotel/card-hotel.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">
                                                <p class="card-title mb-0">Casual Room</p>
                                            </div>
                                            <!-- Thêm các loại phòng khác của khách sạn A nếu có -->
                                        </td>
                                        <td>
                                            <!-- Thêm các loại giường của khách sạn A -->
                                            <div class="d-flex align-items-center">
                                                <img src="img_Hotel/single.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">
                                                <p class="card-title mb-0">Single Bed</p>
                                            </div>
                                            <!-- Thêm các loại giường khác của khách sạn A nếu có -->
                                        </td>
                                        <td>
                                            <!-- Thêm các tiện nghi của khách sạn A -->
                                            <div class="d-flex align-items-center">
                                                <img src="img_Hotel/wifi.svg" alt="Biểu tượng Wifi" style="width: 1rem; height: 1rem;" class="me-2">
                                                <p class="card-title mb-0">Wifi 5G</p>
                                            </div>
                                            <div class="d-flex align-items-center">
                                                <img src="img_Hotel/air.svg" alt="Biểu tượng Gym" style="width: 1rem; height: 1rem;" class="me-2">
                                                <p class="card-title mb-0">Super Air-condition</p>
                                            </div>
                                            <div class="d-flex align-items-center">
                                                <img src="img_Hotel/bake.svg" alt="Biểu tượng Gym" style="width: 1rem; height: 1rem;" class="me-2">
                                                <p class="card-title mb-0">Bake Kitchen</p>
                                            </div>
                                            <!-- Thêm các tiện nghi khác của khách sạn A nếu có -->
                                        </td>
                                        <td>Thanh Hóa - <a href="#"><img src="img_Hotel/map.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2"></a></td>
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
