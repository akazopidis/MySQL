CREATE OR REPLACE VIEW country_languages AS
SELECT cw.Name AS country, COUNT(Language) AS languages
FROM countrylanguage cl JOIN country_vw cw
	ON cl.CountryCode = cw.Code
GROUP BY cw.Code
ORDER BY 1;

SELECT * FROM country_vw;
SELECT * FROM country_languages;

DROP VIEW country_vw;
DROP VIEW country_languages;

/*
CREATE OR REPLACE VIEW country_languages AS
SELECT cn.Name AS country, COUNT(Language) AS languages
FROM countrylanguage cl JOIN country cn
	ON cl.CountryCode = cn.Code
GROUP BY cn.Code
ORDER BY 1;
*/