-- 1
CREATE TABLE copy_customer AS
SELECT *
FROM customer;

CREATE TABLE copy_payment AS
SELECT *
FROM payment;

CREATE TABLE copy_rental AS
SELECT *
FROM rental;

CREATE TABLE copy_address AS
SELECT *
FROM address;

-- 2
SELECT *
FROM copy_address;

DELETE FROM copy_address
WHERE address_id = (
	SELECT address_id
    FROM copy_customer
    WHERE first_name = 'Mary' AND last_name = 'Smith'
    );

DELETE FROM copy_address
WHERE address_id IN 
(SELECT address_id 
 FROM copy_customer
 WHERE first_name = 'Mary' AND last_name = 'Smith'
 );

-- 3
SELECT *
FROM copy_payment;

DELETE FROM copy_payment
WHERE customer_id = (
	SELECT customer_id
    FROM copy_customer
    WHERE first_name = 'Mary' AND last_name = 'Smith'
    );

-- 4
SELECT *
FROM copy_rental;
    
DELETE FROM copy_rental
WHERE customer_id = (
	SELECT customer_id
    FROM copy_customer
    WHERE first_name = 'Mary' AND last_name = 'Smith'
    );

-- 5
SELECT *
FROM copy_customer;
    
DELETE FROM copy_customer
WHERE first_name = 'Mary' AND last_name = 'Smith';

SELECT *
FROM copy_address
WHERE address_id = 1;

-- 6
DROP TABLE copy_customer;
DROP TABLE copy_payment;
DROP TABLE copy_rental;
DROP TABLE copy_address;