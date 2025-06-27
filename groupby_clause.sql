-- Table 'employees'
CREATE TABLE employees (
    emp_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    department_id INTEGER,
    salary REAL
);

-- Inserting dummy data
INSERT INTO employees
VALUES
(1, 'Rohan', 101, 58000),
(2, 'Meera', 103, 52000),
(3, 'Aniket', 101, 50000),
(4, 'Kavya', 104, 65000),
(5, 'Siddharth', 102, 70000),
(6, 'Isha', 103, 53000),
(7, 'Ritika', 104, 64000),
(8, 'Nikhil', 101, 60000),
(9, 'Tanya', 102, 71000),
(10, 'Sneha', 104, 66000),
(11, 'Vikram', 103, 54000),
(12, 'Aditya', 102, 72000),
(13, 'Aishwarya', 102, 69000),
(14, 'Raj', 101, 61000),
(15, 'Pooja', 103, 55000);


-- 1. Total salary by department
SELECT department_id, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id;

-- 2. Average salary by department
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id;

-- 3. Departments with more than 5 employees
SELECT department_id, COUNT(*) AS num_employees
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 5;

-- 4. Count of distinct departments
SELECT COUNT(DISTINCT department_id) AS total_departments
FROM employees;

-- 5. Highest salary in each department
SELECT department_id, MAX(salary) AS highest_salary
FROM employees
GROUP BY department_id;

-- 6. Minimum salary in each department
SELECT department_id, MIN(salary) AS min_salary
FROM employees
GROUP BY department_id;

-- 7. Total number of employees
SELECT COUNT(*) AS total_employees
FROM employees;

-- 8. Number of employees in each department, sorted by count descending
SELECT department_id, COUNT(*) AS num_employees
FROM employees
GROUP BY department_id
ORDER BY num_employees DESC;

-- 9. Departments with average salary > 60,000
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 60000;

-- 10. Employees earning more than 65,000
SELECT emp_id, name, salary, department_id
FROM employees
WHERE salary > 65000;

-- 11. Average salary of all employees (not grouped)
SELECT AVG(salary) AS company_avg_salary
FROM employees;

-- 12. Top 3 highest-paid employees (company-wide)
SELECT emp_id, name, salary
FROM employees
ORDER BY salary DESC
LIMIT 3;

-- 13. Total salary and employee count by department, sorted by total salary
SELECT department_id, COUNT(*) AS num_employees, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id
ORDER BY total_salary DESC;

-- 14. Departments with at least one employee earning over 70,000
SELECT DISTINCT department_id
FROM employees
WHERE salary > 70000;

-- 15. Department with the highest average salary
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id
ORDER BY avg_salary DESC
LIMIT 1;
