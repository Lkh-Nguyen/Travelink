-- Run Vietnam.sql first
-- Create the Customer table
CREATE TABLE Customer (
    Customer_ID INT IDENTITY(1,1) PRIMARY KEY, -- Primary key with auto-increment
    Email VARCHAR(255) NOT NULL UNIQUE,               -- Email field with VARCHAR type
    Password VARCHAR(255),            -- Password field with VARCHAR type
    CMND VARCHAR(20) ,							-- CMND field with VARCHAR type
    Name NVARCHAR(255) NOT NULL,               -- Name field with NVARCHAR type
    Gender CHAR(1),                    -- Gender field with CHAR type
	DateOfBirth DATE,
	PhoneNumber VARCHAR(20),
	AvatarURL VARCHAR(255) default '/Travelink/img_Avatar/avatar_default.jpg',
	Address NVARCHAR(255)
);
delete customer
INSERT INTO Customer (Email, Password, Name, Gender, DateOfBirth, PhoneNumber)
VALUES ('exampl1231e@email.com', '123', N'Nguyễn Văn Nam', 'M', '1990-01-01', '0912345678');

select *
from customer
--Create the Hotel table
CREATE TABLE Hotel (	
    Hotel_ID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Star TINYINT NOT NULL,
    PhoneNumber VARCHAR(20) NOT NULL,
    Description NTEXT NOT NULL,
    CheckInTime TIME(0) NOT NULL,
    CheckOutTime TIME(0) NOT NULL,
    Address NVARCHAR(255) NOT NULL,
    Ward_ID INT NOT NULL,
    FOREIGN KEY (Ward_ID) REFERENCES Ward(Ward_ID)
);

insert into Hotel values 
(N'Khách sạn và căn hộ Seashore','email1@gmail.com',1234567890,4,'0123456789',
N'Dành cho những du khách muốn du lịch thoải mái cùng ngân sách tiết kiệm, Seashore Hotel & Apartment sẽ là lựa chọn lưu trú hoàn hảo,
nơi cung cấp các tiện nghi chất lượng và dịch vụ tuyệt vời.',
'12:00', '10:00',N'15-16 Hoàng Sa, Mân Thái, Sơn Trà, Đà Nẵng, Việt Nam',6372),
(N'Davue Hotel Da Nang','email2@gmail.com',1234567890,3,'0123456789',
N'Davue Hotel Da Nang là đề xuất hàng đầu dành cho những tín đồ du lịch "bụi" mong muốn được nghỉ tại một khách sạn vừa thoải mái lại hợp túi tiền. 
`Dành cho những du khách muốn du lịch thoải mái cùng ngân sách tiết kiệm, Davue Hotel Da Nang sẽ là lựa chọn lưu trú hoàn hảo, nơi cung cấp các tiện nghi chất lượng và dịch vụ tuyệt vời.
`Khách sạn này là lựa chọn hoàn hảo cho các kỳ nghỉ mát lãng mạn hay tuần trăng mật của các cặp đôi. Quý khách hãy tận hưởng những đêm đáng nhớ nhất cùng người thương của mình tại Davue Hotel Da Nang',
'12:00', '10:00',N'57-59 Đỗ Bí, Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Việt Nam',6374),
(N'Cicilia Danang Hotels & Spa Powered by ASTON','email3@gmail.com',1234567890,3,'0123456789',
N'Khách sạn này là lựa chọn hoàn hảo cho các kỳ nghỉ mát lãng mạn hay tuần trăng mật của các cặp đôi. Quý khách hãy tận hưởng những đêm đáng nhớ nhất cùng người thương của mình tại Cicilia Danang Hotels & Spa Powered by ASTON
`Cicilia Danang Hotels & Spa Powered by ASTON là lựa chọn sáng giá dành cho những ai đang tìm kiếm một trải nghiệm xa hoa đầy thú vị trong kỳ nghỉ của mình. Lưu trú tại đây cũng là cách để quý khách chiều chuộng bản thân với những dịch vụ xuất sắc nhất và khiến kỳ nghỉ của mình trở nên thật đáng nhớ.
`Một trong những đặc điểm chính của khách sạn này là các liệu pháp spa đa dạng. Hãy nâng niu bản thân bằng các liệu pháp thư giãn, phục hồi giúp quý khách tươi trẻ thân, tâm.',
'12:00', '10:00',N'06-10 Đỗ Bá, Bãi Biển T20, Phường Mỹ An, Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Việt Nam',6373),
(N'Bay Capital Danang','email4@gmail.com',1234567890,1,'0123456789',
N'Dù quý khách muốn tổ chức một sự kiện hay các dịp kỷ niệm đặc biệt khác, Bay Capital Danang là lựa chọn tuyệt vời cho quý khách với phòng chức năng rộng lớn, được trang bị đầy đủ để sẵn sàng đáp ứng mọi yêu cầu.
`Khách sạn này là lựa chọn hoàn hảo cho các kỳ nghỉ mát lãng mạn hay tuần trăng mật của các cặp đôi. Quý khách hãy tận hưởng những đêm đáng nhớ nhất cùng người thương của mình tại Bay Capital Danang
`Bay Capital Danang là lựa chọn sáng giá dành cho những ai đang tìm kiếm một trải nghiệm xa hoa đầy thú vị trong kỳ nghỉ của mình. Lưu trú tại đây cũng là cách để quý khách chiều chuộng bản thân với những dịch vụ xuất sắc nhất và khiến kỳ nghỉ của mình trở nên thật đáng nhớ.',
'12:00', '10:00',N'17 Quang Trung, Phường Hải Châu 1, Quận Hải Châu, Đà Nẵng, Việt Nam',6355),
(N'Khu nghỉ dưỡng và Spa Mikazuki Nhật Bản','email5@gmail.com',1234567890,2,'0123456789',
N'Từ sự kiện doanh nghiệp đến họp mặt công ty, Da Nang – Mikazuki JAPANESE RESORTS & SPA cung cấp đầy đủ các dịch vụ và tiện nghi đáp ứng mọi nhu cầu của quý khách và đồng nghiệp.
`Dù quý khách muốn tổ chức một sự kiện hay các dịp kỷ niệm đặc biệt khác, Da Nang – Mikazuki JAPANESE RESORTS & SPA là lựa chọn tuyệt vời cho quý khách với phòng chức năng rộng lớn, được trang bị đầy đủ để sẵn sàng đáp ứng mọi yêu cầu.
`Hãy tận hưởng thời gian vui vẻ cùng cả gia đình với hàng loạt tiện nghi giải trí tại Da Nang – Mikazuki JAPANESE RESORTS & SPA, một nơi nghỉ tuyệt vời phù hợp cho mọi kỳ nghỉ bên người thân.',
'12:00', '10:00',N'Đường Nguyễn Tất Thành,Phường Hòa Hiệp Nam, Hòa Hiệp Nam, Liên Chiểu, Đà Nẵng, Việt Nam',6338);