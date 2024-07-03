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
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="vendor/css/sb-admin-2.min.css" rel="stylesheet">

        <!-- Custom styles for lock/unlock functionality -->
        <style>
            .blurred {
/*                filter: blur(5px);*/
                opacity: 0.5;
            }
            .locked {
                color: red;
                font-weight: bold;
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
                        <h1 class="h3 mb-4 text-gray-800">Customer Account List</h1>

                        <!-- Customer Account List Table -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Customer Account List</h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Customer Name</th>
                                                <th>Email</th>
                                                <th>Phone Number</th>
                                                <th>Address</th>
                                                <th>Register Date</th>
                                                <th>Status</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <!-- Sample data for demonstration purposes -->
                                            <tr id="customer1">
                                                <td class="customer-info"><span><img src="assets/logo.png" width="40"></span> John Doe</td>
                                                <td class="customer-info">john.doe@example.com</td>
                                                <td class="customer-info">(123) 456-7890</td>
                                                <td class="customer-info">1234 Elm St, Springfield, IL</td>
                                                <td class="customer-info">2024-06-13</td>
                                                <td class="status text-primary">Active</td>
                                                <td>
                                                    <button class="btn btn-primary btn-sm" onclick="location.href='Admin_Customer_Information.jsp'">View Profile</button>
                                                    <button class="btn btn-danger btn-sm lock-btn" onclick="lockCustomer(this)">Lock</button>
                                                </td>
                                            </tr>
                                            <tr id="customer2">
                                                <td class="customer-info"><img src="assets/logo.png" width="40"></span> Jane Smith</td>
                                                <td class="customer-info">jane.smith@example.com</td>
                                                <td class="customer-info">(987) 654-3210</td>
                                                <td class="customer-info">5678 Oak St, Metropolis, NY</td>
                                                <td class="customer-info">2024-06-13</td>
                                                <td class="status text-primary">Active</td>
                                                <td>
                                                    <button class="btn btn-primary btn-sm" onclick="location.href='Admin_Customer_Information.jsp'">View Profile</button>
                                                    <button class="btn btn-danger btn-sm lock-btn" onclick="lockCustomer(this)">Lock</button>
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

        <!-- Custom script to handle lock/unlock functionality -->
        <script>
            function lockCustomer(button) {
                const row = button.closest('tr');
                const statusCell = row.querySelector('.status');
                const lockButton = row.querySelector('.lock-btn');
                const customerInfoCells = row.querySelectorAll('.customer-info');

                if (lockButton.textContent.trim() === 'Lock') {
                    // Change status to Locked
                    statusCell.textContent = 'Locked';
                    statusCell.classList.remove('text-primary');
                    statusCell.classList.add('text-danger');

                    // Change button text to Unlock
                    lockButton.textContent = 'Unlock';
                    lockButton.classList.remove('btn-danger');
                    lockButton.classList.add('btn-success');

                    // Blur the customer info cells
                    customerInfoCells.forEach(cell => {
                        cell.classList.add('blurred');
                    });
                } else {
                    // Change status to Active
                    statusCell.textContent = 'Active';
                    statusCell.classList.remove('text-danger');
                    statusCell.classList.add('text-primary');

                    // Change button text to Lock
                    lockButton.textContent = 'Lock';
                    lockButton.classList.remove('btn-success');
                    lockButton.classList.add('btn-danger');

                    // Remove blur from the customer info cells
                    customerInfoCells.forEach(cell => {
                        cell.classList.remove('blurred');
                    });
                }
            }
        </script>
    </body>
</html>


<!-- Lock Confirmation Modal -->
<!--        <div class="modal fade" id="lockModal" tabindex="-1" role="dialog" aria-labelledby="lockModalLabel" aria-hidden="true">
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
        </div>-->