SELECT customerName, country, creditLimit
FROM customers
WHERE (country = 'Italy' OR country = 'Spain' OR country = 'USA')
	AND creditLimit BETWEEN 100000 and 120000
ORDER BY country, creditLimit DESC;