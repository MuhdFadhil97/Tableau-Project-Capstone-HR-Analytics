SELECT TOP (1000) [Age]
      ,[Attrition]
      ,[BusinessTravel]
      ,[DailyRate]
      ,[Department]
      ,[DistanceFromHome]
      ,[Education]
      ,[EducationField]
      ,[EmployeeCount]
      ,[EmployeeNumber]
      ,[EnvironmentSatisfaction]
      ,[Gender]
      ,[HourlyRate]
      ,[JobInvolvement]
      ,[JobLevel]
      ,[JobRole]
      ,[JobSatisfaction]
      ,[MaritalStatus]
      ,[MonthlyIncome]
      ,[MonthlyRate]
      ,[NumCompaniesWorked]
      ,[Over18]
      ,[OverTime]
      ,[PercentSalaryHike]
      ,[PerformanceRating]
      ,[RelationshipSatisfaction]
      ,[StandardHours]
      ,[StockOptionLevel]
      ,[TotalWorkingYears]
      ,[TrainingTimesLastYear]
      ,[WorkLifeBalance]
      ,[YearsAtCompany]
      ,[YearsInCurrentRole]
      ,[YearsSinceLastPromotion]
      ,[YearsWithCurrManager]
  FROM [HR Analytics].[dbo].[HR Analytics]


-- Query the database to check the details
SELECT*
FROM [dbo].[HR Analytics]

-- Update the Attrition Column

UPDATE [dbo].[HR Analytics]
	SET Attrition =
	CASE 
		WHEN Attrition = 'Yes' THEN 'Employee Resigned'
	ELSE 'Employee Retained'
END;

-- Check total count of the employees (Answer: 1470 Employees)

SELECT Count(*) As 'Total Employee'
FROM [dbo].[HR Analytics]

-- Check total coount of the employees that resigned and percentages from that company? ( Answer: Count:237 and Percentages = 16)

SELECT Attrition, Count(*) as 'Total Employee Resigned', (Count(*)*100 / (SELECT Count(*) FROM [dbo].[HR Analytics])) AS 'Percentage of the Employee Attrition (%)'
FROM [dbo].[HR Analytics]
--WHERE Attrition = 'Employee Resigned' (Just to check what is the values of the percentage who left the company)
GROUP BY Attrition

-- Check the total count of the employees by gender
SELECT Gender, Count(*) as 'Total Employee By Gender', ROUND((Count(*)*100 / (SELECT Count(*) FROM [dbo].[HR Analytics])),2) AS 'Percentages of the Employee Attrition (%)'
FROM [dbo].[HR Analytics]
GROUP BY Gender

-- Check the total count of the employees by gender who is resigned
SELECT Gender, Count(*) as 'Total Employee By Gender', ROUND((Count(*)*100 / (SELECT Count(*) FROM [dbo].[HR Analytics] WHERE Attrition = 'Employee Resigned')),2) AS 'Percentages of the Employee Attrition (%)'
FROM [dbo].[HR Analytics]
WHERE Attrition = 'Employee Resigned'
GROUP BY Gender

-- Check the total count of marital status by employee resigned?
SELECT MaritalStatus, Gender, Count (*) AS 'Total Employees', (Count(*)*100 / (SELECT Count(*) FROM [dbo].[HR Analytics] WHERE Attrition = 'Employee Resigned')) AS 'Percentages of the Employee Attrition (%)'
FROM [dbo].[HR Analytics]
WHERE Attrition = 'Employee Resigned'
GROUP BY MaritalStatus, Gender
ORDER BY MaritalStatus, 3 DESC