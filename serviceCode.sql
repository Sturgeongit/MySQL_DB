CREATE TABLE ServiceCode (
  SvcCode INT(3) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  SvcDesc VARCHAR(15),
  Price DOUBLE PRECISION
);
ALTER TABLE servicecode AUTO_INCREMENT = 100;

SELECT * FROM ServiceCode
  ORDER BY Price;
  
SELECT COUNT(*) AS Under$100
  FROM ServiceCode 
  WHERE Price > 100;
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

UPDATE ServiceCode
SET Price = 1299.95
WHERE SvcCode = 103;

DELETE FROM ServiceCode
WHERE SvcCode = 104;

INSERT INTO ServiceCode 
VALUES (104,'Radiator Flush', 229.95);

