use task3;

CREATE TABLE OCCUPATIONS (
    Name VARCHAR(50),
    Occupation VARCHAR(50)
);


INSERT INTO OCCUPATIONS (Name, Occupation) VALUES
('Samantha', 'Doctor'),
('Akshay', 'Actor'),
('Maria', 'Doctor'),
('Manu', 'Singer'),
('Ashley', 'Professor'),
('Rajesh', 'Actor'),
('Jenny', 'Doctor'),
('Priya', 'Singer'),
('Priyanka', 'Professor'),
('Jennifer', 'Actor'),
('Suman', 'Professor'),
('Bobby', 'Professor'),
('Naomi', 'Doctor');

SELECT 
    MAX(CASE WHEN Occupation = 'Doctor' THEN Name ELSE NULL END) AS Doctor,
    MAX(CASE WHEN Occupation = 'Professor' THEN Name ELSE NULL END) AS Professor,
    MAX(CASE WHEN Occupation = 'Singer' THEN Name ELSE NULL END) AS Singer,
    MAX(CASE WHEN Occupation = 'Actor' THEN Name ELSE NULL END) AS Actor
FROM (
    SELECT 
        Name,
        Occupation,
        ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) AS rn
    FROM OCCUPATIONS
) AS pivoted
GROUP BY rn
ORDER BY rn;

