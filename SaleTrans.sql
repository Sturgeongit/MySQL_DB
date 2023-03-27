
DROP TABLE saletrans;

CREATE TABLE SaleTrans (
  TransID INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  TransDate DATETIME DEFAULT now() NOT NULL,
  StockNum INT,
  Customer INT,
  SalePrice DOUBLE PRECISION (8,2),
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

INSERT INTO saletrans (transdate, stocknum, customer, saleprice, salesperson, bank, warranty)
VALUES ('2019-11-19', 100102, 3, 21500, 1000, 601, 801);

INSERT INTO saletrans (transdate, stocknum, customer, saleprice, salesperson, bank, warranty)
VALUES ( '2019-10-20', 100101, 2, 20000, 1001, 602, 801);

INSERT INTO saletrans (transdate, stocknum, customer, saleprice, salesperson, bank, warranty)
VALUES ( '2019-09-19', 100100, 1, 25000, 1000, 601, 800);

INSERT INTO saletrans (transdate, stocknum, customer, saleprice, salesperson, bank, warranty)
VALUES ( '2019-12-19', 100103, 5, 32750, 1002, 603, 801);

INSERT INTO saletrans (transdate, stocknum, customer, saleprice, salesperson, bank, warranty)
VALUES ( '2019-10-25', 100104, 4, 31000, 1002, 604, 803);

SELECT * FROM saletrans;