Use Travelink
GO

--insert table Account--
select *
from Account

INSERT INTO Account (Email, Password, Name, Gender, DateOfBirth, PhoneNumber, Role)
VALUES ('example@email.com', '123', N'Nguyễn Văn Nam', 'M', '1990-01-01', '0912345678',1),
('nguyenlkhde170387@fpt.edu.vn','123',N'Le Kim Hoang Nguyen', 'M', '2003-06-30','0934726073',1);
--insert table Account--

--insert table hotel--
select *
from Hotel

INSERT INTO Hotel (
  Name, Email, Star, PhoneNumber, Description, CheckInTimeStart, CheckInTimeEnd, CheckOutTimeStart, CheckOutTimeEnd, Address, Ward_ID
) VALUES 
(N'Khách sạn và căn hộ Seashore', 'email1@gmail.com', 4, '0123456789',
 N'Dành cho những du khách muốn du lịch thoải mái cùng ngân sách tiết kiệm, Seashore Hotel & Apartment sẽ là lựa chọn lưu trú hoàn hảo, nơi cung cấp các tiện nghi chất lượng và dịch vụ tuyệt vời.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'15-16 Hoàng Sa, Mân Thái, Sơn Trà, Đà Nẵng, Việt Nam', 6372),
(N'Davue Hotel Da Nang', 'email2@gmail.com', 3, '0123456789',
 N'Davue Hotel Da Nang là đề xuất hàng đầu dành cho những tín đồ du lịch "bụi" mong muốn được nghỉ tại một khách sạn vừa thoải mái lại hợp túi tiền.
 Dành cho những du khách muốn du lịch thoải mái cùng ngân sách tiết kiệm, Davue Hotel Da Nang sẽ là lựa chọn lưu trú hoàn hảo, nơi cung cấp các tiện nghi chất lượng và dịch vụ tuyệt vời. \nKhách sạn này là lựa chọn hoàn hảo cho các kỳ nghỉ mát lãng mạn hay tuần trăng mật của các cặp đôi. Quý khách hãy tận hưởng những đêm đáng nhớ nhất cùng người thương của mình tại Davue Hotel Da Nang',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'57-59 Đỗ Bí, Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Việt Nam', 6374),
(N'Cicilia Danang Hotels & Spa Powered by ASTON', 'email3@gmail.com', 3, '0123456789',
 N'Khách sạn này là lựa chọn hoàn hảo cho các kỳ nghỉ mát lãng mạn hay tuần trăng mật của các cặp đôi. Quý khách hãy tận hưởng những đêm đáng nhớ nhất cùng người thương của mình tại Cicilia Danang Hotels & Spa Powered by ASTON.
 Cicilia Danang Hotels & Spa Powered by ASTON là lựa chọn sáng giá dành cho những ai đang tìm kiếm một trải nghiệm xa hoa đầy thú vị trong kỳ nghỉ của mình. Lưu trú tại đây cũng là cách để quý khách chiều chuộng bản thân với những dịch vụ xuất sắc nhất và khiến kỳ nghỉ của mình trở nên thật đáng nhớ.
 Một trong những đặc điểm chính của khách sạn này là các liệu pháp spa đa dạng. Hãy nâng niu bản thân bằng các liệu pháp thư giãn, phục hồi giúp quý khách tươi trẻ thân, tâm.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'06-10 Đỗ Bá, Bãi Biển T20, Phường Mỹ An, Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Việt Nam', 6373),
(N'Bay Capital Danang', 'email4@gmail.com', 1, '0123456789',
 N'Dù quý khách muốn tổ chức một sự kiện hay các dịp kỷ niệm đặc biệt khác, Bay Capital Danang là lựa chọn tuyệt vời cho quý khách với phòng chức năng rộng lớn, được trang bị đầy đủ để sẵn sàng đáp ứng mọi yêu cầu.
 Khách sạn này là lựa chọn hoàn hảo cho các kỳ nghỉ mát lãng mạn hay tuần trăng mật của các cặp đôi. Quý khách hãy tận hưởng những đêm đáng nhớ nhất cùng người thương của mình tại Bay Capital Danang
 Bay Capital Danang là lựa chọn sáng giá dành cho những ai đang tìm kiếm một trải nghiệm xa hoa đầy thú vị trong kỳ nghỉ của mình. Lưu trú tại đây cũng là cách để quý khách chiều chuộng bản thân với những dịch vụ xuất sắc nhất và khiến kỳ nghỉ của mình trở nên thật đáng nhớ.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'17 Quang Trung, Phường Hải Châu 1, Quận Hải Châu, Đà Nẵng, Việt Nam', 6355),
(N'Khu nghỉ dưỡng và Spa Mikazuki Nhật Bản', 'email5@gmail.com', 2, '0123456789',
 N'Từ sự kiện doanh nghiệp đến họp mặt công ty, Da Nang – Mikazuki JAPANESE RESORTS & SPA cung cấp đầy đủ các dịch vụ và tiện nghi đáp ứng mọi nhu cầu của quý khách và đồng nghiệp.
 Dù quý khách muốn tổ chức một sự kiện hay các dịp kỷ niệm đặc biệt khác, Da Nang – Mikazuki JAPANESE RESORTS & SPA là lựa chọn tuyệt vời cho quý khách với phòng chức năng rộng lớn, được trang bị đầy đủ để sẵn sàng đáp ứng mọi yêu cầu.
 Hãy tận hưởng thời gian vui vẻ cùng cả gia đình với hàng loạt tiện nghi giải trí tại Da Nang – Mikazuki JAPANESE RESORTS & SPA, một nơi nghỉ tuyệt vời phù hợp cho mọi kỳ nghỉ bên người thân.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'Đường Nguyễn Tất Thành, Phường Hòa Hiệp Nam, Hòa Hiệp Nam, Liên Chiểu, Đà Nẵng, Việt Nam', 6338),
(N'Da Nang Bay', 'email6@gmail.com', '1234567890', 5, '0123456789',
N'Không chỉ sở hữu vị trí giúp quý khách dễ dàng ghé thăm những địa điểm lý thú trong chuyến hành trình, Da Nang Bay cũng sẽ mang đến cho quý khách trải nghiệm lưu trú mỹ mãn.
Da Nang Bay là đề xuất hàng đầu dành cho những tín đồ du lịch "bụi" mong muốn được nghỉ tại một khách sạn vừa thoải mái lại hợp túi tiền.
Dành cho những du khách muốn du lịch thoải mái cùng ngân sách tiết kiệm, Da Nang Bay sẽ là lựa chọn lưu trú hoàn hảo, nơi cung cấp các tiện nghi chất lượng và dịch vụ tuyệt vời.
Khách sạn này là lựa chọn hoàn hảo cho các kỳ nghỉ mát lãng mạn hay tuần trăng mật của các cặp đôi. Quý khách hãy tận hưởng những đêm đáng nhớ nhất cùng người thương của mình tại Da Nang Bay.
Da Nang Bay là lựa chọn sáng giá dành cho những ai đang tìm kiếm một trải nghiệm xa hoa đầy thú vị trong kỳ nghỉ của mình. Lưu trú tại đây cũng là cách để quý khách chiều chuộng bản thân với những dịch vụ xuất sắc nhất và khiến kỳ nghỉ của mình trở nên thật đáng nhớ.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'52 Võ Nguyên Giáp, Phường Mân Thái, Mân Thái, Sơn Trà, Đà Nẵng, Việt Nam.', 6341),
 (N'Sel de Mer Hotel & Suites', 'email7@gmail.com', '1234567890', 1, '0123456789',
N'Không chỉ sở hữu vị trí giúp quý khách dễ dàng ghé thăm những địa điểm lý thú trong chuyến hành trình, Da Nang Bay cũng sẽ mang đến cho quý khách trải nghiệm lưu trú mỹ mãn.
Da Nang Bay là đề xuất hàng đầu dành cho những tín đồ du lịch "bụi" mong muốn được nghỉ tại một khách sạn vừa thoải mái lại hợp túi tiền.
Dành cho những du khách muốn du lịch thoải mái cùng ngân sách tiết kiệm, Da Nang Bay sẽ là lựa chọn lưu trú hoàn hảo, nơi cung cấp các tiện nghi chất lượng và dịch vụ tuyệt vời.
Khách sạn này là lựa chọn hoàn hảo cho các kỳ nghỉ mát lãng mạn hay tuần trăng mật của các cặp đôi. Quý khách hãy tận hưởng những đêm đáng nhớ nhất cùng người thương của mình tại Da Nang Bay.
Da Nang Bay là lựa chọn sáng giá dành cho những ai đang tìm kiếm một trải nghiệm xa hoa đầy thú vị trong kỳ nghỉ của mình. Lưu trú tại đây cũng là cách để quý khách chiều chuộng bản thân với những dịch vụ xuất sắc nhất và khiến kỳ nghỉ của mình trở nên thật đáng nhớ.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'92 Võ Nguyên Giáp, Mân Thái, Sơn Trà, Đà Nẵng, Việt Nam.', 6345),
(N'Dolphin Hotel and Apartment', 'email8@gmail.com', '1234567890', 3, '0123456789',
N'Không chỉ sở hữu vị trí giúp quý khách dễ dàng ghé thăm những địa điểm lý thú trong chuyến hành trình, Da Nang Bay cũng sẽ mang đến cho quý khách trải nghiệm lưu trú mỹ mãn.
Da Nang Bay là đề xuất hàng đầu dành cho những tín đồ du lịch "bụi" mong muốn được nghỉ tại một khách sạn vừa thoải mái lại hợp túi tiền.
Dành cho những du khách muốn du lịch thoải mái cùng ngân sách tiết kiệm, Da Nang Bay sẽ là lựa chọn lưu trú hoàn hảo, nơi cung cấp các tiện nghi chất lượng và dịch vụ tuyệt vời.
Khách sạn này là lựa chọn hoàn hảo cho các kỳ nghỉ mát lãng mạn hay tuần trăng mật của các cặp đôi. Quý khách hãy tận hưởng những đêm đáng nhớ nhất cùng người thương của mình tại Da Nang Bay.
Da Nang Bay là lựa chọn sáng giá dành cho những ai đang tìm kiếm một trải nghiệm xa hoa đầy thú vị trong kỳ nghỉ của mình. Lưu trú tại đây cũng là cách để quý khách chiều chuộng bản thân với những dịch vụ xuất sắc nhất và khiến kỳ nghỉ của mình trở nên thật đáng nhớ.',
'12:00:00', '22:00:00', '10:00:00', '12:00:00', N'09 Tân Thuận, Mân Thái, Sơn Trà, Đà Nẵng, Việt Nam.', 6350),
(N'Le Sands Oceanfront Danang Hotel', 'email9@gmail.com', '1234567890', 2, '0123456789',
N'Không chỉ sở hữu vị trí giúp quý khách dễ dàng ghé thăm những địa điểm lý thú trong chuyến hành trình, Da Nang Bay cũng sẽ mang đến cho quý khách trải nghiệm lưu trú mỹ mãn.
Da Nang Bay là đề xuất hàng đầu dành cho những tín đồ du lịch "bụi" mong muốn được nghỉ tại một khách sạn vừa thoải mái lại hợp túi tiền.
Dành cho những du khách muốn du lịch thoải mái cùng ngân sách tiết kiệm, Da Nang Bay sẽ là lựa chọn lưu trú hoàn hảo, nơi cung cấp các tiện nghi chất lượng và dịch vụ tuyệt vời.
Khách sạn này là lựa chọn hoàn hảo cho các kỳ nghỉ mát lãng mạn hay tuần trăng mật của các cặp đôi. Quý khách hãy tận hưởng những đêm đáng nhớ nhất cùng người thương của mình tại Da Nang Bay.
Da Nang Bay là lựa chọn sáng giá dành cho những ai đang tìm kiếm một trải nghiệm xa hoa đầy thú vị trong kỳ nghỉ của mình. Lưu trú tại đây cũng là cách để quý khách chiều chuộng bản thân với những dịch vụ xuất sắc nhất và khiến kỳ nghỉ của mình trở nên thật đáng nhớ.',
'12:00:00', '22:00:00', '10:00:00', '12:00:00', N'28 Vo Nguyen Giap, Man Thai, Son Tra, Danang, Mân Thái, Sơn Trà, Đà Nẵng.', 6351),
(N'The Leaf Boutique', 'email10@gmail.com', '1234567890', 5, '0123456789',
N'Không chỉ sở hữu vị trí giúp quý khách dễ dàng ghé thăm những địa điểm lý thú trong chuyến hành trình, Da Nang Bay cũng sẽ mang đến cho quý khách trải nghiệm lưu trú mỹ mãn.
Da Nang Bay là đề xuất hàng đầu dành cho những tín đồ du lịch "bụi" mong muốn được nghỉ tại một khách sạn vừa thoải mái lại hợp túi tiền.
Dành cho những du khách muốn du lịch thoải mái cùng ngân sách tiết kiệm, Da Nang Bay sẽ là lựa chọn lưu trú hoàn hảo, nơi cung cấp các tiện nghi chất lượng và dịch vụ tuyệt vời.
Khách sạn này là lựa chọn hoàn hảo cho các kỳ nghỉ mát lãng mạn hay tuần trăng mật của các cặp đôi. Quý khách hãy tận hưởng những đêm đáng nhớ nhất cùng người thương của mình tại Da Nang Bay.
Da Nang Bay là lựa chọn sáng giá dành cho những ai đang tìm kiếm một trải nghiệm xa hoa đầy thú vị trong kỳ nghỉ của mình. Lưu trú tại đây cũng là cách để quý khách chiều chuộng bản thân với những dịch vụ xuất sắc nhất và khiến kỳ nghỉ của mình trở nên thật đáng nhớ.',
'12:00:00', '22:00:00', '10:00:00', '12:00:00', N'38 Võ Nguyên Giáp, Mân Thái, Sơn Trà, Đà Nẵng, Việt Nam.', 6335),
(N'Hotel Brilliant', 'email11@gmail.com', '1234567890', 4, '0123456789',
 N'Tọa lạc tại khu vực sầm uất của Đà Nẵng, Hotel Brilliant mang đến cho du khách trải nghiệm lưu trú tuyệt vời với dịch vụ chuyên nghiệp và không gian sang trọng.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'162 Bạch Đằng, Hải Châu, Đà Nẵng, Việt Nam', 6356),
(N'Sofia Boutique Hotel', 'email12@gmail.com', '1234567890', 3, '0123456789',
 N'Sofia Boutique Hotel là lựa chọn lý tưởng cho những du khách muốn tận hưởng kỳ nghỉ thoải mái với ngân sách tiết kiệm. Với các dịch vụ chất lượng và tiện nghi hiện đại, khách sạn này hứa hẹn mang đến cho du khách những trải nghiệm đáng nhớ.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'63 Hà Bổng, Phước Mỹ, Sơn Trà, Đà Nẵng, Việt Nam', 6371),
(N'Balcona Hotel Da Nang', 'email13@gmail.com', '1234567890', 5, '0123456789',
 N'Balcona Hotel Da Nang là khách sạn 5 sao sang trọng, mang đến cho du khách những trải nghiệm xa hoa với dịch vụ xuất sắc và không gian đẳng cấp. Hãy tận hưởng những giây phút thư giãn tuyệt vời tại đây.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'288 Võ Nguyên Giáp, Phước Mỹ, Sơn Trà, Đà Nẵng, Việt Nam', 6360),
(N'Diamond Sea Hotel', 'email14@gmail.com', '1234567890', 4, '0123456789',
 N'Diamond Sea Hotel là lựa chọn lý tưởng cho du khách muốn tận hưởng không gian nghỉ dưỡng thoải mái với tầm nhìn tuyệt đẹp ra biển. Khách sạn cung cấp các tiện nghi cao cấp và dịch vụ chuyên nghiệp.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'232 Võ Nguyên Giáp, Phước Mỹ, Sơn Trà, Đà Nẵng, Việt Nam', 6361),
(N'Thanh Lich Hotel', 'email15@gmail.com', '1234567890', 3, '0123456789',
N'Không chỉ sở hữu vị trí giúp quý khách dễ dàng ghé thăm những địa điểm lý thú trong chuyến hành trình, Da Nang Bay cũng sẽ mang đến cho quý khách trải nghiệm lưu trú mỹ mãn.
Da Nang Bay là đề xuất hàng đầu dành cho những tín đồ du lịch "bụi" mong muốn được nghỉ tại một khách sạn vừa thoải mái lại hợp túi tiền.
Dành cho những du khách muốn du lịch thoải mái cùng ngân sách tiết kiệm, Da Nang Bay sẽ là lựa chọn lưu trú hoàn hảo, nơi cung cấp các tiện nghi chất lượng và dịch vụ tuyệt vời.
Khách sạn này là lựa chọn hoàn hảo cho các kỳ nghỉ mát lãng mạn hay tuần trăng mật của các cặp đôi. Quý khách hãy tận hưởng những đêm đáng nhớ nhất cùng người thương của mình tại Da Nang Bay.
Da Nang Bay là lựa chọn sáng giá dành cho những ai đang tìm kiếm một trải nghiệm xa hoa đầy thú vị trong kỳ nghỉ của mình. Lưu trú tại đây cũng là cách để quý khách chiều chuộng bản thân với những dịch vụ xuất sắc nhất và khiến kỳ nghỉ của mình trở nên thật đáng nhớ.',
'12:00:00', '22:00:00', '10:00:00', '12:00:00', N'09 Tân Thuận, Mân Thái, Sơn Trà, Đà Nẵng, Việt Nam.', 6350),
(N'Orange Hotel Da Nang', 'email16@gmail.com', '1234567890', 2, '0123456789',
 N'Orange Hotel Da Nang là lựa chọn phổ biến của du khách muốn khám phá Đà Nẵng với ngân sách tiết kiệm. Khách sạn cung cấp các phòng nghỉ thoải mái và dịch vụ đáng giá, giúp du khách có những trải nghiệm tuyệt vời.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'105 Hoàng Diệu, Hải Châu, Đà Nẵng, Việt Nam', 6358),
(N'Hanoi Golden Hotel', 'email17@gmail.com', '1234567890', 1, '0123456789',
 N'Với vị trí thuận lợi và dịch vụ tận tâm, Hanoi Golden Hotel là lựa chọn phổ biến của du khách khi đến Đà Nẵng. Khách sạn cung cấp các tiện nghi cơ bản nhưng đảm bảo sự thoải mái và tiện lợi cho du khách.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'83 Phạm Văn Đồng, An Hải Bắc, Sơn Trà, Đà Nẵng, Việt Nam', 6362),
(N'Pearl Sea Hotel', 'email18@gmail.com', '1234567890', 3, '0123456789',
 N'Với vị trí tuyệt vời ngay trung tâm thành phố, Pearl Sea Hotel là lựa chọn lý tưởng cho du khách muốn khám phá Đà Nẵng dễ dàng. Khách sạn cung cấp không gian nghỉ ngơi thoải mái và các tiện nghi tiện lợi.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'09 Phan Bội Châu, Hải Châu, Đà Nẵng, Việt Nam', 6359),
(N'New Moon Hotel', 'email19@gmail.com', '1234567890', 2, '0123456789',
 N'New Moon Hotel là lựa chọn phù hợp cho du khách muốn khám phá Đà Nẵng với ngân sách tiết kiệm. Khách sạn cung cấp các phòng nghỉ thoải mái và dịch vụ tận tâm, đem lại cho du khách những trải nghiệm thú vị.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'76-78 Bạch Đằng, Hải Châu, Đà Nẵng, Việt Nam', 6363),
(N'Nhu Minh Plaza Hotel Da Nang', 'email20@gmail.com', '1234567890', 4, '0123456789',
 N'Nhu Minh Plaza Hotel Da Nang mang đến cho du khách trải nghiệm lưu trú sang trọng và đẳng cấp với không gian hiện đại và dịch vụ chuyên nghiệp. Hãy khám phá Đà Nẵng và tận hưởng kỳ nghỉ tuyệt vời tại đây.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'75 Hà Bổng, Phước Mỹ, Sơn Trà, Đà Nẵng, Việt Nam', 6364);
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
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-052ed0915412c18f22667341c5c33c8d.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',5),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-20983969df0ca0525a15f20af9488f4c.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',6),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-ca79c5cfc41762e1963c20b8336afb05.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',7),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-8f5a52e0864d04a9277c4e66e4743f7a.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',8),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-f5552e5aaa82d9d1b8263b741ea12957.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',9),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-a184757c040c218aa85aed6644735011.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',10),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-8f5a52e0864d04a9277c4e66e4743f7a.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',10),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-f5552e5aaa82d9d1b8263b741ea12957.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',9),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-a184757c040c218aa85aed6644735011.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',8),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-ff546280a8f0c3c0b2ad804aac4c43ed.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',7),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-17539952ac6a32cd01069e7168957c07.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',6),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-81ea48bfa3734c1df86250647fa1ac35.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',7),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-20983969df0ca0525a15f20af9488f4c.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',8),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-052ed0915412c18f22667341c5c33c8d.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',9),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-20983969df0ca0525a15f20af9488f4c.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',10),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-ca79c5cfc41762e1963c20b8336afb05.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',10),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-8f5a52e0864d04a9277c4e66e4743f7a.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',2),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-f5552e5aaa82d9d1b8263b741ea12957.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',3),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-a184757c040c218aa85aed6644735011.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',4),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-8f5a52e0864d04a9277c4e66e4743f7a.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',5),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-f5552e5aaa82d9d1b8263b741ea12957.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',6),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-a184757c040c218aa85aed6644735011.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',4),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-ff546280a8f0c3c0b2ad804aac4c43ed.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',2),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-17539952ac6a32cd01069e7168957c07.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',7),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-81ea48bfa3734c1df86250647fa1ac35.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',9),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-20983969df0ca0525a15f20af9488f4c.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',8),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-052ed0915412c18f22667341c5c33c8d.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',1),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-20983969df0ca0525a15f20af9488f4c.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',3),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-ca79c5cfc41762e1963c20b8336afb05.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',2),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-8f5a52e0864d04a9277c4e66e4743f7a.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',4),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-f5552e5aaa82d9d1b8263b741ea12957.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',5),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-a184757c040c218aa85aed6644735011.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',1),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-8f5a52e0864d04a9277c4e66e4743f7a.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',1),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-f5552e5aaa82d9d1b8263b741ea12957.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',7),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-a184757c040c218aa85aed6644735011.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',8),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-ff546280a8f0c3c0b2ad804aac4c43ed.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',7),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-17539952ac6a32cd01069e7168957c07.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',5),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-81ea48bfa3734c1df86250647fa1ac35.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',4),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-20983969df0ca0525a15f20af9488f4c.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',3),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-052ed0915412c18f22667341c5c33c8d.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640',2);
 -----------------------------------------------------------------------------------------------------------------
 --insert table Feedback--
 select *
 from Feedback

 insert into Feedback(Account_ID,Hotel_ID,Rating) values
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
(1,5,5),
(1,6,2),
(1,6,3),
(1,7,3),
(1,7,4),
(1,8,1),
(1,8,2),
(1,9,1),
(1,9,2),
(1,10,3),
(1,10,4),
(1,8,3),
(1,9,1),
(1,10,5),
(1,7,5),
(2,4,2),
(2,4,3),
(2,1,3),
(2,1,4),
(2,2,1),
(2,3,2),
(2,5,1),
(2,5,2),
(2,5,3),
(2,5,4),
(2,5,3),
(2,5,1),
(2,1,5),
(2,5,5),
(2,6,2),
(2,6,3),
(2,7,3),
(2,7,4),
(2,8,1),
(2,8,2),
(2,9,1),
(2,9,2),
(2,10,3),
(2,10,4),
(2,8,3),
(2,9,1),
(2,10,5),
(2,7,5);
 -----------------------------------------------------------------------------------------------------------------
  --insert table Favourite_Hotel--
