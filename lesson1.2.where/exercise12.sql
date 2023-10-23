-- ex12.01 --
SELECT city, phone, postalCode
FROM offices
WHERE state IS NULL;

-- ex12.02 --
SELECT city, phone, postalCode
FROM offices
WHERE state IS NULL 
	AND country IN ('Japan','UK');