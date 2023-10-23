DROP PROCEDURE IF EXISTS total_population;

DELIMITER $$
CREATE PROCEDURE total_population()
BEGIN
	DECLARE cur_pop INT;
    DECLARE total_pop BIGINT DEFAULT 0;
    DECLARE finished INT DEFAULT 0;
    DECLARE cursor_population CURSOR FOR
		SELECT population
        FROM country
        WHERE population IS NOT NULL;
	
    DECLARE CONTINUE HANDLER FOR NOT FOUND
		SET finished = 1;
	
    OPEN cursor_population;
    
    loop_name: LOOP
		FETCH cursor_population INTO cur_pop;
		IF finished = 1 THEN
			LEAVE loop_name;
		END IF;
		SET total_pop = total_pop + cur_pop;
	END LOOP loop_name;
    
    CLOSE cursor_population;
    
    SELECT total_pop;
END$$
DELIMITER ;

CALL total_population();












































































