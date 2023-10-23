-- exercise06_a --
SELECT CONCAT(c.first_name,' ',c.last_name) AS fullName, c.active, SUM(p.amount) AS total_amount
FROM customer c
	JOIN payment p ON p.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY total_amount DESC
LIMIT 10;

-- exercise06_b --

SELECT CONCAT(c.first_name,' ',c.last_name) AS fullName, c.active, SUM(p.amount) AS total_amount
FROM customer c
	LEFT JOIN payment p ON p.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY total_amount
LIMIT 100;

-- exercise07 --
SELECT cn.country, SUM(p.amount) AS total_amount
FROM customer c 
	JOIN payment p ON p.customer_id = c.customer_id
	JOIN address a ON c.address_id = a.address_id
    JOIN city ct ON a.city_id = ct.city_id
    RIGHT JOIN country cn ON ct.country_id = cn.country_id
GROUP BY cn.country_id
ORDER BY total_amount DESC;

-- exercise07_2
SELECT cn.country, SUM(p.amount) AS total_amount
FROM country cn
LEFT JOIN city ct ON ct.country_id = cn.country_id
LEFT JOIN address a ON a.city_id = ct.city_id
LEFT JOIN customer c ON c.address_id = a.address_id
LEFT JOIN payment p ON p.customer_id = c.customer_id
GROUP BY cn.country_id
ORDER BY total_amount DESC;

-- test --
SELECT cn.country, SUM(p.amount) AS total_amount
FROM customer c 
	JOIN payment p ON p.customer_id = c.customer_id
	JOIN address a ON c.address_id = a.address_id
    JOIN city ct ON a.city_id = ct.city_id
    RIGHT JOIN country cn ON ct.country_id = cn.country_id
GROUP BY cn.country_id
ORDER BY total_amount DESC;































