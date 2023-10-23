-- ex03.1 --
SELECT *
FROM city
WHERE Name REGEXP '^b.{7}';

-- ex03.2.1 --
SELECT *
FROM city
WHERE Name REGEXP 'aaa';

-- ex03.2.2 --
SELECT *
FROM city
WHERE Name REGEXP 'a{3}';

-- ex03.3 --
SELECT *
FROM city
WHERE Name REGEXP '(a.*){5}'; -- .*(a.*)(a.*)(a.*)(a.*)(a.*).*

-- ex03.4 --
SELECT *
FROM city
WHERE Name REGEXP '^b.{7}' AND Name REGEXP '(a.*){5}';

-- ex03.5 --
SELECT *
FROM city
WHERE Name REGEXP '^b.{6,}r$' AND Name REGEXP '(a.*){5}';





