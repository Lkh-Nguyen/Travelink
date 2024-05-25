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
  CheckInTime TIME(0) ,
  CheckOutTime TIME(0) ,
  Address NVARCHAR(255) ,
  Ward_ID INT,
  FOREIGN KEY (Ward_ID) REFERENCES Ward(Ward_ID)
);
GO

insert into Hotel values 
(N'Khách sạn và căn hộ Seashore','email1@gmail.com',1234567890,4,'0123456789',
N'Dành cho những du khách muốn du lịch thoải mái cùng ngân sách tiết kiệm, Seashore Hotel & Apartment sẽ là lựa chọn lưu trú hoàn hảo,
nơi cung cấp các tiện nghi chất lượng và dịch vụ tuyệt vời.',
'12:00', '10:00',N'15-16 Hoàng Sa, Mân Thái, Sơn Trà, Đà Nẵng, Việt Nam',6372),
(N'Davue Hotel Da Nang','email2@gmail.com',1234567890,3,'0123456789',
N'Davue Hotel Da Nang là đề xuất hàng đầu dành cho những tín đồ du lịch "bụi" mong muốn được nghỉ tại một khách sạn vừa thoải mái lại hợp túi tiền. 
\nDành cho những du khách muốn du lịch thoải mái cùng ngân sách tiết kiệm, Davue Hotel Da Nang sẽ là lựa chọn lưu trú hoàn hảo, nơi cung cấp các tiện nghi chất lượng và dịch vụ tuyệt vời.
\nKhách sạn này là lựa chọn hoàn hảo cho các kỳ nghỉ mát lãng mạn hay tuần trăng mật của các cặp đôi. Quý khách hãy tận hưởng những đêm đáng nhớ nhất cùng người thương của mình tại Davue Hotel Da Nang',
'12:00', '10:00',N'57-59 Đỗ Bí, Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Việt Nam',6374),
(N'Cicilia Danang Hotels & Spa Powered by ASTON','email3@gmail.com',1234567890,3,'0123456789',
N'Khách sạn này là lựa chọn hoàn hảo cho các kỳ nghỉ mát lãng mạn hay tuần trăng mật của các cặp đôi. Quý khách hãy tận hưởng những đêm đáng nhớ nhất cùng người thương của mình tại Cicilia Danang Hotels & Spa Powered by ASTON
\nCicilia Danang Hotels & Spa Powered by ASTON là lựa chọn sáng giá dành cho những ai đang tìm kiếm một trải nghiệm xa hoa đầy thú vị trong kỳ nghỉ của mình. Lưu trú tại đây cũng là cách để quý khách chiều chuộng bản thân với những dịch vụ xuất sắc nhất và khiến kỳ nghỉ của mình trở nên thật đáng nhớ.
\nMột trong những đặc điểm chính của khách sạn này là các liệu pháp spa đa dạng. Hãy nâng niu bản thân bằng các liệu pháp thư giãn, phục hồi giúp quý khách tươi trẻ thân, tâm.',
'12:00', '10:00',N'06-10 Đỗ Bá, Bãi Biển T20, Phường Mỹ An, Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Việt Nam',6373),
(N'Bay Capital Danang','email4@gmail.com',1234567890,1,'0123456789',
N'Dù quý khách muốn tổ chức một sự kiện hay các dịp kỷ niệm đặc biệt khác, Bay Capital Danang là lựa chọn tuyệt vời cho quý khách với phòng chức năng rộng lớn, được trang bị đầy đủ để sẵn sàng đáp ứng mọi yêu cầu.
\nKhách sạn này là lựa chọn hoàn hảo cho các kỳ nghỉ mát lãng mạn hay tuần trăng mật của các cặp đôi. Quý khách hãy tận hưởng những đêm đáng nhớ nhất cùng người thương của mình tại Bay Capital Danang
\nBay Capital Danang là lựa chọn sáng giá dành cho những ai đang tìm kiếm một trải nghiệm xa hoa đầy thú vị trong kỳ nghỉ của mình. Lưu trú tại đây cũng là cách để quý khách chiều chuộng bản thân với những dịch vụ xuất sắc nhất và khiến kỳ nghỉ của mình trở nên thật đáng nhớ.',
'12:00', '10:00',N'17 Quang Trung, Phường Hải Châu 1, Quận Hải Châu, Đà Nẵng, Việt Nam',6355),
(N'Khu nghỉ dưỡng và Spa Mikazuki Nhật Bản','email5@gmail.com',1234567890,2,'0123456789',
N'Từ sự kiện doanh nghiệp đến họp mặt công ty, Da Nang – Mikazuki JAPANESE RESORTS & SPA cung cấp đầy đủ các dịch vụ và tiện nghi đáp ứng mọi nhu cầu của quý khách và đồng nghiệp.
\nDù quý khách muốn tổ chức một sự kiện hay các dịp kỷ niệm đặc biệt khác, Da Nang – Mikazuki JAPANESE RESORTS & SPA là lựa chọn tuyệt vời cho quý khách với phòng chức năng rộng lớn, được trang bị đầy đủ để sẵn sàng đáp ứng mọi yêu cầu.
\nHãy tận hưởng thời gian vui vẻ cùng cả gia đình với hàng loạt tiện nghi giải trí tại Da Nang – Mikazuki JAPANESE RESORTS & SPA, một nơi nghỉ tuyệt vời phù hợp cho mọi kỳ nghỉ bên người thân.',
'12:00', '10:00',N'Đường Nguyễn Tất Thành,Phường Hòa Hiệp Nam, Hòa Hiệp Nam, Liên Chiểu, Đà Nẵng, Việt Nam',6338);

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

