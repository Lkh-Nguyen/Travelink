Use Travelink
GO

--insert table customer--
select *
from Customer

INSERT INTO Customer (Email, Password, Name, Gender, DateOfBirth, PhoneNumber)
VALUES ('example@email.com', '123', N'Nguyễn Văn Nam', 'M', '1990-01-01', '0912345678'),
('nguyenlkhde170387@fpt.edu.vn','123',N'Le Kim Hoang Nguyen', 'M', '2003-06-30','0934726073');
--insert table customer--

--insert table hotel--
select *
from Hotel

INSERT INTO Hotel (
  Name, Email, Password, Star, PhoneNumber, Description, CheckInTimeStart, CheckInTimeEnd, CheckOutTimeStart, CheckOutTimeEnd, Address, Ward_ID
) VALUES 
(N'Khách sạn và căn hộ Seashore', 'email1@gmail.com', '1234567890', 4, '0123456789',
 N'Dành cho những du khách muốn du lịch thoải mái cùng ngân sách tiết kiệm, Seashore Hotel & Apartment sẽ là lựa chọn lưu trú hoàn hảo, nơi cung cấp các tiện nghi chất lượng và dịch vụ tuyệt vời.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'15-16 Hoàng Sa, Mân Thái, Sơn Trà, Đà Nẵng, Việt Nam', 6372),
(N'Davue Hotel Da Nang', 'email2@gmail.com', '1234567890', 3, '0123456789',
 N'Davue Hotel Da Nang là đề xuất hàng đầu dành cho những tín đồ du lịch "bụi" mong muốn được nghỉ tại một khách sạn vừa thoải mái lại hợp túi tiền.
 Dành cho những du khách muốn du lịch thoải mái cùng ngân sách tiết kiệm, Davue Hotel Da Nang sẽ là lựa chọn lưu trú hoàn hảo, nơi cung cấp các tiện nghi chất lượng và dịch vụ tuyệt vời. \nKhách sạn này là lựa chọn hoàn hảo cho các kỳ nghỉ mát lãng mạn hay tuần trăng mật của các cặp đôi. Quý khách hãy tận hưởng những đêm đáng nhớ nhất cùng người thương của mình tại Davue Hotel Da Nang',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'57-59 Đỗ Bí, Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Việt Nam', 6374),
(N'Cicilia Danang Hotels & Spa Powered by ASTON', 'email3@gmail.com', '1234567890', 3, '0123456789',
 N'Khách sạn này là lựa chọn hoàn hảo cho các kỳ nghỉ mát lãng mạn hay tuần trăng mật của các cặp đôi. Quý khách hãy tận hưởng những đêm đáng nhớ nhất cùng người thương của mình tại Cicilia Danang Hotels & Spa Powered by ASTON.
 Cicilia Danang Hotels & Spa Powered by ASTON là lựa chọn sáng giá dành cho những ai đang tìm kiếm một trải nghiệm xa hoa đầy thú vị trong kỳ nghỉ của mình. Lưu trú tại đây cũng là cách để quý khách chiều chuộng bản thân với những dịch vụ xuất sắc nhất và khiến kỳ nghỉ của mình trở nên thật đáng nhớ.
 Một trong những đặc điểm chính của khách sạn này là các liệu pháp spa đa dạng. Hãy nâng niu bản thân bằng các liệu pháp thư giãn, phục hồi giúp quý khách tươi trẻ thân, tâm.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'06-10 Đỗ Bá, Bãi Biển T20, Phường Mỹ An, Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Việt Nam', 6373),
(N'Bay Capital Danang', 'email4@gmail.com', '1234567890', 1, '0123456789',
 N'Dù quý khách muốn tổ chức một sự kiện hay các dịp kỷ niệm đặc biệt khác, Bay Capital Danang là lựa chọn tuyệt vời cho quý khách với phòng chức năng rộng lớn, được trang bị đầy đủ để sẵn sàng đáp ứng mọi yêu cầu.
 Khách sạn này là lựa chọn hoàn hảo cho các kỳ nghỉ mát lãng mạn hay tuần trăng mật của các cặp đôi. Quý khách hãy tận hưởng những đêm đáng nhớ nhất cùng người thương của mình tại Bay Capital Danang
 Bay Capital Danang là lựa chọn sáng giá dành cho những ai đang tìm kiếm một trải nghiệm xa hoa đầy thú vị trong kỳ nghỉ của mình. Lưu trú tại đây cũng là cách để quý khách chiều chuộng bản thân với những dịch vụ xuất sắc nhất và khiến kỳ nghỉ của mình trở nên thật đáng nhớ.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'17 Quang Trung, Phường Hải Châu 1, Quận Hải Châu, Đà Nẵng, Việt Nam', 6355),
(N'Khu nghỉ dưỡng và Spa Mikazuki Nhật Bản', 'email5@gmail.com', '1234567890', 2, '0123456789',
 N'Từ sự kiện doanh nghiệp đến họp mặt công ty, Da Nang – Mikazuki JAPANESE RESORTS & SPA cung cấp đầy đủ các dịch vụ và tiện nghi đáp ứng mọi nhu cầu của quý khách và đồng nghiệp.
 Dù quý khách muốn tổ chức một sự kiện hay các dịp kỷ niệm đặc biệt khác, Da Nang – Mikazuki JAPANESE RESORTS & SPA là lựa chọn tuyệt vời cho quý khách với phòng chức năng rộng lớn, được trang bị đầy đủ để sẵn sàng đáp ứng mọi yêu cầu.
 Hãy tận hưởng thời gian vui vẻ cùng cả gia đình với hàng loạt tiện nghi giải trí tại Da Nang – Mikazuki JAPANESE RESORTS & SPA, một nơi nghỉ tuyệt vời phù hợp cho mọi kỳ nghỉ bên người thân.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'Đường Nguyễn Tất Thành, Phường Hòa Hiệp Nam, Hòa Hiệp Nam, Liên Chiểu, Đà Nẵng, Việt Nam', 6338);
 -----------------------------------------------------------------------------------------------------------------
 --insert table Hotel_Image --
 select *
 from Hotel_Image

 insert into Hotel_Image(URL,Hotel_ID) values
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-20983969df0ca0525a15f20af9488f4c.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',1),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-ca79c5cfc41762e1963c20b8336afb05.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',1),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-8f5a52e0864d04a9277c4e66e4743f7a.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',1),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-f5552e5aaa82d9d1b8263b741ea12957.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',1),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-a184757c040c218aa85aed6644735011.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',1),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-8f5a52e0864d04a9277c4e66e4743f7a.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',2),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-f5552e5aaa82d9d1b8263b741ea12957.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',2),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-a184757c040c218aa85aed6644735011.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',3),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-ff546280a8f0c3c0b2ad804aac4c43ed.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',3),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-17539952ac6a32cd01069e7168957c07.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',4),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-81ea48bfa3734c1df86250647fa1ac35.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',4),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-20983969df0ca0525a15f20af9488f4c.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',5),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-052ed0915412c18f22667341c5c33c8d.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',5);
 -----------------------------------------------------------------------------------------------------------------
 --insert table Feedback--
 select *
 from Feedback

 insert into Feedback(Customer_ID,Hotel_ID,Rating) values
