<%-- 
    Document   : Hotel_Detail.jsp
    Created on : May 24, 2024, 3:27:14 PM
    Author     : HELLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="img_Home/logo.png">
        <link rel="stylesheet" href="bootstrap_css/bootstrap.min.css">
        <link rel="stylesheet" href="css/Hotel_Detail.css">
        <link rel="stylesheet" href="css/listPage.css">
        <title>Hotel</title>
        <style>
            <style>
            table {
                width: 100%;
                border-collapse: collapse;
            }
            th, td {
                border: 1px solid #dddddd;
                text-align: left;
                padding: 8px;
            }
            th {
                background-color: #f2f2f2;
            }
            tfoot th {
                background-color: #4CAF50;
                color: white;
            }
        </style>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <div class="container" id="detail">
            <div id="detail_header">
                <h2>Khách sạn và căn hộ Seashore</h2>
                <button disabled>Hotel</button>
                <i class='bx bxs-star'></i>
                <i class='bx bxs-star'></i>
                <i class='bx bxs-star'></i>
                <i class='bx bx-star' ></i>
                <i class='bx bx-star' ></i>
            </div>
            <div id="detail_address">
                <i class='bx bxs-location-plus' ></i> 15-16 Hoàng Sa, Mân Thái, Sơn Trà, Đà Nẵng, Việt Nam.
            </div>
            <div class="row" style="margin-top: 2%">
                <div class="col-md-8" id="left_img">
                    <img style="width: 102%" src="https://ik.imagekit.io/tvlk/apr-asset/Ixf4aptF5N2Qdfmh4fGGYhTN274kJXuNMkUAzpL5HuD9jzSxIGG5kZNhhHY-p7nw/hotel/asset/10022505-9d47b07d40edadf7857af2b9f8b0835e.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640" alt="alt"/>
                </div>
                <div class="col-md-4" id="right_img">
                    <div class="row" style="margin-bottom: 10px;">
                        <div class="col-6">
                            <img style="width: 108%; height: 195px; object-fit: cover;" src="https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/10022505-f6d75b3fcaf4409e7e815fa3fd7e6a52.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640" alt="image1"/>
                        </div>
                        <div class="col-6">
                            <img style="width: 100%; height: 195px; object-fit: cover;" src="https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/10022505-0f0203f74f0849bd3204d8b16f7e88d5.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640" alt="image2"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <img style="width: 108%; height: 195px; object-fit: cover;" src="https://ik.imagekit.io/tvlk/apr-asset/Ixf4aptF5N2Qdfmh4fGGYhTN274kJXuNMkUAzpL5HuD9jzSxIGG5kZNhhHY-p7nw/hotel/asset/10022505-496e33ca2a044d10467968ecc8c9419c.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640" alt="image3"/>
                        </div>
                        <div class="col-6" id="lastImg" style="position: relative;">
                            <img style="width: 100%; height: 195px; object-fit: cover; filter: brightness(50%);" src="https://ik.imagekit.io/tvlk/apr-asset/Ixf4aptF5N2Qdfmh4fGGYhTN274kJXuNMkUAzpL5HuD9jzSxIGG5kZNhhHY-p7nw/hotel/asset/10022505-de994cc87a7bcf655d33847b2bc8614d.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640" alt="image4"/>
                            <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 1;">
                                <form action="ShowHotel_Images.jsp">
                                    <button style="background-color: rgba(255, 255, 255, 0.5); padding: 10px 25px; border: none; border-radius: 5px">More images</button>
                                    <input type="hidden" value="">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top:1%;padding-bottom: 3%;border-bottom: 1px solid grey" id="content">
                <div class="col-md-8" id="left_content" >
                    <h5 style="font-weight: 550">Introducing the accommodation</h5>
                    <p>Heliport Hostel có hồ bơi ngoài trời, khu vườn, sân hiên và nhà hàng ở Hội An. Với quầy bar, hostel nằm gần một số điểm tham quan nổi tiếng, cách Bảo tàng lịch sử Hội An chưa đến 1 km, Chùa Cầu 8 phút đi bộ và Hội Quán Chi Hội Triều Châu Trung Quốc 1.5 km. Chỗ nghỉ cung cấp lễ tân 24/24, dịch vụ đưa đón sân bay, dịch vụ tiền sảnh và Wi-Fi miễn phí ở toàn bộ chỗ nghỉ.</p>
                    <p>Tại hostel, tất cả các phòng đều được thiết kế có ga trải giường và khăn tắm.</p>
                    <p>Khách có thể thưởng thức bữa sáng thực đơn à la carte, kiểu Á hoặc món chay tại chỗ nghỉ.</p>
                    <p>Khách có thể chơi bi-a và trò phi tiêu tại Heliport Hostel. Ngoài ra, chỗ nghỉ có dịch vụ thuê xe đạp.</p>
                    <p>Chỗ nghỉ cách Sân golf Montgomerie Links 14 km và Sân golf Montgomerie Links Vietnam Golf Club 14 km. Sân bay gần nhất là Sân bay Quốc tế Đà Nẵng, cách Heliport Hostel 29 km.</p>
                    <p>Các cặp đôi đặc biệt thích địa điểm này — họ cho điểm 9,2 cho kỳ nghỉ dành cho 2 người.</p>
                    <h5 style="font-weight: 550">Favorite amenities</h5>
                    <div style="width: 100%; display: flex; flex-wrap: wrap;" id="amenities">
                        <div style="display: flex; align-items: center; margin-right: 20px;">
                            <i class='bx bx-child' style="color: green;"></i><span style="color: black;">Hồ bơi ngoài trời</span>
                        </div>
                        <div style="display: flex; align-items: center; margin-right: 20px;">
                            <i class='bx bx-child' style="color: green;"></i><span style="color: black;">Xe đưa đón sân bay</span>
                        </div>
                        <div style="display: flex; align-items: center; margin-right: 20px;">
                            <i class='bx bx-child' style="color: green;"></i><span style="color: black;">Phòng không hút thuốc</span>
                        </div>
                        <div style="display: flex; align-items: center; margin-right: 20px;">
                            <i class='bx bx-child' style="color: green;"></i><span style="color: black;">Chỗ đỗ xe miễn phí</span>
                        </div>
                        <div style="display: flex; align-items: center; margin-right: 20px;">
                            <i class='bx bx-child' style="color: green;"></i><span style="color: black;">WiFi miễn phí</span>
                        </div>
                        <div style="display: flex; align-items: center; margin-right: 20px;">
                            <i class='bx bx-child' style="color: green;"></i><span style="color: black;">Nhà hàng</span>
                        </div>
                        <div style="display: flex; align-items: center; margin-right: 20px;">
                            <i class='bx bx-child' style="color: green;"></i><span style="color: black;">Lễ tân 24 giờ</span>
                        </div>
                        <div style="display: flex; align-items: center; margin-right: 20px;">
                            <i class='bx bx-child' style="color: green;"></i><span style="color: black;">Sân thượng / hiên</span>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card" style="width: 100%; background-color: rgb(240,246,255)">
                        <div class="card-body">
                            <h5 class="card-title" style="font-weight: bold">Highlights of the property</h5>
                            <h6>Perfect for a 1 night stay!</h6>
                            <p class="card-text">Located in the top-rated area in Hoi An, this property has an excellent location score of 9.1</p>
                            <a href="#" class="btn btn-primary" style="background-color: blue;  color:white">Booking Now</a><br>
                            <form>
                                <h6>Add to favorites hotel</h6>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                    <label class="form-check-label" for="flexSwitchCheckDefault">Add to favorites hotel</label>
                                </div>
                                <a href="#" class="btn btn-success">Save</a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row" style="margin-top:2%;padding-bottom: 2%;border-bottom: 1px solid grey">
                <h5 style="font-weight: 550">Introducing the accommodation</h5>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card mb-3">
                            <div class="row g-0" id="images_rom">
                                <div class="col-md-3" >
                                    <img src="https://ik.imagekit.io/tvlk/generic-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20006877-955b6ed67da99e790391970f2771b15a.jpeg?_src=imagekit&tr=c-at_max,fo-auto,h-222,q-40,w-296" class="img-fluid rounded-start" alt="...">
                                    <div id="show_detail">
                                        <form action="ShowRoom_Images.jsp">
                                            <i class='bx bx-folder-plus'></i>
                                            <button>Xem chi tiết phòng</button>
                                        </form>
                                    </div>
                                </div>
                                <div class="col-md-9">
                                    <div class="card-body1">
                                        <h4 class="card-title">Superior Double</h4>
                                        <table id="roomTable">
                                            <thead>
                                                <tr>
                                                    <th style="width: 250px;">Choose Type Room</th>
                                                    <th>Number people</th>
                                                    <th>Price/Room/Night</th>
                                                    <th>Price</th>
                                                    <th style="width: 250px;">Amount</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td style="width: 250px;">
                                                        <p style=" margin-bottom:0px"><i class='bx bxs-bed' style="font-size: 20px;" ></i> 1 Giường Đôi</p>
                                                        <a id="numberRoom">Only 4 rooms left on our site</a>
                                                    </td>
                                                    <td>
                                                        <div id="amount_People">
                                                            <i class='bx bxs-user'></i>
                                                            <i class='bx bxs-user'></i>
                                                            <i class='bx bxs-user'></i>
                                                            <i class='bx bxs-user'></i>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <p id="save">Tiết kiệm 3,5%</p><br>
                                                        <a id="price_real"><s>62.540 VND</s></a>
                                                        <h4 id="price_save">603.163 VND</h4>
                                                    </td>
                                                    <td>
                                                        <select style="width:50px">
                                                            <option value="0">0</option>
                                                            <option value="1">1</option>
                                                            <option value="2">2</option>
                                                            <option value="3">3</option>
                                                            <option value="4">4</option>
                                                        </select>
                                                    </td>
                                                    <td rowspan="3" style="width: 300px;" id="message">No room selected</td> <!-- Gộp 3 hàng lại thành một ô -->
                                                </tr>
                                                <tr>
                                                    <td style="width: 250px;">
                                                        <p style=" margin-bottom:0px"><i class='bx bxs-bed' style="font-size: 20px;" ></i> 1 Giường Đôi</p>
                                                        <a id="numberRoom">Only 4 rooms left on our site</a>
                                                    </td>
                                                    <td>
                                                        <div id="amount_People">
                                                            <i class='bx bxs-user'></i>
                                                            <i class='bx bxs-user'></i>
                                                            <i class='bx bxs-user'></i>
                                                            <i class='bx bxs-user'></i>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <p id="save">Tiết kiệm 3,5%</p><br>
                                                        <a id="price_real"><s>62.540 VND</s></a>
                                                        <h4 id="price_save">603.163 VND</h4>
                                                    </td>
                                                    <td>
                                                        <select style="width:50px">
                                                            <option value="0">0</option>
                                                            <option value="1">1</option>
                                                            <option value="2">2</option>
                                                            <option value="3">3</option>
                                                            <option value="4">4</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 250px;">
                                                        <p style=" margin-bottom:0px"><i class='bx bxs-bed' style="font-size: 20px;" ></i> 1 Giường Đôi</p>
                                                        <a id="numberRoom">Only 4 rooms left on our site</a>
                                                    </td>
                                                    <td>
                                                        <div id="amount_People">
                                                            <i class='bx bxs-user'></i>
                                                            <i class='bx bxs-user'></i>
                                                            <i class='bx bxs-user'></i>
                                                            <i class='bx bxs-user'></i>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <p id="save">Tiết kiệm 3,5%</p><br>
                                                        <a id="price_real"><s>62.540 VND</s></a>
                                                        <h4 id="price_save">603.163 VND</h4>
                                                    </td>
                                                    <td>
                                                        <select style="width:50px">
                                                            <option value="0">0</option>
                                                            <option value="1">1</option>
                                                            <option value="2">2</option>
                                                            <option value="3">3</option>
                                                            <option value="4">4</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        <div class="row" style="margin-top:2%">
            <h5 style="font-weight: bold">Other reviews from travelers about My Villa Airport Hotel</h5>
            <h6>Rating & Overall Review Score</h6>
            <div class="row">
                <div class="col-md-3" id="left_rate">
                    <p id="rating">4.2</p>
                    <div style="display: flex" id="rate">
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                        <i class='bx bx-star' ></i>
                        <i class='bx bx-star' ></i>
                    </div>
                </div>

                <div class="col-md-9">
                    <div class="card w-100 mb-3">
                        <div class="card-body" style="border-bottom: 1px solid grey">
                            <h5 class="card-title">
                                <img src="${customer.avatarURL}" alt="alt"/><label style="font-size: 16px">${customer.name}</label>
                            </h5>
                            <div>
                                <i class='bx bxs-star'></i>
                                <i class='bx bxs-star'></i>
                                <i class='bx bxs-star'></i>
                                <i class='bx bx-star' ></i>
                                <i class='bx bx-star' ></i>
                            </div>
                            <p class="card-text">Phòng mới nhân viên Ok mà vệ sinh bẩn. Ly trà bẩn,ấm siêu tốc bụi dơ. Phòng tắm bẩn, nói chung vệ sinh khá bẩn</p>                         
                            <!-- <i id="likeButton" class='bx bx-like' onclick="toggleLike()"></i><span id="sumLike">4 likes this comment</span>-->
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </div>
    <ul class="listPage">
    </ul>
    <%@include file="Footer.jsp" %>
    <script src="js/Hotel_Detail.js"></script>
</body>
</html>
