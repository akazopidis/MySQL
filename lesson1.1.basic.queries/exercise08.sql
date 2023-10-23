SELECT Name , Continent, IndepYear
FROM country
WHERE GovernmentForm = 'Republic'
ORDER BY Continent, IndepYear DESC;