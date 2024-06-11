Use Travelink
GO

--insert table Account--
select *
from Account

INSERT INTO Account (Email, Password, Name, Gender, DateOfBirth, PhoneNumber,AvatarURL, Role)
VALUES 
('example@email.com', '123', N'Nguyễn Văn Nam', 'M', '1990-01-01', '0912345678','/Travelink/img_Avatar/avatar_default.jpg',1),
('nguyenlkhde170387@fpt.edu.vn','123',N'Le Kim Hoang Nguyen', 'M', '2003-06-30','0934726073','/Travelink/img_Avatar/avatar_default.jpg',1),
('example1@fpt.edu.vn','123',N'Hoang Cong Minh', 'M', '2003-06-30','0934726073','/Travelink/img_Avatar/Screenshot 2024-05-18 231810.png',1),
('example2@fpt.edu.vn','123',N'Pham Trong Hung', 'M', '2003-06-30','0934726073','/Travelink/img_Avatar/Screenshot 2024-05-31 212127.png',1),
('example3@fpt.edu.vn','123',N'Nguyen Van Duy An', 'M', '2003-06-30','0934726073','/Travelink/img_Avatar/Screenshot 2024-05-23 123209.png',1),
('example4@fpt.edu.vn','123',N'Nguyen Dinh Hoang Hai', 'M', '2003-06-30','0934726073','/Travelink/img_Avatar/Screenshot 2024-05-18 231843.png',1);
--insert table Account--

--insert table hotel--
select *
from Hotel

INSERT INTO Hotel (
  Name, Email, Star, PhoneNumber, Description, CheckInTimeStart, CheckInTimeEnd, CheckOutTimeStart, CheckOutTimeEnd, Address, Ward_ID
) VALUES 

--da nang--
(N'Khách sạn và căn hộ Seashore', 'email1@gmail.com', 4, '0123456789',
 N'Dành cho những du khách muốn du lịch thoải mái cùng ngân sách tiết kiệm, Seashore Hotel & Apartment sẽ là lựa chọn lưu trú hoàn hảo, nơi cung cấp các tiện nghi chất lượng và dịch vụ tuyệt vời.
 Dành cho những du khách muốn du lịch thoải mái cùng ngân sách tiết kiệm, Davue Hotel Da Nang sẽ là lựa chọn lưu trú hoàn hảo, nơi cung cấp các tiện nghi chất lượng và dịch vụ tuyệt vời.
 Khách sạn này là lựa chọn hoàn hảo cho các kỳ nghỉ mát lãng mạn hay tuần trăng mật của các cặp đôi. Quý khách hãy tận hưởng những đêm đáng nhớ nhất cùng người thương của mình tại Davue Hotel Da Nang.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'15-16 Hoàng Sa, Mân Thái, Sơn Trà, Đà Nẵng, Việt Nam', 6337),
