use task3;
CREATE TABLE Companies (
    company_code VARCHAR(10),
    founder_name VARCHAR(50),
    PRIMARY KEY (company_code)
);


INSERT INTO Companies (company_code, founder_name) VALUES
('C_1', 'Varun Dhawan'),
('C_2', 'Arijit Singh'),
('C_3', 'Salman Khan'),
('C_4', 'Aman Gupta'),
('C_5', 'Rajeev Singh');


CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    company_code VARCHAR(10),
    employee_name VARCHAR(50),
    position VARCHAR(50)
);


INSERT INTO Employees (employee_id, company_code, employee_name, position) VALUES
(1, 'C_1', 'Alice', 'Lead_Manager'),
(2, 'C_1', 'Bob', 'Manager'),
(3, 'C_1', 'Charlie', 'Employee'),
(4, 'C_2', 'David', 'Senior_Manager'),
(5, 'C_2', 'sanju', 'Manager'),
(6, 'C_2', 'Frank', 'Employee'),
(7, 'C_3', 'Grace', 'Manager'),
(8, 'C_3', 'Henry', 'Employee'),
(9, 'C_4', 'Ivy', 'Lead_Manager'),
(10, 'C_5', 'Abhishek', 'Employee'),
(11, 'C_5', 'Kelly', 'Employee'),
(12, 'C_5', 'Liam', 'Manager'),
(13, 'C_5', 'Mia', 'Employee');

SELECT 
    c.company_code,
    c.founder_name,
    COUNT(DISTINCT CASE WHEN e.position IN ('Lead_Manager', 'Senior_Manager', 'Manager') THEN e.employee_id END) AS total_managers,
    COUNT(DISTINCT CASE WHEN e.position = 'Employee' THEN e.employee_id END) AS total_employees
FROM Companies c
LEFT JOIN Employees e ON c.company_code = e.company_code
GROUP BY c.company_code, c.founder_name
ORDER BY c.company_code;