-- Create table Room_Type
CREATE TABLE Room_Type (
  Room_Type_ID INT IDENTITY(1,1) PRIMARY KEY,
  Name NVARCHAR(255) NOT NULL,
  Room_Description NVARCHAR(255),
  Adult TINYINT,
  Children TINYINT,
  Total_Rooms TINYINT,
  Hotel_ID INT FOREIGN KEY REFERENCES Hotel(Hotel_ID) ON DELETE CASCADE
);
GO

-- Create table Room_Image
CREATE TABLE Room_Image (
  Room_Image_ID INT IDENTITY(1,1) PRIMARY KEY,
  Name NVARCHAR(255),  -- Optional: Name of the image
  URL VARCHAR(255) NOT NULL, -- Image URL
  Room_Type_ID INT FOREIGN KEY REFERENCES Room_Type(Room_Type_ID) ON DELETE CASCADE
);
GO

-- Create table Hotel_Image
CREATE TABLE Hotel_Image (
  Hotel_Image_ID INT IDENTITY(1,1) PRIMARY KEY,
  Name NVARCHAR(255),  -- Optional: Name of the image
  URL VARCHAR(255) NOT NULL, -- Image URL
  Hotel_ID INT FOREIGN KEY REFERENCES Hotel(Hotel_ID) ON DELETE CASCADE
);
GO

-- Create table Facility
CREATE TABLE Facility (
  Facility_ID INT IDENTITY(1,1) PRIMARY KEY,
  URL VARCHAR(255),  -- Optional: URL for an icon or image representing the facility
  Name NVARCHAR(255) NOT NULL  -- Name of the facility
);
GO

-- Create table Hotel_Facility
CREATE TABLE Hotel_Facility (
  Hotel_ID INT NOT NULL,
  Facility_ID INT NOT NULL,
  PRIMARY KEY (Hotel_ID, Facility_ID),
  FOREIGN KEY (Hotel_ID) REFERENCES Hotel(Hotel_ID) ON DELETE CASCADE,
  FOREIGN KEY (Facility_ID) REFERENCES Facility(Facility_ID) ON DELETE CASCADE
);
GO

-- Create table Service
CREATE TABLE Service (
  Service_ID INT IDENTITY(1,1) PRIMARY KEY,
  Name NVARCHAR(255) NOT NULL
);
GO

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



-- Create table Package
CREATE TABLE Package (
  Package_ID INT IDENTITY(1,1) PRIMARY KEY,
  Room_Type_ID INT NOT NULL,
  Hotel_Service_ID INT NOT NULL,
  Price DECIMAL(10,2) NOT NULL,  -- Use DECIMAL for currency
  Price_Start_Date DATE NOT NULL,
  Price_End_Date DATE NOT NULL,
  FOREIGN KEY (Room_Type_ID) REFERENCES Room_Type(Room_Type_ID) ON DELETE CASCADE,
  FOREIGN KEY (Hotel_Service_ID) REFERENCES Hotel_Service(Hotel_Service_ID) ON DELETE NO ACTION,
  CONSTRAINT UniquePackage  UNIQUE (Room_Type_ID, Hotel_Service_ID),  -- Ensures unique combination of room type and service
);
GO

-- Create Reservation table
CREATE TABLE Reservation (
  Reservation_ID INT IDENTITY(1,1) PRIMARY KEY,  -- Auto-incrementing unique identifier
  Reservation_Date DATE NOT NULL,  -- Date reservation was made
  CheckInDate DATE NOT NULL,  -- Check-in date for the reservation
  CheckOutDate DATE NOT NULL,  -- Check-out date for the reservation
  Total_Price DECIMAL(10,2) NOT NULL,  -- Use DECIMAL for currency with decimals
  Payment_Method NVARCHAR(50) NOT NULL,  -- Payment method used (e.g., credit card, cash)
  Customer_ID INT NOT NULL,
  FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID) ON DELETE CASCADE,  -- Foreign key to Customer table with cascading delete
  CONSTRAINT CheckInAfterResv CHECK (CheckInDate >= Reservation_Date),  -- Ensure check-in is after reservation date
  CONSTRAINT CheckOutAfterCheckIn CHECK (CheckOutDate > CheckInDate),
);
GO

-- Create table Reserved_Package
CREATE TABLE Reserved_Package (
  Reserved_Package_ID INT IDENTITY(1,1) PRIMARY KEY,  -- Auto-incrementing unique identifier
  Package_Amount TINYINT NOT NULL,  -- Number of packages reserved (positive integer)
  Reservation_ID INT NOT NULL,
  Package_ID INT NOT NULL,
  FOREIGN KEY (Reservation_ID) REFERENCES Reservation(Reservation_ID) ON DELETE CASCADE,
  FOREIGN KEY (Package_ID) REFERENCES Package(Package_ID) ON DELETE CASCADE,
  CONSTRAINT CheckPackageAmount CHECK (Package_Amount > 0)  -- Ensure positive number of packages reserved
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










