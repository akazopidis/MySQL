DROP PROCEDURE IF EXISTS message;

DELIMITER $$
CREATE PROCEDURE message() 
BEGIN
	SELECT 'Hello World!' AS message;
END$$
DELIMITER ;

CALL message;