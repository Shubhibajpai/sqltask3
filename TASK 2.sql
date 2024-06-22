use task3;

CREATE TABLE Students (
    ID INT PRIMARY KEY,
    Name VARCHAR(100)
);


INSERT INTO Students (ID, Name) VALUES
(1, 'Aman'),
(2, 'Bobby'),
(3, 'Priya'),
(4, 'David'),
(5, 'Rajesh');


CREATE TABLE Friends (
    ID INT,
    Friend_ID INT,
    PRIMARY KEY (ID),
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
    salary INT  
);


INSERT INTO Packages (ID, salary) VALUES
(1, 60),   
(2, 65),   
(3, 55),   
(4, 70),   
(5, 75);   
SELECT s.Name
FROM Students s
JOIN Friends f ON s.ID = f.ID
JOIN Packages sp ON s.ID = sp.ID
JOIN Packages fp ON f.Friend_ID = fp.ID
WHERE fp.salary > sp.salary
ORDER BY fp.salary;

