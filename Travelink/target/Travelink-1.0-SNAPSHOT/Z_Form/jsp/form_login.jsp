<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/form_login.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <title>Login Form</title>
</head>

<body>
    <!--Sau thay bằng button Login của HomePage-->
    
    <h1 style="color: white;">Travelink is the best choice</h1>
    <div class="div-form-button">
        <button class="ghost" id="showFormButton">Login</button>
    </div>
    <div class="div-form-button">
        <button class="ghost" id="showFormButton-register">Register</button>
    </div>


    <div id="overlayBackground"></div>

    <div class="container" id="container">
        <div class="form-container sign-up-container">
            <form action="#">
                <h1>Create Account</h1>
                <div class="form-field">
                    <input type="text" class="form-input">
                    <label for="name" class="form-label">Name</label>
                </div>
                <div class="form-field">
                    <input type="phonenumber" class="form-input">
                    <label for="name" class="form-label">Phone number</label>
                </div>
                <div class="form-field">
                    <input type="email" class="form-input">
                    <label for="email" class="form-label">Email</label>
                </div>
                <div class="form-field">
                    <input type="password" class="form-input">
                    <label for="password" class="form-label">Password</label>
                </div>
                <p>--------- or login/register with ----------</p>
                <div class="login-way">
                    <a href="https://www.facebook.com/?stype=lo&deoia=1&jlou=AfdibM459Jj0fHXyRGCbN67BSjzCcRXoOwcdxr2C5Nnq-zgmztRY-JtyHe_JO7uB1rTyY--yUuuaiSm38bnVzOTt0_gOTCNpPVh-dg_auVFy6w&smuh=6096&lh=Ac_9OgUQcQFatzL53wo"
                        class="icon-text-container">
                        <img src="../img/logo-fb.jpg" alt="Facebook Logo" class="login-logo">
                        <span class="text-login">Continue with Facebook</span>
                    </a>
                </div>
                <div class="login-way">
                    <a href="https://accounts.google.com/v3/signin/identifier?authuser=0&continue=https%3A%2F%2Fmail.google.com%2Fmail&ec=GAlAFw&hl=vi&service=mail&flowName=GlifWebSignIn&flowEntry=AddSession&dsh=S-469252538%3A1715791335646693&ddm=0"
                        class="icon-text-container">
                        <!-- <i class="fab fa-google-plus-g"></i> -->
                        <img src="../img/logo-gg.jpg" alt="Google Logo" class="login-logo">
                        <span class="text-login">Continue with Google</span>
                    </a>
                </div>
                <button class="btn-login">Sign Up</button>
            </form>
            <!-- Nút đóng form -->
            <button class="close-form-button" id="closeButton">
                <i class="fas fa-times close-icon" id="closeIcon"></i>
            </button>
        </div>
        <div class="form-container sign-in-container">
            <form action="#">
                <h1>Login</h1>
                <div class="form-field">
                    <input type="email" class="form-input">
                    <label for="email" class="form-label">Email</label>
                </div>
                <div class="form-field">
                    <input type="password" class="form-input">
                    <label for="password" class="form-label">Password</label>
                </div>
                <a class="forgot-pass" href="#">Forgot your password?</a>
                <p>--------- or login/register with ----------</p>
                <div class="login-way">
                    <a href="https://www.facebook.com/?stype=lo&deoia=1&jlou=AfdibM459Jj0fHXyRGCbN67BSjzCcRXoOwcdxr2C5Nnq-zgmztRY-JtyHe_JO7uB1rTyY--yUuuaiSm38bnVzOTt0_gOTCNpPVh-dg_auVFy6w&smuh=6096&lh=Ac_9OgUQcQFatzL53wo"
                        class="icon-text-container">
                        <img src="../img/logo-fb.jpg" alt="Facebook Logo" class="login-logo">
                        <span class="text-login">Continue with Facebook</span>
                    </a>
                </div>
                <div class="login-way">
                    <a href="https://accounts.google.com/v3/signin/identifier?authuser=0&continue=https%3A%2F%2Fmail.google.com%2Fmail&ec=GAlAFw&hl=vi&service=mail&flowName=GlifWebSignIn&flowEntry=AddSession&dsh=S-469252538%3A1715791335646693&ddm=0"
                        class="icon-text-container">
                        <!-- <i class="fab fa-google-plus-g"></i> -->
                        <img src="../img/logo-gg.jpg" alt="Google Logo" class="login-logo">
                        <span class="text-login">Continue with Google</span>
                    </a>
                </div>
                <button class="btn-login">Sign In</button>
            </form>
        </div>
        <div class="overlay-container">
            <div class="overlay">
                <div class="overlay-panel overlay-left">
                    <h1>Login</h1>
                    <p>By registering, you agree to our <a href="./rule1.html">Terms & Conditions</a> and
                        that you have read our <a href="./rule2.html"> Privacy
                            Notice.</a></p>
                    <button class="ghost" id="signIn">Sign In</button>
                </div>
                <div class="overlay-panel overlay-right">
                    <h1>Sign Up</h1>
                    <p>By registering, you agree to our <a href="./rule1.html">Terms & Conditions</a> and
                        that you have read our <a href="./rule2.html"> Privacy
                            Notice.</a></p>
                    <button class="ghost" id="signUp">Sign Up</button>
                </div>
            </div>
        </div>
        
    </div>


    <script src="../js/form_login.js"></script>
</body>

</html>