select *
from Favourite_Hotel

insert into Favourite_Hotel values 
(1,1),
(2,1),
(3,1),
(4,1),
(5,1),
(6,1),
(7,1),
(8,1),
(9,1),
(10,1);

insert into Favourite_Hotel values 
(1,2),
(2,2),
(3,2),
(6,2),
(7,2),
(8,2),
(9,2),
(10,2);
 -----------------------------------------------------------------------------------------------------------------
--insert table Room--
select *
from Room

INSERT INTO Room (Name, Room_Description, Capacity, Total_Rooms, Price, Hotel_ID) VALUES
-- Hotel_ID 1
('Standard Room', 'This is a cozy room with one king-size bed', 2, 10, 300000, 1),
('Deluxe Suite', 'Spacious suite with a separate living area and a king-size bed', 4, 5, 500000, 1),
('Family Room', 'Room with two queen-size beds, suitable for families', 4, 3, 2000000, 1),
-- Hotel_ID 2
('Executive Room', 'Modern room with executive facilities and one queen-size bed', 2, 15, 400000, 2),
('Presidential Suite', 'Luxury suite with two bedrooms and a private pool', 6, 2, 1500000, 2),
('Junior Suite', 'Suite with a seating area and a queen-size bed', 3, 8, 450000, 2),
-- Hotel_ID 3
('Single Room', 'Compact room with a single bed, perfect for solo travelers', 1, 12, 250000, 3),
('Double Room', 'Room with a double bed, ideal for couples', 2, 20, 350000, 3),
('Triple Room', 'Room with three single beds, suitable for friends', 3, 5, 500000, 3),
-- Hotel_ID 4
('Luxury Suite', 'Elegant suite with luxurious amenities and a king-size bed', 2, 3, 1200000, 4),
('Budget Room', 'Economical room with basic facilities and a single bed', 1, 25, 200000, 4),
('Superior Room', 'Upgraded room with additional amenities and a queen-size bed', 2, 15, 550000, 4),
-- Hotel_ID 5
('Comfort Room', 'Comfortable room with modern furnishings and a double bed', 2, 18, 400000, 5),
('Penthouse Suite', 'Top-floor suite with panoramic views and luxury features', 4, 1, 2500000, 5),
('Studio Room', 'Open-plan room with a kitchenette and a queen-size bed', 2, 10, 600000, 5),
-- Hotel_ID 6
('Economy Room', 'Affordable room with essential amenities and a single bed', 1, 30, 180000, 6),
('Grand Suite', 'Large suite with separate living and dining areas', 4, 4, 1700000, 6),
-- Hotel_ID 7
('Business Room', 'Room with a work desk and business facilities, single bed', 1, 15, 380000, 7),
('Romantic Suite', 'Suite with a romantic setting and a king-size bed', 2, 6, 1000000, 7),
('Twin Room', 'Room with two single beds, suitable for friends', 2, 12, 350000, 7),
('Queen Room', 'Room with a queen-size bed and a beautiful view', 2, 20, 500000, 7),
-- Hotel_ID 8
('Deluxe Room', 'High-end room with deluxe amenities and a double bed', 2, 10, 600000, 8),
('Honeymoon Suite', 'Special suite for honeymooners with luxury features', 2, 4, 1200000, 8),
('Quad Room', 'Room with four single beds, ideal for groups', 4, 5, 700000, 8),
-- Hotel_ID 9
('Standard Twin Room', 'Room with two single beds and basic facilities', 2, 20, 320000, 9),
('King Suite', 'Spacious suite with a king-size bed and additional amenities', 3, 7, 800000, 9),
('Family Suite', 'Large suite with two bedrooms, perfect for families', 6, 3, 1500000, 9),
-- Hotel_ID 10
('Superior Suite', 'Luxurious suite with superior amenities and a queen-size bed', 2, 5, 900000, 10),
('Classic Room', 'Room with classic decor and a double bed', 2, 18, 400000, 10),
('Premium Room', 'Premium room with additional features and a king-size bed', 2, 10, 750000, 10);

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

