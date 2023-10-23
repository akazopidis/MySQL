-- exercise01_v1 --
SELECT cn.Name AS country,
	ct.Name AS city,
    ct.Population AS population,
    'Capital' AS description
FROM country cn 
	LEFT JOIN city ct ON ct.CountryCode = cn.Code
GROUP BY cn.code
UNION
SELECT cn.Name AS country,
	ct.Name AS city,
    MAX(ct.Population) AS population,
    'Largest City' AS description
FROM country cn
	LEFT JOIN city ct ON ct.CountryCode = cn.Code
GROUP BY cn.code
ORDER BY 1,4;

-- exercise01_v2 --
SELECT cn.name AS country,
	ct.name AS city,
    ct.population AS population,
    "Capital" AS description
FROM country cn 
	LEFT JOIN city ct ON cn.capital = ct.ID
UNION
SELECT cn.Name AS country,
	ct.Name AS city,
    MAX(ct.Population) AS population,
    'Largest City' AS description
FROM country cn
	LEFT JOIN city ct ON ct.CountryCode = cn.Code
GROUP BY cn.code
ORDER BY 1,4;