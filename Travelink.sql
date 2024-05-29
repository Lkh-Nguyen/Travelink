-- Create the Customer table

-- Use the Travelink database
USE Travelink;
GO

CREATE TABLE Customer (
  Customer_ID INT IDENTITY(1,1) PRIMARY KEY, -- Primary key with auto-increment
  Email VARCHAR(255) NOT NULL,        -- Email field with VARCHAR type
  Password VARCHAR(255),      -- Password field with VARCHAR type
  CMND VARCHAR(20),							-- CMND field with VARCHAR type
  Name NVARCHAR(255) NOT NULL,        -- Name field with NVARCHAR type
  Gender CHAR(1),          -- Gender field with CHAR type
  DateOfBirth DATE,
  PhoneNumber VARCHAR(20),
  AvatarURL VARCHAR(255),
  Address NVARCHAR(255)
);
GO

INSERT INTO Customer (Email, Password, Name, Gender, DateOfBirth, PhoneNumber)
VALUES ('example@email.com', '123', N'Nguyễn Văn Nam', 'M', '1990-01-01', '0912345678');
GO

--Create the Hotel table
CREATE TABLE Hotel (
  Hotel_ID INT IDENTITY(1,1) PRIMARY KEY,
  Name NVARCHAR(255) ,
  Email VARCHAR(255) NOT NULL UNIQUE ,
  Password VARCHAR(255) ,
  Star TINYINT ,
  PhoneNumber VARCHAR(20) ,
  Description NTEXT ,
  CheckInTimeStart TIME(0) ,
  CheckInTimeEnd TIME(0) ,
  CheckOutTimeStart TIME(0) ,
  CheckOutTimeEnd TIME(0) ,
  Address NVARCHAR(255) ,
  Ward_ID INT,
  FOREIGN KEY (Ward_ID) REFERENCES Ward(Ward_ID)
);
GO

