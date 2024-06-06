<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>My Feedback</title>
        <link href="bootstrap_css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/listPage.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <div class="container my-5">
            <h2 class="mb-4">My Feedback</h2>
            <c:if test="${not empty feedbacks}">
                <c:forEach var="f" items="${feedbacks}">
                    <div class="row mb-4" id="feedback-${f.feedbackID}">
                        <div class="col-md-5">
                            <div class="shadow-sm">
                                <div class="card card-body row">
                                    <div class="col-md-4"><img src="${f.getHotel(f.hotelID).getAnURL(f.hotelID)}" alt="Hotel Image" class="img-fluid"></div>
                                    <div class="col-md-8">
                                        <h5 class="card-title">Hotel</h5>
                                        <p class="card-text">${f.getHotel(f.hotelID).name}</p>
                                        <p class="card-text">${f.getHotel(f.hotelID).address}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-7">
                            <div class="shadow-sm">
                                <div class="card card-body">
                                    <h4 class="card-title d-flex align-items-center">
                                        <img src="${f.getAccount(f.feedbackID).avatarURL}" alt="Avatar" class="rounded-circle me-3" style="width: 50px; height: 50px;">
                                        ${f.getAccount(f.feedbackID).name}
                                    </h4>
                                    <div class="card-subtitle mb-2 rating-container">
                                        Rating: 
                                        <c:forEach var="i" begin="1" end="5">
                                            <i class="bx ${i <= f.rating ? 'bxs-star' : 'bx-star'} star-icon" data-rating="${i}"></i>
                                        </c:forEach>
                                    </div>
                                    <p class="card-text description">${f.description}</p>
                                    <div class="d-flex justify-content-end">
                                        <span class="me-3"><i class="bx bx-like"></i> ${f.likesCount}</span>
                                        <span><i class="bx bx-dislike"></i> ${f.dislikesCount}</span>
                                    </div>
                                    <div class="mt-3">
                                        <button class="btn btn-primary me-2 update-btn" data-id="${f.feedbackID}">Update</button>
                                        <button class="btn btn-danger me-2 delete-btn" data-id="${f.feedbackID}">Delete</button>
                                        <button class="btn btn-success me-2 save-btn d-none" data-id="${f.feedbackID}">Save</button>
                                        <button class="btn btn-secondary me-2 cancel-btn d-none" data-id="${f.feedbackID}">Cancel</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
            <c:if test="${empty feedbacks}">
                <div class="alert alert-warning" role="alert">
                    You have not left any feedback yet.
                </div>
            </c:if>
            <ul class="listPage"></ul>
        </div>
        <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                var currentRating;

                $('.update-btn').click(function () {
                    var feedbackID = $(this).data('id');
                    var feedbackDiv = $('#feedback-' + feedbackID);
                    var description = feedbackDiv.find('.description').text().trim();
                    currentRating = feedbackDiv.find('.star-icon.bxs-star').length;

                    feedbackDiv.find('.description').html('<textarea class="form-control">' + description + '</textarea>');
                    feedbackDiv.find('.star-icon').removeClass('bx-star bxs-star').addClass('bx-star');
                    feedbackDiv.find('.star-icon').each(function (index) {
                        if (index < currentRating) {
                            $(this).addClass('bxs-star');
                        }
                    });
                    $(this).addClass('d-none');
                    feedbackDiv.find('.save-btn, .cancel-btn').removeClass('d-none');
                });
                $('.delete-btn').click(function () {
                    var feedbackID = $(this).data('id');
                    $.post('DeleteFeedbackServlet', {
                        feedbackID: feedbackID
                    }, function (response) {
                        $('#feedback-' + feedbackID).remove();
                    });
                });

                $('.star-icon').click(function () {
                    var feedbackDiv = $(this).closest('.rating-container');
                    var rating = $(this).data('rating');
                    feedbackDiv.find('.star-icon').removeClass('bxs-star').addClass('bx-star');
                    feedbackDiv.find('.star-icon').each(function (index) {
                        if (index < rating) {
                            $(this).addClass('bxs-star');
                        }
                    });
                });

                $('.save-btn').click(function () {
                    var feedbackID = $(this).data('id');
                    var feedbackDiv = $('#feedback-' + feedbackID);
                    var newDescription = feedbackDiv.find('textarea').val().trim();
                    var newRating = feedbackDiv.find('.star-icon.bxs-star').length;

                    $.post('UpdateFeedbackServlet', {
                        feedbackID: feedbackID,
                        description: newDescription,
                        rating: newRating
                    }, function (response) {
                        location.reload();
                    });
                });

                $('.cancel-btn').click(function () {
                    var feedbackID = $(this).data('id');
                    location.reload();
                });
            });

            let thisPage = 1;
            let limit = 4;
            let list = document.querySelectorAll(".card-body");
            function loadItem() {
                let beginGet = limit * (thisPage - 1);
                let endGet = limit * thisPage - 1;
                list.forEach((item, key) => {
                    if (key >= beginGet && key <= endGet) {
                        item.style.display = "block";
                    } else {
                        item.style.display = "none";
                    }
                });
                listPage();
            }
            loadItem();
            function listPage() {
                let count = Math.ceil(list.length / limit);
                document.querySelector('.listPage').innerHTML = '';

                if (thisPage != 1) {
                    let prev = document.createElement('li');
                    prev.innerText = 'PREV';
                    prev.setAttribute('onclick', "changePage(" + (thisPage - 1) + ")");
                    document.querySelector('.listPage').appendChild(prev);
                }
                for (i = 1; i <= count; i++) {
                    let newPage = document.createElement('li');
                    newPage.innerText = i;
                    if (i == thisPage) {
                        newPage.classList.add('active');
                    }
                    newPage.setAttribute('onclick', "changePage(" + i + ")");
                    document.querySelector('.listPage').appendChild(newPage);
                }

                if (thisPage != count) {
                    let next = document.createElement('li');
                    next.innerText = 'NEXT';
                    next.setAttribute('onclick', "changePage(" + (thisPage + 1) + ")");
                    document.querySelector('.listPage').appendChild(next);
                }
            }
            function changePage(i) {
                thisPage = i;
                loadItem();
                let scrollPosition = window.scrollY;
                window.scrollTo(0, scrollPosition);
            }

        </script>
        <%@include file="Footer.jsp" %>
    </body>
</html>
