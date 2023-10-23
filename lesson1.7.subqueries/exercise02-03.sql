-- exercise02 --
SELECT productName, buyPrice
FROM products
WHERE buyPrice BETWEEN (
	SELECT AVG(buyPrice) FROM products
    ) 
	AND (
		SELECT MAX(buyPrice) FROM products
        )
ORDER BY buyPrice DESC;

-- exercise02_v2
SELECT productName, buyPrice
FROM products
WHERE buyPrice >= (
		SELECT AVG(buyPrice)
        FROM products
	)
ORDER BY buyPrice DESC;

-- exercise03
SELECT c.customerName
FROM customers c
	JOIN orders o ON o.customerNumber = c.customerNumber
    JOIN orderdetails od ON od.orderNumber = o.orderNumber
    JOIN products p ON od.productCode = p.productCode
WHERE p.buyPrice >= (
	SELECT AVG(buyPrice)
    FROM products
    )
GROUP BY c.customerNumber
ORDER BY c.customerName ASC;

-- exercise03_v2
SELECT DISTINCT c.customerName
FROM customers c
	JOIN orders o ON c.customerNumber = o.customerNumber
    JOIN orderdetails od ON od.orderNumber = o.orderNumber
    JOIN products p ON p.productCode = od.productCode
WHERE buyPrice >= (
		SELECT AVG(buyPrice)
        FROM products
	)
ORDER BY c.customerName;


























