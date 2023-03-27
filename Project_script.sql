DROP TABLE ServiceCode;
/*--------------------------------ServiceCodes------------------------ */
CREATE TABLE ServiceCode (
  SvcCode INT(3) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  SvcDesc VARCHAR(15),
  Price DOUBLE PRECISION
);
ALTER TABLE servicecode AUTO_INCREMENT = 100;

INSERT INTO ServiceCode 
VALUES (NULL,'Oil Change', 43.95);
INSERT INTO ServiceCode 
VALUES (NULL,'Brake Pads', 79.95);
INSERT INTO ServiceCode 
VALUES (NULL,'Batt Svc', 109.95);
INSERT INTO ServiceCode 
VALUES (NULL,'Timing Belt', 1200.00);
INSERT INTO ServiceCode 
VALUES (NULL,'Radiator Flush', 229.95);
SELECT * FROM ServiceCode
  ORDER BY Price DESC;
UPDATE ServiceCode
SET Price = 1299.95
WHERE SvcCode = 103;
DELETE FROM ServiceCode
WHERE SvcCode = 104;

DROP TABLE warranty;

/*--------------------------------Warranty------------------------ */

CREATE TABLE Warranty (
  WarrID INT(3) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  WarrType VARCHAR(15),
  Term INT(2),
  Price INT(5)
);
ALTER TABLE warranty AUTO_INCREMENT = 800;
INSERT INTO warranty 
VALUES (NULL,'Basic', 12, 1500);
INSERT INTO warranty 
VALUES (NULL,'Intermediate', 24, 2000);
INSERT INTO warranty 
VALUES (NULL,'Full', 36, 2850);
INSERT INTO warranty 
VALUES (NULL,'Luxury', 48, 3500);
SELECT * FROM warranty;

DROP TABLE bank;

/*--------------------------------Bank------------------------ */

CREATE TABLE Bank (
  BankID INT(3) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  BankName VARCHAR(15),
  Email VARCHAR(15),
  Phone INT
);
ALTER TABLE bank AUTO_INCREMENT = 600;

DROP TABLE location;
/*--------------------------------Location------------------------ */

CREATE TABLE Location (
  LocID INT(2) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  LocName VARCHAR(10),
  StreetAddress VARCHAR(20),
  City VARCHAR(12),
  State VARCHAR(2),
  Zip INT(5),
  Phone DOUBLE(10,0),
  Manager INT(3)
);
ALTER TABLE location AUTO_INCREMENT = 10;
ALTER TABLE location ADD FOREIGN KEY (Manager) REFERENCES Staff(EmpID);
INSERT INTO location 
VALUES(NULL, 'Main', '100 Main St', 'Houston', 'TX', 77001, 7132551000, NULL);
INSERT INTO location 
VALUES(NULL, 'Stafford', '3190 Ash Ave', 'Stafford', 'TX', 77598, 2818240090, NULL);
INSERT INTO location 
VALUES(NULL, 'SciCtr', '3270 Science Center', 'Houston', 'TX', 77018, 7135771000, NULL);
SELECT * FROM Location;

/*--------------------------------Vehicle------------------------ */

CREATE TABLE Vehicle (
  StockNum INT(6) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  ManufYear INT(4),
  Make VARCHAR(10),
  Model VARCHAR(10),
  Color VARCHAR(10),
  Mileage INT(6),
  Price INT(6),
  Location INT(2),
  VIN VARCHAR(17),
  New_Used VARCHAR(4),
  FOREIGN KEY (Location) REFERENCES Location (LocID) ON DELETE SET NULL
);
ALTER TABLE vehicle AUTO_INCREMENT = 100100;
INSERT INTO Vehicle 
VALUES(NULL, 2020, 'Honda', 'Accord', 'Silver', 31598, 29995, 10, 'JHMZE2H74BS003849', 'Used');
INSERT INTO Vehicle 
VALUES(NULL, 2020, 'Toyota', 'Rav4', 'Blue', 38662, 21995, 10, '5TELU4EN6AZ725438', 'Used');
INSERT INTO Vehicle 
VALUES(NULL, 2019, 'Toyota', 'Corolla', 'Silver', 38662, 21995, 11, 'JTMRF4DV0CD045813', 'Used');
INSERT INTO Vehicle 
VALUES(NULL, 2018, 'Toyota', 'Tundra', 'Black', 68001, 32995, 11, 'JT2EL32H8K0425561', 'Used');
INSERT INTO Vehicle 
VALUES(NULL, 2022, 'Toyota', 'Camry', 'Red', 5, 31596, 12, 'JTEGD21A760143408', 'New');

SELECT * FROM vehicle;


/*--------------------------------Staff------------------------ */
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

DROP TABLE Customer, saletrans, service;

/*--------------------------------Customer------------------------ */
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
VALUES (NULL,  'Stover', 'Erica', 7135788952, 'EricaIStover@teleworm.us');
INSERT INTO customer
VALUES (NULL,  'Corry', 'Lani ', 9158317139, 'LaniWCorry@jourrapide.com');
INSERT INTO customer
VALUES (NULL,  'Philpot', 'Thomas ', 2814908181, 'RonaldLPark@yahoo.com');
INSERT INTO customer
VALUES (NULL,  'Park', 'Ronald ', 7133125488, 'rpark2378@gmail.com');
INSERT INTO customer
VALUES (NULL,  'Douglas', 'Dennis ', 7175788952, 'supersailor12@gmail.com');

/*---------------Sales Transaction------------------------ */
CREATE TABLE SaleTrans (
  TransID INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  StockNum INT,
  Customer INT,
  SalePrice INT,
  Salesperson INT,
  Bank INT,
  Warranty INT,
  FOREIGN KEY (StockNum) REFERENCES Vehicle(StockNum) ON DELETE SET NULL,
  FOREIGN KEY (Customer) REFERENCES Customer(CustID) ON DELETE SET NULL,
  FOREIGN KEY (Salesperson) REFERENCES Staff(EmpID) ON DELETE SET NULL,
  FOREIGN KEY (Bank) REFERENCES Bank(BankID) ON DELETE SET NULL,
  FOREIGN KEY (Warranty) REFERENCES Warranty(WarrID) ON DELETE SET NULL
);
ALTER TABLE saletrans AUTO_INCREMENT = 100100100;



/*---------------Service Record------------------------ */
DROP TABLE service;
CREATE TABLE Service (
  InvoiceNum INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Customer INT,
  StockNum INT,
  ServiceCode INT,
  Technician INT,
  FOREIGN KEY (ServiceCode) REFERENCES ServiceCode(SvcCode) ON DELETE SET NULL,
  FOREIGN KEY (Customer) REFERENCES Customer(CustID) ON DELETE SET NULL,
  FOREIGN KEY (StockNum) REFERENCES Vehicle (StockNum) ON DELETE SET NULL,
  FOREIGN KEY (Technician) REFERENCES Staff(EmpID) ON DELETE SET NULL
);
ALTER TABLE Service AUTO_INCREMENT = 1001001000;
