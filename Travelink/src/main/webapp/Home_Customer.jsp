
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap_css/bootstrap.min.css">
        <link rel="stylesheet" href="css/Home_Customer.css">
        <link rel="stylesheet" href="css/Alter.css">
        <link
            href="https://cdn.jsdelivr.net/npm/remixicon@3.4.0/fonts/remixicon.css"
            rel="stylesheet"
            >    
        <title>Travelink</title>
        <link rel="icon" href="img_Home/logo.png">
        <style>
            .booking {
                transition: background-color 0.5s ease, border-color 0.5s ease, color 0.5s ease; /* Increased duration for smoother transition */
                animation: float 3s ease-in-out infinite; /* Apply the floating animation */
            }

            .booking:hover {
                background-color: #17a2b8; /* Example of a property that will change smoothly */
                border-color: #17a2b8; /* Change border color to match the new background */
                color: #fff; /* Change text color for better contrast */
            }
            @keyframes float {
                0%, 100% {
                    transform: translateY(0);
                }
                50% {
                    transform: translateY(-10px);
                }
            }
            .booking__container .btn {
                padding: 1rem;
                font-size: 1rem;
            }
            .booking__container select{
                width: 100%;
                padding: 10px 0;
                font-size: 1rem;
                outline: none;
                border: none;
                border-bottom: 1px solid var(--primary-color);
                color: var(--text-dark);
            }
            .booking__container select:focus~label{
                font-size: 0.8rem;
                top: 0;
            }
            .input__group input:focus + label,
            .input__group input:not(:placeholder-shown) + label,
            .input__group select:focus + label,
            .input__group select:not(:placeholder-shown) + label {
                top: 0;
                font-size: 0.8rem;
                color: #333;
            }
        </style>
    </head>
    <body>
        <c:if test="${requestScope.succesLogin != null}">
            <div id="status-message" style="background-color: rgb(233,251,233);" class="hidden">
                <div style="display: flex">
                    <div style="width: 20%">
                        <i class='bx bxs-check-circle' style="font-size: 50px;color:green;margin-top: 0px"></i>
                    </div>
                    <div style="width: 80%;height: 100%; text-align: start">
                        <h3 style="color:green;margin-top: 5px;font-weight: 550 ">Success</h3>
                        <p style="color: black;font-size: 14px">${succesLogin}</p>
                    </div>
                </div>           
            </div>
        </c:if>
        <c:if test="${requestScope.loggout != null}">
            <div id="status-message" style="background-color: rgb(233,251,233);" class="hidden">
                <div style="display: flex">
                    <div style="width: 20%">
                        <i class='bx bxs-check-circle' style="font-size: 50px;color:green;margin-top: 0px"></i>
                    </div>
                    <div style="width: 80%; text-align: start;">
                        <h3 style="color:green;margin-top: 5px;font-weight: 550;margin-bottom: 0px;">Success</h3>
                        <p style="color: black;font-size: 14px">${loggout}</p>
                    </div>
                </div>           
            </div>
        </c:if>
        <div class="overlay"></div>
        <%@include file="Header.jsp" %>
        <header class="section__container header__container">
            <h1 class="section__header">Find And Book<br />A Great Experience</h1>
            <div style="position: relative">
                <button class="booking btn btn-outline-info position-absolute border border-white p-4 rounded text-white fs-2 cursor-pointer" style="
                        bottom: 13rem;
                        left: 9rem;
                        ">
                    Booking now</button>
                <img src="img_Home/header.jpg" style="border-radius:0" alt="header" />
            </div>
        </header>

        <section class="section__container booking__container">
            <form method="post" action="search">
                <!--                    Location-->
                <div class="form__group">
                    <span><i class="ri-map-pin-line"></i></span>
                    <div class="input__content">
                        <div class="input__group">
                            <select name="location">
                                <option>Location</option>
                                <<c:forEach var="location" items="${requestScope.locationList}">
                                    <option value="${location.name}">${location.name}</option>
                                </c:forEach>
                            </select>
                            <label>Location</label>
                        </div>
                        <p>Where are you going?</p>
                    </div>
                </div>
                <!--                    Number of people-->
                <div class="form__group">
                    <span><i class="ri-user-3-line"></i></span>
                    <div class="input__content">
                        <div class="input__group">
                            <input id="numberInput" type="number" name="number_of_people" min="1" required=""/>
                            <label id="number_label">No of people</label>
                        </div>
                        <p>Add guests</p>
                    </div>
                </div>
                <!--                    Departure-->
                <div class="form__group">
                    <span><i class="ri-calendar-line"></i></span>
                    <div class="input__content">
                        <div class="input__group">
                            <input type="date" name="check_in_date" required=""/>
                            <label>Departure</label>
                        </div>
                        <p>Add date</p>
                    </div>
                </div>
                <!--                    Return-->
                <div class="form__group">
                    <span><i class="ri-calendar-line"></i></span>
                    <div class="input__content">
                        <div class="input__group">
                            <input type="date" name="check_out_date" required=""/>
                            <label>Return</label>
                        </div>
                        <p>Add date</p>
                    </div>
                </div>
                <!--                        Number of rooms-->
                <div class="form__group">
                    <span><i class="ri-home-5-line"></i></span>  <div class="input__content">
                        <div class="input__group">
                            <input type="number" min="1" name="number_of_rooms" required=""/>  <label>Rooms</label>
                        </div>
                        <p>Number of rooms</p>
                    </div>
                </div>
                <!--                    Search button-->
                <div></div><div></div>
                <div class="text-center mb-2">
                    <button class="btn btn-primary fw-bold w-100 text-center"><i class="ri-search-line text-dark">  Search</i></button>
                </div>
            </form>
        </section>  

        <section id = "about" class="section__container plan__container ">
            <p class="subheader">TRAVEL SUPPORT</p>
            <h2 class="section__header">Plan your travel with confidence</h2>
            <p class="description">
                Find help with your bookings and travel plans, and see what to expect
                along your journey.
            </p>
            <div class="plan__grid">
                <div class="plan__content">
                    <span class="number">01</span>
                    <h4>Essential Amenities for Your Stay</h4>
                    <p>
                        Make the most of your stay with these essential amenities to ensure comfort and convenience.
                    </p>
                    <span class="number">02</span>
                    <h4>Tailored Concierge Services</h4>
                    <p>
                        Experience personalized service with our tailored concierge services, catering to your specific needs and preferences throughout your stay.
                    </p>
                    <span class="number">03</span>
                    <h4>Destination-Specific Stay Guidelines</h4>
                    <p>
                        Stay informed and plan your itinerary effortlessly with our detailed information on destination-specific stay guidelines. Whether you're exploring a bustling city or a serene countryside, we provide insights to enhance your experience and make your stay enjoyable.
                    </p>
                </div>
                <div class="plan__image">
                    <img src="img_Home/hotel-1.webp" alt="plan" />
                    <img src="img_Home/hotel-2.jfif" alt="plan" />
                    <img src="img_Home/hotel-3.jpg" alt="plan" />
                </div>
            </div>
        </section>

        <section class="memories">
            <div class="section__container memories__container">
                <div class="memories__header">
                    <h2 class="section__header">
                        Travel to make memories in Viet Nam
                    </h2>
                    <button class="view__all">View All</button>
                </div>
                <div class="memories__grid">
                    <div class="memories__card">
                        <span><i class="ri-calendar-2-line"></i></span>
                        <h4>Book & relax</h4>
                        <p>
                            With "Book and Relax," you can sit back and enjoy the
                            vacation while we take care of everything else.
                        </p>
                    </div>
                    <div class="memories__card">
                        <span><i class="ri-shield-check-line"></i></span>
                        <h4>Smart Checklist</h4>
                        <p>
                            Introducing Smart Checklist with us, the innovative solution
                            revolutionizing the way you travel.
                        </p>
                    </div>
                    <div class="memories__card">
                        <span><i class="ri-bookmark-2-line"></i></span>
                        <h4>Save More</h4>
                        <p>
                            From discounted prices to exclusive promotions and deals,
                            we prioritize affordability without compromising on quality.
                        </p>
                    </div>
                </div>
            </div>
        </section>

        <section class="section__container lounge__container">
            <div class="lounge__image">
                <img src="img_Home/Decor - 1.jfif" alt="lounge" />
                <img src="img_Home/Decor - 2.jpg" alt="lounge" />
            </div>
            <div class="lounge__content">
                <h2 class="section__header">Luxurious interior decoration</h2>
                <div class="lounge__grid">
                    <div class="lounge__details">
                        <h4>The Essence of Luxurious Interior Decoration</h4>
                        <p>
                            Luxurious interior decoration creates elegant, sophisticated spaces using high-quality materials like marble and silk. 
                            It’s about refined taste and attention to detail, with bespoke furniture and unique art enhancing the lavish atmosphere.
                        </p>
                    </div>
                    <div class="lounge__details">
                        <h4>Key Elements of Luxurious Interiors</h4>
                        <p>
                            Key elements include opulent materials, exquisite craftsmanship, and thoughtful design. 
                            High-end materials like crystal and rare woods add glamour, 
                            while custom furniture and draperies contribute to a unique, elevated design.
                        </p>
                    </div>
                    <div class="lounge__details">
                        <h4>
                            The Role of Color and Texture</h4>
                        <p>
                            Rich colors like emerald green and royal blue, complemented by metallic accents, create a sense of grandeur. 
                            Combining plush fabrics like velvet with hard materials like marble adds depth and a luxurious feel.
                        </p>
                    </div>
                    <div class="lounge__details">
                        <h4>Integrating Technology with Luxury</h4>
                        <p>
                            Modern luxurious interiors blend advanced technology seamlessly with traditional opulence. 
                            Smart home systems and hidden audio-visual equipment enhance comfort and convenience, 
                            ensuring a stylish and functional space.
                        </p>
                    </div>
                </div>
            </div>
        </section>

        <section class="section__container travellers__container">
            <h2 class="section__header">Best hotels of the month</h2>
            <div class="travellers__grid">
                <div class="travellers__card">
                    <img src="img_Home/traveller-1.jpg" alt="traveller" />
                    <div class="travellers__card__content">
                        <img src="img_Home/best -1.jpg" alt="client" />
                        <h4>Emily Johnson</h4>
                        <p>Dubai</p>
                    </div>
                </div>
                <div class="travellers__card">
                    <img src="img_Home/traveller-2.jpg" alt="traveller" />
                    <div class="travellers__card__content">
                        <img src="img_Home/best -2.jpg" alt="client" />
                        <h4>David Smith</h4>
                        <p>Paris</p>
                    </div>
                </div>
                <div class="travellers__card">
                    <img src="img_Home/traveller-3.jpg" alt="traveller" />
                    <div class="travellers__card__content">
                        <img src="img_Home/best -3.jpg" alt="client" />
                        <h4>Olivia Brown</h4>
                        <p>Singapore</p>
                    </div>
                </div>
                <div class="travellers__card">
                    <img src="img_Home/traveller-4.jpg" alt="traveller" />
                    <div class="travellers__card__content">
                        <img src="img_Home/best -4.jpg" alt="client" />
                        <h4>Daniel Taylor</h4>
                        <p>Malaysia</p>
                    </div>
                </div>
            </div>
        </section>
        <%@include file="Footer.jsp" %>
        <script src="js/Home_Customer.js"></script>
        <script src="js/Alter.js"></script>
        <script>
            document.querySelector('.booking').addEventListener('click', function () {
                document.querySelector('.booking__container').scrollIntoView({
                    behavior: 'smooth'
                });
            });
        </script>
    </body>
</html>
