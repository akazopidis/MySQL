-- ex01_v1 --
SELECT CONCAT(e.firstName,' ' ,e.lastName) AS 'Full Name', o.city
FROM employees e INNER JOIN offices o 
	ON e.officeCode = o.officeCode;

-- ex01_v2 --
SELECT CONCAT(e.firstName,' ' ,e.lastName) AS 'Full Name', o.city
FROM employees e, offices o
WHERE e.officeCode = o.officeCode;

-- ex01_v3 --
SELECT CONCAT(employees.firstName,' ' ,employees.lastName) AS 'Full Name', offices.city
FROM employees INNER JOIN offices 
	ON employees.officeCode = offices.officeCode;

-- ex01_v4 --
SELECT CONCAT(employees.firstName,' ' ,employees.lastName) AS 'Full Name', offices.city
FROM employees, offices
WHERE employees.officeCode = offices.officeCode;