INSERT INTO Room_Image (Name, URL, Room_ID)
VALUES 
    -- Room_ID 1
    ('Standard Room Image 1', 'https://example.com/images/standard-room1.jpg', 1),
    ('Standard Room Image 2', 'https://example.com/images/standard-room2.jpg', 1),
    ('Standard Room Image 3', 'https://example.com/images/standard-room3.jpg', 1),
    ('Standard Room Image 4', 'https://example.com/images/standard-room4.jpg', 1),
    ('Standard Room Image 5', 'https://example.com/images/standard-room5.jpg', 1),
    -- Room_ID 2
    ('Executive Room Image 1', 'https://example.com/images/executive-room1.jpg', 2),
    ('Executive Room Image 2', 'https://example.com/images/executive-room2.jpg', 2),
    ('Executive Room Image 3', 'https://example.com/images/executive-room3.jpg', 2),
    ('Executive Room Image 4', 'https://example.com/images/executive-room4.jpg', 2),
    ('Executive Room Image 5', 'https://example.com/images/executive-room5.jpg', 2),
    -- Room_ID 3
    ('Single Room Image 1', 'https://example.com/images/single-room1.jpg', 3),
    ('Single Room Image 2', 'https://example.com/images/single-room2.jpg', 3),
    ('Single Room Image 3', 'https://example.com/images/single-room3.jpg', 3),
    ('Single Room Image 4', 'https://example.com/images/single-room4.jpg', 3),
    ('Single Room Image 5', 'https://example.com/images/single-room5.jpg', 3),
    -- Room_ID 4
    ('Luxury Suite Image 1', 'https://example.com/images/luxury-suite1.jpg', 4),
    ('Luxury Suite Image 2', 'https://example.com/images/luxury-suite2.jpg', 4),
    ('Luxury Suite Image 3', 'https://example.com/images/luxury-suite3.jpg', 4),
    ('Luxury Suite Image 4', 'https://example.com/images/luxury-suite4.jpg', 4),
    ('Luxury Suite Image 5', 'https://example.com/images/luxury-suite5.jpg', 4),
    -- Room_ID 5
    ('Comfort Room Image 1', 'https://example.com/images/comfort-room1.jpg', 5),
    ('Comfort Room Image 2', 'https://example.com/images/comfort-room2.jpg', 5),
    ('Comfort Room Image 3', 'https://example.com/images/comfort-room3.jpg', 5),
    ('Comfort Room Image 4', 'https://example.com/images/comfort-room4.jpg', 5),
    ('Comfort Room Image 5', 'https://example.com/images/comfort-room5.jpg', 5),
    -- Room_ID 6
    ('Economy Room Image 1', 'https://example.com/images/economy-room1.jpg', 6),
    ('Economy Room Image 2', 'https://example.com/images/economy-room2.jpg', 6),
    ('Economy Room Image 3', 'https://example.com/images/economy-room3.jpg', 6),
    ('Economy Room Image 4', 'https://example.com/images/economy-room4.jpg', 6),
    ('Economy Room Image 5', 'https://example.com/images/economy-room5.jpg', 6),
    -- Room_ID 7
    ('Business Room Image 1', 'https://example.com/images/business-room1.jpg', 7),
    ('Business Room Image 2', 'https://example.com/images/business-room2.jpg', 7),
    ('Business Room Image 3', 'https://example.com/images/business-room3.jpg', 7),
    ('Business Room Image 4', 'https://example.com/images/business-room4.jpg', 7),
    ('Business Room Image 5', 'https://example.com/images/business-room5.jpg', 7),
    -- Room_ID 8
    ('Deluxe Room Image 1', 'https://example.com/images/deluxe-room1.jpg', 8),
    ('Deluxe Room Image 2', 'https://example.com/images/deluxe-room2.jpg', 8),
    ('Deluxe Room Image 3', 'https://example.com/images/deluxe-room3.jpg', 8),
    ('Deluxe Room Image 4', 'https://example.com/images/deluxe-room4.jpg', 8),
    ('Deluxe Room Image 5', 'https://example.com/images/deluxe-room5.jpg', 8),
    -- Room_ID 9
    ('Standard Twin Room Image 1', 'https://example.com/images/standard-twin-room1.jpg', 9),
    ('Standard Twin Room Image 2', 'https://example.com/images/standard-twin-room2.jpg', 9),
    ('Standard Twin Room Image 3', 'https://example.com/images/standard-twin-room3.jpg', 9),
    ('Standard Twin Room Image 4', 'https://example.com/images/standard-twin-room4.jpg', 9),
    ('Standard Twin Room Image 5', 'https://example.com/images/standard-twin-room5.jpg', 9),
    -- Room_ID 10
    ('Superior Suite Image 1', 'https://example.com/images/superior-suite1.jpg', 10),
    ('Superior Suite Image 2', 'https://example.com/images/superior-suite2.jpg', 10),
    ('Superior Suite Image 3', 'https://example.com/images/superior-suite3.jpg', 10),
    ('Superior Suite Image 4', 'https://example.com/images/superior-suite4.jpg', 10),
    ('Superior Suite Image 5', 'https://example.com/images/superior-suite5.jpg', 10);

 ----------------------------------------------------------------------------------------------------------------
