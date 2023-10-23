-- ex02 --
SELECT CountryCode, COUNT(*) AS cities, SUM(Population) AS total_population, AVG(Population) AS average_population
FROM city
GROUP BY CountryCode WITH ROLLUP;

-- ex02_v2 --
SELECT CountryCode, COUNT(Name) AS cities, SUM(Population) AS total_population, AVG(Population) AS average_population
FROM city
GROUP BY CountryCode WITH ROLLUP;

-- ex03 --
SELECT Language, COUNT(CountryCode) as countries
FROM countrylanguage
GROUP BY Language
ORDER BY 2 DESC;

-- ex03_v2 --
SELECT Language, COUNT(CountryCode) as countries
FROM countrylanguage
GROUP BY Language
ORDER BY countries DESC;

-- ex04 --
SELECT GovernmentForm, COUNT(Name) AS countries, MAX(GNP) AS max_gnp, AVG(LifeExpectancy) AS avg_lifeExpectancy, SUM(SurfaceArea) AS sum_surfaceArea
FROM country
GROUP BY GovernmentForm
ORDER BY GovernmentForm;

-- ex05 --
SELECT GovernmentForm, COUNT(Name) AS countries, MAX(GNP) AS max_gnp, AVG(LifeExpectancy) AS avg_lifeExpectancy, SUM(SurfaceArea) AS sum_surfaceArea
FROM country
WHERE Continent = 'Europe'
GROUP BY GovernmentForm
ORDER BY GovernmentForm;