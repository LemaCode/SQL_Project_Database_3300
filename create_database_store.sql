-- Create Customer table
CREATE TABLE Customer
(
    Customer_ID INT PRIMARY KEY,
    First_Name  VARCHAR(50)  NOT NULL,
    Last_Name   VARCHAR(50)  NOT NULL,
    Password    VARCHAR(255) NOT NULL,
    Email       VARCHAR(100) NOT NULL,
    Address     VARCHAR(255) NOT NULL
);
-- Insert data into Customer table
INSERT INTO Customer (Customer_ID, First_Name, Last_Name, Password, Email, Address)
VALUES ();

-- Create Maker table
CREATE TABLE Maker
(
    Maker_ID               INT PRIMARY KEY,
    Maker_Name             VARCHAR(100) NOT NULL,
    Country                VARCHAR(50)  NOT NULL,
    Maker_Established_Year INT          NOT NULL,
    Maker_Website_URL      VARCHAR(255)
);
-- Insert data into Maker table
INSERT INTO Maker (Maker_ID, Maker_Name, Country, Maker_Established_Year, Maker_Website_URL)
VALUES ();

-- Create Category table
CREATE TABLE Category
(
    Category_ID          INT PRIMARY KEY,
    Category_Name        VARCHAR(50),
    Category_Description VARCHAR(255)
);
-- Insert data into Category table
INSERT INTO Category (Category_ID, Category_Name, Category_Description)
VALUES ();

-- Create Car table
CREATE TABLE Car
(
    Car_ID         INT PRIMARY KEY,
    Price          DECIMAL(10, 2),
    Warranty       VARCHAR(50),
    Engine_Type    VARCHAR(50),
    Category_ID    INT,
    Maker_ID       INT,
    Color          VARCHAR(50),
    Model_ID       INT,
    Condition_Type VARCHAR(50),
    Car_Picture    VARCHAR(255),
    FOREIGN KEY (Category_ID) REFERENCES Category (Category_ID),
    FOREIGN KEY (Maker_ID) REFERENCES Maker (Maker_ID),
    FOREIGN KEY (Model_ID) REFERENCES Model (Model_ID)
);
-- Insert data into Car table
INSERT INTO Car (Car_ID, Price, Warranty, Engine_Type, Category_ID, Maker_ID, Color, Model_ID, Condition_Type,
                 Car_Picture)
VALUES ();

-- Create Review table
CREATE TABLE Review
(
    Review_ID   INT PRIMARY KEY,
    Customer_ID INT,
    Car_ID      INT,
    Rating      INT,
    Comment     VARCHAR(255),
    Date_Posted DATE,
    FOREIGN KEY (Customer_ID) REFERENCES Customer (Customer_ID),
    FOREIGN KEY (Car_ID) REFERENCES Car (Car_ID)
);
-- Insert data into Review table
INSERT INTO Review (Review_ID, Customer_ID, Car_ID, Rating, Comment, Date_Posted)
VALUES ();

-- Create Model table
CREATE TABLE Model
(
    Model_ID                 INT PRIMARY KEY,
    Model_Name               VARCHAR(100),
    Model_Year               INT,
    Transmission_Type        VARCHAR(50),
    Average_Fuel_Consumption DECIMAL(5, 2),
    Sales                    INT,
    Stock_Quantity           INT
);
-- Insert data into Model table
INSERT INTO Model (Model_ID, Model_Name, Model_Year, Transmission_Type, Average_Fuel_Consumption, Sales, Stock_Quantity)
VALUES ();

-- Create Order table
CREATE TABLE Order
(
    Order_ID       INT PRIMARY KEY,
    Customer_ID    INT,
    Car_ID         INT,
    Salesperson_ID INT,
    Order_Date     DATE,
    Total_Amount   DECIMAL(10, 2),
    Status         VARCHAR(50),
    Card_Number    VARCHAR(16),
    Expiry_Date    DATE,
    CVC            INT,
    FOREIGN KEY (Customer_ID) REFERENCES Customer (Customer_ID),
    FOREIGN KEY (Car_ID) REFERENCES Car (Car_ID),
    FOREIGN KEY (Salesperson_ID) REFERENCES Salesperson (Salesperson_ID)
);
-- Insert data into Order table
INSERT INTO Order (Order_ID, Customer_ID, Car_ID, Salesperson_ID, Order_Date, Total_Amount, Status, Card_Number,
                   Expiry_Date, CVC)
VALUES ();

-- Create Salesperson table
CREATE TABLE Salesperson
(
    Salesperson_ID INT PRIMARY KEY,
    First_Name     VARCHAR(50),
    Last_Name      VARCHAR(50),
    Email          VARCHAR(100),
    Phone_Number   VARCHAR(20)
);
-- Insert data into Salesperson table
INSERT INTO Salesperson (Salesperson_ID, First_Name, Last_Name, Email, Phone_Number)
VALUES ();
