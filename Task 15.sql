use task3;
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2)
);


INSERT INTO employees (id, name, salary) VALUES
(1, 'Rajesh', 60000.00),
(2, 'Suresh', 75000.00),
(3, 'Mukesh', 90000.00),
(4, 'Davis', 80000.00),
(5, 'Chris Brown', 85000.00),
(6, 'Virat', 72000.00),
(7, 'David Clark', 68000.00),
(8, 'Sarah White', 82000.00),
(9, 'Paul', 78000.00),
(10, 'Nitin', 83000.00);


SELECT id, name, salary
FROM employees e1
WHERE 5 >= (
    SELECT COUNT(DISTINCT salary)
    FROM employees e2
    WHERE e2.salary >= e1.salary
);

