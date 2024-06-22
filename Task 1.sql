use task3;
CREATE TABLE Projects (
    Task_ID INT PRIMARY KEY,
    Start_Date DATE,
    End_Date DATE
);
INSERT INTO Projects (Task_ID, Start_Date, End_Date) VALUES
(1, '2024-06-01', '2024-06-02'),
(2, '2024-06-03', '2024-06-04'),
(3, '2024-06-05', '2024-06-06'),
(4, '2024-06-07', '2024-06-08'),
(5, '2024-06-10', '2024-06-11'),
(6, '2024-06-12', '2024-06-13'),
(7, '2024-06-15', '2024-06-16'),
(8, '2024-06-17', '2024-06-18'),
(9, '2024-06-20', '2024-06-21');

SELECT 
    MIN(Start_Date) AS Project_Start_Date,
    MAX(End_Date) AS Project_End_Date,
    DATEDIFF(MAX(End_Date), MIN(Start_Date)) + 1 AS Completion_Days
FROM (
    SELECT 
        Task_ID,
        Start_Date,
        End_Date,
        ROW_NUMBER() OVER (ORDER BY Start_Date) - ROW_NUMBER() OVER (ORDER BY End_Date) AS grp
    FROM Projects
) AS grouped
GROUP BY grp
ORDER BY Completion_Days, Project_Start_Date;
