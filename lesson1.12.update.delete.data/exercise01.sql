-- exercise01 --
CREATE TABLE copy_customers
SELECT *
FROM customers;

-- id-1401
SELECT employeeNumber
FROM copy_customers
WHERE firstName = 'Pamela' AND lastName = 'Castillo';

-- id-1002
SELECT employeeNumber
FROM copy_customers
WHERE firstName = 'Diane' AND lastName = 'Murphy';

-- update
UPDATE copy_customers
SET salesRepEmployeeNumber = 1002
WHERE salesRepEmployeeNumber = 1401;

-- 10 rows
SELECT *
FROM copy_customers
WHERE salesRepEmployeeNumber = 1002;

-- none
SELECT *
FROM copy_customers
WHERE salesRepEmployeeNumber = 1401;

DROP TABLE copy_customers;