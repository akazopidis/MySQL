-- exercise02_v1 --
SELECT o.orderNumber AS order_number,
	c.customerName AS customer_name,
    SUM(od.quantityOrdered*od.priceEach) AS total_amount,
    CONCAT('Shipped on ',shippedDate) AS description
FROM orders o
	JOIN customers c ON o.customerNumber = c.customerNumber
    JOIN orderdetails od ON od.orderNumber = o.orderNumber
WHERE o.status = 'Shipped'
GROUP BY o.orderNumber
UNION
SELECT o.orderNumber AS order_number,
	c.customerName AS customer_name,
    SUM(od.quantityOrdered*od.priceEach) AS total_amount,
    CONCAT('Pending...') AS description
FROM orders o
	JOIN customers c ON o.customerNumber = c.customerNumber
    JOIN orderdetails od ON od.orderNumber = o.orderNumber
WHERE o.status <> 'Shipped'
GROUP BY o.orderNumber
ORDER BY 3 DESC;

-- exercise02_v2 --
SELECT o.orderNumber AS order_number,
	c.customerName AS customer_name,
    SUM(od.quantityOrdered*od.priceEach) AS total_amount,
    CONCAT('Shipped on ',shippedDate) AS description
FROM orders o
	JOIN customers c ON o.customerNumber = c.customerNumber
    JOIN orderdetails od ON od.orderNumber = o.orderNumber
WHERE o.status = 'Shipped'
GROUP BY o.orderNumber
UNION
SELECT o.orderNumber AS order_number,
	c.customerName AS customer_name,
    SUM(od.quantityOrdered*od.priceEach) AS total_amount,
    CONCAT('Pending...') AS description
FROM orders o
	JOIN customers c ON o.customerNumber = c.customerNumber
    JOIN orderdetails od ON od.orderNumber = o.orderNumber
WHERE o.status IN ('In Process','On Hold','Cancelled')
GROUP BY o.orderNumber
ORDER BY 3 DESC;