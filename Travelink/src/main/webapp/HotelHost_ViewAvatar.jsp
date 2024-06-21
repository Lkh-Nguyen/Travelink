<%-- 
    Document   : HotelHost_Profile
    Created on : Jun 16, 2024, 12:35:22 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Avatar Management</title>
        <link rel="stylesheet" href="bootstrap_css/bootstrap.min.css">
    </head>
    <body>
        <%@include file="Header_HotelHost.jsp" %>
        <div class="container">
            <div class="card bg-secondary-subtle h-100 shadow p-lg-4 mb-5 bg-body-tertiary border-0 justify-content-center align-items-center" style="border-radius: 30px;">
                <ul class="nav nav-underline mb-4">
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="HotelHost_Profile.jsp">Information</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="#">View Avatar</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="HotelHost_ChangePassword.jsp">Change Password</a>
                    </li>
                </ul>
                <!-- Avatar Upload Section -->
                <div class="card w-75 h-100 shadow p-lg-5 mb-5 mt-3 bg-body-tertiary border-0" style="border-radius: 30px;">
                    <div class="row">
                        <div class="col-md-6 offset-md-3">
                            <div class="avatar-upload text-center">
                                <div class="avatar-container">
                                    <div class="avatar-preview">
                                        <img src="${account.avatarURL}" alt="Avatar" style="width: 15rem; height: 15rem;" class="img-fluid rounded-circle">
                                    </div>
                                </div>
                                <div class="mb-3 mt-3">
                                    <button class="btn btn-outline-primary view-avatar">View Avatar</button>
                                </div>
                                <div class="mb-3 mt-3">
                                    <input type="file" class="form-control" id="avatarInput" accept="image/*">
                                </div>
                                <button type="button" class="btn btn-outline-primary btn-block">Upload Avatar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="Footer.jsp" %>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var avatarPreview = document.querySelector('.avatar-preview');
                var avatarImage = avatarPreview.querySelector('img');
                var viewAvatarButton = document.querySelector('.view-avatar');
                var avatarExpanded = document.createElement('div');
                avatarExpanded.classList.add('modal', 'fade');
                avatarExpanded.id = 'avatarModal';
                avatarExpanded.setAttribute('tabindex', '-1');
                avatarExpanded.setAttribute('aria-labelledby', 'avatarModalLabel');
                avatarExpanded.setAttribute('aria-hidden', 'true');
                avatarExpanded.innerHTML = `
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-body text-center">
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                <img src="${account.avatarURL}" style="height: 20rem; width: 20rem" alt="Avatar" class="img-fluid rounded-circle ">
                            </div>
                        </div>
                    </div>
                `;
                document.body.appendChild(avatarExpanded);

                var modal = new bootstrap.Modal(document.getElementById('avatarModal'));

                // Handle View Avatar button click
                viewAvatarButton.addEventListener('click', function () {
                    modal.show();
                });

                // Handle file input change for avatar preview
                var avatarInput = document.getElementById('avatarInput');
                avatarInput.addEventListener('change', function () {
                    var file = this.files[0];
                    if (file) {
                        var reader = new FileReader();
                        reader.onload = function (event) {
                            avatarImage.src = event.target.result;
                        };
                        reader.readAsDataURL(file);
                    }
                });

                // Example of handling upload button click
                document.querySelector('.btn-outline-primary.btn-block').addEventListener('click', function () {
                    // Logic to upload avatar (AJAX request or form submission)
                    alert('Avatar upload functionality goes here.');
                });
            });
        </script>
    </body>
</html>
