-- Assignment Module 1 - 2
use assignments

--CREATE TABLE Salesman (
--    SalesmanId INT,
--    Name VARCHAR(255),
--    Commission DECIMAL(10, 2),
--    City VARCHAR(255),
--    Age INT
--);

--INSERT INTO Salesman (SalesmanId, Name, Commission, City, Age)
--VALUES
--    (101, 'Joe', 50, 'California', 17),
--    (102, 'Simon', 75, 'Texas', 25),
--    (103, 'Jessie', 105, 'Florida', 35),
--    (104, 'Danny', 100, 'Texas', 22),
--    (105, 'Lia', 65, 'New Jersey', 30);

--CREATE TABLE Customer (
--    SalesmanId INT,
--    CustomerId INT,
--    CustomerName VARCHAR(255),
--    PurchaseAmount INT,
--    );

--INSERT INTO Customer (SalesmanId, CustomerId, CustomerName, PurchaseAmount)
--VALUES
--    (101, 2345, 'Andrew', 550),
--    (103, 1575, 'Lucky', 4500),
--    (104, 2345, 'Andrew', 4000),
--    (107, 3747, 'Remona', 2700),
--    (110, 4004, 'Julia', 4545);

--CREATE TABLE Orders (OrderId int, CustomerId int, SalesmanId int, Orderdate Date, Amount money)
	
--	INSERT INTO Orders Values 
--		(5001,2345,101,'2021-07-01',550),
--		(5003,1234,105,'2022-02-15',1500)


-- TASKS TO BE PERFORMED
-- 1. Insert a new record in your Orders table

	INSERT INTO Orders Values 
		(5002,1575,102,'2021-07-01',650),
		(5004,4004,104,'2022-02-15',1600)

-- 2. Add Primary key constraint for SalesmanId column in Salesman table. 
--	  Add default constraint for City column in Salesman table. 
--    Add Foreign key constraint for SalesmanId column in Customer table. Add not null constraint in Customer_name column for the Customer table. 

	ALTER TABLE dbo.Salesman alter column SalesmanId int NOT NULL;

	ALTER TABLE dbo.Salesman ADD constraint PK_SalesmanId PRIMARY KEY (SalesmanId);

	ALTER TABLE dbo.Salesman ADD CONSTRAINT DEF_CITY DEFAULT 'California' FOR City;

	ALTER TABLE dbo.Customer alter column CustomerName varchar(255) NOT NULL;

-- 3. Fetch the data where the Customer’s name is ending with ‘N’ also get the purchase amount value greater than 500.

	Select * from Customer where CustomerName LIKE '%n' AND PurchaseAmount > 500;


--4. Using SET operators, retrieve the first result with unique SalesmanId values from two tables, and the other result containing SalesmanId with duplicates from two tables
	
	SELECT SalesmanId FROM Salesman UNION SELECT SalesmanId FROM Customer;

	SELECT SalesmanId FROM Salesman
		UNION ALL SELECT SalesmanId FROM Customer;
	
	SELECT DISTINCT SalesmanId, Name
		FROM   Salesman
		UNION 
			SELECT DISTINCT SalesmanId, CustomerName
			FROM   Customer
			WHERE  Customer.SalesmanId NOT IN (SELECT SalesmanId FROM Salesman);

	
-- 5. Display the below columns which has the matching data. Orderdate, Salesman Name, Customer Name, Commission, and City which has the range of Purchase Amount between 500 to 1500.
	
	INSERT INTO Customer (SalesmanId, CustomerId, CustomerName, PurchaseAmount)
			VALUES (101, 2345, 'Suzzon', 550);

	ALTER TABLE dbo.Customer with nocheck ADD FOREIGN KEY(SalesmanId) REFERENCES dbo.Salesman(SalesmanId);

	Select  O.Orderdate, S.Name, C.CustomerName, S.Commission, S.City, O.Amount
		FROM  Orders O 
			Left JOIN Salesman S ON O.SalesmanId = S.SalesmanId
			LEFT JOIN Customer C on O.CustomerId = C.CustomerId
		WHERE O.AMOUNT BETWEEN 500 AND 1500 

-- 6. Using right join fetch all the results from Salesman and Orders table
	Select * from Orders;
	SELECT O.OrderID, S.Name
		FROM Orders O
		RIGHT JOIN Salesman S ON O.SalesmanId = S.SalesmanId



	SELECT * from Salesman UNION SELECT * from Customer


	SELECT SalesmanId, Name
	FROM   Salesman
	INTERSECT 
	SELECT SalesmanId, CustomerName
	FROM   Customer










