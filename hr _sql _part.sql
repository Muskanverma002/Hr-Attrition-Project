CREATE TABLE hr_employee_attrition (
    Age INT,
    Attrition VARCHAR(10),
    BusinessTravel VARCHAR(50),
    DailyRate INT,
    Department VARCHAR(50),
    DistanceFromHome INT,
    Education INT,
    EducationField VARCHAR(50),
    EmployeeCount INT,
    EmployeeNumber INT PRIMARY KEY,
    EnvironmentSatisfaction INT,
    Gender VARCHAR(10),
    HourlyRate INT,
    JobInvolvement INT,
    JobLevel INT,
    JobRole VARCHAR(100),
    JobSatisfaction INT,
    MaritalStatus VARCHAR(20),
    MonthlyIncome INT,
    MonthlyRate INT,
    NumCompaniesWorked INT,
    Over18 VARCHAR(5),
    OverTime VARCHAR(5),
    PercentSalaryHike INT,
    PerformanceRating INT,
    RelationshipSatisfaction INT,
    StandardHours INT,
    StockOptionLevel INT,
    TotalWorkingYears INT,
    TrainingTimesLastYear INT,
    WorkLifeBalance INT,
    YearsAtCompany INT,
    YearsInCurrentRole INT,
    YearsSinceLastPromotion INT,
    YearsWithCurrManager INT
);

SELECT COUNT(*) FROM hr_employee_attrition;   -- total rows (1470)
SELECT * FROM hr_employee_attrition LIMIT 10;

1. Total Employees

SELECT COUNT(*) AS total_employees
FROM hr_employee_attrition;

2. Attrition Rate

SELECT 
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS attrition_rate
FROM hr_employee_attrition;

3. Department-wise Attrition

SELECT Department, 
       COUNT(*) AS total_employees,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
       ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM hr_employee_attrition
GROUP BY Department
ORDER BY employees_left DESC;

4. Gender-wise Attrition

SELECT Gender,
       COUNT(*) AS total_employees,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
       ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM hr_employee_attrition
GROUP BY Gender;

5. Age Group vs Attrition

SELECT CASE 
          WHEN Age < 25 THEN '<25'
          WHEN Age BETWEEN 25 AND 34 THEN '25-34'
          WHEN Age BETWEEN 35 AND 44 THEN '35-44'
          WHEN Age BETWEEN 45 AND 54 THEN '45-54'
          ELSE '55+'
       END AS age_group,
       COUNT(*) AS total_employees,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left
FROM hr_employee_attrition
GROUP BY age_group
ORDER BY age_group;

6. Overtime vs Attrition

SELECT OverTime,
       COUNT(*) AS total_employees,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left
FROM hr_employee_attrition
GROUP BY OverTime;

7. Salary Band vs Attrition

SELECT CASE 
          WHEN MonthlyIncome < 3000 THEN 'Low Income (<3k)'
          WHEN MonthlyIncome BETWEEN 3000 AND 6000 THEN 'Mid Income (3k-6k)'
          ELSE 'High Income (>6k)'
       END AS income_band,
       COUNT(*) AS total_employees,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left
FROM hr_employee_attrition
GROUP BY income_band
ORDER BY income_band;

8. Job Role-wise Attrition

SELECT JobRole,
       COUNT(*) AS total_employees,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
       ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM hr_employee_attrition
GROUP BY JobRole
ORDER BY attrition_rate DESC;

9. Years at Company vs Attrition

SELECT YearsAtCompany,
       COUNT(*) AS total_employees,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left
FROM hr_employee_attrition
GROUP BY YearsAtCompany
ORDER BY YearsAtCompany;

10. Education Field vs Attrition

SELECT EducationField,
       COUNT(*) AS total_employees,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left
FROM hr_employee_attrition
GROUP BY EducationField
ORDER BY employees_left DESC;

11. Performance Rating vs Attrition

SELECT PerformanceRating,
       COUNT(*) AS total_employees,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left
FROM hr_employee_attrition
GROUP BY PerformanceRating;




