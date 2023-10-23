-- v1_update
CREATE TABLE xafies(
	user		VARCHAR(80),
    action		VARCHAR(10),
    changes		VARCHAR(200),
    stamp		TIMESTAMP
);

DELIMITER $$
CREATE TRIGGER tr_employees_after_update
AFTER UPDATE ON employees
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
            VALUES (CURRENT_USER(), 'UPDATE', changes, CURRENT_TIMESTAMP());
            
			SET changes =
			CONCAT(NEW.emp_no, ', ',
				NEW.birth_date, ', ',
                NEW.first_name, ', ',
                NEW.last_name, ', ',
                NEW.gender, ', ',
                NEW.hire_date);
            
			INSERT INTO xafies
            VALUES (CURRENT_USER(), 'UPDATE', changes, CURRENT_TIMESTAMP());
    END$$
DELIMITER ;

UPDATE employees
SET gender = 'F', last_name = 'Zagouri', first_name = 'Maria'
WHERE emp_no = 12;

SELECT * FROM employees;
SELECT * FROM xafies;

DROP table xafies;
DROP TRIGGER tr_employees_after_update;
DELETE FROM employees;
DELETE FROM xafies;

-- v2_update
CREATE TABLE xafies(
	user		VARCHAR(80),
    action		VARCHAR(10),
    changes		VARCHAR(200),
    stamp		TIMESTAMP
);

DELIMITER $$
CREATE TRIGGER tr_employees_after_update
AFTER UPDATE ON employees
FOR EACH ROW
	BEGIN
		DECLARE changes VARCHAR(200);
        
        SET changes =
			CONCAT(OLD.emp_no, ' -> ', NEW.emp_no,', ',
				OLD.birth_date, ' -> ', NEW.birth_date,', ',
                OLD.first_name, ' -> ', NEW.first_name,', ',
                OLD.last_name, ' -> ', NEW.last_name,', ',
                OLD.gender, ' -> ', NEW.gender,', ',
                OLD.hire_date, ' -> ', NEW.hire_date);
			
            INSERT INTO xafies
            VALUES (CURRENT_USER(), 'UPDATE', changes, CURRENT_TIMESTAMP());
    END$$
DELIMITER ;

UPDATE employees
SET gender = 'F', last_name = 'Zagouri', first_name = 'Maria'
WHERE emp_no = 14;

SELECT * FROM employees;
SELECT * FROM xafies;

DROP table xafies;
DROP TRIGGER tr_employees_after_update;
DELETE FROM employees;
DELETE FROM xafies;