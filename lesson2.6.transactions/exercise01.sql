DROP PROCEDURE IF EXISTS insert_employee_with_salary;

DELIMITER $$
CREATE PROCEDURE insert_employee_with_salary
	(in_first_name VARCHAR(30),in_last_name VARCHAR(50),in_gender ENUM('M','F'),
		in_birth_date DATE,in_hire_date DATE,in_salary INT,in_from_date DATE,in_to_date DATE)
BEGIN
	DECLARE err TINYINT DEFAULT 0;
	DECLARE max_emp_no INT;
     -- Declare the handler before using it
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET err = 1;
    
    START TRANSACTION;

	INSERT INTO employees (birth_date,first_name,last_name,gender,hire_date)
	VALUES (in_birth_date,in_first_name,in_last_name,in_gender,in_hire_date);
    
    SAVEPOINT point1;
    
    SELECT MAX(emp_no)
    INTO max_emp_no
    FROM employees;
    
    INSERT INTO salaries (emp_no,salary,from_date,to_date)
    VALUES (max_emp_no,in_salary,in_from_date,in_to_date);
    
    IF err = 1 THEN
		ROLLBACK TO point1;
        SELECT 'ERROR' AS message;
	ELSE
		COMMIT;
        SELECT 'OK' AS message;
    END IF;
END$$
DELIMITER ;

CALL insert_employee_with_salary ("Apostolos","Kazopidis","M","2001-09-15","2023-10-19",2000,"2023-10-20","2024-10-20");