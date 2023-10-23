SELECT productName
FROM products
WHERE productScale IN ('1:18','1:32','1:50')
	AND productLine IN ('Vintage Cars','Planes')
ORDER BY buyPrice DESC
LIMIT 5;