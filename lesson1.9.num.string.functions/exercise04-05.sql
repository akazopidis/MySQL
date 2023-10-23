-- exercise04 --
SELECT 
	CASE SUBSTRING_INDEX(customerName, ' ', -1)
		WHEN 'Ltd.' THEN 
			LEFT(customerName,LENGTH(customerName)-5)
        WHEN 'Co.' THEN 
			LEFT(customerName,LENGTH(customerName)-4)
        WHEN 'Inc.' THEN
			LEFT(customerName,LENGTH(customerName)-5)
		ELSE customerName
	END AS customerName
FROM customers;

-- exercise04_updated_01 --
SELECT LEFT(customerName,LENGTH(customerName)-1)
FROM (SELECT 
	CASE SUBSTRING_INDEX(customerName, ' ', -1)
		WHEN 'Ltd.' THEN 
			LEFT(customerName,LENGTH(customerName)-5)
        WHEN 'Co.' THEN 
			LEFT(customerName,LENGTH(customerName)-4)
        WHEN 'Inc.' THEN
			LEFT(customerName,LENGTH(customerName)-5)
		ELSE customerName
	END AS customerName
FROM customers) AS aoc;

-- exercise04_updated_02 --
SELECT IF(RIGHT(RTRIM(customerName),1) = ',',
		LEFT(customerName,LENGTH(customerName)-1),
        customerName) AS customerName
FROM (SELECT 
	CASE SUBSTRING_INDEX(customerName, ' ', -1)
		WHEN 'Ltd.' THEN 
			LEFT(customerName,LENGTH(customerName)-5)
        WHEN 'Co.' THEN 
			LEFT(customerName,LENGTH(customerName)-4)
        WHEN 'Inc.' THEN
			LEFT(customerName,LENGTH(customerName)-5)
		ELSE customerName
	END AS customerName
FROM customers) AS cust;


-- exercise04_updated_03 --
SELECT
	CASE SUBSTRING_INDEX(customerName, ' ', -1)
		WHEN 'Ltd' THEN 
			LEFT(customerName,LENGTH(customerName)-4)
        WHEN 'Co' THEN 
			LEFT(customerName,LENGTH(customerName)-3)
        WHEN 'Inc' THEN
			LEFT(customerName,LENGTH(customerName)-4)
		ELSE customerName
	END AS customerName
FROM (
SELECT IF(RIGHT(RTRIM(customerName),1) = ',',
		LEFT(customerName,LENGTH(customerName)-1),
        customerName) AS customerName
FROM (SELECT 
	CASE SUBSTRING_INDEX(customerName, ' ', -1)
		WHEN 'Ltd.' THEN 
			LEFT(customerName,LENGTH(customerName)-5)
        WHEN 'Co.' THEN 
			LEFT(customerName,LENGTH(customerName)-4)
        WHEN 'Inc.' THEN
			LEFT(customerName,LENGTH(customerName)-5)
		ELSE customerName
	END AS customerName
FROM customers) AS cust) AS cust2;

-- exercise04_updated_04 --
SELECT IF(RIGHT(RTRIM(customerName),1) = ',',
		LEFT(customerName,LENGTH(customerName)-1),
        customerName) AS customerName
FROM (
	SELECT
	CASE SUBSTRING_INDEX(customerName, ' ', -1)
		WHEN 'Ltd' THEN 
			LEFT(customerName,LENGTH(customerName)-4)
        WHEN 'Co' THEN 
			LEFT(customerName,LENGTH(customerName)-3)
        WHEN 'Inc' THEN
			LEFT(customerName,LENGTH(customerName)-4)
		ELSE customerName
	END AS customerName
FROM (
SELECT IF(RIGHT(RTRIM(customerName),1) = ',',
		LEFT(customerName,LENGTH(customerName)-1),
        customerName) AS customerName
FROM (SELECT 
	CASE SUBSTRING_INDEX(customerName, ' ', -1)
		WHEN 'Ltd.' THEN 
			LEFT(customerName,LENGTH(customerName)-5)
        WHEN 'Co.' THEN 
			LEFT(customerName,LENGTH(customerName)-4)
        WHEN 'Inc.' THEN
			LEFT(customerName,LENGTH(customerName)-5)
		ELSE customerName
	END AS customerName
FROM customers) AS cust) AS cust2) AS cust3;

-- exercise05 --
SELECT SUBSTRING(customerName, 1, LOCATE(' ',customerName)-1),
	SUBSTRING(customerName, LOCATE(' ',customerName)+1)
FROM customers;
















