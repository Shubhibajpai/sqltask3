use task3;
CREATE LOGIN YourLoginName
WITH PASSWORD = 'YourPassword';

CREATE LOGIN [Domain\YourWindowsUser]
FROM WINDOWS;

USE YourDatabaseName; 

CREATE USER YourUserName
FOR LOGIN YourLoginName; 

USE YourDatabaseName; 

ALTER ROLE db_owner ADD MEMBER YourUserName;

CREATE LOGIN JohnDoe
WITH PASSWORD = 'StrongPassword123';


USE YourDatabaseName;
CREATE USER JohnDoeUser
FOR LOGIN JohnDoe;


USE YourDatabaseName;
ALTER ROLE db_owner ADD MEMBER JohnDoeUser;
