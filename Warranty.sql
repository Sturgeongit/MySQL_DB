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