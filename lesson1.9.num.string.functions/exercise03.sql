-- exercise03_v1 --
SELECT customerName
FROM customers
ORDER BY LENGTH(customerName) DESC;

-- exercise03_v2 --
SELECT customerName
FROM customers
WHERE LENGTH(customerName) = (
	SELECT MAX(LENGTH(customerName))
    FROM customers
    );




















