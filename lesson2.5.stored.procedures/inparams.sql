DROP PROCEDURE IF EXISTS input;

DELIMITER $$
CREATE PROCEDURE input(
	IN actor_id_param INT
) 
BEGIN
	SELECT CONCAT(first_name,' ', last_name) AS full_name,
		   COUNT(fa.film_id) AS movies
    FROM actor a JOIN film_actor fa 
		ON a.actor_id = fa.actor_id
    WHERE a.actor_id = actor_id_param;
END$$
DELIMITER ;

CALL input(1);

-- no false info
DROP PROCEDURE IF EXISTS input;

DELIMITER $$
CREATE PROCEDURE input(IN input_actor_id SMALLINT)
BEGIN
	IF input_actor_id < 1 THEN
		SELECT 'Wrong Input...please from (1...200)' AS error;
	ELSEIF input_actor_id > 200 THEN
		SELECT 'Wrong Input...please from (1...200)' AS error;
	ELSE
		SELECT CONCAT(first_name,' ',last_name) AS firstName, COUNT(fa.film_id) AS movies
		FROM film_actor fa JOIN actor a
			ON fa.actor_id = a.actor_id
		WHERE a.actor_id = input_actor_id;
	END IF;
END$$
DELIMITER ;

CALL input(1);

/*
-- test
DROP PROCEDURE IF EXISTS while_input;

DELIMITER $$
CREATE PROCEDURE while_input()
BEGIN
	DECLARE i INT DEFAULT 1;
	WHILE i<201 DO
		CALL input(i);
        SET i = i + 1;
	END WHILE;
END$$
DELIMITER ;

CALL while_input();
*/