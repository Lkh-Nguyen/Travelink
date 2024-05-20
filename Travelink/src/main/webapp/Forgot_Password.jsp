
<%-- 
    Document   : Forgot_Password
    Created on : May 18, 2024, 9:19:11 AM
    Author     : DUYAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot Password</title>
        <link rel="icon" href="img_Home/logo.png">
    </head>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        #content {
            max-width: 30rem;
            margin: 0 auto;
            padding: 2rem;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .form-container {
            background-color: #fff;
            padding: 2rem;
            border-radius: 0.5rem;
            box-shadow: 0 0.5rem 1rem rgba(0,0,0,0.1);
            width: 80%;
            border: 1px solid #007bff;
        }

        h1 {
            color: #333;
            font-size: 1.25rem;
            margin-bottom: 1.5rem;
        }

        p {
            color: #666;
            font-size: 1rem;
            margin-bottom: 1.5rem;
        }

        p a{
            color: #0056b3;
        }

        label {
            font-size: 1rem;
            color: #333;
            margin-bottom: 1rem;
            display: block;
            text-align: left;
            margin-left: 2rem;
            font-weight: bold;
        }

        input[type="email"] {
            width: 75%;
            margin: 0 auto;
            padding: 1rem;
            border: 1px solid #ccc;
            border-radius: 0.5rem;
            font-size: 1rem;
            display: block;
            margin-bottom: 1rem;
        }

        .hidden {
            display: none;
            color: red;
        }

        button[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 1rem 2rem;
            border-radius: 0.5rem;
            font-size: 1rem;
            cursor: pointer;
            width: 85%;
        }

        button[type="submit"]:hover {
            background-color: #0056b3;
        }

        a {
            color: #333;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        .footer {
            margin-top: 2rem;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .footer a {
            margin: 0 1rem;
        }
    </style>
    <body>
        <main id="content" role="main">
            <div class="form-container">
                <h1>Forgot password?</h1>
                <p>
                    Remember your password?
                    <a href="Form_Login.jsp">Login here</a>
                </p>
                <form method="post" action="forgot">
                    <div>
                        <label for="email">Email address</label>
                        <input type="email" id="email" name="email" required aria-describedby="email-error">
                        <p class="hidden" id="email-error">Please include a valid email address so we can get back to you</p>
                    </div>
                    <button type="submit">Reset password</button>
                </form>
            </div>
            <div class="footer">
                <a href="#" target="_blank">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                    <path d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.012 8.012 0 0 0 16 8c0-4.42-3.58-8-8-8z"/>
                    </svg>
                    View Github
                </a>
                <span>|</span>
                <a href="#">Contact us!</a>
            </div>
        </main>     
    </body>
</html>