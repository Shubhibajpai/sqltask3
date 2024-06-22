use task3;
CREATE TABLE MonthlyCosts (
    Month DATE,
    BusinessUnit VARCHAR(50),
    Cost DECIMAL(15, 2)  
);

CREATE TABLE MonthlyRevenues (
    Month DATE,
    BusinessUnit VARCHAR(50),
    Revenue DECIMAL(15, 2)  
);


 INSERT INTO MonthlyCosts (Month, BusinessUnit, Cost) VALUES
 ('2023-01-01', 'BU1', 50000.00),
 ('2023-02-01', 'BU1', 55000.00),
 ('2023-03-01', 'BU1', 60000.00);


INSERT INTO MonthlyRevenues (Month, BusinessUnit, Revenue) VALUES
('2024-01-01', 'BU1', 130000.00),
('2024-02-01', 'BU1', 120000.00),
('2024-03-01', 'BU1', 110000.00);

SELECT 
    MC.Month,
    MC.Cost,
    MR.Revenue,
    ROUND((MC.Cost / MR.Revenue) * 100, 2) AS Cost_to_Revenue_Ratio
FROM 
    MonthlyCosts MC
JOIN 
    MonthlyRevenues MR ON MC.Month = MR.Month AND MC.BusinessUnit = MR.BusinessUnit
WHERE 
    MC.BusinessUnit = 'BU1'
ORDER BY 
    MC.Month;
