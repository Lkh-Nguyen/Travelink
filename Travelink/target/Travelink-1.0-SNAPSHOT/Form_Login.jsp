<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="img_Home/logo.png">
        <link rel="stylesheet" href="css/Form_Login.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <title>Login Form</title>
    </head>

    <body>
        <!--Sau thay bằng button Login của HomePage-->
        <div class="contain-a-button">
            <a class="a-button" href="Home_Customer.jsp">
                <i class="fa fa-arrow-left"></i> Back
            </a>
        </div>
        <!--        Error Message-->
        <%
            if (request.getAttribute("errorMessage") != null) {
        %>
        <div class="missing-container">
            <p class="missing-msg">
                <%= request.getAttribute("errorMessage") %>
            </p>
        </div>
        <%
            }
        %>
        <!--        Success Message-->

        <div class="total-header">
            <div class="div-title">
                <h1 style="color: white; font-size: 100px;">Fuel Mind Travel</h1>
                <div class="contain-p">
                    <p style="color: white; font-size: 20px;">Enthusiastically extend extensive customer service before best
                        breed convergence completely</p>
                </div>
            </div>
            <div class="contain-row">
                <div class="div-form-button">
                    <button class="ghost" id="showFormButton">Login</button>
                </div>
                <div class="div-form-button">
                    <button class="ghost" id="showFormButton-register">Register</button>
                </div>
            </div>
        </div>

        <div id="overlayBackground"></div>

        <div class="container" id="container">
            <div class="form-container sign-up-container">

                <form action="register" method="post">
                    <h1>Create Account</h1>
                    <div class="form-field">
                        <input type="text" class="form-input" name="name"  required>
                        <label for="name" class="form-label">Name</label>
                    </div>
                    <div class="form-field">
                        <input type="text" class="form-input" name="phone" required>
                        <label for="phone" class="form-label">Phone number</label>
                    </div>
                    <div class="form-field">
                        <input type="email" class="form-input" name="email" required>
                        <label for="email" class="form-label">Email</label>
                    </div>
                    <div class="form-field">
                        <input type="password" class="form-input" name="password" required minlength="8">
                        <label for="password" class="form-label">Password</label>
                    </div>
                    <p>--------- or login/register with ----------</p>
                    <%
                        if (request.getAttribute("errorMessage") != null) {
                    %>
                    <div class="missing-container">
                        <p class="missing-msg">
                            <%= request.getAttribute("errorMessage") %>
                        </p>
                    </div>
                    <%
                        }
                    %>
                    <div class="login-way">
                        <a href="https://www.facebook.com/?stype=lo&deoia=1&jlou=AfdibM459Jj0fHXyRGCbN67BSjzCcRXoOwcdxr2C5Nnq-zgmztRY-JtyHe_JO7uB1rTyY--yUuuaiSm38bnVzOTt0_gOTCNpPVh-dg_auVFy6w&smuh=6096&lh=Ac_9OgUQcQFatzL53wo"
                           class="icon-text-container">
                            <img src="img_Form/logo-fb.jpg" alt="Facebook Logo" class="login-logo">
                            <span class="text-login">Continue with Facebook</span>
                        </a>
                    </div>
                    <div class="login-way">
                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:8080/Travelink/LoginGoogleHandler&response_type=code&client_id=753524792966-f76rldgp0a9n3ui96hg8e5pida66ho94.apps.googleusercontent.com&approval_prompt=force"
                           class="icon-text-container">
                            <!-- <i class="fab fa-google-plus-g"></i> -->
                            <img src="img_Form/logo-gg.jpg" alt="Google Logo" class="login-logo">
                            <span class="text-login">Continue with Google</span>
                        </a>
                    </div>
                    <button class="btn-login" id="register">Sign Up</button>
                </form>
                <!-- Nút đóng form -->
                <button class="close-form-button" id="closeButton">
                    <i class="fas fa-times close-icon" id="closeIcon"></i>
                </button>
            </div>
            <div class="form-container sign-in-container">
                <form action="LoginCustomerServlet" method="post">
                    <h1>Login</h1>
                    <div class="form-field">
                        <input type="email" name="email" class="form-input" autocomplete="off">
                        <label for="email" class="form-label">Email</label>
                    </div>
                    <div class="form-field">
                        <input type="password" name="password" class="form-input" autocomplete="off">
                        <label for="password" class="form-label">Password</label>
                    </div>
                    <a class="forgot-pass" href="Forgot_Password.jsp">Forgot your password?</a>
                    <p>--------- or login/register with ----------</p>
                    <div class="login-way">
                        <a href="https://www.facebook.com/?stype=lo&deoia=1&jlou=AfdibM459Jj0fHXyRGCbN67BSjzCcRXoOwcdxr2C5Nnq-zgmztRY-JtyHe_JO7uB1rTyY--yUuuaiSm38bnVzOTt0_gOTCNpPVh-dg_auVFy6w&smuh=6096&lh=Ac_9OgUQcQFatzL53wo"
                           class="icon-text-container">
                            <img src="img_Form/logo-fb.jpg" alt="Facebook Logo" class="login-logo">
                            <span class="text-login">Continue with Facebook</span>
                        </a>
                    </div>
                    <div class="login-way">
                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:8080/Travelink/LoginGoogleHandler&response_type=code&client_id=753524792966-f76rldgp0a9n3ui96hg8e5pida66ho94.apps.googleusercontent.com&approval_prompt=force"
                           class="icon-text-container">
                            <!-- <i class="fab fa-google-plus-g"></i> -->
                            <img src="img_Form/logo-gg.jpg" alt="Google Logo" class="login-logo">
                            <span class="text-login">Continue with Google</span>
                        </a>
                    </div>
                    <button class="btn-login" id="login">Sign In</button>
                    <div class="missing-container">
                        <p class="missing-msg">
                            ${requestScope.status}
                        </p>
                    </div>
                </form>
            </div>
            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-left">
                        <h1>Login</h1>
                        <p>By registering, you agree to our <a href="#">Terms & Conditions</a> and
                            that you have read our <a href="#"> Privacy
                                Notice.</a></p>
                        <button class="ghost" id="signIn">Sign In</button>
                    </div>
                    <div class="overlay-panel overlay-right">
                        <h1>Sign Up</h1>
                        <p>By registering, you agree to our <a href="#">Terms & Conditions</a> and
                            that you have read our <a href="#"> Privacy
                                Notice.</a></p>
                        <button class="ghost" id="signUp">Sign Up</button>
                    </div>
                </div>
            </div>

        </div>

        <script>
            container.classList.add("left-panel-active");

