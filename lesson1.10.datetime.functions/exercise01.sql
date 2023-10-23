-- exercise01 --
SELECT YEAR(orderDate) AS YEAR,
	MONTHNAME(orderDate) AS MONTH,
    COUNT(orderNumber) AS ORDERS
FROM orders
GROUP BY YEAR(orderDate), MONTH(orderDate)
ORDER BY 1,2;

-- exercise01_Correction --
SELECT YEAR(orderDate) AS YEAR,
	MONTHNAME(orderDate) AS MONTH,
    COUNT(orderNumber) AS ORDERS
FROM orders
GROUP BY YEAR(orderDate), MONTH(orderDate)
ORDER BY 1, MONTH(orderDate);