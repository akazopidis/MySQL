-- ex08 --
SELECT f.title AS movie_name
FROM film_category fc 
	JOIN category c ON fc.category_id = c.category_id
    JOIN film f ON fc.film_id = f.film_id
WHERE NOT f.rating IN ('R','NC-17')
	AND f.length BETWEEN 60 AND 90
    AND f.description REGEXP 'boring|love|documentary'
    AND f.replacement_cost BETWEEN 0.00 AND 14.00
    AND c.name IN ('Travel','Family','Comedy','Classics');

-- ex08v2 --
SELECT f.title AS movie_name
FROM film_category fc 
	JOIN category c ON fc.category_id = c.category_id
    JOIN film f ON fc.film_id = f.film_id
WHERE NOT f.rating IN ('R','NC-17')
	AND f.length BETWEEN 60 AND 90
    AND f.description REGEXP 'boring|love|documentary'
    AND f.replacement_cost <= 14.00
    AND c.name IN ('Travel','Family','Comedy','Classics');

-- ex09 --
SELECT DISTINCT c.name
FROM film_actor fa
	JOIN actor a ON fa.actor_id = a.actor_id
    JOIN film f ON fa.film_id = f.film_id
    JOIN film_category fc ON fc.film_id = f.film_id
    JOIN category c ON fc.category_id = c.category_id
WHERE a.first_name = 'JULIA' AND a.last_name = 'FAWCETT';

-- ex10 --My Version --
SELECT c.name, COUNT(*) AS total_movies
FROM film_actor fa
	JOIN actor a ON fa.actor_id = a.actor_id
    JOIN film f ON fa.film_id = f.film_id
    JOIN film_category fc ON fc.film_id = f.film_id
    JOIN category c ON fc.category_id = c.category_id
WHERE a.first_name = 'JULIA' AND a.last_name = 'FAWCETT'
GROUP BY c.category_id;