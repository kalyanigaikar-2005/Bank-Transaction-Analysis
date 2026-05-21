create database Bank_Analysis;
use bank_analysis;
CREATE TABLE Customers_Bank (
CustomerID INT PRIMARY KEY,
CustomerName VARCHAR(100),
Gender CHAR(1),
Age INT,
City VARCHAR(50)
);

INSERT INTO customers_bank (CustomerID, CustomerName, Gender, Age, City) VALUES
(1, 'Amit Sharma', 'M', 28, 'Mumbai'),
(2, 'Priya Mehta', 'F', 32, 'Delhi'),
(3, 'Sujal Verma', 'M', 25, 'Pune'),
(4, 'Sneha Iyer', 'F', 30, 'Chennai'),
(5, 'Vikram Singh', 'M', 40, 'Jaipur'),
(6, 'Neha Gupta', 'F', 27, 'Lucknow'),
(7, 'Arjun Patel', 'M', 35, 'Ahmedabad'),
(8, 'Kavita Nair', 'F', 29, 'Kochi'),
(9, 'Rohit Das', 'M', 31, 'Kolkata'),
(10, 'Pooja Kulkarni', 'F', 26, 'Nagpur'),
(11, 'Suresh Reddy', 'M', 45, 'Hyderabad'),
(12, 'Anjali Kapoor', 'F', 33, 'Chandigarh'),
(13, 'Manish Yadav', 'M', 38, 'Patna'),
(14, 'Divya Shah', 'F', 24, 'Surat'),
(15, 'Karan Malhotra', 'M', 29, 'Delhi'),
(16, 'Meera Joshi', 'F', 36, 'Indore'),
(17, 'Nikhil Bansal', 'M', 28, 'Bhopal'),
(18, 'Ritu Saxena', 'F', 34, 'Kanpur'),
(19, 'Deepak Choudhary', 'M', 41, 'Udaipur'),
(20, 'Shreya Ghosh', 'F', 23, 'Kolkata');

desc table Customers_Bank;
select * from customers_bank;

CREATE TABLE Cards_Master (
CardID INT PRIMARY KEY,
CardType VARCHAR(10),   -- 'Debit' or 'Credit'
IssuerBank VARCHAR(100),
CustomerID INT,
FOREIGN KEY (CustomerID) REFERENCES Customers_Bank(CustomerID)
);

INSERT INTO Cards_Master (CardID, CardType, IssuerBank, CustomerID) VALUES
(101, 'Debit', 'HDFC Bank', 1),
(102, 'Credit', 'ICICI Bank', 2),
(103, 'Debit', 'SBI', 3),
(104, 'Credit', 'Axis Bank', 4),
(105, 'Debit', 'Punjab National Bank', 5),
(106, 'Credit', 'HDFC Bank', 6),
(107, 'Debit', 'ICICI Bank', 7),
(108, 'Credit', 'SBI', 8),
(109, 'Debit', 'Axis Bank', 9),
(110, 'Credit', 'HDFC Bank', 10),
(111, 'Debit', 'ICICI Bank', 11),
(112, 'Credit', 'SBI', 12),
(113, 'Debit', 'Axis Bank', 13),
(114, 'Credit', 'Punjab National Bank', 14),
(115, 'Debit', 'HDFC Bank', 15),
(116, 'Credit', 'ICICI Bank', 16),
(117, 'Debit', 'SBI', 17),
(118, 'Credit', 'Axis Bank', 18),
(119, 'Debit', 'HDFC Bank', 19),
(120, 'Credit', 'ICICI Bank', 20);

select * from cards_master;

CREATE TABLE Merchants_Master (
MerchantID INT PRIMARY KEY,
MerchantName VARCHAR(100),
Category VARCHAR(50) CHECK (Category IN ('Shopping', 'Food', 'Travel')),
City VARCHAR(50)
);

