-- extra01 --
SELECT f.title
FROM film f 
	LEFT JOIN inventory i ON i.film_id = f.film_id
GROUP BY f.film_id
HAVING COUNT(i.inventory_id) = 0
ORDER BY 1;

-- extra02 --
SELECT f.title AS MOVIE, COUNT(r.rental_id) AS TOTAL_RENTALS
FROM film f
	LEFT JOIN inventory i ON i.film_id = f.film_id
    LEFT JOIN rental r ON r.inventory_id = i.inventory_id
GROUP BY f.film_id
ORDER BY TOTAL_RENTALS DESC;

-- extra03 --
SELECT c.customerName AS customer, e.lastName AS assigned_to
FROM customers c
	LEFT JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber
UNION
SELECT c.customerName AS customer, e.lastName AS assigned_to
FROM customers c
	RIGHT JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber;

-- extra04 --
SELECT CONCAT(e1.firstName,' ',e1.lastName) AS employer, CONCAT(e2.firstName,' ',e2.lastName) AS supervisor
FROM employees e1
	LEFT JOIN employees e2 ON e1.reportsTo = e2.employeeNumber
UNION
SELECT CONCAT(e1.firstName,' ',e1.lastName) AS employer, CONCAT(e2.firstName,' ',e2.lastName) AS supervisor
FROM employees e1
	RIGHT JOIN employees e2 ON e1.reportsTo = e2.employeeNumber;

-- extra05 --
SELECT CONCAT(e2.firstName,' ',e2.lastName) AS supervisor, COUNT(e1.employeeNumber) as employers
FROM employees e1
	JOIN employees e2 ON e1.reportsTo = e2.employeeNumber
GROUP BY e2.employeeNumber;

-- extra06 --
SELECT CONCAT(e2.firstName,' ',e2.lastName) AS supervisor, 
	COUNT(e1.employeeNumber) as employers,
    o.city
FROM employees e1
	RIGHT JOIN employees e2 ON e1.reportsTo = e2.employeeNumber
	JOIN offices o ON e2.officeCode = o.officeCode
GROUP BY e2.employeeNumber
HAVING COUNT(e1.employeeNumber) = 0;

-- extra07 --
SELECT DISTINCT o.city
FROM employees e1
	RIGHT JOIN employees e2 ON e1.reportsTo = e2.employeeNumber
	JOIN offices o ON e2.officeCode = o.officeCode
GROUP BY e2.employeeNumber
HAVING COUNT(e1.employeeNumber) = 0;

-- extra08 --
SELECT CONCAT(c.first_name,' ',c.last_name) AS fullName,
	c.active,
    c.email,
    SUM(p.amount) AS total_amount
FROM customer c
	JOIN payment p ON p.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY total_amount DESC
LIMIT 10;

-- extra09 --
SELECT CONCAT(c.first_name,' ',c.last_name) AS fullName,
	c.active,
    c.email,
    SUM(p.amount) AS total_amount
FROM customer c
	LEFT JOIN payment p ON p.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY total_amount ASC
LIMIT 100;

-- extra10 --
SELECT cn.country, SUM(p.amount) AS total_amount
FROM country cn
	LEFT JOIN city ct ON ct.country_id = cn.country_id
    LEFT JOIN address a ON a.city_id = ct.city_id
    LEFT JOIN customer c ON c.address_id = a.address_id
    LEFT JOIN payment p ON p.customer_id = c.customer_id
GROUP BY cn.country_id
ORDER BY total_amount DESC;

-- extra11 --
SELECT cn.country, SUM(p.amount) AS total_amount
FROM customer c 
	JOIN payment p ON p.customer_id = c.customer_id
	JOIN address a ON c.address_id = a.address_id
    JOIN city ct ON a.city_id = ct.city_id
    RIGHT JOIN country cn ON ct.country_id = cn.country_id
GROUP BY cn.country_id
ORDER BY total_amount DESC;
