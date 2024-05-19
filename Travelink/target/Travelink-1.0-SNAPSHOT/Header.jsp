<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP 1</title>
        <style>
            @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap");

            :root {
                --primary-color: #3d5cb8;
                --primary-color-dark: #334c99;
                --text-dark: #0f172a;
                --text-light: #64748b;
                --extra-light: #f1f5f9;
                --white: #ffffff;
                --max-width: 1200px;
            }


            .btn {
                padding: 0.75rem 2rem;
                outline: none;
                border: none;
                font-size: 1rem;
                font-weight: 600;
                color: var(--white);
                background-color: var(--primary-color);
                border-radius: 2rem;
                cursor: pointer;
                transition: 0.3s;
            }

            .btn:hover {
                background-color: var(--primary-color-dark);
            }

            a {
                text-decoration: none;
            }
            .loginBtn a{
                color: white;
            }


            nav {
                max-width: 100%;
                margin: auto;
                padding: 1rem;
                display: flex;
                align-items: center;
                justify-content: space-between;
                gap: 1rem;
                background-color: rgba(0, 0, 0, 0.05);
            }

            .nav__logo {
                font-size: 1.8rem;
                font-weight: 600;
                color: var(--text-dark);
            }
            .nav__logo a:active{

                color:blue;
            }
            span{
                color:var(--primary-color-dark)
            }

            .nav__links {
                list-style: none;
                display: flex;
                align-items: center;
                gap: 4rem;
                margin: 0 2rem 0 12rem;
            }

            .link a {
                font-size: 1.2rem;
                font-weight: 550;
                color: var(--text-light);
                transition: 0.3s;
            }

            .link a:hover {
                color: var(--text-dark);
            }

        </style>
    </head>
    <body>
        <header>
            <nav>
                <div class="nav__logo"><a href="Home_Customer.jsp">Trave<span>link</span></a></div>
                <ul class="nav__links">
                    <li class="link"><a href="#">Home</a></li>
                    <li class="link"><a href="#">About</a></li>
                    <li class="link"><a href="#">My booking</a></li>
                    <li class="link"><a href="#">Transaction History</a></li>
                    <li class="link"><a href="#">Favorite Hotels</a></li>
                </ul>
                <c:set var="customer" value="${sessionScope.customer}"></c:set>
                <c:if test="${not empty customer}">
                    <div class="btns">
                        <button class="btn loginBtn"><a href="My_Account_Update.jsp">${customer.name}</a></button>
                    </div>
                </c:if>
                <c:if test="${empty customer}">
                    <div class="btns">
                        <button class="btn loginBtn"><a href="Form_Login.jsp">GET STARTED</a></button>
                    </div>
                </c:if>

            </nav>
        </header>
    </body>
</html>