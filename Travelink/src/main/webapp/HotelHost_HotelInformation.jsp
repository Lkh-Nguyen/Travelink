<%-- 
    Document   : HotelHost_HotelService
    Created on : Jun 15, 2024, 3:35:18 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dash Board</title>
        <link rel="icon" href="img_Home/logo.png">
        <link rel="stylesheet" href="bootstrap_css/bootstrap.min.css">
        <link rel="stylesheet" href="css/HotelHost_HotelService.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
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
                <div class="col-md-12">
                    <div class="card">
                        <h5 class="card-header">
                            <div class="d-flex align-items-center">
                                <img src="img_Hotel/list.svg" alt="Special Icon" style="width: 1rem; height: 1rem;" class="me-2">
                                <h5 class="card-title mb-0">Hotel Information</h5>
                            </div>
                        </h5>
                        <div class="card-body">
                            <table id="hotelTable" class="table-hover table align-items-center justify-content-center">
                                <thead>
                                    <tr class="text-center">
                                        <th scope="col">No.</th>
                                        <th scope="col">NAME</th>
                                        <th scope="col">EMAIL</th>
                                        <th scope="col">STAR</th>
                                        <th scope="col">PHONE</th>
                                        <th scope="col">DESCRIPTION</th>
                                        <th scope="col">ADDRESS</th>
                                        <th scope="col">STATUS</th>
                                        <th scope="col">ACTION</th>
                                    </tr>
                                </thead>
                                <c:forEach var="h" items="${requestScope.hotel_list}" varStatus="loopStatus">
                                    <tbody class="table-group-divider align-items-center text-center mt-2">
                                        <tr>
                                            <th scope="row">${loopStatus.index + 1}</th>
                                            <td>${h.name}</td>
                                            <td>${h.email}</td>
                                            <td>
                                                <div style="width: 8rem;">
                                                    <c:if test="${h.star == 5}">
                                                        <i class='bx bxs-star' style="color: yellow"></i>
                                                        <i class='bx bxs-star' style="color: yellow"></i>
                                                        <i class='bx bxs-star' style="color: yellow"></i>
                                                        <i class='bx bxs-star' style="color: yellow"></i>
                                                        <i class='bx bxs-star' style="color: yellow"></i>
                                                    </c:if>
                                                    <c:if test="${h.star == 4}">
                                                        <i class='bx bxs-star' style="color: yellow"></i>
                                                        <i class='bx bxs-star' style="color: yellow"></i>
                                                        <i class='bx bxs-star' style="color: yellow"></i>
                                                        <i class='bx bxs-star' style="color: yellow"></i>
                                                        <i class='bx bxs-star'></i>
                                                    </c:if>
                                                    <c:if test="${h.star == 3}">
                                                        <i class='bx bxs-star' style="color: yellow"></i>
                                                        <i class='bx bxs-star' style="color: yellow"></i>
                                                        <i class='bx bxs-star' style="color: yellow"></i>
                                                        <i class='bx bxs-star'></i>
                                                        <i class='bx bxs-star'></i>
                                                    </c:if>
                                                    <c:if test="${h.star == 2}">
                                                        <i class='bx bxs-star' style="color: yellow"></i>
                                                        <i class='bx bxs-star' style="color: yellow"></i>
                                                        <i class='bx bxs-star'></i>
                                                        <i class='bx bxs-star'></i>
                                                        <i class='bx bxs-star'></i>
                                                    </c:if>
                                                    <c:if test="${h.star == 1}">
                                                        <i class='bx bxs-star' style="color: yellow"></i>
                                                        <i class='bx bxs-star'></i>
                                                        <i class='bx bxs-star'></i>
                                                        <i class='bx bxs-star'></i>
                                                        <i class='bx bxs-star'></i>
                                                    </c:if>
                                                </div>
                                            </td>
                                            <td>${h.phoneNumber}</td>
                                            <td class="justify-content-start">
                                                <div class="card-text">${h.description}</div>
                                            </td>
                                            <td>
                                                <div style="width: 15rem;">${h.address}</div>
                                            </td>
                                            <td>Active</td>
                                            <td>
                                                <form class="row m-1 p-1" action="#" method="#" id="cancelForm">
                                                    <button type="button" class="btn btn-outline-primary mb-1 w-100 cancel-button" data-reservation-id="${entry.key}">
                                                       Update
                                                    </button>
                                                </form>       
                                                <form class="row m-1 p-1" action="#" method="#" id="cancelForm">        
                                                    <button type="button" class="btn btn-outline-danger mb-1 w-100" id="deleteButton">
                                                        Delete
                                                    </button>
                                                </form>
                                                <form class="row m-1 p-1" action="#" method="#" id="cancelForm">
                                                    <button type="button" class="btn btn-outline-secondary mb-1 w-100" id="addButton">
                                                        Add
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                    <div class="modal fade" id="confirmCancelModal" tabindex="-1" role="dialog" aria-labelledby="confirmCancelModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="confirmCancelModalLabel">Confirm Cancellation</h5>
                                                </div>
                                                <div class="modal-body justify-content-center">
                                                    <form action="hotelHost_UpdateHotelServlet" method="get">
                                                        <button>Update Hotel</button>
                                                        <input type="hidden" name="hotelID" value="${h.hotel_ID}">
                                                    </form>
                                                    <form>
                                                        <button>Update Room</button>
                                                        <input type="hidden" name="hotelID" value="${h.hotel_ID}">
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Modal Delete-->
                                    <div class="modal fade" id="confirmDeleteModal" tabindex="-1" role="dialog" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="confirmDeleteModalLabel">Confirm Delete</h5>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                                        <label class="form-check-label" for="flexCheckDefault">Room 1</label>
                                                    </div>
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked>
                                                        <label class="form-check-label" for="flexCheckChecked">Room 2</label>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                                    <button type="button" class="btn btn-primary" id="confirmDeleteButton">Delete</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </tbody>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="Footer.jsp" %>
        <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.5.2/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script>
            $(document).ready(function () {
                $('#hotelTable').DataTable();
            });
            //ModalUpdate
            document.addEventListener('DOMContentLoaded', () => {
                const cancelButtons = document.querySelectorAll('.cancel-button');
                const confirmCancelButton = document.getElementById('confirmCancelButton');
                let formToSubmit;

                cancelButtons.forEach(button => {
                    button.addEventListener('click', () => {
                        formToSubmit = button.closest('form');
                        $('#confirmCancelModal').modal('show');
                    });
                });

                confirmCancelButton.addEventListener('click', () => {
                    formToSubmit.submit();
                });
            });

            //ModalDelete
            document.addEventListener('DOMContentLoaded', () => {
                const cancelButtons = document.querySelectorAll('.delete-button');
                const confirmCancelButton = document.getElementById('confirmDeleteButton');
                let formToSubmit;

                cancelButtons.forEach(button => {
                    button.addEventListener('click', () => {
                        formToSubmit = button.closest('form');
                        $('#confirmDeleteModal').modal('show');
                    });
                });

                confirmDeleteButton.addEventListener('click', () => {
                    formToSubmit.submit();
                });
            });

            function redirectToUpdatePage() {
                window.location.href = 'HotelHost_UpdateRoom.jsp';
            }
        </script>
    </body>
</html>
