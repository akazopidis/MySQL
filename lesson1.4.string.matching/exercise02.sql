-- ex02.1 --
SELECT *
FROM city
WHERE Name REGEXP '^A..n$';

-- ex02.2 --
SELECT *
FROM city
WHERE Name REGEXP 'b...e';

-- ex02.3 --
SELECT *
FROM city
WHERE Name REGEXP '...';

-- ex02.4 --
SELECT *
FROM city
WHERE Name REGEXP '^...$';

-- ex02.5 --
SELECT *
FROM city
WHERE Name REGEXP '^&' 
	OR Name REGEXP '^.$' 
	OR Name REGEXP '^..$' 
    OR Name REGEXP '^...$';

-- ex02.5.1 --
SELECT *
FROM city
WHERE Name NOT REGEXP '....';