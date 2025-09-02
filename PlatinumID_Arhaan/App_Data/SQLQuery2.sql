CREATE TABLE accounts(
UserID INT  IDENTITY(1,1) PRIMARY KEY,
Username Varchar(40),
Password Varchar(40),
EmpId Varchar(40),
Role Varchar(40))
SELECT * FROM accounts;
INSERT INTO accounts 
(Username,Password,EmpId,Role) 
VALUES 
('Arhaan','123','000','admin')

SELECT * from data
DELETE FROM data
TRUNCATE TABLE data
USE FormDB