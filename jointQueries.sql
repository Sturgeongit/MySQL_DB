/*TABLE DATA*/

SELECT * FROM service;
SELECT * FROM bank;
SELECT * FROM warranty;
SELECT * FROM vehicle;
SELECT * FROM servicecode;
SELECT * FROM saletrans;
SELECT * FROM staff;
SELECT * FROM customer;
SELECT * FROM location;


update service
set stocknum = 100100
where customer = 3;

/*AGGREGATE*/ 

SELECT count(ServiceCode) AS 'Number Services, by Tech', 
	technician AS 'Technician'
FROM service
GROUP BY technician
;

SELECT CONCAT ('$', FORMAT(AVG(saleprice), 2)) AS 'Average Car Sale'
 FROM saletrans;

SELECT COUNT(*) AS 'Number of Available Services Under $100'
  FROM ServiceCode 
  WHERE Price < 100; 
  
SELECT COUNT(*) AS 'Number of Partner Banks'
  FROM Bank; 
  
SELECT 
	CONCAT ('$', MIN(price), ' - ', '$', MAX(price)) AS 'Warranty Price Range'
  FROM Warranty;   
  
SELECT COUNT(*) AS 'Number of Customers'
FROM customer;

SELECT CONCAT ('$', FORMAT(AVG(price), 2)) AS 'Average Price'
FROM vehicle;

SELECT 
	location AS 'Location',
	COUNT(*) AS 'Number of Employees by Location'
FROM staff
GROUP BY location;

SELECT 
	city AS 'City',
	COUNT(locid) AS 'Number Locations per City'
FROM location
GROUP BY city;  

/*************************************SERVICE TABLE****************************************/
SELECT * FROM service;

/*JOINT(service, customer, svccode, vehicle)*/
SELECT  
	DATE_FORMAT(s.svcdate, '%m/%d/%Y')  AS 'Date',
    CONCAT (c.firstname, ' ', c.lastname) AS 'Customer',
    CONCAT (h.manufyear, ' ', h.make, ' ', h.model) AS 'Vehicle',
    v.svcdesc AS 'Service Performed'
FROM service s
JOIN customer c
 ON s.customer = c.custid
JOIN servicecode v
 ON s.servicecode = v.svccode
JOIN vehicle h
 ON s.stocknum = h.stocknum
ORDER BY c.lastname
;
/*************************************SALES TRANSACTION TABLE***********************************/

SELECT * FROM saletrans;

 /*JOINT(saletrans, customer, vehicle, staff, warranty, bank)*/
SELECT  
	DATE_FORMAT(s.transdate, '%m/%d/%Y')  AS 'Date',
    CONCAT (c.firstname, ' ', c.lastname) AS 'Customer',
    CONCAT (v.manufyear, ' ', v.make, ' ', v.model) AS 'Vehicle',
    CONCAT ('$', FORMAT(s.saleprice, 2)) AS 'Sale Price',
    CONCAT (f.firstname, ' ', f.lastname) AS 'Salesperson',
    CONCAT (w.warrtype, ' ', w.term, ' month') AS 'Warranty',
    b.bankname AS 'Financing Bank'
FROM saletrans s
JOIN customer c
 ON s.customer = c.custid
JOIN staff f
 ON s.salesperson = f.empid
JOIN vehicle v
 ON s.stocknum = v.stocknum
JOIN warranty w
 ON s.warranty = w.warrid
JOIN bank b
 ON s.bank = b.bankid
ORDER BY f.lastname
;

/*************************************SERVICE CODE TABLE***********************************/
SELECT * FROM servicecode;

  
/*************************************BANK TABLE***********************************/
SELECT * FROM bank;

  
/*************************************WARRANTY TABLE***********************************/

SELECT * FROM warranty;

/*************************************CUSTOMER TABLE***********************************/
SELECT * FROM customer;

/* JOINT (Customer, Staff) */
SELECT 
	CONCAT (f.firstname, ' ', f.lastname) AS 'Salesperson',
	COUNT(*) AS 'Number of Customers by Salesperson'
FROM customer c
JOIN staff f
 ON c.salesperson = f.empid
GROUP BY salesperson;

/*************************************VEHICLE TABLE***********************************/
SELECT * FROM vehicle;

/* JOINT (vehicle, location) */
SELECT 
	v.stocknum AS 'Stock Number',
    CONCAT (v.manufyear, ' ', v.make, ' ', v.model) AS 'Vehicle',
    CONCAT ('$', FORMAT(v.price, 2)) AS 'Price',
	l.locname AS 'Location'
FROM vehicle v
JOIN location l
	ON v.location = l.locid
;

/*************************************STAFF TABLE***********************************/
SELECT * FROM staff;

/*JOINT(staff, location)*/
SELECT
	CONCAT (f.firstname, ' ', f.lastname) AS Employee,
    l.locname AS Location
FROM staff f
JOIN location l
	ON f.location = l.locid
ORDER BY l.locid
;

/*************************************LOCATION TABLE***********************************/
SELECT * FROM location;

/*JOINT(staff (manager), location)*/
SELECT 
	l.locname AS 'Location',
	CONCAT (f.firstname, ' ', f.lastname) AS 'Manager'
FROM location l 
JOIN staff f
	ON l.manager = f.empid
ORDER BY locid;


























/*AGGREGATE(saletrans, staff)*/
/*+++SKIP+++ */
SELECT 
 CONCAT (f.firstname, ' ', f.lastname) AS 'Salesperson',
	SUM(s.saleprice) AS 'Total Sales'
 FROM saletrans s
 JOIN staff f
  ON s.salesperson = f.empid
 GROUP BY s.salesperson;

/*JOINT (service, vehicle)*/
/*+++SKIP+++*/
SELECT 	
	s.svcdate ,	
	s.ServiceCode,	
	v.Make,	
	v.Model,	
	v.ManufYear	
FROM Vehicle v		
JOIN Service s		
ON v.StockNum =  s.StockNum		
ORDER BY v.ManufYear, s.ServiceCode;