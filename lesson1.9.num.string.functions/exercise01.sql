-- v1
SELECT o.orderNumber,
	c.customerName,
    TRUNCATE(SUM(od.quantityOrdered*od.priceEach),0) AS total_amount
FROM customers c
	JOIN orders o ON o.customerNumber = c.customerNumber
    JOIN orderdetails od ON od.orderNumber = o.orderNumber
GROUP BY o.orderNumber;

-- v2
SELECT o.orderNumber,
	c.customerName,
    ROUND(SUM(od.quantityOrdered*od.priceEach)) AS total_amount
FROM customers c
	JOIN orders o ON o.customerNumber = c.customerNumber
    JOIN orderdetails od ON od.orderNumber = o.orderNumber
GROUP BY o.orderNumber;