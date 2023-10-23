-- 1
CREATE TABLE copy_customers AS
SELECT *
FROM customers;

CREATE TABLE copy_employees AS
SELECT *
FROM employees;

-- 2
SELECT CONCAT(firstName,' ',lastName) AS fullName, COUNT(e.employeeNumber) AS customers
FROM copy_customers c
	JOIN copy_employees e ON c.salesRepEmployeeNumber = e.employeeNumber
GROUP BY e.employeeNumber
ORDER BY 2 DESC;

-- 3
UPDATE copy_customers
SET salesRepEmployeeNumber = (
	SELECT employeeNumber
    FROM copy_employees
    WHERE firstName = 'Diane' AND lastName = 'Murphy'
    )
WHERE salesRepEmployeeNumber = (
	SELECT employeeNumber
    FROM copy_employees
    WHERE firstName = 'Pamela' AND lastName = 'Castillo'
    );

-- 4
DROP TABLE copy_employees;
DROP TABLE copy_customers;