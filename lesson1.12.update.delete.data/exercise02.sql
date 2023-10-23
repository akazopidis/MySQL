-- 1
CREATE TABLE copy_country AS
SELECT *
FROM country;

CREATE TABLE copy_city AS
SELECT *
FROM city;

-- 2
SELECT cn.Name, COUNT(ct.Name) AS cities
FROM country cn
	JOIN city ct ON ct.CountryCode = cn.Code
GROUP BY cn.Code
ORDER BY 2 DESC;

SELECT cn.Name, COUNT(ct.Name) AS cities
FROM country cn
	JOIN city ct ON ct.CountryCode = cn.Code
WHERE cn.Name = 'Barbados'
GROUP BY cn.Code;

-- 3
UPDATE copy_city
SET CountryCode = 'BIM'
WHERE CountryCode = 'BRB';

UPDATE copy_country
SET Code = 'BIM',
	Name = 'Bim'
WHERE Name = 'Barbados';

-- 4
DROP TABLE copy_city;
DROP TABLE copy_country;