use task3;

CREATE TABLE BST (
    N INT,
    P INT
);


INSERT INTO BST (N, P) VALUES
(1, NULL),   
(2, 1),      
(3, 1),      
(4, 2),      
(5, 2),      
(6, 3),      
(7, 3);      

SELECT 
    N,
    CASE 
        WHEN P IS NULL THEN 'Root'
        WHEN EXISTS (SELECT 1 FROM BST b2 WHERE b2.P = b.N) THEN 'Inner'
        ELSE 'Leaf'
    END AS NodeType
FROM BST b
ORDER BY N;

