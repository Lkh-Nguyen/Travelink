<%-- 
    Document   : HotelHost_HotelService
    Created on : Jun 15, 2024, 3:35:18 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                        <c:if test="${requestScope.hotels == null || requestScope.hotels.isEmpty()}">
                            <tr>
                            <div class="alert alert-danger mt-4">You don't own any hotels.</div>
                            </tr>
                        </c:if>


                        <c:if test="${requestScope.hotels != null}">
                            <div class="card-body">
                                <table class="table-hover table align-items-center justify-content-center">
                                    <thead>
                                        <tr class="text-center">
                                            <th scope="col">No.</th>
                                            <th scope="col">HOTEL NAME</th>
                                            <th scope="col">SERVICE</th>
                                            <th scope="col">PRICE</th>
                                            <th scope="col">LOCATION</th>                       
                                            <th scope="col">HOTEL INFORMATION</th>
                                            <th scope="col">ACTION</th>
                                        </tr>
                                    </thead>
                                    <tbody class="table-group-divider">


                                        <c:forEach items="${requestScope.hotels}" var="hotel" varStatus="status">
                                            <tr>
                                                <th scope="row">${status.index +1}</th>
                                                <td>${hotel.name}</td>
                                                <c:forEach items="${hotel.getService()}" var="service">
                                                    <td>
                                                        <div class="d-flex align-items-center">
                                                            <img src="img_Hotel/breakfast.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">
                                                            <p class="card-title mb-0">${service.name}</p>
                                                        </div>
                                                    </td>                                                
                                                    <td>
                                                        <div>${service.getPrice(hotel.hotel_ID)}</div>
                                                    </td>
                                                </c:forEach>
                                                <td>${hotel.getLocation()} - <a href="#"><img src="img_Hotel/map.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2"></a></td>
                                                <td><a class="btn btn-outline-primary"><img src="img_Hotel/view.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">View</a></td>
                                                <td>
                                                    <a class="btn btn-success"><img src="img_Hotel/update.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">Update</a>
                                                    <a class="btn btn-secondary"><img src="img_Hotel/create.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">Add</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Button to trigger modal -->
        <!--<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal">
          Delete Item
        </button>-->

        <!-- Modal -->
        <!--<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="deleteModalLabel">Confirm Delete</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                Are you sure you want to delete?
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-danger" id="confirmDelete">Delete</button>
              </div>
            </div>
          </div>
        </div>-->

        <%@include file="Footer.jsp" %>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
