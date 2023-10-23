-- extra01_v1 --
SELECT LEFT(customerName, LOCATE(' ',customerName)-1) AS first_part,
	RIGHT(customerName,LENGTH(customerName)-LOCATE(' ',customerName)) AS second_part
FROM customers;

-- extra01_v2 --
SELECT SUBSTRING(customerName, 1, LOCATE(' ', customerName)-1) AS first_part,
	SUBSTRING(customerName,LOCATE(' ', customerName)+1) AS second_part
FROM customers;