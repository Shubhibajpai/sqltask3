use task3;
CREATE TABLE Students (
    ID INT PRIMARY KEY,
    Name VARCHAR(50)
);


INSERT INTO Students (ID, Name) VALUES
(1, 'Alia'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David'),
(5, 'Tina');


CREATE TABLE Friends (
    ID INT PRIMARY KEY,
    Friend_ID INT,
    FOREIGN KEY (ID) REFERENCES Students(ID),
    FOREIGN KEY (Friend_ID) REFERENCES Students(ID)
);


INSERT INTO Friends (ID, Friend_ID) VALUES
(1, 2),  
(2, 1),  
(3, 4),  
(4, 5),  
(5, 3);  

CREATE TABLE Packages (
    ID INT PRIMARY KEY,
    Salary INT  
);


INSERT INTO Packages (ID, Salary) VALUES
(1, 60),   
(2, 70),   
(3, 55),  
(4, 80),   
(5, 65);   

SELECT s.Name
FROM Students s
JOIN Friends f ON s.ID = f.ID
JOIN Packages p1 ON f.Friend_ID = p1.ID
JOIN Packages p2 ON s.ID = p2.ID
WHERE p1.Salary > p2.Salary
ORDER BY p1.Salary;



