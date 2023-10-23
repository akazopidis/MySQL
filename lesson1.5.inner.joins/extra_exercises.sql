-- extra01 --
SELECT CONCAT(c.first_name,' ',c.last_name) AS Customer, a.phone, c.email, COUNT(*) AS rentals
FROM rental r
	JOIN customer c ON r.customer_id = c.customer_id
    JOIN address a ON c.address_id = a.address_id
GROUP BY c.customer_id
ORDER BY rentals DESC
LIMIT 10;

-- extra02 --
SELECT f.title, COUNT(*) AS Actors
FROM film_actor fa
	JOIN actor a ON fa.actor_id = a.actor_id
	JOIN film f ON fa.film_id = f.film_id
    JOIN film_category fc ON fc.film_id = f.film_id
    JOIN category c ON fc.category_id = c.category_id
WHERE c.name IN ('Action','Comedy','Children')
GROUP BY f.film_id
HAVING Actors > 8
ORDER BY Actors DESC;

-- extra03 --
SELECT f.title AS Movie, COUNT(*) as Total_Rentals
FROM film_actor fa
	JOIN actor a ON fa.actor_id = a.actor_id
	JOIN film f ON fa.film_id = f.film_id
    JOIN inventory i ON i.film_id = f.film_id
    JOIN rental r ON r.inventory_id = i.inventory_id
WHERE a.first_name = 'CHRISTIAN' AND a.last_name = 'GABLE'
GROUP BY f.film_id
ORDER BY Total_Rentals DESC;

-- extra04 --
SELECT cn.Name AS Country_Name,
	cn.Population AS Country_Population,
    c.Name AS City_Name,
    c.Population AS City_Population, 
    (c.Population/cn.Population)*100 AS percentage
FROM city c 
	JOIN country cn ON c.CountryCode = cn.Code
WHERE cn.Population > 5000000
GROUP BY cn.Code
ORDER BY percentage DESC;

-- extra05 --
SELECT e.email, CONCAT(e.firstName,' ',e.lastName) AS fullName, od.quantityOrdered
FROM orderdetails od
	JOIN products pr ON od.productCode = pr.productCode
    JOIN orders o ON od.orderNumber = o.orderNumber
    JOIN customers c ON o.customerNumber = c.customerNumber
    JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE pr.productName REGEXP 'Moto Guzzi'
GROUP BY od.orderNumber
ORDER BY od.quantityOrdered DESC;

-- extra05_extra --
SELECT CONCAT(firstName,' ',lastName) AS full_name, email, quantityOrdered
FROM orderdetails o
	JOIN products p ON o.productCode = p.productCode
	JOIN orders ord ON o.orderNumber =ord.orderNumber
       JOIN customers c ON ord.customerNumber = c.customerNumber
      JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE p.productName REGEXP ' Moto Guzzi'
ORDER BY o.quantityOrdered DESC;