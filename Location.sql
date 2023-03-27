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
UPDATE staff
 SET location = 12
 WHERE EmpID = 1005;
 
UPDATE location
SET Manager = 1002
WHERE locid = 10;

UPDATE location
SET Manager = 1005
WHERE locid = 12;

UPDATE location
SET Manager = 1006
WHERE locid = 11;