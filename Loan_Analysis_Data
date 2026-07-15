
--1.	Retrieve all records from the loan portfolio. 
SELECT *
From [dbo].['Loan Portfolio$']

--2.	Display only the Customer Name, Branch, and Credit Officer. 
SELECT
      [CUSTOMER NAME],
    [BRANCH],
    [CREDIT OFFICER]
FROM [dbo].['Loan Portfolio$']

--3.	Retrieve all loans disbursed in a specific branch. 
SELECT *
FROM ['Loan Portfolio$']
WHERE [Branch] = 'Accra';

--4.	Display all customers from Urban communities. 
SELECT 
      [Customer Name],
      [Community],
      [Urban/Rural]
FROM [dbo].['Loan Portfolio$']
WHERE [Urban/Rural] = 'Urban'

--5.	Retrieve all loans with Total Loan Arrears greater than zero. 
SELECT *
FROM [dbo].['Loan Portfolio$']
WHERE [Total Loan Arrears] > 0

--6.	Find all Education Loans. 
SELECT *
FROM [dbo].['Loan Portfolio$']
WHERE [Product Category] = 'Education Loan'

--7.	Retrieve customers whose names begin with the letter 'A'. 
SELECT *
FROM [dbo].['Loan Portfolio$']
WHERE [Customer Name] Like 'A%';

--8.	Retrieve loans with an Interest Rate greater than 25%. 
SELECT
      [Customer Name],
      [Product Category],
      [Total Disb Amount],
      [Interest Rate]
FROM [dbo].['Loan Portfolio$']
WHERE [Interest Rate] > '25'
ORDER BY [Interest Rate] DESC;

--9.	Find loans disbursed between two specified dates. 
SELECT 
      [Customer Name],
      [Branch],
      [Credit Officer],
      [Total Disb Amount],
      [Disb Date]
FROM [dbo].['Loan Portfolio$']
WHERE [Disb Date] Between '2025/6/1' And '2025/6/30'
ORDER BY [Disb Date]

--10.	Display the top 10 highest loan disbursements. 
SELECT TOP 10
            [Customer name],
            [Branch],
            [Credit Officer],
            [Total Disb Amount],
            [Product Category]
FROM [dbo].['Loan Portfolio$']
ORDER BY [Total Disb Amount] DESC

--11.	Calculate the total loan disbursement. 
SELECT
      SUM([Total Disb Amount]) As [Total Loan Disbursement]
FROM [dbo].['Loan Portfolio$']

--12.	Calculate the average individual loan amount. 
SELECT
     AVG([Indv Disb Amount]) As [Average Individual Loan Amount]
FROM [dbo].['Loan Portfolio$']

--13.	Count the total number of clients. 
SELECT
     SUM([Client Count]) As [Total Clients]
FROM [dbo].['Loan Portfolio$']

--14.	Calculate the total loan disbursement by Branch. 
SELECT
      [Branch],
      SUM([Total Disb Amount]) As [Total Loan Disbursement]
FROM [dbo].['Loan Portfolio$']
GROUP BY [Branch]
ORDER BY [TOTAL Loan Disbursement] DESC

--15.	Calculate the total loan disbursement by Credit Officer. 
SELECT
     [Credit Officer],
     SUM([Total Disb Amount]) As [Total Loan Disbursement]
FROM [dbo].['Loan Portfolio$']
GROUP BY [Credit Officer]
ORDER BY [Total Loan Disbursement] DESC

--16.	Calculate the total outstanding loan arrears by Branch. 
SELECT
     [Branch],
     SUM([Total Loan Arrears]) As [Total Outstanding Loan Arrears]
FROM [dbo].['Loan Portfolio$']
GROUP BY [Branch]
ORDER BY [Total Outstanding Loan Arrears] DESC

--17.	Calculate the average interest rate for each Product Category. 
SELECT
     [Product Category],
     AVG([Interest Rate]) As [Average Interest Rate]
FROM [dbo].['Loan Portfolio$']
GROUP BY [Product Category]
ORDER BY [Average Interest Rate] DESC

--18.	Display branches with more than 100 clients. 
SELECT
      [Branch],
      SUM([Client Count]) As [Total Clients]
FROM [dbo].['Loan Portfolio$']
GROUP BY [Branch]
HAVING SUM([Client Count]) > 100
ORDER BY [Total Clients] DESC

--19.	Calculate the total loan disbursement for each year. 
SELECT
     Year([Disb Date]) As [Year],
     SUM([Total Disb Amount]) As [Total Disbursement]
FROM [dbo].['Loan Portfolio$']
GROUP BY Year([Disb Date])
ORDER BY [Total Disbursement] DESC

