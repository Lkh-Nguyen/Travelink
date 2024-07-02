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
Role INT NOT NULL,
);

ALTER TABLE Account
ADD Status INT NOT NULL;


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
Rating Float,
PhoneNumber VARCHAR(20) ,
Description NTEXT ,
CheckInTimeStart TIME(0) ,
CheckInTimeEnd TIME(0) ,
CheckOutTimeStart TIME(0) ,
CheckOutTimeEnd TIME(0) ,
Address NVARCHAR(255) ,
Ward_ID INT,
Status NVARCHAR(50),
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
Total_Price INT NOT NULL,  -- Use INT 
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


-- Create table Refunding_Reservation
CREATE TABLE Refunding_Reservation (
Refunding_Reservation_ID INT IDENTITY(1,1) PRIMARY KEY,  -- Auto-incrementing unique identifier
Cancel_Date DATETIME NOT NULL,  -- Date the cancellation request was submitted
Amount INT,
RefundTime DATETIME,
Status NVARCHAR(50),
Reservation_ID INT NOT NULL,
FOREIGN KEY (Reservation_ID) REFERENCES Reservation(Reservation_ID) ON DELETE CASCADE,
CONSTRAINT UniqueCancelRequestt UNIQUE (Reservation_ID)  -- Ensures only one pending cancellation request per reservation
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

-- Create table Feedback
CREATE TABLE Feedback (
Feedback_ID INT IDENTITY(1,1) PRIMARY KEY,
Description NVARCHAR(MAX),
Rating TINYINT,
Date DATE,
LikesCount INT,
DislikesCount INT,
Reservation_ID INT FOREIGN KEY REFERENCES Reservation(Reservation_ID) ON DELETE CASCADE,
);
-- Create table Reported Feedback
CREATE TABLE Reported_Feedback (
Reported_Feedback_ID INT PRIMARY KEY Identity(1,1),
ReportTime DATETIME,
Reason NVARCHAR(255),
Feedback_ID INT FOREIGN KEY REFERENCES Feedback(Feedback_ID),
Account_ID INT FOREIGN KEY REFERENCES Account(Account_ID)
);

CREATE TABLE UserFeedbackLikes (
Like_ID INT IDENTITY(1,1) PRIMARY KEY, -- Primary key with auto-increment
Account_ID INT NOT NULL, -- Foreign key to Account table
Feedback_ID INT NOT NULL, -- Foreign key to Feedback table
Liked BIT DEFAULT 0, -- 0 or 1 indicating whether the feedback is liked
Disliked BIT DEFAULT 0, -- 0 or 1 indicating whether the feedback is disliked
CONSTRAINT FK_UserFeedbackLikes_Account FOREIGN KEY (Account_ID) REFERENCES Account(Account_ID) ON DELETE CASCADE,
CONSTRAINT FK_UserFeedbackLikes_Feedback 
FOREIGN KEY (Feedback_ID) REFERENCES Feedback(Feedback_ID) ON DELETE NO ACTION,
CONSTRAINT CK_Like_Dislike_Exclusive CHECK (
    (Liked = 1 AND Disliked = 0) OR
    (Liked = 0 AND Disliked = 1) OR
    (Liked = 0 AND Disliked = 0)
)
);


-- Create table Monthly Revenue
CREATE TABLE MonthlyPayment (
Monthly_Payment_ID INT PRIMARY KEY IDENTITY(1,1),
Month TINYINT,
Year SMALLINT,
Amount INT,
Status NVARCHAR(50),
PaymentTime DATETIME,
Hotel_ID INT FOREIGN KEY REFERENCES Hotel(Hotel_ID) ON DELETE CASCADE
);
GO





--Auto delete temporary online reservation
CREATE PROCEDURE DeleteExpiredReservations
AS
BEGIN
DELETE FROM Reservation
WHERE Status = 'NOT PAID'
    AND Payment_Method = 'VIETQR'
    AND Reservation_Date < DATEADD(MINUTE, -5, GETDATE());
END
GO

--Apply for all reservation
CREATE PROCEDURE UpdateReservationStatus
AS
BEGIN
-- Update reservations where the current date is >= CheckInDate and < CheckOutDate
-- and the status is 'PAID' to 'PROCESSING'
UPDATE Reservation
SET Status = 'PROCESSING'
WHERE GETDATE() >= CheckInDate
    AND GETDATE() < CheckOutDate
    AND Status = 'PAID';

-- Update reservations where the current date is >= CheckOutDate
-- and the status is 'PROCESSING' to 'FINISHED'
UPDATE Reservation
SET Status = 'FINISHED'
WHERE GETDATE() >= CheckOutDate
    AND Status = 'PROCESSING';
END;
GO


--
CREATE PROCEDURE CalculateMonthlyRevenueForAllHotelsPreviousMonthYear
AS
BEGIN
SET NOCOUNT ON;
DECLARE @Month TINYINT = MONTH(DATEADD(MONTH, -1, GETDATE()));
DECLARE @Year SMALLINT = YEAR(DATEADD(MONTH, -1, GETDATE()));
DECLARE @PaymentTime DATETIME = NULL;

-- Temporary table to hold aggregated data
CREATE TABLE #MonthlyRevenueData (
    Hotel_ID INT,
    TotalRevenue INT
);

