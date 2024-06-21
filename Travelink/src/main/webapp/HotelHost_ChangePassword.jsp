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
        </style>
    </head>
    <body>
        <%@include file="Header_HotelHost.jsp" %>
        <div class="container">
            <div class="card bg-secondary-subtle h-100 shadow p-lg-4 mb-5 bg-body-tertiary border-0 equal-height justify-content-center align-items-center" style="border-radius: 30px;">
                <ul class="nav nav-underline">
                    <li class="nav-item">
                        <a class="nav-link" href="HotelHost_Profile.jsp">Information</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="HotelHost_ViewAvatar.jsp">View Avatar</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="#">Change Password</a>
                    </li>
                </ul>
                <div class="card w-75 h-100 shadow p-lg-5 mb-5 mt-3 bg-body-tertiary border-0 equal-height" style="border-radius: 30px;">
                    <div class="row">
                        <div class="col-md-1">
                        </div>
                        <div class="col-md-4">
                            <div class="card shadow p-lg-1 mb-5 bg-body-tertiary">
                                <div class="card-header">
                                    Hotel Host Information
                                </div>
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <img src="${account.avatarURL}" alt="Special Icon" style="width: 2rem; height: 2rem; border-radius: 50%;" class="me-2">
                                        <p class="card-title mb-0">${account.name}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-default">Old Password</span>
                                        <input type="password" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text" id="inputGroup-sizing-default">New Password</span>
                                        <input type="password" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">

                                </div>
                            </div>


                            <div class="row">
                                <div class="col-md-12">
                                    <p class="d-inline-flex gap-1">
                                        <a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                                            Hint
                                        </a>
                                        <a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample2" role="button" aria-expanded="false" aria-controls="collapseExample2">
                                            Form PIN
                                        </a>
                                    </p>
                                    <div class="row">
                                        <div class="col">
                                            <div class="collapse" id="collapseExample">
                                                <div class="alert alert-success " role="alert">
                                                    <p>PIN will send to your email !</p>
                                                    <p>Please Click "Next"</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="collapse" id="collapseExample2">
                                                <div class="card " role="alert">
                                                    <div class="card-body">
                                                        <div class="card-header">
                                                            Your PIN
                                                        </div>
                                                        <div class="card-text mt-2">
                                                            <div class="row px-0">
                                                                <div class="col-md-12">
                                                                    <div class="input-group mb-3">
                                                                        <input type="text" class="form-control" placeholder="Enter PIN Code" aria-label="Enter PIN Code" aria-describedby="button-addon2">
                                                                        <button class="btn btn-outline-secondary btn-sm" type="button" id="button-addon2">Submit</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <div class="row mt-4 d-flex justify-content-center align-items-center">
                            <div class="col-md-6 justify-content-center align-items-center">
                            </div>
                            <div class="col-md-6 justify-content-center align-items-center">
                                <button type="button" class="btn btn-outline-primary btn-block" id="btn-cancel">Cancel</button>
                                <button type="button" class="btn btn-primary btn-block" id="btn-next">Next</button>
                            </div>
                        </div>


                    </div>
                    <div class="col-md-1">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="Footer.jsp" %>

    <!-- Modal Structure -->
    <div class="modal fade" id="emailModal" tabindex="-1" aria-labelledby="emailModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="emailModalLabel">Enter Your Email</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" id="btn-close" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="emailInput" class="form-label">Email address</label>
                        <input type="email" class="form-control" id="emailInput" placeholder="Enter your email">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="btn-send">Send</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.5.2/umd/popper.min.js"></script>
    <!-- Sử dụng Bootstrap 5 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>



    <script>
        //SỬ DỤNG CÁC BUTTON ĐỂ THOÁT MODAL
        document.getElementById('btn-next').addEventListener('click', function () {
            var emailModal = new bootstrap.Modal(document.getElementById('emailModal'));
            emailModal.show();
        });
        document.getElementById('btn-send').addEventListener('click', function () {
            var emailModal = bootstrap.Modal.getInstance(document.getElementById('emailModal'));
            emailModal.hide();
        });
        document.getElementById('btn-close').addEventListener('click', function () {
            var emailModal = bootstrap.Modal.getInstance(document.getElementById('emailModal'));
            emailModal.hide();
        });

        //Hiện MODAL PIN VÀ HINT
        var collapseList = [].slice.call(document.querySelectorAll('.collapse'));
        var collapseList2 = [].slice.call(document.querySelectorAll('.collapse2'));

        var collapseElementList = collapseList.map(function (collapseEl) {
            return new bootstrap.Collapse(collapseEl);
        });

        var collapseElementList2 = collapseList2.map(function (collapseEl2) {
            return new bootstrap.Collapse(collapseEl2);
        });

    </script>
</body>
</html>
