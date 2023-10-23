-- example 3.1 
SELECT name AS country, population
FROM country
WHERE population > (
		 SELECT AVG(population)
         FROM country
        )
ORDER BY population DESC;

-- example 3.2 
SELECT productName, buyPrice
FROM products
WHERE buyPrice = (SELECT MAX(buyPrice) FROM products)
   OR buyPrice = (SELECT MIN(buyPrice) FROM products);

-- example 3.3
SELECT productName, buyPrice
FROM products
WHERE buyPrice BETWEEN (SELECT MIN(buyPrice) FROM products) 
	AND (SELECT MAX(buyPrice) FROM products)
ORDER BY buyPrice DESC;




   
