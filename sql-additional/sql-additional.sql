
	
	
USE hr;

SELECT Attrition, Department, Gender, JobRole, MonthlyIncome FROM employee e

SELECT Attrition attr, Department dep, Gender sex, JobRole title, MonthlyIncome m_income FROM employee e

SELECT MaritalStatus marital_status, OverTime over_time, TotalWorkingYears total_working_years FROM employee e 

SELECT JobRole, MonthlyIncome FROM employee e ORDER BY MonthlyIncome DESC;

SELECT Department, TotalWorkingYears FROM employee e ORDER BY TotalWorkingYears DESC;

SELECT Department , Age  FROM employee e ORDER BY Age  ASC;

SELECT DISTINCT(Department) FROM employee e 

SELECT COUNT(*) FROM employee e 

SELECT COUNT(DISTINCT(JobRole)) num_unique_jobrole
FROM employee e 

SELECT Attrition, Department, Gender, EmployeeNumber FROM employee e WHERE Department = 'Sales'

SELECT EmployeeNumber, Department, Gender, EducationField, MaritalStatus, Attrition FROM employee e WHERE EducationField = 'Life Sciences'

SELECT EmployeeNumber, Department, HourlyRate, JobRole, Attrition FROM employee e WHERE HourlyRate > '65' ORDER BY HourlyRate DESC

SELECT EmployeeNumber, JobRole FROM employee e WHERE JobRole = "Laboratory Technician"

SELECT EmployeeNumber, JobRole FROM employee e WHERE JobRole LIKE 'Represenative%';

SELECT EmployeeNumber, JobRole FROM employee e WHERE JobRole  = "Research"

Complete