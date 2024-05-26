
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
        <link rel="stylesheet" href="css/ShowHotel_Images.css">
        <title>Hotel</title>
    </head>
    <body>
        <div class='container-fluid'>
            <%@include file="Header.jsp" %>
        </div>
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
        </div>    
        <div class="container" style="margin-top:1%">
            <h3>Images of Room: Superior Double</h3>
            <div class="row" >
                <div class="col-md-2 Img">
                    <img src="img_Home/best -4.jpg" alt="Thumbnail 1" class="thumbnail">
                </div>
                <div class="col-md-2 Img">
                    <img src="img_Home/Decor - 2.jpg" alt="Thumbnail 2" class="thumbnail">
                </div>
                <div class="col-md-2 Img">
                    <img src="img_Home/best -1.jpg" alt="Thumbnail 3" class="thumbnail">
                </div>
                <div class="col-md-2 Img">
                    <img src="img_Home/best -2.jpg" alt="Thumbnail 4" class="thumbnail">
                </div>
                <div class="col-md-2 Img">
                    <img src="img_Home/best -1.jpg" alt="Thumbnail 3" class="thumbnail">
                </div>
                <div class="col-md-2 Img">
                    <img src="img_Home/best -2.jpg" alt="Thumbnail 4" class="thumbnail">
                </div>
            </div>
            
            <div id="myModal" class="modal">
                <span class="close">&times;</span>
                <span class="prev">&#10094;</span>
                <img class="modal-content" id="img01">
                <span class="next">&#10095;</span>
            </div>
        </div>
        <%@include file="Footer.jsp" %>
        <script src="js/ShowHotel_Images.js"></script>
    </body>
</html>
