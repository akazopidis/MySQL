-- v1
SELECT CONCAT(firstName,' ',lastName) as full_name
FROM employees
WHERE jobTitle != 'Sales Rep';

-- v2
SELECT CONCAT(firstName,' ',lastName) as full_name
FROM employees
WHERE jobTitle <> 'Sales Rep';

