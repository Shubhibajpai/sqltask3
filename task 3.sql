use task3;

CREATE TABLE Functions (
     X INT,
     Y INT
 );

 INSERT INTO Functions (X, Y) VALUES
 (20, 20),
 (20, 20),
 (20, 21),
 (23, 22),
 (22, 23),
 (21, 20);


SELECT F1.X AS X1, F1.Y AS Y1
FROM Functions F1

WHERE F1.X <= F1.Y   
ORDER BY X1;
