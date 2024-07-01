<%-- 
    Document   : Admin_Customer_List
    Created on : Jun 30, 2024, 10:45:35 AM
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
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="vendor/css/sb-admin-2.min.css" rel="stylesheet">
        <style>
            .custom-button {
                width: 100px;  /* Điều chỉnh giá trị này theo nhu cầu của bạn */
                height: 40px;
                margin-top: 10px;/* Điều chỉnh giá trị này theo nhu cầu của bạn */
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
                        <h1 class="h3 mb-4 text-gray-800">Report Feedback List</h1>

                        <!-- Customer Account List Table -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Report Feedback List</h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th style="width: 600px">Description</th>
                                                <th>Rating</th>
                                                <th>Date</th>
                                                <th>Likes Count</th>
                                                <th>Dislike Count</th>
                                                <th>Count report</th>
                                                <th style="width: 100px">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <!-- Sample data for demonstration purposes -->
                                            <tr>
                                                <td>1</td>
                                                <td>7BE23549-EB91-40AA-8B40-02E771367D64 6A987F0E-AA6A-498E-8714-20CE95388B60D-4E63-B2FC-D1DAE75 7BA48A240</td>
                                                <td>2024-12-03</td>
                                                <td>5 star</td>
                                                <td>1 Like</td>
                                                <td>5 Dislike</td>
                                                <td>10 reports</td>
                                                <td>
                                                    <button class="btn btn-primary btn-sm custom-button" onclick="location.href = 'Admin_Customer_Information.jsp'">View Profile</button>
                                                    <button class="btn btn-danger btn-sm custom-button" data-toggle="modal" data-target="#lockModal">Lock</button>
                                                    <button class="btn btn-secondary btn-sm custom-button" data-toggle="modal" data-target="#lockModal">Cancel</button>

                                                </td>
                                            </tr>
                                            <!-- End of sample data -->
                                        </tbody>
                                    </table>
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
        <!-- Lock Confirmation Modal -->
        <div class="modal fade" id="lockModal" tabindex="-1" role="dialog" aria-labelledby="lockModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="lockModalLabel">Lock Customer Account</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label for="lockReason" class="col-form-label">Reason for locking:</label>
                                <textarea class="form-control" id="lockReason"></textarea>
                            </div>
                        </form>
                        Are you sure you want to lock this customer account?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="button" class="btn btn-danger" id="confirmLock">Lock</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="bootstrap_js/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="vendor/js/sb-admin-2.min.js"></script>
        <!-- Page level plugins -->
        <script src="vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="vendor/demo/datatables-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </body>
</html>
