CREATE TABLE Customer (
  CustID INT(7) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  LastName VARCHAR(15),
  FirstName VARCHAR(10),
  Phone DOUBLE,
  Email VARCHAR(25),
  Salesperson INT(4),
  FOREIGN KEY (Salesperson) REFERENCES Staff(EmpID) ON DELETE SET NULL
);
ALTER TABLE customer AUTO_INCREMENT = 1100000;

INSERT INTO customer
VALUES (NULL,  'Stover', 'Erica', 7135788952, 'EricaIStover@teleworm.us', 1001);
INSERT INTO customer
VALUES (NULL,  'Corry', 'Lani ', 9158317139, 'LaniWCorry@jourrapide.com', 1001);
INSERT INTO customer
VALUES (NULL,  'Philpot', 'Thomas ', 2814908181, 'RonaldLPark@yahoo.com', 1002);
INSERT INTO customer
VALUES (NULL,  'Park', 'Ronald ', 7133125488, 'rpark2378@gmail.com', 1001);
INSERT INTO customer 
VALUES (NULL,  'Douglas', 'Dennis ', 7175788952, 'supersailor12@gmail.com', 1002);

INSERT INTO customer (CustID, Lastname)
VALUES (0, 'IN-HOUSE');
UPDATE customer
 SET FirstName = 'In'
WHERE custid = 0;
UPDATE customer
 SET lastName = 'House'
WHERE custid = 0;
 
SELECT * FROM customer;