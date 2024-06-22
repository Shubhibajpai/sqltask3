use task3;
CREATE TABLE EmployeeCost (
    Month VARCHAR(10),
    NumEmployees INT,
    AvgCost DECIMAL(10, 2)
);


INSERT INTO EmployeeCost (Month, NumEmployees, AvgCost)
VALUES 
    ('January', 50, 4000.00),
    ('February', 55, 4100.00),
    ('March', 60, 4200.00);
    

SELECT Month, 
       SUM(NumEmployees * AvgCost) / SUM(NumEmployees) AS WeightedAvgCost
FROM EmployeeCost
GROUP BY Month;
    
