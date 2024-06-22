use task3;
CREATE TABLE swap_table (
    id INT PRIMARY KEY,
    column1 INT,
    column2 INT
);


INSERT INTO swap_table (id, column1, column2) VALUES
(1, 10, 20),
(2, 30, 40),
(3, 50, 60);


UPDATE swap_table
SET
    column1 = column1 + column2, 
    column2 = column1 - column2, 
    column1 = column1 - column2  

;


SELECT * FROM swap_table;


