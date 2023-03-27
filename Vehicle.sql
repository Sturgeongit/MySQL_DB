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
SELECT AVG(price) AS Avg_Used_Price
FROM vehicle
WHERE new_used = 'used';