(1,4,2),
(1,4,3),
(1,1,3),
(1,1,4),
(1,2,1),
(1,3,2),
(1,5,1),
(1,5,2),
(1,5,3),
(1,5,4),
(1,5,3),
(1,5,1),
(1,1,5),
(1,5,5);
 -----------------------------------------------------------------------------------------------------------------
  --insert table Favourite_Hotel--
select *
from Favourite_Hotel

insert into Favourite_Hotel values 
(1,1),
(2,1),
(3,1),
(4,1),
(5,1);
 -----------------------------------------------------------------------------------------------------------------
--insert table Room--
select *
from Room

 INSERT INTO Room (Name, Room_Description, Capacity, Total_Rooms, Price, Hotel_ID) VALUES 
 ('Standard Room', 'This is a cozy room with one king-size bed', 2, 10, 300000, 1),
 ('Deluxe Suite', 'Spacious suite with a separate living area and a king-size bed', 4, 5, 500000, 1),
 ('Family Room', 'Room with two queen-size beds, suitable for families', 4, 3, 2000000, 1);
 ----------------------------------------------------------------------------------------------------------------
 --INSERT INTO Room_Image-
select *
from Room_Image

INSERT INTO Room_Image (Name, URL, Room_ID)
VALUES 
  ('Standard Room Image', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fseashore-hotel-apartment-da-nang.hotelmix.vn%2F&psig=AOvVaw2xNmNbltska2Lk5K-TAFD5&ust=1716947801704000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCMj0zYqfr4YDFQAAAAAdAAAAABAE', 1),  -- Link to Standard Room (ID 1)
  ('Deluxe Suite Image', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fseashore-hotel-apartment-da-nang.hotelmix.vn%2F&psig=AOvVaw2xNmNbltska2Lk5K-TAFD5&ust=1716947801704000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCMj0zYqfr4YDFQAAAAAdAAAAABAE', 1), 
  ('Family Room Image', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fseashore-hotel-apartment-da-nang.hotelmix.vn%2F&psig=AOvVaw2xNmNbltska2Lk5K-TAFD5&ust=1716947801704000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCMj0zYqfr4YDFQAAAAAdAAAAABAE', 1),
  ('Standard Room Image', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fseashore-hotel-apartment-da-nang.hotelmix.vn%2F&psig=AOvVaw2xNmNbltska2Lk5K-TAFD5&ust=1716947801704000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCMj0zYqfr4YDFQAAAAAdAAAAABAE', 2), 
  ('Deluxe Suite Image', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fseashore-hotel-apartment-da-nang.hotelmix.vn%2F&psig=AOvVaw2xNmNbltska2Lk5K-TAFD5&ust=1716947801704000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCMj0zYqfr4YDFQAAAAAdAAAAABAE', 2), 
  ('Family Room Image', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fseashore-hotel-apartment-da-nang.hotelmix.vn%2F&psig=AOvVaw2xNmNbltska2Lk5K-TAFD5&ust=1716947801704000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCMj0zYqfr4YDFQAAAAAdAAAAABAE', 2), 
  ('Standard Room Image', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.booking.com%2Fhotel%2Fvn%2Fseashore-amp-apartment.vi.html&psig=AOvVaw2xNmNbltska2Lk5K-TAFD5&ust=1716947801704000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCMj0zYqfr4YDFQAAAAAdAAAAABBF', 3), 
  ('Deluxe Suite Image', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.booking.com%2Fhotel%2Fvn%2Fseashore-amp-apartment.vi.html&psig=AOvVaw2xNmNbltska2Lk5K-TAFD5&ust=1716947801704000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCMj0zYqfr4YDFQAAAAAdAAAAABBF', 3), 
  ('Family Room Image', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.booking.com%2Fhotel%2Fvn%2Fseashore-amp-apartment.vi.html&psig=AOvVaw2xNmNbltska2Lk5K-TAFD5&ust=1716947801704000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCMj0zYqfr4YDFQAAAAAdAAAAABBF', 3); 
 ----------------------------------------------------------------------------------------------------------------
--INSERT INTO Facility--
select *
from Facility

INSERT INTO Facility (URL, Name)
VALUES ('bx bx-swim', N'Hồ bơi ngoài trời'),
       ('bx bxs-car', N'Xe đưa đón sân bay'),
	   ('bx bxs-edit-alt', N'Phòng không hút thuốc'),
	   ('bx bxs-cart-download', N'Chỗ đỗ xe miễn phí'),
	   ('bx bx-wifi', N'WiFi miễn phí'),
	   ('bx bxs-home-heart', N'Nhà hàng'),
	   ('bx bx-child', N'Lễ tân 24 giờ'),
	   ('bx bxs-wallet', N'Sân thượng / hiên');
----------------------------------------------------------------------------------------------------------------
--INSERT INTO Hotel_Facility--
select * 
from Hotel_Facility

INSERT INTO Hotel_Facility (Hotel_ID, Facility_ID)VALUES
(1, 1),  
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(2, 1),  
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(3, 1),  
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(4, 1),  
(4, 2),
(4, 3),
(4, 4),
(5, 5),
(5, 6),
(5, 7),
(5, 8);
----------------------------------------------------------------------------------------------------------------
--INSERT INTO Service--
select *
from Service 
INSERT INTO Service (Name) VALUES 
(N'Ăn sáng'),
('Buffet');


-- Insert Bed
INSERT INTO Bed (Name, Description, URL) VALUES 
(N'Giường đơn', 'Rộng 90 - 130 cm', 'URL_for_single_bed_image'),
(N'Giường đôi', 'Rộng 131 - 150 cm', 'URL_for_double_bed_image'),
(N'Giường lớn (cỡ King)', 'Rộng 151 - 180 cm', 'URL_for_king_bed_image'),
(N'Giường cực lớn (cỡ Super-king)', 'Rộng 181 - 210 cm', 'URL_for_super_king_bed_image');

-- Inserting data into Room_Bed table
INSERT INTO Room_Bed (Amount, Bed_ID, Room_ID) VALUES (2, 1, 1);
INSERT INTO Room_Bed (Amount, Bed_ID, Room_ID) VALUES (1, 2, 1);
INSERT INTO Room_Bed (Amount, Bed_ID, Room_ID) VALUES (3, 3, 2);
INSERT INTO Room_Bed (Amount, Bed_ID, Room_ID) VALUES (2, 4, 1);
INSERT INTO Room_Bed (Amount, Bed_ID, Room_ID) VALUES (1, 2, 3);
