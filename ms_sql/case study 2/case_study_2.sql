use case_study_2;

	CREATE TABLE LOCATION (
	  Location_ID INT PRIMARY KEY,
	  City VARCHAR(50)
	);

	INSERT INTO LOCATION (Location_ID, City)
	VALUES (122, 'New York'),
		   (123, 'Dallas'),
		   (124, 'Chicago'),
		   (167, 'Boston');

	select * from Location;


	  CREATE TABLE DEPARTMENT (
	  Department_Id INT PRIMARY KEY,
	  Name VARCHAR(50),
	  Location_Id INT,
	  FOREIGN KEY (Location_Id) REFERENCES LOCATION(Location_ID)
	);



	INSERT INTO DEPARTMENT (Department_Id, Name, Location_Id)
	VALUES (10, 'Accounting', 122),
		   (20, 'Sales', 124),
		   (30, 'Research', 123),
		   (40, 'Operations', 167);

		   CREATE TABLE JOB (
	  Job_ID INT PRIMARY KEY,
	  Designation VARCHAR(50)
	);

	select * from DEPARTMENT;

	CREATE TABLE JOB (JOB_ID INT PRIMARY KEY, DESIGNATION VARCHAR(20))

	INSERT  INTO JOB VALUES
	(667, 'CLERK'),
	(668,'STAFF'),
	(669,'ANALYST'),
	(670,'SALES_PERSON'),
	(671,'MANAGER'),
	(672, 'PRESIDENT')


	CREATE TABLE EMPLOYEE
	(EMPLOYEE_ID INT,
	LAST_NAME VARCHAR(20),
	FIRST_NAME VARCHAR(20),
	MIDDLE_NAME CHAR(1),
	JOB_ID INT FOREIGN KEY
	REFERENCES JOB(JOB_ID),
	MANAGER_ID INT,
	HIRE_DATE DATE,
	SALARY INT,
	COMM INT,
	DEPARTMENT_ID  INT FOREIGN KEY
	REFERENCES DEPARTMENT(DEPARTMENT_ID))

INSERT INTO EMPLOYEE VALUES
(7369,'SMITH','JOHN','Q',667,7902,'17-DEC-84',800,NULL,20),
(7499,'ALLEN','KEVIN','J',670,7698,'20-FEB-84',1600,300,30),
(7505,'DOYLE','JEAN','K',671,7839,'04-APR-85',2850,NULl,30),
(7506,'DENNIS','LYNN','S',671,7839,'15-MAY-85',2750,NULL,30),
(7507,'BAKER','LESLIE','D',671,7839,'10-JUN-85',2200,NULL,40),
(7521,'WARK','CYNTHIA','D',670,7698,'22-FEB-85',1250,500,30)

--1.  List all the employee details 
	SELECT 
		Employee.Employee_ID,
		Employee.Last_Name,
		Employee.First_Name,
		Employee.Middle_Name,
		Job.Designation,
		Employee.Hire_Date,
		Employee.Salary,
		Department.Name AS Department_Name,
		Location.City AS Location_City
	FROM 
		Employee
	JOIN 
		Job ON Employee.Job_Id = Job.Job_ID
	JOIN 
		Department ON Employee.Department_Id = Department.Department_Id
	JOIN 
		Location ON Department.Location_Id = Location.Location_ID;

-- 2. List all the department
	SELECT Department_Id, Name, Location_Id FROM  Department;

-- 3. List all job details
	SELECT * FROM Job;

-- 4. List all location
	SELECT * from Location;

-- 5. List out the First Name, Last Name, Salary, Comm for all Employees

	SELECT First_Name, Last_Name, Salary, Comm
	FROM 
		Employee;

-- 6. List out the Employee ID, Last Name, Department ID for all employees and alias Employee ID as "ID of the Employee", Last Name as "Name of the Employee", Department ID as "Dep_id"

	SELECT 
		Employee_ID AS "ID of the Employee",
		Last_Name AS "Name of the Employee",
		Department_Id AS "Dep_id"
	FROM 
		Employee;

