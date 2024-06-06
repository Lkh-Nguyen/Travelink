<%-- 
    Document   : Promotion
    Created on : Jun 5, 2024, 1:06:34 PM
    Author     : DUYAN
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, com.travelink.Model.Promotion" %>
<%@ page import="com.travelink.Database.PromotionDB" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Promotions</title>
    <link href="bootstrap_css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4 text-primary">Manage Promotions</h1>

        <!-- List of Promotions -->
        <h2 class="mb-3 text-secondary">Promotion List</h2>
        <table class="table table-bordered table-striped table-hover">
            <thead class="bg-primary text-white">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Discount</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="promotion" items="${requestScope.promotions}">
                    <tr>
                        <td>${promotion.promotionID}</td>
                        <td>${promotion.name}</td>
                        <td>${promotion.discount}%</td>
                        <td>${promotion.startDate}</td>
                        <td>${promotion.endDate}</td>
                        <td>
                            <form action="PromotionServlet" method="post" class="d-inline">
                                <input type="hidden" name="action" value="edit">
                                <input type="hidden" name="promotionID" value="${promotion.promotionID}">
                                <button type="submit" class="btn btn-warning btn-sm">Edit</button>
                            </form>
                            <form action="PromotionServlet" method="post" class="d-inline">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="promotionID" value="${promotion.promotionID}">
                                <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- Promotion Form -->
        <h2 class="mt-5 mb-3 text-secondary">${requestScope.promotion != null ? 'Edit' : 'Add'} Promotion</h2>
        <form action="PromotionServlet" method="post" class="needs-validation" novalidate>
            <input type="hidden" name="action" value="${requestScope.promotion != null ? 'update' : 'add'}">
            <input type="hidden" name="promotionID" value="${requestScope.promotion.promotionID}">
            <div class="mb-3">
                <label for="name" class="form-label">Name</label>
                <input type="text" class="form-control" id="name" name="name" value="${requestScope.promotion.name}" required>
                <div class="invalid-feedback">Please enter a name.</div>
            </div>
            <div class="mb-3">
                <label for="discount" class="form-label">Discount</label>
                <input type="number" class="form-control" id="discount" name="discount" value="${requestScope.promotion.discount}" required>
                <div class="invalid-feedback">Please enter a discount percentage.</div>
            </div>
            <div class="mb-3">
                <label for="startDate" class="form-label">Start Date</label>
                <input type="date" class="form-control" id="startDate" name="startDate" value="${requestScope.promotion.startDate}" required>
                <div class="invalid-feedback">Please enter a start date.</div>
            </div>
            <div class="mb-3">
                <label for="endDate" class="form-label">End Date</label>
                <input type="date" class="form-control" id="endDate" name="endDate" value="${requestScope.promotion.endDate}" required>
                <div class="invalid-feedback">Please enter an end date.</div>
            </div>
            <button type="submit" class="btn btn-success">${requestScope.promotion != null ? 'Update' : 'Add'} Promotion</button>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.0.2/js/bootstrap.min.js"></script>
    <script>
        (function () {
            'use strict'
            var forms = document.querySelectorAll('.needs-validation')
            Array.prototype.slice.call(forms)
                .forEach(function (form) {
                    form.addEventListener('submit', function (event) {
                        if (!form.checkValidity()) {
                            event.preventDefault()
                            event.stopPropagation()
                        }
                        form.classList.add('was-validated')
                    }, false)
                })
        })()
    </script>
</body>
</html>