--INSERT INTO Facility--
select *
from Facility

INSERT INTO Facility (URL, Name)
VALUES 
    ('bx bx-swim', N'Hồ bơi ngoài trời'),
    ('bx bxs-car', N'Xe đưa đón sân bay'),
    ('bx bxs-edit-alt', N'Phòng không hút thuốc'),
    ('bx bxs-cart-download', N'Chỗ đỗ xe miễn phí'),
    ('bx bx-wifi', N'WiFi miễn phí'),
    ('bx bxs-home-heart', N'Nhà hàng'),
    ('bx bx-child', N'Lễ tân 24 giờ'),
    ('bx bxs-wallet', N'Sân thượng / hiên'),
    ('bx bx-dumbbell', N'Phòng gym'),
    ('bx bx-spa', N'Spa & Wellness'),
    ('bx bxs-hot', N'Sauna'),
    ('bx bx-drink', N'Quầy bar'),
    ('bx bx-cab', N'Dịch vụ taxi'),
    ('bx bx-coffee', N'Quán cà phê'),
    ('bx bx-tv', N'TV màn hình phẳng'),
    ('bx bx-bed', N'Giường phụ'),
    ('bx bx-shield-quarter', N'Bảo vệ 24 giờ'),
    ('bx bxs-bath', N'Bồn tắm'),
    ('bx bx-bus', N'Dịch vụ xe buýt'),
    ('bx bxs-gas-pump', N'Trạm xăng'),
    ('bx bx-hotel', N'Khách sạn'),
    ('bx bx-shopping-bag', N'Cửa hàng quà tặng'),
    ('bx bx-gift', N'Dịch vụ quà tặng'),
    ('bx bx-landscape', N'Vườn'),
    ('bx bx-parking', N'Bãi đỗ xe'),
    ('bx bx-bicycle', N'Dịch vụ cho thuê xe đạp'),
    ('bx bx-restaurant', N'Khu ẩm thực'),
    ('bx bx-money', N'Máy ATM');
