use task3;

CREATE TABLE source_table (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    salary DECIMAL(10, 2)
);


INSERT INTO source_table (id, name, age, salary)
VALUES
    (1, 'Arun', 30, 5000.00),
    (2, 'Sunil', 28, 6000.00),
    (3, 'Suresh', 35, 4500.00),
    (4, 'Priti', 25, 7000.00),
    (5, 'Deepika', 32, 5500.00);

CREATE TABLE destination_table (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    salary DECIMAL(10, 2)
);


INSERT INTO destination_table (id, name, age, salary)
SELECT id, name, age, salary
FROM source_table;

