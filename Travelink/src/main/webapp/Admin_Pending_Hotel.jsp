<%-- 
    Document   : Admin_Pending_Hotel
    Created on : Jun 30, 2024, 10:25:16 AM
    Author     : DUYAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Travelink - Hotel Management</title>

        <!-- Custom fonts for this template-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="vendor/css/sb-admin-2.min.css" rel="stylesheet">
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
                        <h1 class="h3 mb-4 text-gray-800">Pending Hotel Accounts</h1>

                        <!-- Pending Hotel Accounts Table -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Pending Hotel Accounts</h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Hotel Host Name</th>
                                                <th>Email</th>
                                                <th>Phone</th>
                                                <th>Submission Date</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>AnNVD</td>
                                                <td>duyan9646@gmail.com</td>
                                                <td>+1 123 456 7890</td>
                                                <td>2023-06-13</td>
                                                <td class="text-warning fw-bold">Pending</td>
                                                <td>
                                                    <button class="btn btn-outline-primary btn-sm"><a href="Admin_Hotel_Information.jsp">View hotel</a></button>
                                                    <button class="btn btn-success btn-sm" onclick="approveAction()">Approve</button>
                                                    <button class="btn btn-danger btn-sm">Reject</button>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>HungPT</td>
                                                <td>hungpt@gmail.com</td>
                                                <td>+1 123 456 7890</td>
                                                <td>2023-06-13</td>
                                                <td class="text-warning fw-bold">Pending</td>
                                                <td>
                                                    <button class="btn btn-outline-primary btn-sm"><a href="Admin_Hotel_Information.jsp">View hotel</a></button>
                                                    <button class="btn btn-success btn-sm" onclick="approveAction()">Approve</button>
                                                    <button class="btn btn-danger btn-sm">Reject</button>
                                                </td>
                                            </tr>

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
        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="bootstrap_js/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="vendor/js/sb-admin-2.min.js"></script>
        <!-- Page level custom scripts -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <script>
                                                        function approveAction() {
                                                            Swal.fire({
                                                                title: "Approve hotel successfully!",
                                                                text: "Please check list hotel",
                                                                icon: "success"
                                                            });
                                                        }
        </script>
        <!-- Page level plugins -->
        <script src="vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="vendor/demo/datatables-demo.js"></script>
    </body>
</html>