----------------------------------------------------------------------------------------------------------------
--INSERT INTO Hotel_Facility--
select * 
from Hotel_Facility

INSERT INTO Hotel_Facility (Hotel_ID, Facility_ID) 
VALUES
-- Hotel_ID 1
(1, 1),  
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
-- Hotel_ID 2
(2, 1),  
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 12),
(2, 13),
(2, 14),
(2, 15),
(2, 16),
(2, 17),
(2, 18),
-- Hotel_ID 3
(3, 1),  
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(3, 9),
(3, 10),
(3, 11),
(3, 12),
(3, 13),
(3, 14),
(3, 15),
(3, 16),
(3, 17),
(3, 18),
-- Hotel_ID 4
(4, 1),  
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 6),
(4, 7),
(4, 8),
(4, 9),
(4, 10),
(4, 11),
(4, 12),
(4, 13),
(4, 14),
(4, 15),
(4, 16),
(4, 17),
(4, 18),
-- Hotel_ID 5
(5, 1),  
(5, 2),
(5, 3),
(5, 4),
(5, 5),
(5, 6),
(5, 7),
(5, 8),
(5, 9),
(5, 10),
(5, 11),
(5, 12),
(5, 13),
(5, 14),
(5, 15),
(5, 16),
(5, 17),
(5, 18),
-- Hotel_ID 6
(6, 1),  
(6, 2),
(6, 3),
(6, 4),
(6, 5),
(6, 6),
(6, 7),
(6, 8),
(6, 9),
(6, 10),
(6, 11),
(6, 12),
(6, 13),
(6, 14),
(6, 15),
(6, 16),
(6, 17),
(6, 18),
-- Hotel_ID 7
(7, 1),  
(7, 2),
(7, 3),
(7, 4),
(7, 5),
(7, 6),
(7, 7),
(7, 8),
(7, 9),
(7, 10),
(7, 11),
(7, 12),
(7, 13),
(7, 14),
(7, 15),
(7, 16),
(7, 17),
(7, 18),
-- Hotel_ID 8
(8, 1),  
(8, 2),
(8, 3),
(8, 4),
(8, 5),
(8, 6),
(8, 7),
(8, 8),
(8, 9),
(8, 10),
(8, 11),
(8, 12),
(8, 13),
(8, 14),
(8, 15),
(8, 16),
(8, 17),
(8, 18),
-- Hotel_ID 9
(9, 1),  
(9, 2),
(9, 3),
(9, 4),
(9, 5),
(9, 6),
(9, 7),
(9, 8),
(9, 9),
(9, 10),
(9, 11),
(9, 12),
(9, 13),
(9, 14),
(9, 15),
(9, 16),
(9, 17),
(9, 18),
-- Hotel_ID 10
(10, 1),  
(10, 2),
(10, 3),
(10, 4),
(10, 5),
(10, 6),
(10, 7),
(10, 8),
(10, 9),
(10, 10),
(10, 11),
(10, 12),
(10, 13),
(10, 14),
(10, 15),
(10, 16),
(10, 17),
(10, 18);

