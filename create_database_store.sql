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
VALUES (1001, 'John', 'Doe', 'password123', 'john.doe@email.com', '123 Main St'),
       (1002, 'Jane', 'Smith', 'securepass', 'jane.smith@email.com', '456 Oak Ave'),
       (1003, 'Robert', 'Johnson', 'pass123', 'robert.johnson@email.com', '789 Pine Rd'),
       (1004, 'Emily', 'Davis', 'securepass321', 'emily.davis@email.com', '101 Elm St'),
       (1005, 'Michael', 'Miller', 'mikepass', 'michael.miller@email.com', '202 Maple Ave'),
       (1006, 'Olivia', 'Williams', 'olivia123', 'olivia.williams@email.com', '303 Birch Rd'),
       (1007, 'David', 'Brown', 'brownpass', 'david.brown@email.com', '404 Cedar St'),
       (1008, 'Emma', 'Jones', 'emma456', 'emma.jones@email.com', '505 Oak Ave'),
       (1009, 'William', 'Lee', 'willpass789', 'william.lee@email.com', '606 Pine Rd'),
       (1010, 'Sophia', 'Taylor', 'sophiapass', 'sophia.taylor@email.com', '707 Elm St');

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
VALUES (2001, 'Toyota', 'Japan', 1937, 'https://www.toyota.com'),
       (2002, 'Ford', 'USA', 1903, 'https://www.ford.com'),
       (2003, 'Honda', 'Japan', 1948, 'https://www.honda.com'),
       (2004, 'Chevrolet', 'USA', 1911, 'https://www.chevrolet.com'),
       (2005, 'BMW', 'Germany', 1916, 'https://www.bmw.com'),
       (2006, 'Mercedes-Benz', 'Germany', 1926, 'https://www.mercedes-benz.com'),
       (2007, 'Hyundai', 'South Korea', 1967, 'https://www.hyundai.com'),
       (2008, 'Nissan', 'Japan', 1933, 'https://www.nissan.com'),
       (2009, 'Kia', 'South Korea', 1944, 'https://www.kia.com'),
       (2010, 'Volkswagen', 'Germany', 1937, 'https://www.vw.com');