-- 7. List out the annual salary of the employees with their names only

	SELECT 
		First_Name,
		Last_Name,
		(Salary * 12) AS Annual_Salary
	FROM 
		Employee;

-- WHERE Condition
-- List the details about "Smith"
	SELECT 
		Employee_ID,
		Last_Name,
		First_Name,
		Middle_Name,
		Job_Id,
		Hire_Date,
		Salary,
		Department_Id
	FROM 
		Employee
	WHERE 
		Last_Name = 'Smith';

--2. List out the employees who are working in department 20
	SELECT 
		Employee_ID,
		Last_Name,
		First_Name,
		Middle_Name,
		Job_Id,
		Hire_Date,
		Salary,
		Department_Id
	FROM 
		Employee
	WHERE 
		Department_Id = 20;

--3. List out the employees who are earning salary between 2000 and 3000.
	SELECT 
    Employee_ID,
    Last_Name,
    First_Name,
    Middle_Name,
    Job_Id,
    Hire_Date,
    Salary,
    Department_Id
		FROM 
			Employee
		WHERE 
			Salary BETWEEN 2000 AND 3000;

-- 4. List out the employees who are working in department 10 or 20
	SELECT 
		Employee_ID,
		Last_Name,
		First_Name,
		Middle_Name,
		Job_Id,
		Hire_Date,
		Salary,
		Department_Id
	FROM 
		Employee
	WHERE 
		Department_Id = 20 OR Department_Id = 10;

-- 5. Find out the employees who are not working in department 10 or 30
	SELECT 
		Employee_ID,
		Last_Name,
		First_Name,
		Middle_Name,
		Job_Id,
		Hire_Date,
		Salary,
		Department_Id
	FROM 
		Employee
	WHERE 
		Department_Id NOT IN (10, 30);

--6. List out the employees whose name starts with 'L'
	SELECT 
		Employee_ID,
		Last_Name,
		First_Name,
		Middle_Name,
		Job_Id,
		Hire_Date,
		Salary,
		Department_Id
	FROM 
		Employee
	WHERE 
		First_Name LIKE 'L%';

--7. List out the employees whose name starts with 'L' and ends with 'E'
	SELECT 
		Employee_ID,
		Last_Name,
		First_Name,
		Middle_Name,
		Job_Id,
		Hire_Date,
		Salary,
		Department_Id
	FROM 
		Employee
	WHERE 
		First_Name LIKE 'L%E';

-- 8. List out the employees whose name length is 4 and start with 'J'
	SELECT 
		Employee_ID,
		Last_Name,
		First_Name,
		Middle_Name,
		Job_Id,
		Hire_Date,
		Salary,
		Department_Id
	FROM 
		Employee
	WHERE 
		First_Name LIKE 'J___'

-- 9. List out the employees who are working in department 30 and draw the salaries more than 2500.
	SELECT 
		Employee_ID,
		Last_Name,
		First_Name,
		Middle_Name,
		Job_Id,
		Hire_Date,
		Salary,
		Department_Id
	FROM 
		Employee
	WHERE 
		Department_Id = 30
		AND Salary > 2500;

-- 10. List out the employees who are not receiving commission. 
	SELECT 
		Employee_ID,
		Last_Name,
		First_Name,
		Middle_Name,
		Job_Id,
		Hire_Date,
		Salary,
		Department_Id
	FROM 
		Employee
	WHERE 
		Comm IS NULL OR Comm = 0;

-- ORDER BY Clause

-- 1. List out the Employee ID and Last Name in ascending order based on the Employee ID.
	SELECT Employee_ID, Last_Name FROM Employee ORDER BY Employee_ID ASC;

-- 2. List out the Employee ID and Name in descending order based on salary.
	SELECT Employee_ID, CONCAT(First_Name, ' ', Middle_Name, ' ', Last_Name) AS Full_Name FROM Employee ORDER BY Salary DESC;

