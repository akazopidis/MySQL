-- 1
CREATE TABLE copy_country AS
SELECT *
FROM country;

CREATE TABLE copy_city AS
SELECT *
FROM city;

-- 2
UPDATE copy_city
SET countryCode = 'BIM'
WHERE countryCode = (
	SELECT Code
    FROM copy_country
    WHERE Name = 'Barbados'
    );

UPDATE copy_country
SET Code = 'BIM', Name = 'Bim', localName = 'Bim'
WHERE Code = 'BRB';

-- 3
SELECT ct.CountryCode, cn.Code, cn.name, ct.Name
FROM copy_country cn JOIN
	copy_city ct ON ct.CountryCode = cn.Code
WHERE cn.Code = 'BIM';

-- 4
DROP TABLE copy_city;
DROP TABLE copy_country;