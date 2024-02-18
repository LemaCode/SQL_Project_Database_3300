-- Create Customer table
CREATE TABLE Customer
(
    Customer_ID INT PRIMARY KEY,
    First_Name  VARCHAR(50),
    Last_Name   VARCHAR(50),
    Password    VARCHAR(255),
    Email       VARCHAR(100),
    Address     VARCHAR(255)
);

-- Create Maker table
CREATE TABLE Maker
(
    Maker_ID               INT PRIMARY KEY,
    Maker_Name             VARCHAR(100),
    Country                VARCHAR(50),
    Maker_Established_Year INT,
    Maker_Website_URL      VARCHAR(255)
);

-- Create Category table
CREATE TABLE Category
(
    Category_ID          INT PRIMARY KEY,
    Category_Name        VARCHAR(50),
    Category_Description VARCHAR(255)
);

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

-- Create Salesperson table
CREATE TABLE Salesperson
(
    Salesperson_ID INT PRIMARY KEY,
    First_Name     VARCHAR(50),
    Last_Name      VARCHAR(50),
    Email          VARCHAR(100),
    Phone_Number   VARCHAR(20)
);
