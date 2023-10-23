-- step1
INSERT INTO film (title, language_id)
VALUES ("Joker",1);

-- step2
INSERT INTO actor (first_name, last_name)
VALUES ("Joaquin","Phoenix");

-- learn the id's
SELECT film_id
FROM film
WHERE title = 'Joker';

SELECT actor_id
FROM actor
WHERE first_name = 'Joaquin' AND last_name = 'Phoenix';

-- step3
INSERT INTO film_actor (film_id, actor_id)
VALUES (1001,201);

-- step3_v2
INSERT INTO film_actor (film_id, actor_id)
SELECT film_id, actor_id
FROM film_actor
WHERE film_id = 1001 AND actor_id = 201;

-- Query_Select
SELECT f.title, CONCAT(first_name,' ',last_name) AS actor
FROM film f
	JOIN film_actor fa ON fa.film_id = f.film_id
    JOIN actor a ON fa.actor_id = a.actor_id
WHERE f.title = 'Joker';