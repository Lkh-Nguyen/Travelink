--Use the Travelink database
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
  ('Deluxe Suite Image', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fseashore-hotel-apartment-da-nang.hotelmix.vn%2F&psig=AOvVaw2xNmNbltska2Lk5K-TAFD5&ust=1716947801704000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCMj0zYqfr4YDFQAAAAAdAAAAABAE', 2), 
  ('Family Room Image', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fseashore-hotel-apartment-da-nang.hotelmix.vn%2F&psig=AOvVaw2xNmNbltska2Lk5K-TAFD5&ust=1716947801704000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCMj0zYqfr4YDFQAAAAAdAAAAABAE', 3),
  ('Standard Room Image', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fseashore-hotel-apartment-da-nang.hotelmix.vn%2F&psig=AOvVaw2xNmNbltska2Lk5K-TAFD5&ust=1716947801704000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCMj0zYqfr4YDFQAAAAAdAAAAABAE', 1), 
  ('Deluxe Suite Image', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fseashore-hotel-apartment-da-nang.hotelmix.vn%2F&psig=AOvVaw2xNmNbltska2Lk5K-TAFD5&ust=1716947801704000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCMj0zYqfr4YDFQAAAAAdAAAAABAE', 2), 
  ('Family Room Image', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fseashore-hotel-apartment-da-nang.hotelmix.vn%2F&psig=AOvVaw2xNmNbltska2Lk5K-TAFD5&ust=1716947801704000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCMj0zYqfr4YDFQAAAAAdAAAAABAE', 3), 
  ('Standard Room Image', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.booking.com%2Fhotel%2Fvn%2Fseashore-amp-apartment.vi.html&psig=AOvVaw2xNmNbltska2Lk5K-TAFD5&ust=1716947801704000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCMj0zYqfr4YDFQAAAAAdAAAAABBF', 1), 
  ('Deluxe Suite Image', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.booking.com%2Fhotel%2Fvn%2Fseashore-amp-apartment.vi.html&psig=AOvVaw2xNmNbltska2Lk5K-TAFD5&ust=1716947801704000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCMj0zYqfr4YDFQAAAAAdAAAAABBF', 2), 
  ('Family Room Image', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.booking.com%2Fhotel%2Fvn%2Fseashore-amp-apartment.vi.html&psig=AOvVaw2xNmNbltska2Lk5K-TAFD5&ust=1716947801704000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCMj0zYqfr4YDFQAAAAAdAAAAABBF', 3); 






-- Create table Facility
CREATE TABLE Facility (
  Facility_ID INT IDENTITY(1,1) PRIMARY KEY,
  URL VARCHAR(255),  -- Optional: URL for an icon or image representing the facility
  Name NVARCHAR(255) NOT NULL  -- Name of the facility
);
GO


-- Create table Room_Facility
CREATE TABLE Room_Facility (
  Room_ID INT ,
  Facility_ID INT,
  PRIMARY KEY (Room_ID, Facility_ID),
  FOREIGN KEY (Room_ID) REFERENCES Room(Room_ID) ON DELETE CASCADE,
  FOREIGN KEY (Facility_ID) REFERENCES Facility(Facility_ID) ON DELETE CASCADE 
);

-- Create table Bed
CREATE TABLE Bed (
  Bed_ID INT IDENTITY(1,1) PRIMARY KEY,
  Name NVARCHAR(255),
  Description NVARCHAR(255),
  URL VARCHAR(255)
);
INSERT INTO Bed (Name, Description, URL) VALUES 
(N'Giường đơn', 'Rộng 90 - 130 cm', 'URL_for_single_bed_image'),
(N'Giường đôi', 'Rộng 131 - 150 cm', 'URL_for_double_bed_image'),
(N'Giường lớn (cỡ King)', 'Rộng 151 - 180 cm', 'URL_for_king_bed_image'),
(N'Giường cực lớn (cỡ Super-king)', 'Rộng 181 - 210 cm', 'URL_for_super_king_bed_image');


CREATE TABLE Room_Bed (
  Room_Bed_ID INT IDENTITY(1,1) PRIMARY KEY,
  Amount TINYINT,
  Bed_ID INT,
  Room_ID INT,
  FOREIGN KEY (Bed_ID) REFERENCES Bed(Bed_ID) ON DELETE CASCADE,
  FOREIGN KEY (Room_ID) REFERENCES Room(Room_ID) ON DELETE CASCADE
);


-- Inserting data into Room_Bed table
INSERT INTO Room_Bed (Amount, Bed_ID, Room_ID) VALUES (2, 1, 1);
INSERT INTO Room_Bed (Amount, Bed_ID, Room_ID) VALUES (1, 2, 1);
INSERT INTO Room_Bed (Amount, Bed_ID, Room_ID) VALUES (3, 3, 2);
INSERT INTO Room_Bed (Amount, Bed_ID, Room_ID) VALUES (2, 4, 1);
INSERT INTO Room_Bed (Amount, Bed_ID, Room_ID) VALUES (1, 2, 3);



-- Create table Hotel_Facility
CREATE TABLE Hotel_Facility (
  Hotel_ID INT NOT NULL,
  Facility_ID INT NOT NULL,
  PRIMARY KEY (Hotel_ID, Facility_ID),
  FOREIGN KEY (Hotel_ID) REFERENCES Hotel(Hotel_ID) ON DELETE CASCADE,
  FOREIGN KEY (Facility_ID) REFERENCES Facility(Facility_ID) ON DELETE CASCADE
);

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