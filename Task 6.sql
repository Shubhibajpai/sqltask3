use task3;
CREATE TABLE STATION (
    ID INT PRIMARY KEY,
    CITY varchar(21),
    State varchar(20),
    LAT_N int,  
    LONG_W int
    
    
);

INSERT INTO STATION (ID,CITY,State, LAT_N, LONG_W) VALUES
(1,"Bareilly","Uttar Pradesh", 40.730610, -73.935242),   
(2,"Delhi","Delhi", 34.052235, -118.243683),  
(3,"Mumbai","Maharashtra", 41.878113, -87.629799),   
(4,"Shimla","Uttrakhand", 29.760427, -95.369804); 

SELECT ROUND(ABS(P1.LAT_N - P2.LAT_N) + ABS(P1.LONG_W - P2.LONG_W), 4) AS Manhattan_Distance
FROM (
    SELECT LAT_N, LONG_W
    FROM STATION
    WHERE LAT_N = (SELECT MIN(LAT_N) FROM STATION)
    AND LONG_W = (SELECT MIN(LONG_W) FROM STATION)
) AS P1,
(
    SELECT LAT_N, LONG_W
    FROM STATION
    WHERE LAT_N = (SELECT MAX(LAT_N) FROM STATION)
    AND LONG_W = (SELECT MAX(LONG_W) FROM STATION)
) AS P2;