-- Calculate revenue for hotels with reservations using VIETQR payment method
INSERT INTO #MonthlyRevenueData (Hotel_ID, TotalRevenue)
SELECT
    rm.Hotel_ID,
    CAST(SUM(
        CASE
            WHEN r.Status IN ('PROCESSING', 'FINISHED', 'FEEDBACKED') THEN r.Total_Price
            WHEN r.Status = 'CANCEL' THEN r.Total_Price - ISNULL(rr.Amount, 0)
            WHEN r.Status = 'REFUNDING' THEN r.Total_Price - ISNULL(rr.Amount, 0)
            ELSE 0
        END
    ) * 0.9 AS INT) AS TotalRevenue  -- Apply 90% multiplier and cast to INT
FROM
    Reservation r
INNER JOIN
    Reserved_Room rr ON r.Reservation_ID = rr.Reservation_ID
INNER JOIN
    Room rm ON rr.Room_ID = rm.Room_ID
LEFT JOIN
    Refunding_Reservation rf ON r.Reservation_ID = rf.Reservation_ID
WHERE
    MONTH(r.CheckInDate) = @Month
    AND YEAR(r.CheckInDate) = @Year
    AND r.Status IN ('PROCESSING', 'FINISHED', 'FEEDBACKED', 'CANCEL', 'REFUNDING')
    AND r.Payment_Method = 'VIETQR'  -- Filter by payment method VIETQR
GROUP BY
    rm.Hotel_ID;

-- Insert into MonthlyPayment table
INSERT INTO MonthlyPayment (Month, Year, Amount, Status, PaymentTime, Hotel_ID)
SELECT
    @Month,
    @Year,
    SUM(m.TotalRevenue) AS Amount,  -- Sum the TotalRevenue for each hotel
    'NOT PAID',  -- Assuming all amounts are pending for now
    @PaymentTime,
    m.Hotel_ID
FROM
    #MonthlyRevenueData m
GROUP BY
    m.Hotel_ID;

-- Clean up temporary table
DROP TABLE #MonthlyRevenueData;

PRINT 'Monthly revenue calculation successful for all hotels for month ' + CAST(@Month AS VARCHAR(2)) + ', year ' + CAST(@Year AS VARCHAR(4)) + '.';
END;

GO


EXEC CalculateMonthlyRevenueForAllHotelsPreviousMonthYear;
DROP PROC CalculateMonthlyRevenueForAllHotelsPreviousMonthYear;
DROP TABLE MonthlyPayment


CREATE VIEW HotelInfor AS
WITH RankedHotels AS (
SELECT 
    h.Hotel_ID, 
    h.Name, 
    h.Star, 
    h.Address, 
    hi.URL, 
    fh.Account_ID,
    ROW_NUMBER() OVER (PARTITION BY h.Hotel_ID ORDER BY (SELECT NULL)) AS rn
FROM 
    Favourite_Hotel fh
INNER JOIN 
    Hotel h ON fh.Hotel_ID = h.Hotel_ID
INNER JOIN 
    Hotel_Image hi ON h.Hotel_ID = hi.Hotel_ID
), 
HotelRatings AS (
SELECT 
    h.Hotel_ID,
    COUNT(F.Rating) AS Total_Rating_Count,
    AVG(CAST(F.Rating AS FLOAT)) AS Average_Rating
FROM 
    Hotel h
inner JOIN 
	Room room ON h.Hotel_ID = room.Hotel_ID
inner JOIN 
	Reserved_Room rs on room.Room_ID = rs.Room_ID
inner JOIN 
    Feedback F ON rs.Reserved_Room_ID = F.Reservation_ID
GROUP BY 
    h.Hotel_ID
)
SELECT 
rh.Hotel_ID, 
rh.Name, 
rh.Star, 
rh.Address, 
rh.URL, 
rh.Account_ID,
COALESCE(hr.Total_Rating_Count, 0) AS RatingCount, 
COALESCE(hr.Average_Rating, 0) AS Average
FROM 
RankedHotels rh
LEFT JOIN 
HotelRatings hr ON rh.Hotel_ID = hr.Hotel_ID
WHERE 
rh.rn = 1;





SELECT
H.Hotel_ID,
COUNT(F.Feedback_ID) AS Total_Rating_Count,
AVG(CAST(F.Rating AS FLOAT)) AS Average_Rating
FROM
Hotel H
LEFT JOIN
Room R ON H.Hotel_ID = R.Hotel_ID
LEFT JOIN
Reserved_Room RR ON R.Room_ID = RR.Room_ID
LEFT JOIN
Reservation Res ON RR.Reservation_ID = Res.Reservation_ID
LEFT JOIN
Feedback F ON Res.Reservation_ID = F.Reservation_ID
GROUP BY
H.Hotel_ID;
