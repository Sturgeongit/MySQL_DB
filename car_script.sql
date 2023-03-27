CREATE TABLE ServiceCode (
  SvcCode INT PRIMARY KEY,
  SvcDesc VARCHAR(15),
  Price DOUBLE PRECISION  
);


CREATE TABLE Warranty (
  WarrID INT PRIMARY KEY,
  WarrType VARCHAR(15),
  Term INT,
  Price INT
);

ALTER TABLE Warranty AUTO_INCREMENT = 2201;

CREATE TABLE Location (
  LocID INT PRIMARY KEY,
  LocName VARCHAR(15),
  StreetAddress VARCHAR(15),
  City VARCHAR(10),
  State VARCHAR(2),
  Zip INT(5),
  Manager INT
);
ALTER TABLE Location AUTO_INCREMENT = 1;

CREATE TABLE Vehicle (
  StockNum INT PRIMARY KEY,
  Yr INT,
  Make VARCHAR(15),
  Model VARCHAR(15),
  Color VARCHAR(15),
  Mileage INT,
  Price INT,
  Location INT,
  VIN VARCHAR(15),
  New_Used VARCHAR(15),
  FOREIGN KEY (Location) REFERENCES Location (LocID) ON DELETE SET NULL
);
ALTER TABLE Vehicle AUTO_INCREMENT = 200000;

CREATE TABLE Staff (
  EmpID INT PRIMARY KEYvehicle,
  LastName VARCHAR(15),
  FirstName VARCHAR(15),
  StreetAddress VARCHAR(15),
  City VARCHAR(15),
  State VARCHAR(15),
  Zip INT,
  Phone INT,
  Location INT,
  Department VARCHAR(15),
  JobTitle VARCHAR(15),
  PRIMARY KEY (EmpID),
  FOREIGN KEY (Location) REFERENCES Location(LocCode) ON DELETE SET NULL
);

CREATE TABLE Customer (
  CustID INT,
  LastName VARCHAR(15),
  FirstName VARCHAR(10),
  Phone INT,
  Email VARCHAR(25),
  PRIMARY KEY (CustID)
);

CREATE TABLE Bank (
  BankID INT,
  BankName VARCHAR(15),
  Email VARCHAR(15),
  Phone INT,
  PRIMARY KEY (BankID)
);

CREATE TABLE Transaction (
  TransID INT,
  StockNum INT,
  Customer INT,
  SalePrice INT,
  Salesperson INT,
  Bank INT,
  Warranty INT,
  PRIMARY KEY (TransID),
  FOREIGN KEY (StockNum) REFERENCES Vehicle(StockNum) ON DELETE SET NULL,
  FOREIGN KEY (Customer) REFERENCES Customer(CustID) ON DELETE SET NULL,
  FOREIGN KEY (Salesperson) REFERENCES Staff(EmpID) ON DELETE SET NULL,
  FOREIGN KEY (Bank) REFERENCES Bank(BankID) ON DELETE SET NULL,
  FOREIGN KEY (Warranty) REFERENCES Warranty(WarrCode) ON DELETE SET NULL
);

CREATE TABLE Service (
  InvoiceNum INT,
  CustNum INT,
  StockNum INT,
  ServiceCode INT,
  Technician INT,
  PRIMARY KEY (InvoiceNum),
  FOREIGN KEY (ServiceCode) REFERENCES ServiceCode(SvcCode) ON DELETE SET NULL,
  FOREIGN KEY (CustNum) REFERENCES Customer(CustID) ON DELETE SET NULL,
  FOREIGN KEY (StockNum) REFERENCES Vehicle (StockNum) ON DELETE SET NULL,
  FOREIGN KEY (Technician) REFERENCES Staff(EmpID) ON DELETE SET NULL
);