--20.	Calculate the monthly loan disbursement trend. 
SELECT
      Year([Disb Date]) As [Year],
      Month([Disb Date]) As [Month Number],
     DATENAME(MONTH, [Disb Date]) AS [Month],
      ROUND(SUM([Total Disb Amount]), 2) As [Total Loan Disbursement]
FROM [dbo].['Loan Portfolio$']
GROUP BY Year([Disb Date]),
         Month([Disb Date]),
         DATENAME(MONTH, [Disb Date])
ORDER BY [Year],
         [Month Number]     

--21.	Retrieve all loans that mature in the year 2026. 
SELECT
     [Customer Name],
     [Branch],
     [Credit Officer],
     [Product Category],
     [Total Disb Amount],
     [Maturity Date]
FROM [dbo].['Loan Portfolio$']
WHERE Year([Maturity Date]) = 2026
ORDER BY [Maturity Date]

--22.	Convert all customer names to uppercase. 
SELECT
     [Customer Name],
     UPPER([Customer Name]) As [Customer Name Uppercase]
FROM [dbo].['Loan Portfolio$']

--23.	Display the first five characters of each customer name. 
SELECT
      [Customer Name],
      LEFT([Customer Name],5) As [First Five Characters]
FROM [dbo].['Loan Portfolio$']

--24.	Combine Customer Number and Customer Name into a single column. 
SELECT
      [Customer No],
      [Customer Name],
      CONCAT([Customer No], ' - ', [Customer Name]) As [Customer Details]
FROM [dbo].['Loan Portfolio$']

--25.	Classify loans as High Risk, Medium Risk, or Low Risk based on Total Loan Arrears. 
SELECT
      [Customer Name],
      [Branch],
      [Total Loan Arrears],
   CASE
      WHEN [Total Loan Arrears] >= 5000 THEN 'High Risk'
      WHEN [Total Loan Arrears] >= 1000 THEN 'Medium Risk'
      ELSE 'Low Risk'
      END AS [Risk Category]
FROM [dbo].['Loan Portfolio$']
ORDER BY [Total Loan Arrears] DESC

--26.	Rank Credit Officers based on total loan disbursement. 
SELECT
      [Credit Officer],
      SUM([Total Disb Amount]) As [Total Loan Disbursement],
      RanK() Over (ORDER BY SUM([Total Disb Amount]) DESC ) As [Rank]
FROM [dbo].['Loan Portfolio$']
GROUP BY [Credit Officer]

--27.	Display the top three Credit Officers within each branch based on total loan disbursement.
WITH [Officer Disbursement] AS
(
    SELECT
        [Branch],
        [Credit Officer],
        SUM([Total Disb Amount]) AS [Total Loan Disbursement],
        ROW_NUMBER() OVER
        (
            PARTITION BY [Branch]
            ORDER BY SUM([Total Disb Amount]) DESC
        ) AS [Rank]
    FROM [dbo].['Loan Portfolio$']
    GROUP BY
        [Branch],
        [Credit Officer]
)
SELECT
    [Branch],
    [Credit Officer],
    [Total Loan Disbursement],
    [Rank]
FROM [Officer Disbursement]
WHERE [Rank] <= 3
ORDER BY
    [Branch],
    [Rank];

--28.	Use a Common Table Expression (CTE) to identify branches with above-average loan disbursement. 
WITH [Branch Disbursement] AS
(
    SELECT
        [Branch],
        SUM([Total Disb Amount]) AS [Total Loan Disbursement]
    FROM [dbo].['Loan Portfolio$']
    GROUP BY [Branch]
)
SELECT
    [Branch],
    [Total Loan Disbursement]
FROM [Branch Disbursement]
WHERE [Total Loan Disbursement] >
(
    SELECT AVG([Total Loan Disbursement])
    FROM [Branch Disbursement]
)
ORDER BY [Total Loan Disbursement] DESC;

--29.	Retrieve customers whose individual loan amount is greater than the average loan amount. 
SELECT
    [Customer Name],
    [Branch],
    [Credit Officer],
    [Indv Disb Amount]
FROM [dbo].['Loan Portfolio$']
WHERE [Indv Disb Amount] >
(
    SELECT AVG([Indv Disb Amount])
    FROM [dbo].['Loan Portfolio$']
)
ORDER BY [Indv Disb Amount] DESC;

--30.	Determine which Product Category contributed the highest total loan disbursement.
SELECT Top 1
        [Product Category],
        SUM([Total Disb Amount]) As [Total Disbursement Amount]
FROM [dbo].['Loan Portfolio$']
GROUP BY [Product Category]
ORDER BY [Total Disbursement Amount] DESC
