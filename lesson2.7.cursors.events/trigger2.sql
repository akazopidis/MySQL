-- delete
CREATE TABLE xafies(
	user		VARCHAR(80),
    action		VARCHAR(10),
    changes		VARCHAR(200),
    stamp		TIMESTAMP
);

DELIMITER $$
CREATE TRIGGER tr_employees_after_delete
AFTER DELETE ON employees
FOR EACH ROW
	BEGIN
		DECLARE changes VARCHAR(200);
        
        SET changes =
			CONCAT(OLD.emp_no, ', ',
				OLD.birth_date, ', ',
                OLD.first_name, ', ',
                OLD.last_name, ', ',
                OLD.gender, ', ',
                OLD.hire_date);
			
            INSERT INTO xafies
            VALUES (CURRENT_USER(), 'DELETE', changes, CURRENT_TIMESTAMP());
    END$$
DELIMITER ;

DELETE FROM employees
WHERE emp_no = 11;

SELECT * FROM employees;
SELECT * FROM xafies;

DROP table xafies;
DROP TRIGGER tr_employees_after_delete;
DELETE FROM employees;