CREATE DATABASE [E-Commercial]
go

use [E-Commercial]


CREATE TABLE Users (
    ID int IDENTITY PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Password VARCHAR(100) NOT NULL,
    IsActive bit NOT NULL
);

CREATE TABLE UserDetails (
	ID INT IDENTITY PRIMARY KEY,
	UserId int FOREIGN KEY REFERENCES Users(ID) UNIQUE,
    PhoneNumber VARCHAR(30),
    Address VARCHAR(255),
);


CREATE TABLE Products (
    ID INT IDENTITY PRIMARY KEY,
    Name VARCHAR(255),
    Price DECIMAL(10, 2)
);

CREATE TABLE Orders (
    ID INT IDENTITY PRIMARY KEY,
	UserId int FOREIGN KEY REFERENCES Users(ID),
	ExecutedDate DATE,
);

CREATE TABLE [Products and Orders](
 ID INT IDENTITY PRIMARY KEY,
 OrderID int FOREIGN KEY REFERENCES Orders(ID),
 ProductID int FOREIGN KEY  REFERENCES Products(ID),
);


/*
use master

drop database [E-Commercial]

*/

-- Users table
INSERT INTO Users (FirstName, LastName, Email, Password, IsActive)
VALUES
('Senan', 'orucov', 'senan.@gmail.com', 'password123', 1),
('Tarif', 'Alýyev', 'arif.@gmail.com', 'qwert', 1),
('Alice', 'Johnson', 'alice.@gmail.com', 'asdfgh', 1),
('Jane', 'Brown', 'jane.@gmail.com', 'password111123', 1),
('Eva', 'Brown', 'eva.brown@gmail.com', '12323', 1);

-- UserDetails table
INSERT INTO UserDetails (UserId, PhoneNumber, Address)
VALUES
(1, '050-539-40-16', '123 Main St, Cityville'),
(2, '070-111-11-11', '456 Oak St, Townsville'),
(3, '000-102-23-31', '789 Pine St, Villageton'),
(4, '999-793-12-13', '101 Cedar St, Hamletsville'),
(5, '051-123-12-12', '202 Elm St, Burgville');

-- Products table
INSERT INTO Products (Name, Price)
VALUES
('Laptop', 900.99),
('Smartphone', 199.99),
('Headphones', 809.99),
('Tablet', 22.99),
('Camera', 10.99);

-- Orders table
INSERT INTO Orders (UserId, ExecutedDate)
VALUES
(1, '2023-11-01'),
(2, '2010-02-15'),
(3, '2022-03-20'),
(4, '2021-04-10'),
(5, '2023-11-05');

-- ProductOrder table
INSERT INTO [Products and Orders](OrderID, ProductID)
VALUES
(1, 1),
(1, 3),
(2, 2),
(3, 1),
(4, 4);

SELECT * FROM Users
WHERE FirstName LIKE 'T%';


SELECT * FROM Products
WHERE Price > 30;


SELECT * FROM Orders
WHERE MONTH(ExecutedDate) = 11 AND YEAR(ExecutedDate) = 2023;


