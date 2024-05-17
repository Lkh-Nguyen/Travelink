<%-- 
    Document   : Home_Customer
    Created on : May 17, 2024, 9:31:54 AM
    Author     : HELLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/Home_Customer.css">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="overlay"></div>
        <%@include file="../../header.jsp" %>
        <header class="section__container header__container">
            <h1 class="section__header">Find And Book<br />A Great Experience</h1>
            <img src="../img_Home/header.jpg" alt="header" />
        </header>

        <section class="section__container booking__container">
            <div class="booking__nav">
                <span class="active">Regular Room</span>
                <span>Presidential Room</span>
                <span>VIP Room</span>
            </div>
            <form>
                <div class="form__group">
                    <span><i class="ri-map-pin-line"></i></span>
                    <div class="input__content">
                        <div class="input__group">
                            <input type="text" />
                            <label>Location</label>
                        </div>
                        <p>Where are you going?</p>
                    </div>
                </div>
                <div class="form__group">
                    <span><i class="ri-user-3-line"></i></span>
                    <div class="input__content">
                        <div class="input__group">
                            <input id="numberInput" type="text" />
                            <label id="number_label">No of people</label>
                        </div>
                        <p>Add guests</p>
                    </div>
                    <div class="dropdown" id="travellersDropdown">
                        <div class="dropdown__item">
                            <label for="adults">Adults:</label>
                            <input type="number" id="adults" name="adults" min="0" value="1" />
                        </div>
                        <div class="dropdown__item">
                            <label for="children">Children:</label>
                            <input type="number" id="children" name="children" min="0" value="0" />
                        </div>
                        <button class="btn" id="applyTravellers">Apply</button>
                    </div>
                </div>
                <div class="form__group">
                    <span><i class="ri-calendar-line"></i></span>
                    <div class="input__content">
                        <div class="input__group">
                            <input type="text" />
                            <label>Departure</label>
                        </div>
                        <p>Add date</p>
                    </div>
                </div>
                <div class="form__group">
                    <span><i class="ri-calendar-line"></i></span>
                    <div class="input__content">
                        <div class="input__group">
                            <input type="text" />
                            <label>Return</label>
                        </div>
                        <p>Add date</p>
                    </div>
                </div>
                <button class="btn"><i class="ri-search-line"></i></button>
            </form>
        </section>

        <section id = "about" class="section__container plan__container ">
            <p class="subheader">TRAVEL SUPPORT</p>
            <h2 class="section__header">Plan your travel with confidence</h2>
            <p class="description">
                Find help with your bookings and travel plans, and seee what to expect
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
                    <img src="../img_Home/plan-1.jpg" alt="plan" />
                    <img src="../img_Home/plan-2.jpg" alt="plan" />
                    <img src="../img_Home/plan-3.jpg" alt="plan" />
                </div>
            </div>
        </section>

        <section class="memories">
            <div class="section__container memories__container">
                <div class="memories__header">
                    <h2 class="section__header">
                        Travel to make memories all around the world
                    </h2>
                    <button class="view__all">View All</button>
                </div>
                <div class="memories__grid">
                    <div class="memories__card">
                        <span><i class="ri-calendar-2-line"></i></span>
                        <h4>Book & relax</h4>
                        <p>
                            With "Book and Relax," you can sit back, unwind, and enjoy the
                            journey while we take care of everything else.
                        </p>
                    </div>
                    <div class="memories__card">
                        <span><i class="ri-shield-check-line"></i></span>
                        <h4>Smart Checklist</h4>
                        <p>
                            Introducing Smart Checklist with us, the innovative solution
                            revolutionizing the way you travel with our airline.
                        </p>
                    </div>
                    <div class="memories__card">
                        <span><i class="ri-bookmark-2-line"></i></span>
                        <h4>Save More</h4>
                        <p>
                            From discounted ticket prices to exclusive promotions and deals,
                            we prioritize affordability without compromising on quality.
                        </p>
                    </div>
                </div>
            </div>
        </section>

        <section class="section__container lounge__container">
            <div class="lounge__image">
                <img src="../img_Home/lounge-1.jpg" alt="lounge" />
                <img src="../img_Home/lounge-2.jpg" alt="lounge" />
            </div>
            <div class="lounge__content">
                <h2 class="section__header">Unaccompanied Minor Lounge</h2>
                <div class="lounge__grid">
                    <div class="lounge__details">
                        <h4>Essential Amenities for Your Stay</h4>
                        <p>
                            Make the most of your stay with these essential amenities to 
                            ensure comfort and convenience.
                        </p>
                    </div>
                    <div class="lounge__details">
                        <h4>Tailored Concierge Services</h4>
                        <p>
                            Experience personalized service with our tailored concierge services, 
                            catering to your specific needs and preferences throughout your stay.
                        </p>
                    </div>
                    <div class="lounge__details">
                        <h4>
                            Destination-Specific Stay Guidelines</h4>
                        <p>
                            Stay informed and plan your itinerary effortlessly with our detailed information 
                            on destination-specific stay guidelines. Whether you're exploring a bustling city 
                            or a serene countryside, we provide insights to enhance your experience and make your stay enjoyable.
                        </p>
                    </div>
                    <div class="lounge__details">
                        <h4>A Culinary Delight</h4>
                        <p>
                            Immerse yourself in a world of flavors, offering international
                            cuisines, gourmet dishes, and carefully curated beverages.
                        </p>
                    </div>
                </div>
            </div>
        </section>

        <section class="section__container travellers__container">
            <h2 class="section__header">Best hotels of the month</h2>
            <div class="travellers__grid">
                <div class="travellers__card">
                    <img src="../img_Home/traveller-1.jpg" alt="traveller" />
                    <div class="travellers__card__content">
                        <img src="../img_Home/client-1.jpg" alt="client" />
                        <h4>Emily Johnson</h4>
                        <p>Dubai</p>
                    </div>
                </div>
                <div class="travellers__card">
                    <img src="../img_Home/traveller-2.jpg" alt="traveller" />
                    <div class="travellers__card__content">
                        <img src="../img_Home/client-2.jpg" alt="client" />
                        <h4>David Smith</h4>
                        <p>Paris</p>
                    </div>
                </div>
                <div class="travellers__card">
                    <img src="../img_Home/traveller-3.jpg" alt="traveller" />
                    <div class="travellers__card__content">
                        <img src="../img_Home/client-3.jpg" alt="client" />
                        <h4>Olivia Brown</h4>
                        <p>Singapore</p>
                    </div>
                </div>
                <div class="travellers__card">
                    <img src="../img_Home/traveller-4.jpg" alt="traveller" />
                    <div class="travellers__card__content">
                        <img src="../img_Home/client-4.jpg" alt="client" />
                        <h4>Daniel Taylor</h4>
                        <p>Malaysia</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- <section class="subscribe">
          <div class="section__container subscribe__container">
            <h2 class="section__header">Subscribe newsletter & get latest news</h2>
            <form class="subscribe__form">
              <input type="text" placeholder="Enter your email here" />
              <button class="btn">Subscribe</button>
            </form>
          </div>
        </section> -->

        <footer class="footer">
            <div class="section__container footer__container">
                <div class="footer__col">
                    <h3>Travelink</h3>
                    <p>
                        Embark on a Journey of Excellence. With a steadfast dedication to 
                        guest satisfaction and a love for hospitality, Travelink offers 
                        remarkable services for memorable stays.
                    </p>
                    <p>
                        From warm greetings to cutting-edge amenities, we link you to a world of comfort, 
                        ensuring secure, cozy, and unforgettable accommodations.
                    </p>
                </div>
                <div class="footer__col">
                    <h4>INFORMATION</h4>
                    <p>Home</p>
                    <p>About</p>
                    <p>Offers</p>
                    <p>Seats</p>
                    <p>Destinations</p>
                </div>
                <div class="footer__col">
                    <h4>CONTACT</h4>
                    <p>Support</p>
                    <p>Media</p>
                    <p>Socials</p>
                </div>
            </div>
            <div class="section__container footer__bar">
                <p>Copyright © 2023 Web Design Mastery. All rights reserved.</p>
                <div class="socials">
                    <span><i class="ri-facebook-fill"></i></span>
                    <span><i class="ri-twitter-fill"></i></span>
                    <span><i class="ri-instagram-line"></i></span>
                    <span><i class="ri-youtube-fill"></i></span>
                </div>
            </div>
        </footer>
        <script src="Home_Customer.js"></script>
    </body>
</html>