//Khi nhấn vào button login => hiện container và hiện lớp overlay làm mờ
            document.getElementById('showFormButton').onclick = function () {
                container.classList.add("left-panel-active");
                container.classList.remove("right-panel-active");
                container.style.display = 'block';
                overlayBackground.style.display = 'block';
                // Thêm lớp 'show' để kích hoạt hiệu ứng trượt
                setTimeout(() => {
                    container.classList.add('show');
                }, 150);
            }

            document.getElementById('overlayBackground').onclick = function () {
                // Ẩn form và overlay
                container.classList.remove('show');
                setTimeout(() => {
                    container.style.display = 'none';
                    overlayBackground.style.display = 'none';
                }, 500); // Thời gian chờ cho animation hoàn thành
            }

// Để cho overlay trượt qua phải và trái
            document.getElementById('signUp').onclick = function () {
                container.classList.add("right-panel-active");
            }
            document.getElementById('signIn').onclick = function () {
                container.classList.remove("right-panel-active");
            }

            document.getElementById('closeButton').onclick = function () {
                // Ẩn form và overlay
                container.classList.remove('show');
                setTimeout(() => {
                    container.style.display = 'none';
                    overlayBackground.style.display = 'none';
                }, 500); // Thời gian chờ cho animation hoàn thành
            }


            document.getElementById('showFormButton-register').onclick = function () {
                // Kiểm tra nếu container đã có lớp 'right-panel-active'
                container.classList.add("right-panel-active");
                container.classList.remove("left-panel-active");
                container.style.display = 'block';
                overlayBackground.style.display = 'block';
                // Thêm lớp 'show' để kích hoạt hiệu ứng trượt
                setTimeout(() => {
                    container.classList.add('show');
                }, 150);
            }

//Phần login_fix input
            document.addEventListener('DOMContentLoaded', function () {
                const inputs = document.querySelectorAll('.form-input');

                inputs.forEach(input => {
                    const label = input.nextElementSibling;

                    // Không nhập gì thì label về top = 50% là về giữa input nếu không thì lên trên
                    if (input.value.trim() === '') {
                        label.style.top = '50%';
                        label.style.color = '#999';
                    } else {
                        label.style.top = '5px';
                        label.style.color = '#999';
                    }


                    input.addEventListener('input', function () {
                        if (this.value.trim() !== '') {
                            label.style.top = '5px';
                            label.style.color = '#999';
                        } else {
                            label.style.top = '50%';
                            label.style.color = '#999';
                        }
                    });


                    input.addEventListener('focus', function () {
                        label.style.top = '5px';
                        label.style.color = '#999';
                    });

                    //blur là khi không còn focus
                    input.addEventListener('blur', function () {
                        if (this.value.trim() === '') {
                            label.style.top = '50%';
                            label.style.color = '#999';
                        }
                    });
                });
            });

            //Test Bấm login không nhập 5 lần 
//            let count = 0;
//            document.getElementById('login').onclick = function () {
//                count++;
//                if (count > 5) {
//                    window.alert("Lỗi rồi");
//                }
//
//            }
            document.addEventListener('DOMContentLoaded', function () {
                const errorMessage = document.querySelector('.missing-container');

                if (errorMessage) {
                    setTimeout(() => {
                        errorMessage.style.display = 'none';
                    }, 5000); // 2 giây
                }
            });

        </script>
    </body>

</html>