-- Create Category table
CREATE TABLE Category
(
    Category_ID          INT PRIMARY KEY,
    Category_Name        VARCHAR(50),
    Category_Description VARCHAR(255)
);
-- Insert data into Category table
INSERT INTO Category (Category_ID, Category_Name, Category_Description)
VALUES (3001, 'Sedan', 'Four-door passenger car'),
       (3002, 'SUV', 'Sport Utility Vehicle'),
       (3003, 'Hatchback', 'Compact car with a rear door that opens upwards'),
       (3004, 'Truck', 'Large vehicle designed to transport cargo'),
       (3005, 'Coupe', 'Two-door car with a fixed roof'),
       (3006, 'Convertible', 'Car with a folding or retractable roof'),
       (3007, 'Crossover', 'Combines features of SUV and sedan'),
       (3008, 'Van', 'Larger vehicle primarily used for transporting people'),
       (3009, 'Electric', 'Vehicle powered by electric energy'),
       (3010, 'Sports Car', 'High-performance and typically two-seater');


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
VALUES (4001, 25000.00, '2 years', 'V6', 3001, 2001, 'Blue', 1, 'New', 'car1.jpg'),
       (4002, 30000.00, '3 years', 'V8', 3002, 2002, 'Red', 2, 'Used', 'car2.jpg'),
       (4003, 22000.00, '1 year', 'Inline-4', 3003, 2003, 'Silver', 3, 'New', 'car3.jpg'),
       (4004, 35000.00, '2 years', 'V8', 3004, 2004, 'Black', 4, 'Used', 'car4.jpg'),
       (4005, 40000.00, '3 years', 'V6', 3005, 2005, 'White', 5, 'New', 'car5.jpg'),
       (4006, 28000.00, '2 years', 'Inline-6', 3006, 2006, 'Gray', 6, 'Used', 'car6.jpg'),
       (4007, 24000.00, '1 year', 'V4', 3007, 2007, 'Green', 7, 'New', 'car7.jpg'),
       (4008, 32000.00, '3 years', 'V6', 3008, 2008, 'Brown', 8, 'Used', 'car8.jpg'),
       (4009, 26000.00, '2 years', 'Inline-4', 3009, 2009, 'Yellow', 9, 'New', 'car9.jpg'),
       (4010, 38000.00, '2 years', 'V8', 3010, 2010, 'Orange', 10, 'Used', 'car10.jpg');

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
VALUES (5001, 1001, 4001, 5, 'Great car!', '2024-02-18'),
       (5002, 1002, 4002, 4, 'Good performance', '2024-02-19'),
       (5003, 1003, 4003, 3, 'Average experience', '2024-02-20'),
       (5004, 1004, 4004, 5, 'Excellent truck', '2024-02-21'),
       (5005, 1005, 4005, 4, 'Smooth ride', '2024-02-22'),
       (5006, 1006, 4006, 2, 'Not satisfied with the convertible', '2024-02-23'),
       (5007, 1007, 4007, 4, 'Spacious interior', '2024-02-24'),
       (5008, 1008, 4008, 5, 'Luxurious feel', '2024-02-25'),
       (5009, 1009, 4009, 3, 'Decent electric car', '2024-02-26'),
       (5010, 1010, 4010, 4, 'Sporty and fun', '2024-02-27');

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
VALUES (6001, 'Camry', 2022, 'Automatic', 30.5, 100, 20),
       (6002, 'Explorer', 2023, 'Automatic', 25.2, 80, 15),
       (6003, 'Civic', 2022, 'CVT', 32.1, 120, 25),
       (6004, 'Silverado', 2023, 'Automatic', 18.5, 60, 10),
       (6005, 'X5', 2022, 'Automatic', 27.8, 90, 18),
       (6006, 'C-Class', 2023, 'Automatic', 24.3, 70, 12),
       (6007, 'Palisade', 2022, 'Automatic', 22.7, 110, 22),
       (6008, 'Altima', 2023, 'CVT', 28.4, 75, 14),
       (6009, 'Soul', 2022, 'Automatic', 26.0, 95, 16),
       (6010, 'Golf', 2023, 'Automatic', 29.6, 85, 17);

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
VALUES (7001, 1001, 4001, 1, '2024-02-20', 25000.00, 'Completed', '1234567890123456', '2025-12-31', 123),
       (7002, 1002, 4002, 2, '2024-02-21', 30000.00, 'Processing', '9876543210987654', '2024-10-31', 456),
       (7003, 1003, 4003, 3, '2024-02-22', 22000.00, 'Shipped', '6543210987654321', '2024-08-31', 789),
       (7004, 1004, 4004, 4, '2024-02-23', 35000.00, 'Pending', '1230987654321098', '2024-09-30', 234),
       (7005, 1005, 4005, 5, '2024-02-24', 40000.00, 'Completed', '5678901234567890', '2025-11-30', 567),
       (7006, 1006, 4006, 6, '2024-02-25', 28000.00, 'Processing', '0987654321098765', '2024-07-31', 890),
       (7007, 1007, 4007, 7, '2024-02-26', 24000.00, 'Shipped', '3456789012345678', '2024-06-30', 123),
       (7008, 1008, 4008, 8, '2024-02-27', 32000.00, 'Pending', '9012345678901234', '2024-11-30', 456),
       (7009, 1009, 4009, 9, '2024-02-28', 26000.00, 'Completed', '2345678901234567', '2025-10-31', 789),
       (7010, 1010, 4010, 10, '2024-02-29', 38000.00, 'Processing', '6789012345678901', '2024-05-31', 234);

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
VALUES (8001, 'Alice', 'Johnson', 'alice@email.com', '555-1234'),
       (8002, 'Bob', 'Williams', 'bob@email.com', '555-5678'),
       (8003, 'Charlie', 'Smith', 'charlie@email.com', '555-9876'),
       (8004, 'David', 'Brown', 'david@email.com', '555-4321'),
       (8005, 'Emma', 'Davis', 'emma@email.com', '555-8765'),
       (8006, 'Frank', 'Jones', 'frank@email.com', '555-2345'),
       (8007, 'Grace', 'Taylor', 'grace@email.com', '555-6789'),
       (8008, 'Henry', 'Wilson', 'henry@email.com', '555-3456'),
       (8009, 'Ivy', 'Martinez', 'ivy@email.com', '555-7890'),
       (8010, 'Jack', 'Harris', 'jack@email.com', '555-4567');

-- Confirming the completion of data insertion
SELECT * FROM Customer;
SELECT * FROM Maker;
SELECT * FROM Category;
SELECT * FROM Car;
SELECT * FROM Review;
SELECT * FROM Model;
SELECT * FROM Order;
SELECT * FROM Salesperson;

-- 1. Find the average rating and the total number of reviews for each car.
SELECT Car.Car_ID, AVG(Review.Rating) AS Avg_Rating, COUNT(Review.Review_ID) AS Total_Reviews
FROM Car
         LEFT JOIN Review ON Car.Car_ID = Review.Car_ID
GROUP BY Car.Car_ID;
-- 2. Retrieve details of cars with prices higher than the average price of cars in the same category.
SELECT Car_ID, Price, Category_ID
FROM Car
WHERE Price > (SELECT AVG(Price) FROM Car AS SubCar WHERE SubCar.Category_ID = Car.Category_ID);

-- 3. Retrieve details of cars with prices higher than the average price of cars in the same category.
SELECT Car_ID, Price, Category_ID
FROM Car
WHERE Price > (SELECT AVG(Price) FROM Car AS SubCar WHERE SubCar.Category_ID = Car.Category_ID);

-- 4. Find makers with more than 3 cars in the database and list the count of cars for each maker.
SELECT Maker.Maker_ID, Maker.Maker_Name, COUNT(Car.Car_ID) AS Car_Count
FROM Maker
         LEFT JOIN Car ON Maker.Maker_ID = Car.Maker_ID
GROUP BY Maker.Maker_ID, Maker.Maker_Name
HAVING COUNT(Car.Car_ID) > 3;

-- 5. Retrieve a list of customers and their order details, including those who haven't placed any orders.
SELECT Car.Car_ID, Car.Model_ID, Car.Price, Review.Rating, Review.Comment
FROM Car
         LEFT OUTER JOIN Review ON Car.Car_ID = Review.Car_ID;