-- 3. List out the employee details according to their Last Name in ascending-order.
	SELECT Employee_ID, Last_Name, First_Name, Middle_Name, Job_Id, Hire_Date, Salary, Department_Id FROM Employee ORDER BY Last_Name ASC;

-- 4. List out the employee details according to their Last Name in ascending order and then Department ID in descending order.
	SELECT Employee_ID, Last_Name, First_Name, Middle_Name, Job_Id, Hire_Date, Salary, Department_Id
		FROM Employee
		ORDER BY Last_Name ASC, Department_Id DESC;


-- GROUP BY and HAVING Clause:
-- 1. List out the department wise maximum salary, minimum salary and average salary of the employees.
	SELECT Department_Id,
		   MAX(Salary) AS Max_Salary,
		   MIN(Salary) AS Min_Salary,
		   AVG(Salary) AS Avg_Salary
	FROM Employee
	GROUP BY Department_Id;

-- 2. List out the job wise maximum salary, minimum salary and average salary of the employees.
	SELECT Job_Id,
		   MAX(Salary) AS Max_Salary,
		   MIN(Salary) AS Min_Salary,
		   AVG(Salary) AS Avg_Salary
	FROM Employee
	GROUP BY Job_Id;

-- 3. List out the number of employees who joined each month in ascending order.
	SELECT FORMAT(Hire_Date, 'yyyy-MM') AS Month,
		   COUNT(Employee_ID) AS Number_of_Employees
	FROM Employee
	GROUP BY FORMAT(Hire_Date, 'yyyy-MM')
	ORDER BY Month ASC;


-- 4. List out the number of employees for each month and year in ascending order based on the year and month.
	SELECT YEAR(Hire_Date) AS Year,
		   MONTH(Hire_Date) AS Month,
		   COUNT(Employee_ID) AS Number_of_Employees
	FROM Employee
	GROUP BY YEAR(Hire_Date), MONTH(Hire_Date)
	ORDER BY Year ASC, Month ASC;

-- 5. List out the Department ID having at least four employees.
	SELECT Department_Id
	FROM Employee
	GROUP BY Department_Id
	HAVING COUNT(Employee_ID) >= 4;

-- 6. How many employees joined in February month.
	SELECT COUNT(Employee_ID) AS Number_of_Employees FROM Employee WHERE MONTH(Hire_Date) = 2;

-- 7. How many employees joined in May or June month.
	SELECT COUNT(Employee_ID) AS Number_of_Employees FROM Employee WHERE MONTH(Hire_Date) IN (5, 6);

-- 8. How many employees joined in 1985?
	SELECT COUNT(Employee_ID) AS Number_of_Employees FROM Employee WHERE YEAR(Hire_Date) = 1985;

-- 9. How many employees joined each month in 1985?
	SELECT MONTH(Hire_Date) AS Month,
		   COUNT(Employee_ID) AS Number_of_Employees
			FROM Employee
			WHERE YEAR(Hire_Date) = 1985
			GROUP BY MONTH(Hire_Date)
			ORDER BY Month ASC;

-- 10. How many employees were joined in April 1985?
SELECT COUNT(Employee_ID) AS Number_of_Employees FROM Employee WHERE YEAR(Hire_Date) = 1985 AND MONTH(Hire_Date) = 4;

-- 11. SELECT Department_Id
	SELECT Department_Id FROM Employee
		WHERE YEAR(Hire_Date) = 1985 AND MONTH(Hire_Date) = 4
		GROUP BY Department_Id
		HAVING COUNT(Employee_ID) >= 3;

-- Joins:
-- 1. List out employees with their department names.
	SELECT e.Employee_ID, e.Last_Name, e.First_Name, e.Middle_Name, d.Name AS Department_Name
		FROM Employee e
		JOIN Department d ON e.Department_Id = d.Department_Id;

