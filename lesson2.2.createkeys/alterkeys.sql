-- 2. Then we drop the FK
ALTER TABLE salaries
   DROP PRIMARY KEY;

-- 3. We add the PK's again
ALTER TABLE salaries
   ADD PRIMARY KEY (emp_no, from_date);

-- 1. firstly, we drop the FK
ALTER TABLE salaries
	DROP FOREIGN KEY salaries_fk_emp;

-- 4. We add the FK relationship
ALTER TABLE salaries
	ADD CONSTRAINT salaries_fk_emp FOREIGN KEY (emp_no) REFERENCES employees(emp_no) ON DELETE CASCADE;