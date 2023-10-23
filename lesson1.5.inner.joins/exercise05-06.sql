-- ex05 --
SELECT l.name, COUNT(*) AS total_movies
FROM film f JOIN language l 
	ON f.language_id = l.language_id
GROUP BY f.language_id;

-- ex06 --
SELECT CONCAT(a.first_name,' ',a.last_name) AS ACTOR, COUNT(*) AS MOVIES
FROM film_actor fa 
	JOIN actor a ON fa.actor_id = a.actor_id
    JOIN film f ON fa.film_id = f.film_id
GROUP BY a.actor_id
ORDER BY MOVIES DESC;

-- ex06v2 --
SELECT CONCAT(a.first_name,' ',a.last_name) AS ACTOR, COUNT(*) AS MOVIES
FROM film_actor fa 
	JOIN actor a ON fa.actor_id = a.actor_id
GROUP BY a.actor_id
ORDER BY MOVIES DESC;

 -- ex06.v3 --
SELECT CONCAT(a.first_name,' ',a.last_name) AS ACTOR, COUNT(*) AS MOVIES
FROM film_actor fa
	JOIN film f ON fa.film_id = f.film_id
	JOIN actor a ON fa.actor_id = a.actor_id
GROUP BY a.actor_id
ORDER BY MOVIES DESC;