-- 2. Display employees with their designations.
	SELECT e.Employee_ID, e.Last_Name, e.First_Name, e.Middle_Name, j.Designation
		FROM Employee e JOIN Job j ON e.Job_Id = j.Job_ID;

-- 3. Display the employees with their department names and city.
	SELECT e.Employee_ID, e.Last_Name, e.First_Name, e.Middle_Name, d.Name AS Department_Name, l.City
		FROM Employee e
		JOIN Department d ON e.Department_Id = d.Department_Id
		JOIN Location l ON d.Location_Id = l.Location_ID;

-- 4. How many employees are working in different departments? Display with department names.
	SELECT d.Name AS Department_Name, COUNT(e.Employee_ID) AS Number_of_Employees
		FROM Employee e
		JOIN Department d ON e.Department_Id = d.Department_Id
		GROUP BY d.Name;
		-- 5. How many employees are working in the sales department?
		SELECT COUNT(e.Employee_ID) AS Number_of_Employees
		FROM Employee e
		JOIN Department d ON e.Department_Id = d.Department_Id
		WHERE d.Name = 'Sales';

-- 6. Which is the department having greater than or equal to 3 employees and display the department names in ascending order.
	SELECT d.Name AS Department_Name FROM Employee e JOIN Department d ON e.Department_Id = d.Department_Id
			GROUP BY d.Name
			HAVING COUNT(e.Employee_ID) >= 3
			ORDER BY d.Name ASC;
-- 7. How many employees are working in 'Dallas'?
	SELECT COUNT(e.Employee_ID) AS Number_of_Employees
		FROM Employee e
		JOIN Department d ON e.Department_Id = d.Department_Id
		JOIN Location l ON d.Location_Id = l.Location_ID
		WHERE l.City = 'Dallas';
		-- 8. Display all employees in sales or operation departments.
		SELECT e.Employee_ID, e.Last_Name, e.First_Name, e.Middle_Name, d.Name AS Department_Name
		FROM Employee e
		JOIN Department d ON e.Department_Id = d.Department_Id
		WHERE d.Name IN ('Sales', 'Operations');

-- CONDITIONAL STATEMENT
-- 1. Display the employee details with salary grades. Use conditional statement to create a grade column.
	SELECT e.Employee_ID, e.Last_Name, e.First_Name, e.Middle_Name, e.Salary,
       CASE
           WHEN e.Salary >= 100000 THEN 'A'
           WHEN e.Salary >= 80000 THEN 'B'
           WHEN e.Salary >= 60000 THEN 'C'
           WHEN e.Salary >= 40000 THEN 'D'
           ELSE 'E'
       END AS Salary_Grade
	FROM Employee e;
-- 2. List out the number of employees grade wise. Use conditional statement to create a grade column.
	SELECT Salary_Grade, COUNT(*) AS Number_of_Employees
	FROM (
		SELECT 
			CASE
				WHEN Salary >= 100000 THEN 'A'
				WHEN Salary >= 80000 THEN 'B'
				WHEN Salary >= 60000 THEN 'C'
				WHEN Salary >= 40000 THEN 'D'
				ELSE 'E'
			END AS Salary_Grade
		FROM Employee
	) AS GradedEmployees
	GROUP BY Salary_Grade;
-- 3. Display the employee salary grades and the number of employees between 2000 to 5000 range of salary.
	SELECT Salary_Grade, COUNT(*) AS Number_of_Employees
	FROM (
		SELECT 
			CASE
				WHEN Salary >= 100000 THEN 'A'
				WHEN Salary >= 80000 THEN 'B'
				WHEN Salary >= 60000 THEN 'C'
				WHEN Salary >= 40000 THEN 'D'
				ELSE 'E'
			END AS Salary_Grade
		FROM Employee
		WHERE Salary BETWEEN 2000 AND 5000
	) AS GradedEmployees
	GROUP BY Salary_Grade;