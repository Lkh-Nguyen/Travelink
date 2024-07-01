<%-- 
    Document   : ViewFeedbackReservationID
    Created on : Jun 28, 2024, 3:14:16 PM
    Author     : HELLO
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/Right_My_Account.css">
        <link rel="stylesheet" href="css/HotelHost_Feedback.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="css/Alter.css"/>

        <style>
            .hotel-card {
                transition: transform 0.3s ease-in-out;
            }

            .hotel-card:hover {
                transform: scale(1.05);
            }

            .modal-content {
                border-radius: 15px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .modal-header {
                background-color: #f8f9fa;
                border-bottom: 1px solid #dee2e6;
                border-radius: 15px 15px 0 0;
            }

            .modal-title {
                color: #495057;
                font-weight: bold;
            }

            .modal-body {
                padding: 20px;
                background-color: #fff;
            }

            .review {
                border: 1px solid #e3e3e3;
                border-radius: 10px;
                padding: 15px;
                background-color: #f9f9f9;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
            }

            .review:hover {
                transform: scale(1.02);
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .avatar img {
                border-radius: 50%;
                width: 60px;
                height: 60px;
                object-fit: cover;
            }

            .avatar {
                margin-right: 15px;
            }

            .review .row {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 10px;
            }

            .review h6 {
                margin: 0;
                color: #333;
                font-weight: bold;
            }

            .review .text-muted {
                font-size: 0.85rem;
            }

            .rating i {
                color: #ffc107;
                font-size: 1.2rem;
                margin-right: 2px;
            }

            .rating i.bx-star {
                color: #e0e0e0;
            }

            .review p {
                margin: 10px 0;
                font-size: 1rem;
                color: #555;
            }

            .badge {
                font-size: 0.85rem;
                margin-right: 5px;
            }

            .bg-light {
                background-color: #f8f9fa !important;
            }

            .text-dark {
                color: #343a40 !important;
            }
            #comeback{
                margin-left: 50px;
                margin-bottom: 20px;
                margin-top: 20px;
            }
            #comeback button{
                width: 70px;
                height: 30px;
            }
            #comeback button:hover{
                background-color: white;
            }
            .report-form {
                background-color: #fefefe;
                margin: 20px auto;
                padding: 20px;
                border: 1px solid #888;
                width: 80%;
                max-width: 100%;
                box-shadow: 0 5px 15px rgba(0,0,0,0.3);
                border-radius: 5px;
            }

            h2 {
                margin-top: 0;
            }

            form label {
                display: block;
                margin: 5px 0;
            }

            .buttons {
                text-align: right;
            }

            .submit-btn {
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 14px;
            }


            .submit-btn {
                background-color: red;
                color: white;
            }

            .submit-btn:hover {
                background-color: #ff9999;
            }
            .btn-secondary {
                display: inline-block;
                font-weight: 400;
                color: #fff;
                text-align: center;
                vertical-align: middle;
                user-select: none;
                background-color: #6c757d;
                border: 1px solid #6c757d;
                padding: 0.375rem 0.75rem;
                font-size: 1rem;
                line-height: 1.5;
                border-radius: 0.25rem;
                transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
                text-decoration: none;
            }

            .btn-secondary:hover {
                color: #fff;
                background-color: #5a6268;
                border-color: #545b62;
                text-decoration: none;
            }

            .btn-secondary:focus, .btn-secondary.focus {
                outline: 0;
                box-shadow: 0 0 0 0.2rem rgba(130, 138, 145, 0.5);
            }

            .btn-secondary.disabled, .btn-secondary:disabled {
                opacity: 0.65;
            }

            .btn-secondary:not(:disabled):not(.disabled):active, .btn-secondary:not(:disabled):not(.disabled).active,
            .show > .btn-secondary.dropdown-toggle {
                color: #fff;
                background-color: #545b62;
                border-color: #4e555b;
            }

            .btn-secondary:not(:disabled):not(.disabled):active:focus, .btn-secondary:not(:disabled):not(.disabled).active:focus,
            .show > .btn-secondary.dropdown-toggle:focus {
                box-shadow: 0 0 0 0.2rem rgba(130, 138, 145, 0.5);
            }
        </style>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <c:if test="${requestScope.alterDeleteSuccess != null}">
            <div id="status-message" style="background-color: rgb(233,251,233);height: 70px;margin-top: 10px" class="hidden">
                <div style="display: flex">
                    <div style="width: 20%">
                        <i class='bx bxs-check-circle' style="font-size: 50px;color:green;margin-top: 0px"></i>
                    </div>
                    <div style="width: 80%; text-align: start">
                        <h3 style="color:green;margin-top: 5px; margin-bottom: -2px;font-weight:550">Success</h3>
                        <p style="color: black;font-size: 14px">${alterDeleteSuccess}</p>
                    </div>
                </div>           
            </div>
        </c:if>
        <c:if test="${requestScope.alterDeleteUnSuccess != null}">
            <div id="status-message" style="background-color: rgb(59,31,1);height: 70px ;margin-top: 10px" class="hidden">
                <div style="display: flex">
                    <div style="width: 20%">
                        <i class='bx bxs-error-circle' style="font-size: 50px;color: rgb(255,218,106);margin-top: 0px"></i>
                    </div>
                    <div style="width: 80%;text-align: start">
                        <h3 style="color: rgb(255,218,106);margin-top: 5px;font-weight: 550 ">Waring</h3>
                        <p style="color: rgb(255,218,106);margin-top: -10px;font-size: 14px">${alterDeleteUnSuccess}</p>
                    </div>
                </div>           
            </div>
        </c:if>
        <div id="comeback">
            <a class="btn-secondary" href="viewHotelDetailServlet?hotel_ID=${requestScope.hotel_ID}">Back</a>   
        </div>
        <div class="report-form" style="clear: both">
            <h2>Report This Assessment</h2>
            <p>Please select a reason for reporting</p>
            <form action="ReportFeedbackServlet" method="post">
                <label><input type="radio" name="reason" value="Vulgar and offensive review"> Vulgar and offensive review</label><br>
                <label><input type="radio" name="reason" value="Duplicate reviews (junk information)"> Duplicate reviews (junk information)</label><br>
                <label><input type="radio" name="reason" value="Contains personal information"> Contains personal information</label><br>
                <label><input type="radio" name="reason" value="Unauthorized advertising"> Unauthorized advertising</label><br>
                <label><input type="radio" name="reason" value="Inaccurate/misleading reviews (e.g. reviews and products do not match,...)"> Inaccurate/misleading reviews (e.g. reviews and products do not match,...)</label><br>
                <div class="buttons">
                    <button type="submit" class="submit-btn">Send</button>
                </div>
                <input type="hidden" name="feedbackID" value="${requestScope.feedback.feedbackID}"/>
                <input type="hidden" name="hotel_ID" value="${requestScope.hotel_ID}"/>
            </form>
        </div>
        <div class="modal fade " id="confirmCancelModal" style="margin-bottom: 200px;">
            <div class="modal-dialog d-flex justify-content-center align-items-center" role="document" style="height: 33vh">
                <div class="modal-content" >
                    <div class="modal-header">       
                    </div>
                    <div class="modal-body justify-content-center">
                        <div class="modal-body">
                            <div class="review mb-3" id="fb" style="border: 1px solid rgb(227,227,227);border-radius: 5px">
                                <div class="d-flex">

                                    <div class="avatar" ><img src="${requestScope.feedback.getAccount(requestScope.feedback.feedbackID).avatarURL}" style="width: 100px;height: 100%"></div>
                                    <div class="ms-3">
                                        <div class="row" style="margin-bottom: -10px;">
                                            <h3 class="mb-0">${requestScope.feedback.getAccount(requestScope.feedback.feedbackID).name}</h3>
                                        </div>
                                        <div class="row">
                                            <h4 class="text-muted" style="font-weight: 500"><span style="font-weight: bold">Date Feedback:</span> ${requestScope.feedback.date}</h4>
                                        </div>
                                        <div class="row" style="margin-top: -10px;">
                                            <c:if test="${requestScope.feedback.rating == 1}">
                                                <div class="rating mt-1">                                            
                                                    <i class='bx bxs-star'></i>
                                                    <i class='bx bx-star'></i>
                                                    <i class='bx bx-star'></i>
                                                    <i class='bx bx-star'></i>
                                                    <i class='bx bx-star'></i>
                                                </div>
                                            </c:if>
                                            <c:if test="${requestScope.feedback.rating == 2}">
                                                <div class="rating mt-1">                                            
                                                    <i class='bx bxs-star'></i>
                                                    <i class='bx bxs-star'></i>
                                                    <i class='bx bx-star'></i>
                                                    <i class='bx bx-star'></i>
                                                    <i class='bx bx-star'></i>
                                                </div>
                                            </c:if>

                                            <c:if test="${requestScope.feedback.rating == 3}">
                                                <div class="rating mt-1">                                            
                                                    <i class='bx bxs-star'></i>
                                                    <i class='bx bxs-star'></i>
                                                    <i class='bx bxs-star'></i>
                                                    <i class='bx bx-star'></i>
                                                    <i class='bx bx-star'></i>
                                                </div>
                                            </c:if>
                                            <c:if test="${requestScope.feedback.rating == 4}">
                                                <div class="rating mt-1">                                            
                                                    <i class='bx bxs-star'></i>
                                                    <i class='bx bxs-star'></i>
                                                    <i class='bx bxs-star'></i>
                                                    <i class='bx bxs-star'></i>
                                                    <i class='bx bx-star'></i>
                                                </div>
                                            </c:if>
                                            <c:if test="${requestScope.feedback.rating == 5}">
                                                <div class="rating mt-1">                                            
                                                    <i class='bx bxs-star'></i>
                                                    <i class='bx bxs-star'></i>
                                                    <i class='bx bxs-star'></i>
                                                    <i class='bx bxs-star'></i>
                                                    <i class='bx bxs-star'></i>
                                                </div>
                                            </c:if>
                                        </div>
                                        <p>${requestScope.feedback.description}</p>
                                        <div>
                                            <span class="badge bg-light text-dark" style="font-size: 20px;margin-right: 20px;">${requestScope.feedback.likesCount} <i class='bx bxs-like'></i></span> 
                                            <span class="badge bg-light text-dark" style="font-size: 20px">${requestScope.feedback.dislikesCount} <i class='bx bxs-dislike' ></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="Footer.jsp" %>
        <script src="js/Alter.js"></script>
    </body>

</html>
