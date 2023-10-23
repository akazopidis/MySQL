-- ex01_initial --
SELECT f.title AS MOVIE, COUNT(i.inventory_id) AS total_movies
FROM film f 
	LEFT JOIN inventory i ON i.film_id = f.film_id
GROUP BY f.film_id
ORDER BY total_movies;

-- ex01 --
SELECT f.title AS MOVIE
FROM film f 
	LEFT JOIN inventory i ON i.film_id = f.film_id
GROUP BY f.film_id
HAVING COUNT(i.inventory_id) = 0
ORDER BY 1;

-- ex01v2 --
SELECT f.title AS Movie
FROM film f 
	LEFT JOIN inventory i ON f.film_id = i.film_id
WHERE i.inventory_id IS NULL;

-- ex02 --
SELECT f.title AS MOVIE, COUNT(r.rental_id) AS TOTAL_RENTALS
FROM film f
	LEFT JOIN inventory i ON i.film_id = f.film_id
    LEFT JOIN rental r ON r.inventory_id = i.inventory_id
GROUP BY f.film_id
ORDER BY 2 DESC;



































