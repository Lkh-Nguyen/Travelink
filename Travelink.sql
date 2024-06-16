--Use the Travelink database
USE Travelink;
GO

CREATE TABLE Account (
  Account_ID INT IDENTITY(1,1) PRIMARY KEY, -- Primary key with auto-increment
  Email VARCHAR(255) NOT NULL,        -- Email field with VARCHAR type
  Password VARCHAR(255),      -- Password field with VARCHAR type
  CMND VARCHAR(20),							-- CMND field with VARCHAR type
  Name NVARCHAR(255) NOT NULL,        -- Name field with NVARCHAR type
  Gender CHAR(1),          -- Gender field with CHAR type
  DateOfBirth DATE,
  PhoneNumber VARCHAR(20),
  AvatarURL VARCHAR(255),
  Address NVARCHAR(255),
  Role INT NOT NULL
);

CREATE TABLE Pending_Host (
  Pending_Host_ID INT IDENTITY(1,1) PRIMARY KEY, -- Primary key with auto-increment
  Email VARCHAR(255) NOT NULL,        -- Email field with VARCHAR type
  Password VARCHAR(255),      -- Password field with VARCHAR type
  CMND VARCHAR(20),							-- CMND field with VARCHAR type
  Name NVARCHAR(255) NOT NULL,        -- Name field with NVARCHAR type
  Gender CHAR(1),          -- Gender field with CHAR type
  DateOfBirth DATE,
  PhoneNumber VARCHAR(20),
  AvatarURL VARCHAR(255),
  Address NVARCHAR(255),
);

--Create the Hotel table
CREATE TABLE Hotel (
  Hotel_ID INT IDENTITY(1,1) PRIMARY KEY,
  Name NVARCHAR(255) ,
  Email VARCHAR(255) NOT NULL UNIQUE ,
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
  Account_ID INT FOREIGN KEY REFERENCES Account(Account_ID) ON DELETE CASCADE,
  PRIMARY KEY (Hotel_ID, Account_ID)
);
GO

--Create Owned_Hotel table with ON DELETE CASCADE for foreign keys
CREATE TABLE Owned_Hotel (
  Hotel_ID INT FOREIGN KEY REFERENCES Hotel(Hotel_ID) ON DELETE CASCADE,
  Account_ID INT FOREIGN KEY REFERENCES Account(Account_ID) ON DELETE CASCADE,
  PRIMARY KEY (Hotel_ID, Account_ID)
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
  Account_ID INT FOREIGN KEY REFERENCES Account(Account_ID) ON DELETE CASCADE,
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
  Status NVARCHAR(50) NOT NULL,
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


CREATE TABLE Room_Bed (
  Room_Bed_ID INT IDENTITY(1,1) PRIMARY KEY,
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
  Reservation_Date DATETIME NOT NULL,  -- Date reservation was made
  Number_of_guests TINYINT NOT NULL,  -- Date reservation was made
  CheckInDate DATE NOT NULL,  -- Check-in date for the reservation
  CheckOutDate DATE NOT NULL,  -- Check-out date for the reservation
  Total_Price DECIMAL(10,2) NOT NULL,  -- Use DECIMAL for currency with decimals
  Payment_Method NVARCHAR(50) NOT NULL,  -- Payment method used (e.g., credit card, cash)
  Status NVARCHAR(50) NOT NULL, -- Paid / Canceled
  Account_ID INT NOT NULL,
  FOREIGN KEY (Account_ID) REFERENCES Account(Account_ID) ON DELETE CASCADE,  -- Foreign key to Account table with cascading delete
  CONSTRAINT CheckInAfterResv CHECK (CheckInDate >= Reservation_Date),  -- Ensure check-in is after reservation date
  CONSTRAINT CheckOutAfterCheckIn CHECK (CheckOutDate > CheckInDate),
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
  Cancel_Date DATETIME NOT NULL,  -- Date the cancellation request was submitted
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

--Auto delete temporary reservation
CREATE PROCEDURE DeleteExpiredReservations
AS
BEGIN
    DELETE FROM Reservation
    WHERE Status = 'NOT PAID'
      AND Payment_Method = 'VIETQR'
      AND Reservation_Date < DATEADD(MINUTE, -5, GETDATE());
END

