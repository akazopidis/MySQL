-- example 4.1
SELECT * 
FROM country
WHERE region = 'Caribbean'
ORDER BY name;

-- example 4.2
SELECT code
FROM country
WHERE Region = 'Caribbean'
ORDER BY name DESC;

-- example 4.3
SELECT Name, Region
FROM country
ORDER BY Region, Name;

-- example 4.4
SELECT CONCAT(HeadOfState, ' ', Name) AS ruler, population AS subjects
FROM country
ORDER BY 2 DESC;