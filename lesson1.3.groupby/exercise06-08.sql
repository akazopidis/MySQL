-- ex06 --
SELECT city, COUNT(*) AS customers
FROM customers
WHERE country = 'USA'
GROUP BY city
HAVING customers >= 2
ORDER BY customers DESC;

-- ex07 --
SELECT productVendor AS Vendor, SUM(quantityInStock*buyPrice) AS total_price
FROM products
GROUP BY productVendor
HAVING total_price > 2500000
ORDER BY total_price DESC;

-- ex08 --
SELECT state, COUNT(*) AS customers
FROM customers
GROUP BY state
HAVING customers >= 2
ORDER BY customers DESC;

-- ex08.v1 --
SELECT state, COUNT(*) AS customers
FROM customers
WHERE state IS NOT NULL
GROUP BY state
HAVING customers >= 2
ORDER BY customers DESC;

-- ex08.v2 --
SELECT state, COUNT(*) AS customers
FROM customers
GROUP BY state
HAVING customers >= 2 AND state IS NOT NULL
ORDER BY customers DESC;