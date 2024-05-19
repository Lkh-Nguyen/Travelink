-- Run Vietnam.sql first
-- Create the Customer table
CREATE TABLE Customer (
    Customer_ID INT IDENTITY(1,1) PRIMARY KEY, -- Primary key with auto-increment
    Email VARCHAR(255) NOT NULL,               -- Email field with VARCHAR type
    Password VARCHAR(255),            -- Password field with VARCHAR type
    CMND VARCHAR(20) ,							-- CMND field with VARCHAR type
    Name NVARCHAR(255) NOT NULL,               -- Name field with NVARCHAR type
    Gender CHAR(1),                    -- Gender field with CHAR type
	DateOfBirth DATE,
	PhoneNumber VARCHAR(20),
	AvatarURL VARCHAR(255),
	Address NVARCHAR(255)
);

INSERT INTO Customer (Email, Password, Name, Gender, DateOfBirth, PhoneNumber)
VALUES ('example@email.com', '123', N'Nguyễn Văn Nam', 'M', '1990-01-01', '0912345678');

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