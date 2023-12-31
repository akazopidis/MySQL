-- example 5.1
SELECT name AS country, population
FROM country
WHERE population > ALL
(
 SELECT population
 FROM country
 WHERE Continent IN ('Europe', 'North America')
);

-- Without ALL
SELECT name AS country, population
FROM country
WHERE population > (
	SELECT MAX(population)
    FROM country
    WHERE Continent IN ('Europe', 'North America')
);