----------------------------------------------------------------------------------------------------------------
--INSERT INTO Service--
select *
from Service 
INSERT INTO Service (Name) VALUES 
(N'Ăn sáng'),
('Buffet'),
('Airport Shuttle');

----------------------------------------------------------------------------------------------------------------
-- Insert Bed
INSERT INTO Bed (Bed_ID,Name, Description, URL) VALUES 
(1,N'Giường đơn', 'Rộng 90 - 130 cm', 'URL_for_single_bed_image'),
(2,N'Giường đôi', 'Rộng 131 - 150 cm', 'URL_for_double_bed_image'),
(3,N'Giường lớn (cỡ King)', 'Rộng 151 - 180 cm', 'URL_for_king_bed_image'),
(4,N'Giường cực lớn (cỡ Super-king)', 'Rộng 181 - 210 cm', 'URL_for_super_king_bed_image');
select *
from Bed
----------------------------------------------------------------------------------------------------------------
-- Inserting data into Room_Bed table
INSERT INTO Room_Bed (Room_Bed_ID,Amount, Bed_ID, Room_ID) VALUES 
(1,2, 1, 1),
(2,1, 2, 1),
(3,3, 3, 2),
(4,2, 4, 1),
(5,1, 2, 3);

----------------------------------------------------------------------------------------------------------------

