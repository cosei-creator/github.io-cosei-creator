--1	Write a query to fetch the EmpFname from the EmployeeInfo table in the upper case and use the ALIAS name as EmpName.
SELECT UPPER(EmpFname) AS EmpFname
FROM [dbo].[Employee Info]

--2	Write a query to fetch the number of employees working in the department ‘HR’.
SELECT COUNT(*) AS Total_employees
FROM [dbo].[Employee Info]
WHERE Department='HR'

--3	Write a query to get the current date.
SELECT GETDATE() AS 'Current_Date'

--4	Write a query to retrieve the first four characters of  EmpLname from the EmployeeInfo table.
SELECT LEFT(EmpLname,4) AS First_Four_Characters
FROM [dbo].[Employee Info]

--5	Write a query to fetch only the place name(string before brackets) from the Address column of EmployeeInfo table.
SELECT LEFT(address,CHARINDEX('(',Address)-1) AS Place_Name
FROM [dbo].[Employee Info]

--6	Write a query to create a new table that consists of data and structure copied from the other table.
SELECT * 
INTO Employee_Info_New
FROM [dbo].[Employee Info]

--7	Write q query to find all the employees whose salary is between 50000 to 100000.
SELECT *
FROM[dbo].[EMPLOYEE POSITION]
WHERE Salary BETWEEN 50000 AND 100000

--8	Write a query to find the names of employees that begin with ‘S’
SELECT EmpFName
FROM[dbo].[Employee Info]
WHERE EmpFName LIKE 'S%'

--9	Write a query to fetch top N records.
SELECT TOP 2 *
FROM [dbo].[EMPLOYEE POSITION]
ORDER BY SALARY DESC
--10	Write a query to retrieve the EmpFname and EmpLname in a single column as “FullName”. The first name and the last name must be separated with space.
SELECT CONCAT(EmpFName,' ',EmpLName) AS FullName
FROM [dbo].[Employee Info]