-- Insert into Hotel table
INSERT INTO Hotel (
  Name, Email, Password, Star, PhoneNumber, Description, CheckInTimeStart, CheckInTimeEnd, CheckOutTimeStart, CheckOutTimeEnd, Address, Ward_ID
) VALUES 
(N'Khách sạn và căn hộ Seashore', 'email1@gmail.com', '1234567890', 4, '0123456789',
 N'Dành cho những du khách muốn du lịch thoải mái cùng ngân sách tiết kiệm, Seashore Hotel & Apartment sẽ là lựa chọn lưu trú hoàn hảo, nơi cung cấp các tiện nghi chất lượng và dịch vụ tuyệt vời.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'15-16 Hoàng Sa, Mân Thái, Sơn Trà, Đà Nẵng, Việt Nam', 6372),
(N'Davue Hotel Da Nang', 'email2@gmail.com', '1234567890', 3, '0123456789',
 N'Davue Hotel Da Nang là đề xuất hàng đầu dành cho những tín đồ du lịch "bụi" mong muốn được nghỉ tại một khách sạn vừa thoải mái lại hợp túi tiền. \nDành cho những du khách muốn du lịch thoải mái cùng ngân sách tiết kiệm, Davue Hotel Da Nang sẽ là lựa chọn lưu trú hoàn hảo, nơi cung cấp các tiện nghi chất lượng và dịch vụ tuyệt vời. \nKhách sạn này là lựa chọn hoàn hảo cho các kỳ nghỉ mát lãng mạn hay tuần trăng mật của các cặp đôi. Quý khách hãy tận hưởng những đêm đáng nhớ nhất cùng người thương của mình tại Davue Hotel Da Nang',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'57-59 Đỗ Bí, Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Việt Nam', 6374),
(N'Cicilia Danang Hotels & Spa Powered by ASTON', 'email3@gmail.com', '1234567890', 3, '0123456789',
 N'Khách sạn này là lựa chọn hoàn hảo cho các kỳ nghỉ mát lãng mạn hay tuần trăng mật của các cặp đôi. Quý khách hãy tận hưởng những đêm đáng nhớ nhất cùng người thương của mình tại Cicilia Danang Hotels & Spa Powered by ASTON \nCicilia Danang Hotels & Spa Powered by ASTON là lựa chọn sáng giá dành cho những ai đang tìm kiếm một trải nghiệm xa hoa đầy thú vị trong kỳ nghỉ của mình. Lưu trú tại đây cũng là cách để quý khách chiều chuộng bản thân với những dịch vụ xuất sắc nhất và khiến kỳ nghỉ của mình trở nên thật đáng nhớ. \nMột trong những đặc điểm chính của khách sạn này là các liệu pháp spa đa dạng. Hãy nâng niu bản thân bằng các liệu pháp thư giãn, phục hồi giúp quý khách tươi trẻ thân, tâm.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'06-10 Đỗ Bá, Bãi Biển T20, Phường Mỹ An, Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Việt Nam', 6373),
(N'Bay Capital Danang', 'email4@gmail.com', '1234567890', 1, '0123456789',
 N'Dù quý khách muốn tổ chức một sự kiện hay các dịp kỷ niệm đặc biệt khác, Bay Capital Danang là lựa chọn tuyệt vời cho quý khách với phòng chức năng rộng lớn, được trang bị đầy đủ để sẵn sàng đáp ứng mọi yêu cầu. \nKhách sạn này là lựa chọn hoàn hảo cho các kỳ nghỉ mát lãng mạn hay tuần trăng mật của các cặp đôi. Quý khách hãy tận hưởng những đêm đáng nhớ nhất cùng người thương của mình tại Bay Capital Danang \nBay Capital Danang là lựa chọn sáng giá dành cho những ai đang tìm kiếm một trải nghiệm xa hoa đầy thú vị trong kỳ nghỉ của mình. Lưu trú tại đây cũng là cách để quý khách chiều chuộng bản thân với những dịch vụ xuất sắc nhất và khiến kỳ nghỉ của mình trở nên thật đáng nhớ.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'17 Quang Trung, Phường Hải Châu 1, Quận Hải Châu, Đà Nẵng, Việt Nam', 6355),
(N'Khu nghỉ dưỡng và Spa Mikazuki Nhật Bản', 'email5@gmail.com', '1234567890', 2, '0123456789',
 N'Từ sự kiện doanh nghiệp đến họp mặt công ty, Da Nang – Mikazuki JAPANESE RESORTS & SPA cung cấp đầy đủ các dịch vụ và tiện nghi đáp ứng mọi nhu cầu của quý khách và đồng nghiệp. \nDù quý khách muốn tổ chức một sự kiện hay các dịp kỷ niệm đặc biệt khác, Da Nang – Mikazuki JAPANESE RESORTS & SPA là lựa chọn tuyệt vời cho quý khách với phòng chức năng rộng lớn, được trang bị đầy đủ để sẵn sàng đáp ứng mọi yêu cầu. \nHãy tận hưởng thời gian vui vẻ cùng cả gia đình với hàng loạt tiện nghi giải trí tại Da Nang – Mikazuki JAPANESE RESORTS & SPA, một nơi nghỉ tuyệt vời phù hợp cho mọi kỳ nghỉ bên người thân.',
 '12:00:00', '22:00:00', '10:00:00', '12:00:00', N'Đường Nguyễn Tất Thành, Phường Hòa Hiệp Nam, Hòa Hiệp Nam, Liên Chiểu, Đà Nẵng, Việt Nam', 6338);

--Create Favourite_Hotel table with ON DELETE CASCADE for foreign keys
CREATE TABLE Favourite_Hotel (
  Hotel_ID INT FOREIGN KEY REFERENCES Hotel(Hotel_ID) ON DELETE CASCADE,
  Customer_ID INT FOREIGN KEY REFERENCES Customer(Customer_ID) ON DELETE CASCADE,
  PRIMARY KEY (Hotel_ID, Customer_ID)
);
GO

--Create table Pending_Hotel
CREATE TABLE Pending_Hotel (
  Pending_Hotel_ID INT IDENTITY(1,1) PRIMARY KEY, -- Use IDENTITY for auto-increment if needed
  Name NVARCHAR(255) NOT NULL,
  Email VARCHAR(255) UNIQUE,  -- Assuming email should be unique for pending hotels
  Password VARCHAR(255),
  PhoneNumber VARCHAR(20),
  Address NVARCHAR(255),
  Ward_ID INT FOREIGN KEY REFERENCES Ward(Ward_ID),
);
GO

-- Create table Feedback
CREATE TABLE Feedback (
  Feedback_ID INT IDENTITY(1,1) PRIMARY KEY,
  Description NTEXT,
  Rating TINYINT,
  Date DATE,
  LikesCount INT,
  DislikesCount INT,
  Customer_ID INT FOREIGN KEY REFERENCES Customer(Customer_ID) ON DELETE CASCADE,
  Hotel_ID INT FOREIGN KEY REFERENCES Hotel(Hotel_ID) ON DELETE CASCADE
);

-- Create table Room
CREATE TABLE Room (
  Room_ID INT IDENTITY(1,1) PRIMARY KEY,
  Name NVARCHAR(255) NOT NULL,
  Room_Description NVARCHAR(255),
  Capacity TINYINT,
  Total_Rooms TINYINT,
  Price INT,
  Hotel_ID INT FOREIGN KEY REFERENCES Hotel(Hotel_ID) ON DELETE CASCADE
);
GO
INSERT INTO Room (Name, Room_Description, Capacity, Total_Rooms, Price, Hotel_ID)
VALUES ('Standard Room', 'This is a cozy room with one king-size bed', 2, 10, 300000, 1);

INSERT INTO Room (Name, Room_Description, Capacity, Total_Rooms, Price, Hotel_ID)
VALUES ('Deluxe Suite', 'Spacious suite with a separate living area and a king-size bed', 4, 5, 500000, 1);

INSERT INTO Room (Name, Room_Description, Capacity, Total_Rooms, Price, Hotel_ID)
VALUES ('Family Room', 'Room with two queen-size beds, suitable for families', 4, 3, 2000000, 1);

-- Create table Room_Image
CREATE TABLE Room_Image (
  Room_Image_ID INT IDENTITY(1,1) PRIMARY KEY,
  Name NVARCHAR(255),  -- Optional: Name of the image
  URL VARCHAR(255) NOT NULL, -- Image URL
  Room_ID INT FOREIGN KEY REFERENCES Room(Room_ID) ON DELETE CASCADE
);
GO
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

-- Create table Hotel_Image
CREATE TABLE Hotel_Image (
  Hotel_Image_ID INT IDENTITY(1,1) PRIMARY KEY,
  Name NVARCHAR(255),  -- Optional: Name of the image
  URL VARCHAR(255) NOT NULL, -- Image URL
  Hotel_ID INT FOREIGN KEY REFERENCES Hotel(Hotel_ID) ON DELETE CASCADE
);
GO
INSERT INTO Hotel_Image (Name, URL, Hotel_ID)
VALUES ('SeashoreHotelImg1', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fseashore-hotel-apartment-da-nang.hotelmix.vn%2F&psig=AOvVaw2xNmNbltska2Lk5K-TAFD5&ust=1716947801704000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCMj0zYqfr4YDFQAAAAAdAAAAABAE', 1);
INSERT INTO Hotel_Image (Name, URL, Hotel_ID)
VALUES ('SeashoreHotelImg2', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fseashore-hotel-apartment-da-nang.hotelmix.vn%2F&psig=AOvVaw2xNmNbltska2Lk5K-TAFD5&ust=1716947801704000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCMj0zYqfr4YDFQAAAAAdAAAAABAE', 1);
INSERT INTO Hotel_Image (Name, URL, Hotel_ID)
VALUES ('SeashoreHotelImg3', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.booking.com%2Fhotel%2Fvn%2Fseashore-amp-apartment.vi.html&psig=AOvVaw2xNmNbltska2Lk5K-TAFD5&ust=1716947801704000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCMj0zYqfr4YDFQAAAAAdAAAAABBF',1);
INSERT INTO Hotel_Image (Name, URL, Hotel_ID)
VALUES ('SeashoreHotelImg4', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.booking.com%2Fhotel%2Fvn%2Fseashore-amp-apartment.vi.html&psig=AOvVaw2xNmNbltska2Lk5K-TAFD5&ust=1716947801704000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCMj0zYqfr4YDFQAAAAAdAAAAABBF', 1);
INSERT INTO Hotel_Image (Name, URL, Hotel_ID)
VALUES ('SeashoreHotelImg5', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.booking.com%2Fhotel%2Fvn%2Fseashore-amp-apartment.vi.html&psig=AOvVaw2xNmNbltska2Lk5K-TAFD5&ust=1716947801704000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCMj0zYqfr4YDFQAAAAAdAAAAABBF', 1);



-- Create table Facility
CREATE TABLE Facility (
  Facility_ID INT IDENTITY(1,1) PRIMARY KEY,
  URL VARCHAR(255),  -- Optional: URL for an icon or image representing the facility
  Name NVARCHAR(255) NOT NULL  -- Name of the facility
);
GO
INSERT INTO Facility (URL, Name)
VALUES (NULL, N'Hồ bơi ngoài trời'),
       (NULL, N'Xe đưa đón sân bay'),
	   (NULL, N'Phòng không hút thuốc'),
	   (NULL, N'Chỗ đỗ xe miễn phí'),
	   (NULL, N'WiFi miễn phí'),
	   (NULL, N'Nhà hàng'),
	   (NULL, N'Lễ tân 24 giờ'),
	   (NULL, N'Sân thượng / hiên');

-- Create table Room_Facility
CREATE TABLE Room_Facility (
  Room_ID INT,
  Facility_ID INT,
  PRIMARY KEY (Room_ID, Facility_ID),
  FOREIGN KEY (Room_ID) REFERENCES Room(Room_ID) ON DELETE CASCADE,
  FOREIGN KEY (Facility_ID) REFERENCES Facility(Facility_ID) ON DELETE CASCADE 
);

-- Create table Bed
CREATE TABLE Bed (
  Bed_ID INT PRIMARY KEY,
  Name NVARCHAR(255),
  Description NVARCHAR(255),
  URL VARCHAR(255)
);

-- Create table Room_Bed
CREATE TABLE Room_Bed (
  Room_Bed_ID INT PRIMARY KEY,
  Amount TINYINT,
  Bed_ID INT,
  Room_ID INT,
  FOREIGN KEY (Bed_ID) REFERENCES Bed(Bed_ID) ON DELETE CASCADE,
  FOREIGN KEY (Room_ID) REFERENCES Room(Room_ID) ON DELETE CASCADE
);


-- Create table Hotel_Facility
CREATE TABLE Hotel_Facility (
  Hotel_ID INT NOT NULL,
  Facility_ID INT NOT NULL,
  PRIMARY KEY (Hotel_ID, Facility_ID),
  FOREIGN KEY (Hotel_ID) REFERENCES Hotel(Hotel_ID) ON DELETE CASCADE,
  FOREIGN KEY (Facility_ID) REFERENCES Facility(Facility_ID) ON DELETE CASCADE
);
GO
INSERT INTO Hotel_Facility (Hotel_ID, Facility_ID)
VALUES (1, 1),  
       (1, 2),
	   (1, 3),
	   (1, 4),
	   (1, 5),
	   (1, 6),
	   (1, 7),
	   (1, 8);
-- Create table Service
CREATE TABLE Service (
  Service_ID INT IDENTITY(1,1) PRIMARY KEY,
  Name NVARCHAR(255) NOT NULL
);
GO
INSERT INTO Service (Name)
VALUES (N'Ăn sáng');
INSERT INTO Service (Name)
VALUES ('Buffet');

-- Create table Hotel_Service
CREATE TABLE Hotel_Service (
  Hotel_Service_ID INT IDENTITY(1, 1) PRIMARY KEY,  -- Add unique identifier with IDENTITY
  Hotel_ID INT NOT NULL,
  Service_ID INT NOT NULL,
  Price INT,
  FOREIGN KEY (Hotel_ID) REFERENCES Hotel(Hotel_ID) ON DELETE CASCADE,
  FOREIGN KEY (Service_ID) REFERENCES Service(Service_ID) ON DELETE CASCADE,
  CONSTRAINT UniqueHotelService UNIQUE (Hotel_ID, Service_ID) -- Maintain uniqueness for hotel-service combination
);	
GO

-- Create Reservation table
CREATE TABLE Reservation (
  Reservation_ID INT IDENTITY(1,1) PRIMARY KEY,  -- Auto-incrementing unique identifier
  Reservation_Date DATE NOT NULL,  -- Date reservation was made
  Number_of_guests TINYINT NOT NULL,  -- Date reservation was made
  CheckInDate DATE NOT NULL,  -- Check-in date for the reservation
  CheckOutDate DATE NOT NULL,  -- Check-out date for the reservation
  Total_Price DECIMAL(10,2) NOT NULL,  -- Use DECIMAL for currency with decimals
  Payment_Method NVARCHAR(50) NOT NULL,  -- Payment method used (e.g., credit card, cash)
  Status NVARCHAR(50) NOT NULL, -- Paid / Canceled
  Customer_ID INT NOT NULL,
  FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID) ON DELETE CASCADE,  -- Foreign key to Customer table with cascading delete
  CONSTRAINT CheckInAfterResv CHECK (CheckInDate >= Reservation_Date),  -- Ensure check-in is after reservation date
  CONSTRAINT CheckOutAfterCheckIn CHECK (CheckOutDate > CheckInDate),
);
GO

CREATE TABLE Reserved_Service (
  Reserved_Service_ID INT IDENTITY(1,1) PRIMARY KEY,
  AmountOfDays TINYINT,
  Reservation_ID INT,
  Hotel_Service_ID INT,
  FOREIGN KEY (Reservation_ID) REFERENCES Reservation(Reservation_ID) ON DELETE CASCADE,
  FOREIGN KEY (Hotel_Service_ID) REFERENCES Hotel_Service(Hotel_Service_ID) ON DELETE CASCADE
);
GO

CREATE TABLE Reserved_Room (
  Reserved_Room_ID INT IDENTITY(1,1) PRIMARY KEY,
  Amount TINYINT,
  Reservation_ID INT,
  Room_ID INT,
  FOREIGN KEY (Reservation_ID) REFERENCES Reservation(Reservation_ID) ON DELETE CASCADE,
  FOREIGN KEY (Room_ID) REFERENCES Room(Room_ID) ON DELETE CASCADE
);
GO


-- Create table Pending_Cancel_Reservation
CREATE TABLE Pending_Cancel_Reservation (
  Pending_Cancel_Reservation_ID INT IDENTITY(1,1) PRIMARY KEY,  -- Auto-incrementing unique identifier
  Cancel_Date DATE NOT NULL,  -- Date the cancellation request was submitted
  Reservation_ID INT NOT NULL,
  FOREIGN KEY (Reservation_ID) REFERENCES Reservation(Reservation_ID) ON DELETE CASCADE,
  CONSTRAINT UniqueCancelRequest UNIQUE (Reservation_ID)  -- Ensures only one pending cancellation request per reservation
);
GO

-- Create table Promotion
CREATE TABLE Promotion (
  Promotion_ID INT IDENTITY(1,1) PRIMARY KEY,
  Name NVARCHAR(255) NOT NULL,
  Discount INT NOT NULL,
  StartDate DATE NOT NULL,
  EndDate DATE NOT NULL
);
GO