INSERT INTO Merchants_Master (MerchantID, MerchantName, Category, City) VALUES
(201, 'Amazon', 'Shopping', 'Mumbai'),
(202, 'Flipkart', 'Shopping', 'Bangalore'),
(203, 'Big Bazaar', 'Shopping', 'Delhi'),
(204, 'Dominos', 'Food', 'Pune'),
(205, 'Swiggy', 'Food', 'Hyderabad'),
(206, 'Zomato', 'Food', 'Delhi'),
(207, 'McDonalds', 'Food', 'Mumbai'),
(208, 'KFC', 'Food', 'Chennai'),
(209, 'IRCTC', 'Travel', 'Delhi'),
(210, 'MakeMyTrip', 'Travel', 'Gurgaon'),
(211, 'Uber', 'Travel', 'Bangalore'),
(212, 'Ola', 'Travel', 'Mumbai'),
(213, 'Reliance Digital', 'Shopping', 'Ahmedabad'),
(214, 'Croma', 'Shopping', 'Chennai'),
(215, 'Pantaloons', 'Shopping', 'Kolkata'),
(216, 'Starbucks', 'Food', 'Bangalore'),
(217, 'Subway', 'Food', 'Delhi'),
(218, 'Yatra', 'Travel', 'Noida'),
(219, 'Goibibo', 'Travel', 'Gurgaon'),
(220, 'Spencer’s', 'Shopping', 'Kolkata');

select * from merchants_master;

CREATE TABLE Transactions_Bank (
TransactionID INT PRIMARY KEY,
TransactionDate DATE NOT NULL,
CustomerID INT,
CardID INT,
MerchantID INT,
Amount DECIMAL(10, 2) CHECK (Amount > 0),
TransactionType VARCHAR(10) CHECK (TransactionType IN ('Credit', 'Debit')),
Mode VARCHAR(50),
City VARCHAR(50),
FOREIGN KEY (CustomerID) REFERENCES Customers_Bank(CustomerID),
FOREIGN KEY (CardID) REFERENCES Cards_Master(CardID),
FOREIGN KEY (MerchantID) REFERENCES Merchants_Master(MerchantID)
);

INSERT INTO Transactions_Bank 
(TransactionID, TransactionDate, CustomerID, CardID, MerchantID, Amount, TransactionType, Mode, City) 
VALUES
(301, '2025-01-01', 1, 101, 201, 2500.50, 'Debit', 'UPI', 'Mumbai'),
(302, '2025-01-02', 2, 102, 202, 15000.00, 'Credit', 'Credit Card', 'Delhi'),
(303, '2025-01-03', 3, 103, 204, 800.75, 'Debit', 'Debit Card', 'Pune'),
(304, '2025-01-04', 4, 104, 205, 22000.00, 'Credit', 'NetBanking', 'Chennai'),
(305, '2025-01-05', 5, 105, 209, 3000.00, 'Debit', 'NetBanking', 'Jaipur'),
(306, '2025-01-06', 6, 106, 206, 950.20, 'Debit', 'UPI', 'Lucknow'),
(307, '2025-01-07', 7, 107, 203, 42000.00, 'Credit', 'Credit Card', 'Ahmedabad'),
(308, '2025-01-08', 8, 108, 210, 5000.00, 'Debit', 'Credit Card', 'Kochi'),
(309, '2025-01-09', 9, 109, 211, 700.00, 'Debit', 'UPI', 'Kolkata'),
(310, '2025-01-10', 10, 110, 212, 65000.00, 'Credit', 'NetBanking', 'Nagpur'),
(311, '2025-01-11', 11, 111, 213, 4200.00, 'Debit', 'Debit Card', 'Hyderabad'),
(312, '2025-01-12', 12, 112, 214, 18000.00, 'Credit', 'Credit Card', 'Chandigarh'),
(313, '2025-01-13', 13, 113, 215, 2750.00, 'Debit', 'UPI', 'Patna'),
(314, '2025-01-14', 14, 114, 216, 600.00, 'Debit', 'UPI', 'Surat'),
(315, '2025-01-15', 15, 115, 217, 45000.00, 'Credit', 'NetBanking', 'Delhi'),
(316, '2025-01-16', 16, 116, 218, 5200.00, 'Debit', 'NetBanking', 'Indore'),
(317, '2025-01-17', 17, 117, 219, 31000.00, 'Credit', 'Credit Card', 'Bhopal'),
(318, '2025-01-18', 18, 118, 220, 900.00, 'Debit', 'UPI', 'Kanpur'),
(319, '2025-01-19', 19, 119, 201, 1500.00, 'Debit', 'Debit Card', 'Udaipur'),
(320, '2025-01-20', 20, 120, 202, 27500.00, 'Credit', 'Credit Card', 'Kolkata'),
(321, '2025-01-21', 1, 101, 203, 3200.00, 'Debit', 'UPI', 'Mumbai'),
(322, '2025-01-22', 2, 102, 204, 1100.00, 'Debit', 'Debit Card', 'Delhi'),
(323, '2025-01-23', 3, 103, 205, 75000.00, 'Credit', 'NetBanking', 'Pune'),
(324, '2025-01-24', 4, 104, 206, 980.00, 'Debit', 'Credit Card', 'Chennai'),
(325, '2025-01-25', 5, 105, 207, 670.00, 'Debit', 'UPI', 'Jaipur');

