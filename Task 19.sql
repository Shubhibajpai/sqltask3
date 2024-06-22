use task3;
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    salary DECIMAL(10, 2)
);


INSERT INTO employees (employee_id, employee_name, salary)
VALUES
    (1, 'Ravi', 5000.00),
    (2, 'Raj', 6000.00),
    (3, 'Rajesh', 4500.00),
    (4, 'Davis', 7000.00),
    (5, 'Priya', 5500.00);
    

SELECT CEIL(AVG(salary)) AS actual_average_salary
FROM employees;


SELECT CEIL(AVG(REPLACE(CAST(salary AS VARCHAR), '0', ''))) AS miscalculated_average_salary
FROM employees;


SELECT CEIL(
    (SELECT AVG(salary) FROM employees) - 
    (SELECT AVG(REPLACE(CAST(salary AS VARCHAR), '0', '')) FROM employees)
) AS rounded_up_error;
    
