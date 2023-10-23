CREATE TABLE salaries (
	emp_no		INT(11) 	NOT NULL,
    salary		INT(11)		NOT NULL,
    from_date   DATE		NOT NULL,
    to_date		DATE		NOT NULL
);

ALTER TABLE salaries
	ADD last_update INT NOT NULL;

ALTER TABLE salaries
	CHANGE COLUMN last_update lastupdate INT NOT NULL;

ALTER TABLE salaries
	DROP COLUMN lastupdate;