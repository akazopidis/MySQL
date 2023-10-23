-- ex1.1 --
SELECT COUNT(*) AS cities
FROM city
WHERE Name LIKE 'A%';

-- ex1.2 --
SELECT Name
FROM city
WHERE Name LIKE '_P%A';

-- ex1.3 --
SELECT Name
FROM city
WHERE Name LIKE 'M%O%A' OR Name LIKE 'N%O%A';

-- ex1.4 --
SELECT Name
FROM city
WHERE Name LIKE '_____';











