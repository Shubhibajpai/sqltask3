use task3;
CREATE TABLE JobCosts (
    JobFamily VARCHAR(50),
    Location VARCHAR(50),
    Cost DECIMAL(15, 2)  -- Assuming cost is stored as a decimal with 2 decimal places
);
INSERT INTO JobCosts (JobFamily, Location, Cost) VALUES
('Software Engineers', 'India', 50000.00),
('Software Engineers', 'International', 70000.00);

SELECT 
    'India' AS Location,
    Cost AS Cost_in_India,
    100 AS Percentage,
    ROUND((Cost / (SELECT Cost FROM JobCosts WHERE Location = 'International' AND JobFamily = 'Software Engineers')) * 100, 2) AS Cost_percentage
FROM 
    JobCosts
WHERE 
    Location = 'India'
    AND JobFamily = 'Software Engineers'

UNION ALL

SELECT 
    'International' AS Location,
    (SELECT Cost FROM JobCosts WHERE Location = 'International' AND JobFamily = 'Software Engineers') AS Cost_in_International,
    100 AS Percentage,
    100.00 AS Cost_percentage

