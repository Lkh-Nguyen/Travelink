<%-- 
    Document   : CreateFeedback
    Created on : May 29, 2024, 10:15:52 PM
    Author     : DUYAN
--%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Create New Feedback</title>
        <link href="bootstrap_css/bootstrap.min.css" rel="stylesheet">
        <style>
            .rating {
                display: flex;
                flex-direction: row-reverse;
                justify-content: center;
            }
            .rating input {
                display: none;
            }
            .rating label {
                position: relative;
                width: 1em;
                font-size: 3vw;
                color: #FFD700;
                cursor: pointer;
            }
            .rating label::before {
                content: "\2605";
                position: absolute;
                opacity: 0.3;
            }
            .rating label:hover::before,
            .rating label:hover ~ label::before,
            .rating input:checked ~ label::before {
                opacity: 1 !important;
            }

            /* Overlay style */
            .overlay {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                z-index: 999;
                justify-content: center;
                align-items: center;
            }
            .overlay-content {
                background-color: white;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
                transition: opacity 0.3s ease-in-out;
            }

            /* Custom tick animation */
            .tick-icon {
                color: #28a745;
                font-size: 4em;
            }

            /* Form style */
            .container {
                max-width: 600px;
                margin: auto;
                padding: 20px;
                border-radius: 5px;
                background-color: #f9f9f9;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
                transition: box-shadow 0.3s ease-in-out;
            }

            .container:hover {
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
            }

            .form-label {
                font-size: 1.5em;
            }

            .form-control {
                font-size: 1.2em;
                border: 2px solid #ccc;
                border-radius: 5px;
                transition: border-color 0.3s ease-in-out;
            }

            .form-control:focus {
                border-color: #4d90fe;
                outline: none;
            }

            .btn-primary {
                font-size: 1.5em;
                background-color: #4d90fe;
                border: none;
                border-radius: 5px;
                transition: background-color 0.3s ease-in-out;
            }

            .btn-secondary{
                font-size: 1.5rem;
                border: none;
                border-radius: 5px;
                transition: background-color 0.3s ease-in-out;
            }

            .btn-primary:hover {
                background-color: #357ae8;
            }
        </style>
    </head>
    <body>
        <div class="container mt-5">
            <h2>Create New Feedback</h2>
            <form id="feedbackForm" action="/submit_feedback" method="post">
                <div class="mb-3">
                    <label for="rating" class="form-label fs-3">Rating</label>
                    <div class="rating">
                        <input type="radio" id="star5" name="rating" value="5" required/><label for="star5" title="5 stars"></label>
                        <input type="radio" id="star4" name="rating" value="4" required/><label for="star4" title="4 stars"></label>
                        <input type="radio" id="star3" name="rating" value="3" required/><label for="star3" title="3 stars"></label>
                        <input type="radio" id="star2" name="rating" value="2" required/><label for="star2" title="2 stars"></label>
                        <input type="radio" id="star1" name="rating" value="1" required/><label for="star1" title="1 star"></label>
                    </div>
                </div>
                <div class="mb-3 mt-5">
                    <label for="description" class="form-label fs-3">Description</label>
                    <textarea class="form-control" id="description" name="description" rows="7" required></textarea>
                </div>
                <input type="hidden" id="date" name="date" value="">
                <div class="d-flex justify-content-around ">
                    <button type="submit" class="btn btn-primary fw-bold">Submit</button>
                    <button class="btn btn-secondary fw-bold">Cancel</button>
                </div>
            </form>
            <!-- Overlay for success message -->
            <div class="overlay" id="overlay">
                <div class="overlay-content text-center">
                    <i class="fas fa-check-circle tick-icon"></i>
                    <p class="text-success">Feedback submitted successfully!</p>
                </div>
            </div>
        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                document.getElementById('date').value = new Date().toISOString().split('T')[0];

                // Show overlay when form is submitted
                document.getElementById('feedbackForm').addEventListener('submit', function (e) {
                    e.preventDefault();
                    // Display the overlay
                    document.getElementById('overlay').style.display = 'flex';
                    // Hide the overlay after 3 seconds
                    setTimeout(function () {
                        document.getElementById('overlay').style.display = 'none';
                    }, 3000);
                    // You can add further actions here like submitting the form via AJAX
                });
            });
        </script>
    </body>
</html>

