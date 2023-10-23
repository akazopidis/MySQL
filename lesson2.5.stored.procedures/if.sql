-- IF...ELSE
DROP PROCEDURE IF EXISTS independence;

DELIMITER $$
CREATE PROCEDURE independence() 
BEGIN	
       DECLARE vyear INT DEFAULT 1700;
       DECLARE vdiff INT DEFAULT 100;

       IF vyear+vdiff > EXTRACT(YEAR FROM NOW()) THEN	
                SELECT 'invalid values' AS error_message;
       ELSE		
                 SELECT name, indepYear        
                 FROM country        
                 WHERE indepYear BETWEEN vyear-vdiff AND vyear+vdiff;
	   END IF; 
END$$
DELIMITER ;

CALL independence();

-- pass_fail_exam
DROP PROCEDURE IF EXISTS pass_fail_exam;

DELIMITER $$
CREATE PROCEDURE pass_fail_exam() 
BEGIN	
	DECLARE numeric_grade INT DEFAULT 8;
    DECLARE letter_grade VARCHAR(80);
    
    SET letter_grade = 
		CASE
			WHEN numeric_grade >= 5 THEN
				'Pass'
			ELSE
				'Fail'
		END;
        
    SELECT CONCAT('Numeric Grade:',numeric_grade,' Letter grade:',letter_grade) AS result;
END$$
DELIMITER ;

CALL pass_fail_exam();