INSERT INTO Hotel_Service (Hotel_ID, Service_ID, Price)
VALUES
(1, 1, 50), -- Hotel A - Room Cleaning
(1, 2, 20), -- Hotel A - Breakfast
(2, 2, 15), -- Hotel B - Breakfast
(2, 3, 30); -- Hotel B - Airport Shuttle
----------------------------------------------------------------------------------------------------------------
select *
from Reservation
INSERT INTO Reservation (Reservation_Date, Number_of_guests, CheckInDate, CheckOutDate, Total_Price, Payment_Method, Status, Customer_ID)
VALUES
('2024-06-01', 2, '2024-06-10', '2024-06-15', 3500.00, 'Credit Card', 'Paid', 1),
('2024-06-02', 1, '2024-06-12', '2024-06-14', 1250.00, 'Cash', 'Not Paid', 1),
('2024-06-03', 3, '2024-06-20', '2024-06-25', 5100.00, 'Credit Card', 'Cancel', 1);
----------------------------------------------------------------------------------------------------------------
INSERT INTO Reserved_Service (AmountOfDays, Reservation_ID, Hotel_Service_ID)
VALUES
(5, 1, 1), -- Reservation 1 includes Room Cleaning at Hotel A
(3, 2, 2), -- Reservation 2 includes Breakfast at Hotel A
(6, 3, 4); -- Reservation 3 includes Airport Shuttle at Hotel B
