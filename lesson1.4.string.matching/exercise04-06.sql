-- ex04 --
SELECT *
FROM customers
WHERE customerName REGEXP '^B.*(Co\\.?|Inc\\.?)';

-- ex05 --
SELECT *
FROM customers
WHERE contactLastName REGEXP '^[aeuioy].{6,}';

-- ex06 --
SELECT *
FROM employees
WHERE email NOT REGEXP '^[[:alpha:]]{2,}@[[:alpha:]]{3,}\\.com$';

-- ex07.1 --
SELECT *
FROM employees
WHERE lastName REGEXP '[^aeuioy]{2}'
	AND firstName LIKE 'L%'
    AND extension REGEXP '31|13';

-- ex07.2 --
SELECT *
FROM employees
WHERE lastName REGEXP '[^aeuioy]{2}'
	AND firstName REGEXP '^L'
    AND extension REGEXP '31|13';
    
-- ex07.3 MODIFIED With two identical consecutive consonants
SELECT *
FROM employees
WHERE lastName REGEXP '([^aeuioy])\\1'
    AND firstName REGEXP '^L'
    AND extension REGEXP '31|13';

/*
In this modified pattern, ([^aeuioy])\\1 matches 
any two consecutive identical consonants in the lastName column. 
The ([^aeuioy]) part captures a single consonant, 
and the \\1 part checks if the next character is the same as the captured consonant. 
This ensures that you're matching two identical consecutive consonants in the last name.
*/

-- ex07.4
SELECT *
FROM employees
WHERE lastName REGEXP '([bcdfghjklmnpqrstvwxz])\\1'
    AND firstName REGEXP '^L'
    AND extension REGEXP '31|13';

-- ex08 --
SELECT customerNumber, SUM(amount) AS total_amount
FROM payments
WHERE checkNumber REGEXP '^[a-z]{2}[0-9]{5}$'
GROUP BY customerNumber
HAVING total_amount > 100000
ORDER BY total_amount DESC;

-- ex08.2 --
SELECT customerNumber, SUM(amount) AS total_amount
FROM payments
WHERE checkNumber REGEXP '^[[:alpha:]]{2}[[:digit:]]{5}$'
GROUP BY customerNumber
HAVING total_amount > 100000
ORDER BY total_amount DESC;