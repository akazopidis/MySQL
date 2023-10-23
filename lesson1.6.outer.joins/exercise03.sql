-- exercise03 --
SELECT r.rental_date, p.amount
FROM rental r LEFT JOIN payment p 
	ON p.rental_id = r.rental_id
UNION
SELECT r.rental_date, p.amount
FROM rental r RIGHT JOIN payment p 
	ON p.rental_id = r.rental_id;