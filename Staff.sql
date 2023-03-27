CREATE TABLE Staff (
  EmpID INT(4) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  LastName VARCHAR(15),
  FirstName VARCHAR(15),
  StreetAddress VARCHAR(20),
  City VARCHAR(12),
  State VARCHAR(2),
  Zip INT(5),
  Phone DOUBLE,
  Location INT(2),
  Department VARCHAR(12),
  JobTitle VARCHAR(12),
  FOREIGN KEY (Location) REFERENCES Location(LocID) ON DELETE SET NULL
);
ALTER TABLE Staff AUTO_INCREMENT = 1000 ;
INSERT INTO Staff 
VALUES (NULL, 'John', 'Barry', '201 S. First St', 'Houston', 'TX', 77223, 2815559021, 10, 'Sales', 'Salesperson');
INSERT INTO Staff 
VALUES (NULL, 'Sara', 'MacKenzie', '15201 Jameson St', 'Houston', 'TX', 77032, 2814445298, 10, 'Sales', 'Sales Mgr');
INSERT INTO Staff
VALUES (NULL, 'Tom', 'Bombadil', '675 McGowan St', 'Houston', 'TX', 77006, 7135269875, 10, 'Service', 'Technician');
INSERT INTO Staff
VALUES (NULL, 'Calvin ', 'Davis', '661 Watson Street', 'Houston', 'TX', 77106, 2816966155, 11, 'Service', 'Technician');
INSERT INTO Staff
VALUES (NULL, 'Dona ', 'Kinard', '1947 Arbor Court', 'Houston', 'TX', 77055, 7132888944, 11, 'Operations', 'GM');
SELECT * FROM Staff;

INSERT INTO Staff 
VALUES (NULL, 'Butler', 'John', '120 George St', 'Houston', 'TX', 77041, 2815244698, 12, 'Operations', 'GM');

UPDATE staff
 SET location = 12
 WHERE EmpID = 1005;
 
 UPDATE staff
 SET FirstName = 'Suresh', LastName = 'Natarajan', StreetAddress = '17201 Greenleaf Ct', Zip = 77495, Phone = 2812775448, Location = 11
 WHERE EmpID = 1001;
 UPDATE staff
 SET FirstName = 'Sara', LastName = 'MacKenzie'
 WHERE EmpID = 1002;
 UPDATE staff
 SET FirstName = 'Tom', LastName = 'Bombadil'
 WHERE EmpID = 1003;
 UPDATE staff
 SET FirstName = 'Calvin', LastName = 'Davis'
 WHERE EmpID = 1004;
 UPDATE staff
 SET JobTitle = 'Manager'
 WHERE EmpID = 1006;
 UPDATE staff
 SET JobTitle = 'Manager'
 WHERE EmpID = 1002;
 UPDATE staff
 SET JobTitle = 'Manager'
 WHERE EmpID = 1005;
 
 
 select * from staff;