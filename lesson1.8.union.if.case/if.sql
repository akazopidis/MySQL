-- example 2.1
SELECT IF(status='Shipped', 'Shipped', 'Not Shipped') AS status,
	   COUNT(*) AS total
FROM orders
GROUP BY 1;

-- example 2.2
SELECT c.customerName AS customer, 
	IFNULL(CONCAT(e.firstName, ' ', e.lastName),'None') AS company_employee
FROM customers c LEFT JOIN employees e
	ON c.salesRepEmployeeNumber = e.employeeNumber
ORDER BY 2;

-- example 2.3
SELECT c.customerName AS customer, 
	IF(CONCAT(e.firstName, ' ', e.lastName) IS NULL,'None',CONCAT(e.firstName, ' ', e.lastName)) AS company_employee
FROM customers c LEFT JOIN employees e
	ON c.salesRepEmployeeNumber = e.employeeNumber
ORDER BY 2;