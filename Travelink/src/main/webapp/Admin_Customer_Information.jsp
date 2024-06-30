<%-- 
    Document   : Admin_Customer_Information
    Created on : Jun 30, 2024, 11:02:49 AM
    Author     : DUYAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Travelink - Customer Management</title>

        <!-- Custom fonts for this template-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="vendor/css/sb-admin-2.min.css" rel="stylesheet">
        <style>
            .equal {
                flex: 1;
                flex-direction: column;
            }
        </style>
    </head>
    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">
            <!-- Sidebar -->
            <%@include file="Admin_Sidebar.jsp" %>
            <!-- End of Sidebar -->
            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">
                <!-- Main Content -->
                <div id="content">
                    <!-- Topbar -->
                    <%@include file="Admin_Header.jsp" %>
                    <!-- End of Topbar -->
                    <!-- Begin Page Content -->
                    <div class="container-fluid">
                        <!-- Page Heading -->
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800">Customer Information</h1>
                        </div>

                        <div class="row d-flex">
                            <!-- Left Sidebar - Customer's Information -->
                            <div class="col-lg-4 mb-4 d-flex">
                                <div class="card shadow mb-4 equal">
                                    <div class="card-header py-3">
                                        <h6 class="m-0 font-weight-bold text-primary">Customer Information</h6>
                                    </div>
                                    <div class="card-body">
                                        <img class="img-fluid mb-3" src="data:image/png;base64,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" alt="Customer Image">
                                        <p><strong>Name:</strong> Jane Smith</p>
                                        <p><strong>Email:</strong> janesmith@example.com</p>
                                        <p><strong>Phone:</strong> (987) 654-3210</p>
                                        <p><strong>Address:</strong> 456 Elm St, Anytown, USA</p>
                                    </div>
                                </div>
                            </div>

                            <!-- Right Sidebar - Customer's Additional Information -->
                            <div class="col-lg-8 mb-4 d-flex">
                                <div class="card shadow mb-4 equal">
                                    <div class="card-header py-3">
                                        <h6 class="m-0 font-weight-bold text-primary">Customer Additional Information</h6>
                                    </div>
                                    <div class="card-body" style="
                                         display: flex;
                                         flex-direction: column;
                                         justify-content: space-evenly;
                                         ">
                                        <p><strong>Customer ID:</strong> 1</p>
                                        <p><strong>Status:</strong> Active</p>
                                        <p><strong>Membership Type:</strong> Gold</p>
                                        <p><strong>Registration Date:</strong> January 1, 2020</p>
                                        <p><strong>Last Login:</strong> June 10, 2024</p>
                                        <p><strong>Notes:</strong> This customer has been a loyal member and enjoys frequent bookings.</p>
                                        <!-- Buttons for View booked hotel and View feedback -->
                                        <button class="btn btn-primary mr-2" data-toggle="modal" data-target="#bookedHotelsModal">
                                            View booked hotels
                                        </button>
                                        <button class="btn btn-primary" data-toggle="modal" data-target="#feedbackModal">
                                            View feedback
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End of Page Content -->
                </div>
                <!-- End of Main Content -->

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="vendor/js/sb-admin-2.min.js"></script>
        <!-- Modal for Booked Hotels -->
        <div class="modal fade" id="bookedHotelsModal" tabindex="-1" role="dialog" aria-labelledby="bookedHotelsModalLabel"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="bookedHotelsModalLabel">Booked Hotels</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <table id="bookedHotelsTable" class="table table-bordered table-hover" style="width: 100%">
                            <thead>
                                <tr>
                                    <th>Hotel Name</th>
                                    <th>Check-in Date</th>
                                    <th>Check-out Date</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Hilton Garden Inn</td>
                                    <td>2024-06-01</td>
                                    <td>2024-06-05</td>
                                </tr>
                                <tr>
                                    <td>Marriott Downtown</td>
                                    <td>2024-05-15</td>
                                    <td>2024-05-20</td>
                                </tr>
                                <!-- Add more rows as needed -->
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>


        <!-- Modal for Feedback -->
        <div class="modal fade" id="feedbackModal" tabindex="-1" role="dialog" aria-labelledby="feedbackModalLabel"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="feedbackModalLabel">Feedback</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <table id="feedbackTable" class="table table-bordered table-hover" style="width: 100%">
                            <thead>
                                <tr>
                                    <th>Hotel Name</th>
                                    <th>Rating</th>
                                    <th>Comment</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Hilton Garden Inn</td>
                                    <td>4.5/5</td>
                                    <td>Great experience, friendly staff!</td>
                                </tr>
                                <tr>
                                    <td>Marriott Downtown</td>
                                    <td>4/5</td>
                                    <td>Good location, clean rooms.</td>
                                </tr>
                                <!-- Add more rows as needed -->
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Include DataTables scripts -->
        <script src="vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>
        <!-- Initialize DataTables -->
        <script>
            $(document).ready(function () {
                // Initialize Booked Hotels DataTable
                $('#bookedHotelsTable').DataTable({
                    paging: true,
                    searching: false, // Optionally disable searching
                    info: true // Optionally display info
                });

                // Initialize Feedback DataTable
                $('#feedbackTable').DataTable({
                    paging: true,
                    searching: false, // Optionally disable searching
                    info: true // Optionally display info
                });
            });
        </script>
    </body>
</html>
