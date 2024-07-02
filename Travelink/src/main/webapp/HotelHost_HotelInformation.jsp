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
            body {
                font-family: Montserrat, sans-serif;
                background-color: #f8f9fa;
                color: #343a40;
            }
            .container-fluid {
                padding: 2rem;
            }
            .btn-outline-primary {
                border-color: #007bff;
                color: #007bff;
                transition: all 0.3s;
            }
            .btn-outline-primary:hover {
                background-color: #007bff;
                color: #fff;
            }
            .card {
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                margin-bottom: 2rem;
            }
            .card-header {
                background-color: #007bff;
                color: white;
                border-radius: 8px 8px 0 0;
                padding: 1rem;
            }
            .card-title {
                margin-bottom: 0;
            }
            .table {
                margin-bottom: 0;
            }
            .table th, .table td {
                vertical-align: middle;
                padding: 1rem;
            }
            .table thead th {
                background-color: #007bff;
                color: white;
                border: none;
            }
            .table-hover tbody tr:hover {
                background-color: #e9ecef;
            }
            .btn {
                transition: all 0.3s;
            }
            .btn-outline-primary {
                border-color: #007bff;
                color: #007bff;
            }
            .btn-outline-primary:hover {
                background-color: #007bff;
                color: white;
            }
            .btn-outline-danger {
                border-color: #dc3545;
                color: #dc3545;
            }
            .btn-outline-danger:hover {
                background-color: #dc3545;
                color: white;
            }
            .btn-outline-secondary {
                border-color: #6c757d;
                color: #6c757d;
            }
            .btn-outline-secondary:hover {
                background-color: #6c757d;
                color: white;
            }
            .modal-header {
                background-color: #007bff;
                color: white;
            }
            .modal-footer .btn-primary {
                background-color: #007bff;
                border: none;
            }
        </style>
    </head>
    <body>
        <%@include file="Header_HotelHost.jsp" %>
        <div class="container-fluid">
            <a href="Home_HotelHost.jsp" class="btn btn-outline-primary mt-2">
                <img src="img_Hotel/back.svg" alt="Back Icon" style="width: 1rem; height: 1rem;" class="me-2">Back
            </a>
            <div class="row p-4 d-flex align-items-center">
                <div class="col-md-12">
                    <div class="card">
                        <h5 class="card-header">
                            <div class="d-flex align-items-center">
                                <img src="img_Hotel/list.svg" alt="List Icon" style="width: 1rem; height: 1rem;" class="me-2">
                                <span>Hotel Information</span>
                            </div>
                        </h5>
                        <div class="card-body">
                            <c:choose>
                                <c:when test="${not empty requestScope.hotel_list}">
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
                                        <tbody class="table-group-divider align-items-center text-center">
                                            <c:forEach var="h" items="${requestScope.hotel_list}" varStatus="loopStatus">
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
                                                    <td class="text-start">
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
                                                            <input type="hidden" name="hotel_ID" value="${h.hotel_ID}"/>
                                                            <input type="hidden" name="action" value="update"/>
                                                        </form>       
                                                        <form class="row m-1 p-1" action="#" method="#" id="cancelForm">        
                                                            <button type="button" class="btn btn-outline-danger mb-1 w-100 delete-button">
                                                                Delete
                                                            </button>
                                                            <input type="hidden" name="hotel_ID" value="${h.hotel_ID}"/>
                                                            <input type="hidden" name="action" value="delete"/>
                                                        </form>
                                                        <form class="row m-1 p-1" action="#" method="#" id="cancelForm">
                                                            <button type="button" class="btn btn-outline-secondary mb-1 w-100 add-button">
                                                                Add
                                                            </button>
                                                            <input type="hidden" name="hotel_ID" value="${h.hotel_ID}"/>
                                                            <input type="hidden" name="action" value="add"/>
                                                        </form>
                                                        <div class="row m-2">
                                                            <a class="btn btn-outline-primary w-100" href="UpdateHotelRoomServlet?hotelID=${h.hotel_ID}">
                                                                Room
                                                            </a>                                                    
                                                        </div>
                                                    </td>
                                                </tr>
                                                <!-- Modal Update-->
                                                <div class="modal fade" id="confirmCancelModal" tabindex="-1" role="dialog" aria-labelledby="confirmCancelModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="confirmCancelModalLabel">Confirm Cancellation</h5>
                                                            </div>
                                                            <div class="modal-body justify-content-center">
                                                                <a class='btn btn-primary' href='HotelHost_UpdateHotelInformation.jsp?hotelID=${h.hotel_ID}'>Update Hotel </a>
                                                                <a class='btn btn-primary' href='UpdateHotelRoomServlet?hotelID=${h.hotel_ID}'>Update Room </a>
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
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </c:when>
                                <c:otherwise>
                                    <div class="alert alert-warning" role="alert">
                                        No hotels available.
                                    </div>
                                </c:otherwise>
                            </c:choose>
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
                const deleteButtons = document.querySelectorAll('.delete-button');
                const confirmDeleteButton = document.getElementById('confirmDeleteButton');
                let formToSubmit;

                deleteButtons.forEach(button => {
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
