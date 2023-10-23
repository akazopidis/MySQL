-- exercise06 --
SELECT name AS country, indepYear
FROM country
WHERE IndepYear < ALL (
	SELECT indepYear
    FROM country
    WHERE Continent = 'Europe'
		AND IndepYear IS NOT NULL
    );

-- exercise06 Without ALL --
SELECT name AS country, indepYear
FROM country
WHERE IndepYear < (
	SELECT MIN(IndepYear)
    FROM country
    WHERE Continent = 'Europe'
		AND IndepYear IS NOT NULL
    );












