CREATE TABLE dept_manager (
	dept_no	   CHAR(4)	   NOT NULL,
    emp_no	   INT(11)     NOT NULL,
    from_date  DATE		   NOT NULL,
    to_date    DATE		   NOT NULL 
);

CREATE TABLE dept_emp (
	emp_no	   INT(11)	   NOT NULL,
    dept_no	   CHAR(4)     NOT NULL,
    from_date  DATE		   NOT NULL,
    to_date    DATE		   NOT NULL 
);