DROP TABLE service;
CREATE TABLE Service (
  svcdate DATETIME DEFAULT now() NOT NULL,
  StockNum INT NOT NULL,
  ServiceCode INT NOT NULL,
  Customer INT,
  Technician INT,
  PRIMARY KEY(svcdate, stocknum, servicecode),
  FOREIGN KEY (ServiceCode) REFERENCES ServiceCode(SvcCode),
  FOREIGN KEY (Customer) REFERENCES Customer(CustID) ON DELETE SET NULL,
  FOREIGN KEY (StockNum) REFERENCES Vehicle (StockNum),
  FOREIGN KEY (Technician) REFERENCES Staff(EmpID) ON DELETE SET NULL
);

INSERT INTO service
VALUES ('2020-01-27', 100102, 105, 1, 1003);

INSERT INTO service 
VALUES ('2020-03-02', 100102, 102, 1, 1003);

INSERT INTO service 
VALUES ('2020-03-02', 100102, 101, 1, 1004);

INSERT INTO service
VALUES ('2020-02-16', 100101, 103, 2, 1004);

INSERT INTO service 
VALUES ('2020-04-12', 100103, 102, 4, 1004);

INSERT INTO service 
VALUES ('2021-07-06', 100102, 100, 3, 1003);

INSERT INTO service 
VALUES ('2021-06-14', 100101, 100, 0, 1004);

INSERT INTO service 
VALUES ('2021-06-14', 100101, 102, 0, 1004);

INSERT INTO service 
VALUES ('2021-06-14', 100101, 105, 0, 1004);

INSERT INTO service 
VALUES ('2021-08-17', 100101, 100, 0, 1004);

UPDATE service
 SET svcdate = '2020-03-02'
 WHERE stocknum = 100102;

SELECT * FROM service;

ALTER TABLE Service
ADD svcdate DATETIME DEFAULT now();

ALTER TABLE Service 
DROP invoicenum;

ALTER TABLE service 
ADD PRIMARY KEY(svcdate, stocknum);

DROP TABLE service;