(N'Davue Hotel Da Nang', 'email2@gmail.com', 3, '0123456789',
 N'Davue Hotel Da Nang là đề xuất hàng đầu dành cho những tín đồ du lịch "bụi" mong muốn được nghỉ tại một khách sạn vừa thoải mái lại hợp túi tiền.
 Dành cho những du khách muốn du lịch thoải mái cùng ngân sách tiết kiệm, Davue Hotel Da Nang sẽ là lựa chọn lưu trú hoàn hảo, nơi cung cấp các tiện nghi chất lượng và dịch vụ tuyệt vời.
 Khách sạn này là lựa chọn hoàn hảo cho các kỳ nghỉ mát lãng mạn hay tuần trăng mật của các cặp đôi. Quý khách hãy tận hưởng những đêm đáng nhớ nhất cùng người thương của mình tại Davue Hotel Da Nang',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'57-59 Đỗ Bí, Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Việt Nam', 6337),
(N'Cicilia Danang Hotels & Spa Powered by ASTON', 'email3@gmail.com', 3, '0123456789',
 N'Khách sạn này là lựa chọn hoàn hảo cho các kỳ nghỉ mát lãng mạn hay tuần trăng mật của các cặp đôi. Quý khách hãy tận hưởng những đêm đáng nhớ nhất cùng người thương của mình tại Cicilia Danang Hotels & Spa Powered by ASTON.
 Cicilia Danang Hotels & Spa Powered by ASTON là lựa chọn sáng giá dành cho những ai đang tìm kiếm một trải nghiệm xa hoa đầy thú vị trong kỳ nghỉ của mình. Lưu trú tại đây cũng là cách để quý khách chiều chuộng bản thân với những dịch vụ xuất sắc nhất và khiến kỳ nghỉ của mình trở nên thật đáng nhớ.
 Một trong những đặc điểm chính của khách sạn này là các liệu pháp spa đa dạng. Hãy nâng niu bản thân bằng các liệu pháp thư giãn, phục hồi giúp quý khách tươi trẻ thân, tâm.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'06-10 Đỗ Bá, Bãi Biển T20, Phường Mỹ An, Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Việt Nam', 6337),
(N'Bay Capital Danang', 'email4@gmail.com', 1, '0123456789',
 N'Dù quý khách muốn tổ chức một sự kiện hay các dịp kỷ niệm đặc biệt khác, Bay Capital Danang là lựa chọn tuyệt vời cho quý khách với phòng chức năng rộng lớn, được trang bị đầy đủ để sẵn sàng đáp ứng mọi yêu cầu.
 Khách sạn này là lựa chọn hoàn hảo cho các kỳ nghỉ mát lãng mạn hay tuần trăng mật của các cặp đôi. Quý khách hãy tận hưởng những đêm đáng nhớ nhất cùng người thương của mình tại Bay Capital Danang
 Bay Capital Danang là lựa chọn sáng giá dành cho những ai đang tìm kiếm một trải nghiệm xa hoa đầy thú vị trong kỳ nghỉ của mình. Lưu trú tại đây cũng là cách để quý khách chiều chuộng bản thân với những dịch vụ xuất sắc nhất và khiến kỳ nghỉ của mình trở nên thật đáng nhớ.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'17 Quang Trung, Phường Hải Châu 1, Quận Hải Châu, Đà Nẵng, Việt Nam', 6337),
(N'Khu nghỉ dưỡng và Spa Mikazuki Nhật Bản', 'email5@gmail.com', 2, '0123456789',
 N'Từ sự kiện doanh nghiệp đến họp mặt công ty, Da Nang – Mikazuki JAPANESE RESORTS & SPA cung cấp đầy đủ các dịch vụ và tiện nghi đáp ứng mọi nhu cầu của quý khách và đồng nghiệp.
 Dù quý khách muốn tổ chức một sự kiện hay các dịp kỷ niệm đặc biệt khác, Da Nang – Mikazuki JAPANESE RESORTS & SPA là lựa chọn tuyệt vời cho quý khách với phòng chức năng rộng lớn, được trang bị đầy đủ để sẵn sàng đáp ứng mọi yêu cầu.
 Hãy tận hưởng thời gian vui vẻ cùng cả gia đình với hàng loạt tiện nghi giải trí tại Da Nang – Mikazuki JAPANESE RESORTS & SPA, một nơi nghỉ tuyệt vời phù hợp cho mọi kỳ nghỉ bên người thân.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'Đường Nguyễn Tất Thành, Phường Hòa Hiệp Nam, Hòa Hiệp Nam, Liên Chiểu, Đà Nẵng, Việt Nam', 6337),
(N'Da Nang Bay', 'email6@gmail.com', 5, '0123456789',
N'Không chỉ sở hữu vị trí giúp quý khách dễ dàng ghé thăm những địa điểm lý thú trong chuyến hành trình, Da Nang Bay cũng sẽ mang đến cho quý khách trải nghiệm lưu trú mỹ mãn.
Da Nang Bay là đề xuất hàng đầu dành cho những tín đồ du lịch "bụi" mong muốn được nghỉ tại một khách sạn vừa thoải mái lại hợp túi tiền.
Dành cho những du khách muốn du lịch thoải mái cùng ngân sách tiết kiệm, Da Nang Bay sẽ là lựa chọn lưu trú hoàn hảo, nơi cung cấp các tiện nghi chất lượng và dịch vụ tuyệt vời.
Khách sạn này là lựa chọn hoàn hảo cho các kỳ nghỉ mát lãng mạn hay tuần trăng mật của các cặp đôi. Quý khách hãy tận hưởng những đêm đáng nhớ nhất cùng người thương của mình tại Da Nang Bay.
Da Nang Bay là lựa chọn sáng giá dành cho những ai đang tìm kiếm một trải nghiệm xa hoa đầy thú vị trong kỳ nghỉ của mình. Lưu trú tại đây cũng là cách để quý khách chiều chuộng bản thân với những dịch vụ xuất sắc nhất và khiến kỳ nghỉ của mình trở nên thật đáng nhớ.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'52 Võ Nguyên Giáp, Phường Mân Thái, Mân Thái, Sơn Trà, Đà Nẵng, Việt Nam.', 6337),
 (N'Sel de Mer Hotel & Suites', 'email7@gmail.com', 1, '0123456789',
N'Không chỉ sở hữu vị trí giúp quý khách dễ dàng ghé thăm những địa điểm lý thú trong chuyến hành trình, Da Nang Bay cũng sẽ mang đến cho quý khách trải nghiệm lưu trú mỹ mãn.
Da Nang Bay là đề xuất hàng đầu dành cho những tín đồ du lịch "bụi" mong muốn được nghỉ tại một khách sạn vừa thoải mái lại hợp túi tiền.
Dành cho những du khách muốn du lịch thoải mái cùng ngân sách tiết kiệm, Da Nang Bay sẽ là lựa chọn lưu trú hoàn hảo, nơi cung cấp các tiện nghi chất lượng và dịch vụ tuyệt vời.
Khách sạn này là lựa chọn hoàn hảo cho các kỳ nghỉ mát lãng mạn hay tuần trăng mật của các cặp đôi. Quý khách hãy tận hưởng những đêm đáng nhớ nhất cùng người thương của mình tại Da Nang Bay.
Da Nang Bay là lựa chọn sáng giá dành cho những ai đang tìm kiếm một trải nghiệm xa hoa đầy thú vị trong kỳ nghỉ của mình. Lưu trú tại đây cũng là cách để quý khách chiều chuộng bản thân với những dịch vụ xuất sắc nhất và khiến kỳ nghỉ của mình trở nên thật đáng nhớ.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'92 Võ Nguyên Giáp, Mân Thái, Sơn Trà, Đà Nẵng, Việt Nam.', 6337),
(N'Dolphin Hotel and Apartment', 'email8@gmail.com', 3, '0123456789',
N'Không chỉ sở hữu vị trí giúp quý khách dễ dàng ghé thăm những địa điểm lý thú trong chuyến hành trình, Da Nang Bay cũng sẽ mang đến cho quý khách trải nghiệm lưu trú mỹ mãn.
Da Nang Bay là đề xuất hàng đầu dành cho những tín đồ du lịch "bụi" mong muốn được nghỉ tại một khách sạn vừa thoải mái lại hợp túi tiền.
Dành cho những du khách muốn du lịch thoải mái cùng ngân sách tiết kiệm, Da Nang Bay sẽ là lựa chọn lưu trú hoàn hảo, nơi cung cấp các tiện nghi chất lượng và dịch vụ tuyệt vời.
Khách sạn này là lựa chọn hoàn hảo cho các kỳ nghỉ mát lãng mạn hay tuần trăng mật của các cặp đôi. Quý khách hãy tận hưởng những đêm đáng nhớ nhất cùng người thương của mình tại Da Nang Bay.
Da Nang Bay là lựa chọn sáng giá dành cho những ai đang tìm kiếm một trải nghiệm xa hoa đầy thú vị trong kỳ nghỉ của mình. Lưu trú tại đây cũng là cách để quý khách chiều chuộng bản thân với những dịch vụ xuất sắc nhất và khiến kỳ nghỉ của mình trở nên thật đáng nhớ.',
'12:00:00', '22:00:00', '10:00:00', '12:00:00', N'09 Tân Thuận, Mân Thái, Sơn Trà, Đà Nẵng, Việt Nam.', 6337),
(N'Le Sands Oceanfront Danang Hotel', 'email9@gmail.com', 2, '0123456789',
N'Không chỉ sở hữu vị trí giúp quý khách dễ dàng ghé thăm những địa điểm lý thú trong chuyến hành trình, Da Nang Bay cũng sẽ mang đến cho quý khách trải nghiệm lưu trú mỹ mãn.
Da Nang Bay là đề xuất hàng đầu dành cho những tín đồ du lịch "bụi" mong muốn được nghỉ tại một khách sạn vừa thoải mái lại hợp túi tiền.
Dành cho những du khách muốn du lịch thoải mái cùng ngân sách tiết kiệm, Da Nang Bay sẽ là lựa chọn lưu trú hoàn hảo, nơi cung cấp các tiện nghi chất lượng và dịch vụ tuyệt vời.
Khách sạn này là lựa chọn hoàn hảo cho các kỳ nghỉ mát lãng mạn hay tuần trăng mật của các cặp đôi. Quý khách hãy tận hưởng những đêm đáng nhớ nhất cùng người thương của mình tại Da Nang Bay.
Da Nang Bay là lựa chọn sáng giá dành cho những ai đang tìm kiếm một trải nghiệm xa hoa đầy thú vị trong kỳ nghỉ của mình. Lưu trú tại đây cũng là cách để quý khách chiều chuộng bản thân với những dịch vụ xuất sắc nhất và khiến kỳ nghỉ của mình trở nên thật đáng nhớ.',
'12:00:00', '22:00:00', '10:00:00', '12:00:00', N'28 Vo Nguyen Giap, Man Thai, Son Tra, Danang, Mân Thái, Sơn Trà, Đà Nẵng.', 6337),
(N'The Leaf Boutique', 'email10@gmail.com', 5, '0123456789',
N'Không chỉ sở hữu vị trí giúp quý khách dễ dàng ghé thăm những địa điểm lý thú trong chuyến hành trình, Da Nang Bay cũng sẽ mang đến cho quý khách trải nghiệm lưu trú mỹ mãn.
Da Nang Bay là đề xuất hàng đầu dành cho những tín đồ du lịch "bụi" mong muốn được nghỉ tại một khách sạn vừa thoải mái lại hợp túi tiền.
Dành cho những du khách muốn du lịch thoải mái cùng ngân sách tiết kiệm, Da Nang Bay sẽ là lựa chọn lưu trú hoàn hảo, nơi cung cấp các tiện nghi chất lượng và dịch vụ tuyệt vời.
Khách sạn này là lựa chọn hoàn hảo cho các kỳ nghỉ mát lãng mạn hay tuần trăng mật của các cặp đôi. Quý khách hãy tận hưởng những đêm đáng nhớ nhất cùng người thương của mình tại Da Nang Bay.
Da Nang Bay là lựa chọn sáng giá dành cho những ai đang tìm kiếm một trải nghiệm xa hoa đầy thú vị trong kỳ nghỉ của mình. Lưu trú tại đây cũng là cách để quý khách chiều chuộng bản thân với những dịch vụ xuất sắc nhất và khiến kỳ nghỉ của mình trở nên thật đáng nhớ.',
'12:00:00', '22:00:00', '10:00:00', '12:00:00', N'38 Võ Nguyên Giáp, Mân Thái, Sơn Trà, Đà Nẵng, Việt Nam.', 6337),

--Ho Chi Minh-
(N'Hotel Brilliant', 'email11@gmail.com', 4, '0123456789',
 N'Tọa lạc tại khu vực sầm uất của Đà Nẵng, Hotel Brilliant mang đến cho du khách trải nghiệm lưu trú tuyệt vời với dịch vụ chuyên nghiệp và không gian sang trọng.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'22 Lý Chính Thắng, Vo Thi Sau, Quận 3, Thành phố Hồ Chí Minh, Việt Nam',8670 ),
(N'Sofia Boutique Hotel', 'email12@gmail.com', 3, '0123456789',
 N'Sofia Boutique Hotel là lựa chọn lý tưởng cho những du khách muốn tận hưởng kỳ nghỉ thoải mái với ngân sách tiết kiệm. Với các dịch vụ chất lượng và tiện nghi hiện đại, khách sạn này hứa hẹn mang đến cho du khách những trải nghiệm đáng nhớ.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'150 Hoa Minh, Vo Thi Sau, Quận 4, Thành phố Hồ Chí Minh, Việt Nam',8670 ),
(N'Balcona Hotel Da Nang', 'email13@gmail.com', 5, '0123456789',
 N'Balcona Hotel Da Nang là khách sạn 5 sao sang trọng, mang đến cho du khách những trải nghiệm xa hoa với dịch vụ xuất sắc và không gian đẳng cấp. Hãy tận hưởng những giây phút thư giãn tuyệt vời tại đây.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'15 Tố Hữu, Vo Thi Sau, Quận 9, Thành phố Hồ Chí Minh, Việt Nam', 8670),
(N'Diamond Sea Hotel', 'email14@gmail.com', 4, '0123456789',
 N'Diamond Sea Hotel là lựa chọn lý tưởng cho du khách muốn tận hưởng không gian nghỉ dưỡng thoải mái với tầm nhìn tuyệt đẹp ra biển. Khách sạn cung cấp các tiện nghi cao cấp và dịch vụ chuyên nghiệp.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'15 Tố Hữu, Vo Thi Sau, Quận 9, Thành phố Hồ Chí Minh, Việt Nam', 8670),
(N'Thanh Lich Hotel', 'email15@gmail.com', 3, '0123456789',
N'Không chỉ sở hữu vị trí giúp quý khách dễ dàng ghé thăm những địa điểm lý thú trong chuyến hành trình, Da Nang Bay cũng sẽ mang đến cho quý khách trải nghiệm lưu trú mỹ mãn.
Da Nang Bay là đề xuất hàng đầu dành cho những tín đồ du lịch "bụi" mong muốn được nghỉ tại một khách sạn vừa thoải mái lại hợp túi tiền.
Dành cho những du khách muốn du lịch thoải mái cùng ngân sách tiết kiệm, Da Nang Bay sẽ là lựa chọn lưu trú hoàn hảo, nơi cung cấp các tiện nghi chất lượng và dịch vụ tuyệt vời.
Khách sạn này là lựa chọn hoàn hảo cho các kỳ nghỉ mát lãng mạn hay tuần trăng mật của các cặp đôi. Quý khách hãy tận hưởng những đêm đáng nhớ nhất cùng người thương của mình tại Da Nang Bay.
Da Nang Bay là lựa chọn sáng giá dành cho những ai đang tìm kiếm một trải nghiệm xa hoa đầy thú vị trong kỳ nghỉ của mình. Lưu trú tại đây cũng là cách để quý khách chiều chuộng bản thân với những dịch vụ xuất sắc nhất và khiến kỳ nghỉ của mình trở nên thật đáng nhớ.',
'12:00:00', '22:00:00', '10:00:00', '12:00:00', N'15 Tố Hữu, Vo Thi Sau, Quận 9, Thành phố Hồ Chí Minh, Việt Nam', 8670),
(N'Orange Hotel Da Nang', 'email16@gmail.com', 2, '0123456789',
 N'Orange Hotel Da Nang là lựa chọn phổ biến của du khách muốn khám phá Đà Nẵng với ngân sách tiết kiệm. Khách sạn cung cấp các phòng nghỉ thoải mái và dịch vụ đáng giá, giúp du khách có những trải nghiệm tuyệt vời.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'15 Tố Hữu, Vo Thi Sau, Quận 9, Thành phố Hồ Chí Minh, Việt Nam', 8670),
(N'Hanoi Golden Hotel', 'email17@gmail.com', 1, '0123456789',
 N'Với vị trí thuận lợi và dịch vụ tận tâm, Hanoi Golden Hotel là lựa chọn phổ biến của du khách khi đến Đà Nẵng. Khách sạn cung cấp các tiện nghi cơ bản nhưng đảm bảo sự thoải mái và tiện lợi cho du khách.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'15 Tố Hữu, Vo Thi Sau, Quận 9, Thành phố Hồ Chí Minh, Việt Nam', 8670),
(N'Pearl Sea Hotel', 'email18@gmail.com', 3, '0123456789',
 N'Với vị trí tuyệt vời ngay trung tâm thành phố, Pearl Sea Hotel là lựa chọn lý tưởng cho du khách muốn khám phá Đà Nẵng dễ dàng. Khách sạn cung cấp không gian nghỉ ngơi thoải mái và các tiện nghi tiện lợi.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'15 Tố Hữu, Vo Thi Sau, Quận 9, Thành phố Hồ Chí Minh, Việt Nam', 8670),
(N'New Moon Hotel', 'email19@gmail.com', 2, '0123456789',
 N'New Moon Hotel là lựa chọn phù hợp cho du khách muốn khám phá Đà Nẵng với ngân sách tiết kiệm. Khách sạn cung cấp các phòng nghỉ thoải mái và dịch vụ tận tâm, đem lại cho du khách những trải nghiệm thú vị.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'15 Tố Hữu, Vo Thi Sau, Quận 9, Thành phố Hồ Chí Minh, Việt Nam', 8670),
(N'Nhu Minh Plaza Hotel Da Nang', 'email20@gmail.com', 4, '0123456789',
 N'Nhu Minh Plaza Hotel Da Nang mang đến cho du khách trải nghiệm lưu trú sang trọng và đẳng cấp với không gian hiện đại và dịch vụ chuyên nghiệp. Hãy khám phá Đà Nẵng và tận hưởng kỳ nghỉ tuyệt vời tại đây.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'15 Tố Hữu, Vo Thi Sau, Quận 9, Thành phố Hồ Chí Minh, Việt Nam', 8670),
 --Ha Noi--
 (N'Khách Sạn Ha Noi Le Grand', 'email21@gmail.com', 4, '0123456789',
 N'Tọa lạc tại khu vực sầm uất của Đà Nẵng, Hotel Brilliant mang đến cho du khách trải nghiệm lưu trú tuyệt vời với dịch vụ chuyên nghiệp và không gian sang trọng.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'3 B9 Đầm Trấu, Bạch Đằng, Quận Hai Bà Trưng, Hà Nội, Việt Nam',1 ),
(N'Sofia Hello Boutique Hotel', 'email22@gmail.com', 3, '0123456789',
 N'Sofia Boutique Hotel là lựa chọn lý tưởng cho những du khách muốn tận hưởng kỳ nghỉ thoải mái với ngân sách tiết kiệm. Với các dịch vụ chất lượng và tiện nghi hiện đại, khách sạn này hứa hẹn mang đến cho du khách những trải nghiệm đáng nhớ.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'3 B9 Đầm Trấu, Bạch Đằng, Quận Hai Bà Trưng, Hà Nội, Việt Nam',1 ),
(N'Balcona Nice Try Hotel Da Nang', 'email23@gmail.com', 5, '0123456789',
 N'Balcona Hotel Da Nang là khách sạn 5 sao sang trọng, mang đến cho du khách những trải nghiệm xa hoa với dịch vụ xuất sắc và không gian đẳng cấp. Hãy tận hưởng những giây phút thư giãn tuyệt vời tại đây.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'3 B9 Đầm Trấu, Bạch Đằng, Quận Hai Bà Trưng, Hà Nội, Việt Nam', 1),
(N'Diamond SeaGame 21 Hotel', 'email24@gmail.com', 4, '0123456789',
 N'Diamond Sea Hotel là lựa chọn lý tưởng cho du khách muốn tận hưởng không gian nghỉ dưỡng thoải mái với tầm nhìn tuyệt đẹp ra biển. Khách sạn cung cấp các tiện nghi cao cấp và dịch vụ chuyên nghiệp.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'3 B9 Đầm Trấu, Bạch Đằng, Quận Hai Bà Trưng, Hà Nội, Việt Nam', 1),
(N'Thanh Lich Thanh Lich Hotel', 'email25@gmail.com', 3, '0123456789',
N'Không chỉ sở hữu vị trí giúp quý khách dễ dàng ghé thăm những địa điểm lý thú trong chuyến hành trình, Da Nang Bay cũng sẽ mang đến cho quý khách trải nghiệm lưu trú mỹ mãn.
Da Nang Bay là đề xuất hàng đầu dành cho những tín đồ du lịch "bụi" mong muốn được nghỉ tại một khách sạn vừa thoải mái lại hợp túi tiền.
Dành cho những du khách muốn du lịch thoải mái cùng ngân sách tiết kiệm, Da Nang Bay sẽ là lựa chọn lưu trú hoàn hảo, nơi cung cấp các tiện nghi chất lượng và dịch vụ tuyệt vời.
Khách sạn này là lựa chọn hoàn hảo cho các kỳ nghỉ mát lãng mạn hay tuần trăng mật của các cặp đôi. Quý khách hãy tận hưởng những đêm đáng nhớ nhất cùng người thương của mình tại Da Nang Bay.
Da Nang Bay là lựa chọn sáng giá dành cho những ai đang tìm kiếm một trải nghiệm xa hoa đầy thú vị trong kỳ nghỉ của mình. Lưu trú tại đây cũng là cách để quý khách chiều chuộng bản thân với những dịch vụ xuất sắc nhất và khiến kỳ nghỉ của mình trở nên thật đáng nhớ.',
'12:00:00', '22:00:00', '10:00:00', '12:00:00', N'3 B9 Đầm Trấu, Bạch Đằng, Quận Hai Bà Trưng, Hà Nội, Việt Nam', 1),
(N'Orange Hotel Apple Da Nang', 'email26@gmail.com', 2, '0123456789',
 N'Orange Hotel Da Nang là lựa chọn phổ biến của du khách muốn khám phá Đà Nẵng với ngân sách tiết kiệm. Khách sạn cung cấp các phòng nghỉ thoải mái và dịch vụ đáng giá, giúp du khách có những trải nghiệm tuyệt vời.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'3 B9 Đầm Trấu, Bạch Đằng, Quận Hai Bà Trưng, Hà Nội, Việt Nam', 1),
(N'Hanoi Golden Master Hotel', 'email27@gmail.com', 1, '0123456789',
 N'Với vị trí thuận lợi và dịch vụ tận tâm, Hanoi Golden Hotel là lựa chọn phổ biến của du khách khi đến Đà Nẵng. Khách sạn cung cấp các tiện nghi cơ bản nhưng đảm bảo sự thoải mái và tiện lợi cho du khách.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'3 B9 Đầm Trấu, Bạch Đằng, Quận Hai Bà Trưng, Hà Nội, Việt Nam', 1),
(N'Pearlimlk Nice Sea Hotel', 'email28@gmail.com', 3, '0123456789',
 N'Với vị trí tuyệt vời ngay trung tâm thành phố, Pearl Sea Hotel là lựa chọn lý tưởng cho du khách muốn khám phá Đà Nẵng dễ dàng. Khách sạn cung cấp không gian nghỉ ngơi thoải mái và các tiện nghi tiện lợi.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'3 B9 Đầm Trấu, Bạch Đằng, Quận Hai Bà Trưng, Hà Nội, Việt Nam', 1),
(N'New Moon Sun Day Hotel', 'email29@gmail.com', 2, '0123456789',
 N'New Moon Hotel là lựa chọn phù hợp cho du khách muốn khám phá Đà Nẵng với ngân sách tiết kiệm. Khách sạn cung cấp các phòng nghỉ thoải mái và dịch vụ tận tâm, đem lại cho du khách những trải nghiệm thú vị.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'3 B9 Đầm Trấu, Bạch Đằng, Quận Hai Bà Trưng, Hà Nội, Việt Nam', 1),
(N'Nhu Minh Plaza Hello Word Hotel Da Nang', 'email30@gmail.com', 4, '0123456789',
 N'Nhu Minh Plaza Hotel Da Nang mang đến cho du khách trải nghiệm lưu trú sang trọng và đẳng cấp với không gian hiện đại và dịch vụ chuyên nghiệp. Hãy khám phá Đà Nẵng và tận hưởng kỳ nghỉ tuyệt vời tại đây.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'3 B9 Đầm Trấu, Bạch Đằng, Quận Hai Bà Trưng, Hà Nội, Việt Nam', 1);	
 -----------------------------------------------------------------------------------------------------------------
 --insert table Hotel_Image --
 select *
 from Hotel_Image

CREATE TABLE #TempURLs (
    URL NVARCHAR(MAX)
);
-- Insert the URLs into the temporary table
INSERT INTO #TempURLs (URL)
VALUES
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-20983969df0ca0525a15f20af9488f4c.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640'),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-ca79c5cfc41762e1963c20b8336afb05.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640'),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-8f5a52e0864d04a9277c4e66e4743f7a.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640'),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-f5552e5aaa82d9d1b8263b741ea12957.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640'),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-a184757c040c218aa85aed6644735011.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640');

-- Declare variables for the loop
DECLARE @HotelID INT = 1;
DECLARE @MaxHotelID INT = 30;

-- Loop through Hotel_ID values from 1 to 30
WHILE @HotelID <= @MaxHotelID
BEGIN
    -- Insert URLs with the current Hotel_ID
    INSERT INTO Hotel_Image (URL, Hotel_ID)
    SELECT URL, @HotelID
    FROM #TempURLs;

    -- Increment the Hotel_ID
    SET @HotelID = @HotelID + 1;
END;

-- Drop the temporary table
DROP TABLE #TempURLs;

 -----------------------------------------------------------------------------------------------------------------
 --insert table Feedback--
 select *
 from Feedback

-- Set up a counter for Hotel_ID
DECLARE @HotelID INT = 1;
DECLARE @MaxHotelID INT = 30;
DECLARE @Rating INT;
DECLARE @Description NVARCHAR(255);
DECLARE @Date DATE;

-- Loop through Hotel_ID values from 1 to 30
WHILE @HotelID <= @MaxHotelID
BEGIN
    -- Generate a random Rating between 1 and 5
    SET @Rating = ROUND((RAND() * 4) + 1, 0);
    
    -- Generate a random Description
    SET @Description = 'Random Description ' + CAST(@HotelID AS NVARCHAR(10));
    
    -- Generate a random Date within the last month
    SET @Date = DATEADD(DAY, -1 * FLOOR(RAND() * 30), GETDATE());

    -- Insert the record into Feedback
    INSERT INTO Feedback (Account_ID, Hotel_ID, Rating, Description, Date)
    VALUES (1, @HotelID, @Rating, @Description, @Date);

    -- Increment the Hotel_ID
    SET @HotelID = @HotelID + 1;
END;
 -----------------------------------------------------------------------------------------------------------------
-- Set up a counter for Hotel_ID
DECLARE @HotelID INT = 1;
DECLARE @MaxHotelID INT = 30;
DECLARE @Rating INT;
DECLARE @Description NVARCHAR(255);
DECLARE @Date DATE;

-- Loop through Hotel_ID values from 1 to 30
WHILE @HotelID <= @MaxHotelID
BEGIN
    -- Generate a random Rating between 1 and 5
    SET @Rating = ROUND((RAND() * 4) + 1, 0);
    
    -- Generate a random Description
    SET @Description = 'Random Description ' + CAST(@HotelID AS NVARCHAR(10));
    
    -- Generate a random Date within the last month
    SET @Date = DATEADD(DAY, -1 * FLOOR(RAND() * 30), GETDATE());

    -- Insert the record into Feedback
    INSERT INTO Feedback (Account_ID, Hotel_ID, Rating, Description, Date)
    VALUES (2, @HotelID, @Rating, @Description, @Date);

    -- Increment the Hotel_ID
    SET @HotelID = @HotelID + 1;
END;
 -----------------------------------------------------------------------------------------------------------------
-- Set up a counter for Hotel_ID
DECLARE @HotelID INT = 1;
DECLARE @MaxHotelID INT = 30;
DECLARE @Rating INT;
DECLARE @Description NVARCHAR(255);
DECLARE @Date DATE;

-- Loop through Hotel_ID values from 1 to 30
WHILE @HotelID <= @MaxHotelID
BEGIN
    -- Generate a random Rating between 1 and 5
    SET @Rating = ROUND((RAND() * 4) + 1, 0);
    
    -- Generate a random Description
    SET @Description = 'Random Description ' + CAST(@HotelID AS NVARCHAR(10));
    
    -- Generate a random Date within the last month
    SET @Date = DATEADD(DAY, -1 * FLOOR(RAND() * 30), GETDATE());

    -- Insert the record into Feedback
    INSERT INTO Feedback (Account_ID, Hotel_ID, Rating, Description, Date)
    VALUES (3, @HotelID, @Rating, @Description, @Date);

    -- Increment the Hotel_ID
    SET @HotelID = @HotelID + 1;
END;
 -----------------------------------------------------------------------------------------------------------------
-- Set up a counter for Hotel_ID
DECLARE @HotelID INT = 1;
DECLARE @MaxHotelID INT = 30;
DECLARE @Rating INT;
DECLARE @Description NVARCHAR(255);
DECLARE @Date DATE;

-- Loop through Hotel_ID values from 1 to 30
WHILE @HotelID <= @MaxHotelID
BEGIN
    -- Generate a random Rating between 1 and 5
    SET @Rating = ROUND((RAND() * 4) + 1, 0);
    
    -- Generate a random Description
    SET @Description = 'Random Description ' + CAST(@HotelID AS NVARCHAR(10));
    
    -- Generate a random Date within the last month
    SET @Date = DATEADD(DAY, -1 * FLOOR(RAND() * 30), GETDATE());

    -- Insert the record into Feedback
    INSERT INTO Feedback (Account_ID, Hotel_ID, Rating, Description, Date)
    VALUES (4, @HotelID, @Rating, @Description, @Date);

    -- Increment the Hotel_ID
    SET @HotelID = @HotelID + 1;
END;
 -----------------------------------------------------------------------------------------------------------------
-- Set up a counter for Hotel_ID
DECLARE @HotelID INT = 1;
DECLARE @MaxHotelID INT = 30;
DECLARE @Rating INT;
DECLARE @Description NVARCHAR(255);
DECLARE @Date DATE;

-- Loop through Hotel_ID values from 1 to 30
WHILE @HotelID <= @MaxHotelID
BEGIN
    -- Generate a random Rating between 1 and 5
    SET @Rating = ROUND((RAND() * 4) + 1, 0);
    
    -- Generate a random Description
    SET @Description = 'Random Description ' + CAST(@HotelID AS NVARCHAR(10));
    
    -- Generate a random Date within the last month
    SET @Date = DATEADD(DAY, -1 * FLOOR(RAND() * 30), GETDATE());

    -- Insert the record into Feedback
    INSERT INTO Feedback (Account_ID, Hotel_ID, Rating, Description, Date)
    VALUES (5, @HotelID, @Rating, @Description, @Date);

    -- Increment the Hotel_ID
    SET @HotelID = @HotelID + 1;
END;
 -----------------------------------------------------------------------------------------------------------------
-- Set up a counter for Hotel_ID
DECLARE @HotelID INT = 1;
DECLARE @MaxHotelID INT = 30;
DECLARE @Rating INT;
DECLARE @Description NVARCHAR(255);
DECLARE @Date DATE;

-- Loop through Hotel_ID values from 1 to 30
WHILE @HotelID <= @MaxHotelID
BEGIN
    -- Generate a random Rating between 1 and 5
    SET @Rating = ROUND((RAND() * 4) + 1, 0);
    
    -- Generate a random Description
    SET @Description = 'Random Description ' + CAST(@HotelID AS NVARCHAR(10));
    
    -- Generate a random Date within the last month
    SET @Date = DATEADD(DAY, -1 * FLOOR(RAND() * 30), GETDATE());

    -- Insert the record into Feedback
    INSERT INTO Feedback (Account_ID, Hotel_ID, Rating, Description, Date)
    VALUES (6, @HotelID, @Rating, @Description, @Date);

    -- Increment the Hotel_ID
    SET @HotelID = @HotelID + 1;
END;
 -----------------------------------------------------------------------------------------------------------------
  --insert table Favourite_Hotel--
select *
from Favourite_Hotel

-- Set up variables
DECLARE @HotelID INT = 1;
DECLARE @MaxHotelID INT = 30;

-- Loop through Hotel_ID values from 1 to 30 but only odd numbers
WHILE @HotelID <= @MaxHotelID
BEGIN
    -- Insert the record into Favourite_Hotel
    INSERT INTO Favourite_Hotel (Hotel_ID, Account_ID)
    VALUES (@HotelID, 1);

    -- Increment the Hotel_ID by 2 to get the next odd number
    SET @HotelID = @HotelID + 2;
END;
 -----------------------------------------------------------------------------------------------------------------
--insert table Room--
select *
from Room


-- Create a table variable to hold room types
DECLARE @RoomTypes TABLE (
    Name NVARCHAR(255),
    Room_Description NVARCHAR(MAX),
    Capacity INT
);

-- Insert room types into the table variable
INSERT INTO @RoomTypes (Name, Room_Description, Capacity)
VALUES 
('Standard Room', 'This is a cozy room with one king-size bed', 2),
('Deluxe Suite', 'Spacious suite with a separate living area and a king-size bed', 4),
('Family Room', 'Room with two queen-size beds, suitable for families', 4);

-- Declare variables for the loop
DECLARE @HotelID INT = 1;
DECLARE @MaxHotelID INT = 30;
DECLARE @Price INT;
DECLARE @TotalRooms INT;

-- Loop through Hotel_ID values from 1 to 30
WHILE @HotelID <= @MaxHotelID
BEGIN
    -- Loop through each room type
    DECLARE @Name NVARCHAR(255);
    DECLARE @Room_Description NVARCHAR(MAX);
    DECLARE @Capacity INT;
    
    DECLARE RoomCursor CURSOR FOR 
    SELECT Name, Room_Description, Capacity FROM @RoomTypes;
    
    OPEN RoomCursor;
    FETCH NEXT FROM RoomCursor INTO @Name, @Room_Description, @Capacity;
    
    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Generate random Price between 10000 and 50000
        SET @Price = FLOOR(RAND() * (50000 - 10000 + 1)) + 10000;
        
        -- Generate random TotalRooms between 1 and 5
        SET @TotalRooms = FLOOR(RAND() * (5 - 1 + 1)) + 1;
        
        -- Insert the record into Room
        INSERT INTO Room (Name, Room_Description, Capacity, Total_Rooms, Price, Hotel_ID)
        VALUES (@Name, @Room_Description, @Capacity, @TotalRooms, @Price, @HotelID);
        
        FETCH NEXT FROM RoomCursor INTO @Name, @Room_Description, @Capacity;
    END;
    
    CLOSE RoomCursor;
    DEALLOCATE RoomCursor;
    
    -- Increment the Hotel_ID
    SET @HotelID = @HotelID + 1;
END;


 ----------------------------------------------------------------------------------------------------------------
 --INSERT INTO Room_Image-
select *
from Room_Image
order by Room_ID

delete Room_Image
CREATE TABLE #TempURLs (
    URL NVARCHAR(MAX)
);
   INSERT INTO #TempURLs (URL)
VALUES
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-20983969df0ca0525a15f20af9488f4c.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640'),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-ca79c5cfc41762e1963c20b8336afb05.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640'),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-8f5a52e0864d04a9277c4e66e4743f7a.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640'),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-f5552e5aaa82d9d1b8263b741ea12957.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640'),
('https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010910-a184757c040c218aa85aed6644735011.jpeg?_src=imagekit&tr=c-at_max,h-360,q-40,w-640');

-- Declare variables for the loop
DECLARE @Room_ID INT = 1;
DECLARE @MaxRoom_ID INT = 90;

-- Loop through Hotel_ID values from 1 to 30
WHILE @Room_ID <= @MaxRoom_ID
BEGIN
    -- Insert URLs with the current Hotel_ID
     insert into Room_Image(URL, Room_ID)
    SELECT URL, @Room_ID
    FROM #TempURLs;

    -- Increment the Hotel_ID
    SET @Room_ID = @Room_ID + 1;
END;

-- Drop the temporary table
DROP TABLE #TempURLs;

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

-- Declare variables for the loops
DECLARE @Hotel_ID INT = 1;
DECLARE @MaxHotel_ID INT = 30;
DECLARE @Facility_ID INT;
DECLARE @InsertionCount INT;
DECLARE @MaxInsertions INT = 10;

-- Loop through Hotel_ID values from 1 to 30
WHILE @Hotel_ID <= @MaxHotel_ID
BEGIN
    -- Reset the insertion count for each hotel
    SET @InsertionCount = 1;
    
    -- Insert 10 random facility IDs for each hotel
    WHILE @InsertionCount <= @MaxInsertions
    BEGIN
        -- Generate a random Facility_ID between 1 and 18
        SET @Facility_ID = FLOOR(RAND() * (18 - 1 + 1)) + 1;
        
        -- Insert the record into Hotel_Facility
        INSERT INTO Hotel_Facility (Hotel_ID, Facility_ID)
        VALUES (@Hotel_ID, @Facility_ID);

        -- Increment the insertion count
        SET @InsertionCount = @InsertionCount + 1;
    END;
    
    -- Increment the Hotel_ID
    SET @Hotel_ID = @Hotel_ID + 1;
END;

----------------------------------------------------------------------------------------------------------------
--INSERT INTO Service--
select *
from Service 
INSERT INTO Service (Name) VALUES
('Big Pool'),
('Breakfast'),
('Buffet'),
('Airport Shuttle');

----------------------------------------------------------------------------------------------------------------
select *
from Hotel_Service

-- Declare variables for the loop
DECLARE @Hotel_ID INT = 1;
DECLARE @Service_ID INT;
DECLARE @Price INT;

-- Loop through Hotel_ID values from 1 to 30, excluding multiples of 5
WHILE @Hotel_ID <= 30
BEGIN
    -- Check if the current Hotel_ID is not a multiple of 5
    IF @Hotel_ID % 5 != 0
    BEGIN
        -- Generate a random Service_ID between 1 and 4
        SET @Service_ID = FLOOR(RAND() * (4 - 1 + 1)) + 1;
        
        -- Generate a random Price between 20000 and 100000 that is a multiple of 1000
        SET @Price = (FLOOR(RAND() * (100 - 20 + 1)) + 20) * 1000;
        
        -- Insert the record into Hotel_Service
        INSERT INTO Hotel_Service (Hotel_ID, Service_ID, Price)
        VALUES (@Hotel_ID, @Service_ID, @Price);
    END

    -- Increment the Hotel_ID
    SET @Hotel_ID = @Hotel_ID + 1;
END; 

----------------------------------------------------------------------------------------------------------------
-- Insert Bed
INSERT INTO Bed (Name, Description, URL) VALUES 
(N'Giường đơn', N'Rộng 90 - 130 cm', 'URL_for_single_bed_image'),
(N'Giường đôi', N'Rộng 131 - 150 cm', 'URL_for_double_bed_image'),
(N'Giường lớn (cỡ King)', N'Rộng 151 - 180 cm', 'URL_for_king_bed_image'),
(N'Giường cực lớn (cỡ Super-king)', N'Rộng 181 - 210 cm', 'URL_for_super_king_bed_image');
select *
from Bed
----------------------------------------------------------------------------------------------------------------
select *
from Room_Bed
-- Declare variables for the loops
DECLARE @Room_ID INT = 1;
DECLARE @MaxRoom_ID INT = 90;
DECLARE @Amount INT;
DECLARE @Bed_ID INT;

-- Loop through Room_ID values from 1 to 90
WHILE @Room_ID <= @MaxRoom_ID
BEGIN
    -- Generate random Amount between 1 and 3
    SET @Amount = FLOOR(RAND() * (3 - 1 + 1)) + 1;
    
    -- Loop through Bed_ID values from 1 to 4
    SET @Bed_ID = 1;
    WHILE @Bed_ID <= 4
    BEGIN
        -- Insert record into Room_Bed
        INSERT INTO Room_Bed (Amount, Bed_ID, Room_ID)
        VALUES (@Amount, @Bed_ID, @Room_ID);

        -- Increment Bed_ID
        SET @Bed_ID = @Bed_ID + 1;
    END;
    
    -- Increment Room_ID
    SET @Room_ID = @Room_ID + 1;
END;

----------------------------------------------------------------------------------------------------------------



select *
from Reservation


INSERT INTO Reservation (Reservation_Date, Number_of_guests, CheckInDate, CheckOutDate, Total_Price, Payment_Method, Status, Account_ID)
VALUES
--cancel
('2024-06-01', 2, '2024-06-11', '2024-06-16', 3500.00, 'Credit Card', 'Cancel', 1),
('2024-06-02', 3, '2024-06-12', '2024-06-17', 500.00, 'Credit Card', 'Cancel', 1),
('2024-06-03', 4, '2024-06-13', '2024-06-18', 4500.00, 'Credit Card', 'Cancel', 1),
('2024-06-04', 1, '2024-06-14', '2024-06-19', 5500.00, 'Credit Card', 'Cancel', 1),
('2024-06-05', 3, '2024-06-15', '2024-06-20', 6500.00, 'Credit Card', 'Cancel', 1),
('2024-06-06', 5, '2024-06-16', '2024-06-21', 7500.00, 'Credit Card', 'Cancel', 1),
--not paid
('2024-05-02', 3, '2024-06-20', '2024-06-26', 25100.00, 'Credit Card', 'Not Paid', 1),
('2024-05-05', 2, '2024-06-21', '2024-06-27', 15100.00, 'Credit Card', 'Not Paid', 1),
('2024-05-04', 1, '2024-06-22', '2024-06-28', 35100.00, 'Credit Card', 'Not Paid', 1),
('2024-05-05', 4, '2024-06-23', '2024-06-29', 45100.00, 'Credit Card', 'Not Paid', 1),
('2024-05-06', 5, '2024-06-24', '2024-06-30', 55100.00, 'Credit Card', 'Not Paid', 1),
--paid , not finish , not feedback
('2024-06-02', 5, '2024-06-11', '2024-06-26', 2100.00, 'Credit Card', 'Paid', 1),
('2024-06-05', 6, '2024-06-12', '2024-06-27', 4100.00, 'Credit Card', 'Paid', 1),
('2024-06-04', 7, '2024-06-13', '2024-06-28', 4100.00, 'Credit Card', 'Paid', 1),
('2024-06-05', 2, '2024-06-14', '2024-06-29', 3100.00, 'Credit Card', 'Paid', 1),
('2024-06-06', 3, '2024-06-15', '2024-06-30', 2100.00, 'Credit Card', 'Paid', 1),

--paid , finish, not feedback
('2024-05-03', 5, '2024-05-11', '2024-05-26', 2100.00, 'Credit Card', 'Paid', 1),
('2024-05-05', 6, '2024-05-12', '2024-05-27', 4100.00, 'Credit Card', 'Paid', 1),
('2024-05-04', 7, '2024-05-13', '2024-05-28', 4100.00, 'Credit Card', 'Paid', 1),
('2024-05-05', 2, '2024-05-14', '2024-05-29', 3100.00, 'Credit Card', 'Paid', 1),
('2024-05-06', 3, '2024-05-15', '2024-05-30', 2100.00, 'Credit Card', 'Paid', 1),
--finish,feedback
('2024-05-01', 5, '2024-05-13', '2024-05-30', 2100.00, 'Credit Card', 'Finish', 1),
('2024-05-02', 6, '2024-05-14', '2024-05-31', 4100.00, 'Credit Card', 'Finish', 1);

-----------------------------------------------------------------------------------------------------------------
select *
from Reserved_Room
order by Reservation_ID

-- Chèn dữ liệu vào bảng Reserved_Room với Reservation_ID từ 1 đến 21, Room_ID random từ 1 đến 90, amount từ 1 đến 2
DECLARE @ReservationID INT = 1;

WHILE @ReservationID <= 23
BEGIN
    INSERT INTO Reserved_Room (Reservation_ID, Room_ID, Amount)
    VALUES (@ReservationID, FLOOR(RAND() * 90) + 1, FLOOR(RAND() * 2) + 1);

    SET @ReservationID = @ReservationID + 1;
END;
-----------------------------------------------------------------------------------------------------------------