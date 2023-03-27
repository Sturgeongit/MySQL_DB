CREATE TABLE Bank (
  BankID INT(3) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  BankName VARCHAR(15),
  Email VARCHAR(15),
  Phone INT
);
ALTER TABLE bank AUTO_INCREMENT = 600;
ALTER TABLE bank MODIFY Email VARCHAR(25);
ALTER TABLE bank MODIFY Phone BIGINT;
ALTER TABLE Phone ;
INSERT INTO Bank
VALUES (NULL, 'Bank of America', 'manager@bofa.com', 2125554000);
INSERT INTO Bank
VALUES (NULL, 'Comerica Bank', 'mgr@comericabank.com', 7135655020);
INSERT INTO Bank
VALUES (NULL, 'TDECU', 'manager@tdecu.com', 2815551234);
INSERT INTO Bank
VALUES (NULL, 'Chase Bank', 'manager@chase.com', 8885551212);
INSERT INTO Bank
VALUES (NULL, 'Citibank', 'manager@citibank.com', 8005556060);

UPDATE Bank
SET email = 'newmanager@chase.com'
WHERE BankID = 604;
DELETE FROM Bank
WHERE BankID = 605;

SELECT * FROM bank;

SELECT COUNT(*) AS NumBanks
FROM Bank;