select * from transactions_bank;

SELECT cardtype, SUM(customerid) AS total
FROM cards_master
GROUP BY cardtype;

               
--- Customer-wise Spending (INNER JOIN)

SELECT c.CustomerName, SUM(t.Amount) AS Total_Spending
FROM Customers_Bank c
JOIN Transactions_Bank t 
ON c.CustomerID = t.CustomerID
GROUP BY c.CustomerName
ORDER BY Total_Spending DESC;

--- Category-wise Spending (INNER JOIN)

SELECT m.Category, SUM(t.Amount) AS Total_Spending
FROM Transactions_Bank t
INNER JOIN Merchants_Master m
ON t.MerchantID = m.MerchantID
GROUP BY m.Category;

--- Debit vs Credit Analysis (INNER JOIN)

SELECT cm.CardType, SUM(t.Amount) AS Total_Amount
FROM Transactions_Bank t
INNER JOIN Cards_Master cm
ON t.CardID = cm.CardID
GROUP BY cm.CardType;

--- High-Value Transactions (SUBQUERY)

SELECT * from transactions_bank
WHERE Amount > (SELECT AVG(Amount)
FROM Transactions_Bank);

--- average of all customers

SELECT AVG(TotalAmt)
FROM (SELECT SUM(Amount) AS TotalAmt
FROM Transactions_Bank
GROUP BY CustomerID) AS TempTable;

--- Customer Spending Above Average (INNER JOIN + SUBQUERY)

SELECT c.CustomerName, SUM(t.Amount) AS Total_Spending
FROM Customers_Bank c
INNER JOIN Transactions_Bank t
ON c.CustomerID = t.CustomerID
GROUP BY c.CustomerName
HAVING SUM(t.Amount) > (SELECT AVG(TotalAmt)
FROM (SELECT SUM(Amount) AS TotalAmt
FROM Transactions_Bank
GROUP BY CustomerID) AS TempTable);



--- City-wise Spending (Derived Table / Virtual Table)

SELECT City, Total_Spending
FROM (SELECT City, SUM(Amount) AS Total_Spending
FROM Transactions_Bank
GROUP BY City) AS CityTable
ORDER BY Total_Spending DESC;

--- VIEW TABLE (WITH INNER JOIN)

CREATE VIEW Bank_Analysis_View AS
SELECT 
    c.CustomerName,
    c.City AS Customer_City,
    cm.CardType,
    m.Category,
    t.Amount,
    t.Mode,
    t.TransactionDate
FROM Transactions_Bank t
INNER JOIN Customers_Bank c ON t.CustomerID = c.CustomerID
INNER JOIN Cards_Master cm ON t.CardID = cm.CardID
INNER JOIN Merchants_Master m ON t.MerchantID = m.MerchantID;

SELECT * FROM Bank_Analysis_View;


