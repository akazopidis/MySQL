-- example 2.1 
SELECT cn.name AS country, ct.name AS city
FROM city ct JOIN country cn
  ON ct.CountryCode = cn.Code
ORDER BY 1, 2;

-- example 2.1.2
SELECT cn.name AS country, ct.name AS city
FROM city ct INNER JOIN country cn
	ON ct.CountryCode = cn.Code
ORDER BY 1, 2;
