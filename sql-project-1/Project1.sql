CREATE TABLE customer_evan
	(customer_id SMALLINT,
	 name VARCHAR(20),
	 location VARCHAR(20),
	 total_expenditure VARCHAR(20));
	 
	DROP TABLE customer_evan 
	
	
SELECT * FROM customer_evan

INSERT INTO customer_evan
	(customer_id, name, location, total_expenditure)
	values (1701, "John", "Newport Beach, CA", "2000"),
		   ( 1707, "Tracy","Irvine, CA","1500"),
		   (1711, "Daniel","Newport Beach, CA","2500"),
		   (1703, "Ella","Santa Ana, CA","1800"),
		   (1708, "Mel","Orange, CA","1700"),
		   (1716,"Steve","Irvine, CA","18000");
	

SELECT * FROM customer_evan

UPDATE customer_evan
SET total_expenditure = "1800"
WHERE customer_id = 1716

ALTER TABLE customer_evan
	ADD gender VARCHAR(10);

UPDATE customer_evan
	SET gender =
	CASE 
		WHEN customer_id = 1701 THEN "M"
		WHEN customer_id = 1707 THEN "F"
		WHEN customer_id = 1711 THEN "M"
		WHEN customer_id = 1703 THEN "F"
		WHEN customer_id = 1708 THEN "F"
		WHEN customer_id = 1716 THEN "M"
	END
	
	
	
DELETE FROM customer_evan
	WHERE customer_id = 1716;

ALTER TABLE customer_evan
	ADD store VARCHAR(10);

ALTER TABLE customer_evan 
DROP COLUMN store;

SELECT * FROM customer_evan

SELECT * FROM customer_evan

SELECT name, total_expenditure FROM customer_evan

ALTER TABLE customer_evan
MODIFY total_expenditure SMALLINT; 

SELECT total_expenditure FROM customer_evan 
ORDER BY total_expenditure desc;

SELECT name, total_expenditure FROM customer_evan 
ORDER BY total_expenditure desc
LIMIT 3;

SELECT COUnt(DISTINCT location) FROM customer_evan nuniques

SELECT * FROM customer_evan WHERE gender = "M";

SELECT * FROM customer_evan WHERE gender = "F";

SELECT * FROM customer_evan WHERE location = "Irvine, CA";

SELECT name, location, total_expenditure FROM customer_evan
WHERE total_expenditure < 2000
ORDER BY name asc;