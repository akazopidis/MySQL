SELECT Code
FROM country
WHERE name IN ('Afghanistan', 'Czech Republic', 'Nigeria');

SELECT Name
FROM city
WHERE CountryCode IN ('AFG', 'CZE', 'NGA')
ORDER BY Name ASC;