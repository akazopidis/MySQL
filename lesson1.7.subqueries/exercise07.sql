-- exercise07 --
/*
Continent       Cities
North America	581
Africa	        366
South America	470
Oceania	        55
Antarctica	    0
*/

SELECT cn.Continent, COUNT(ct.Name) AS cities
FROM country cn
	LEFT JOIN city ct ON ct.CountryCode = cn.Code
GROUP BY Continent
HAVING COUNT(ct.Name) < (
	SELECT COUNT(ct.Name)
    FROM country cn
	LEFT JOIN city ct ON ct.CountryCode = cn.Code
    WHERE cn.Name IN ('India','China')
    );

/*
Continent       Cities
North America	581
Asia	        1766
Africa	        366
Europe	        841
South America	470
Oceania	        55
Antarctica		0
*/
SELECT cn.Continent, COUNT(ct.Name) AS cities
FROM country cn
	LEFT JOIN city ct ON ct.CountryCode = cn.Code
GROUP BY Continent;

/*
Continent       Cities
Asia	        704
*/
SELECT cn.Continent, COUNT(ct.Name) AS cities
FROM country cn
	LEFT JOIN city ct ON ct.CountryCode = cn.Code
WHERE cn.Name IN ('India','China')
GROUP BY Continent;
