-- exercise01_example1 --
CREATE DATABASE IF NOT EXISTS temp;

USE temp;

CREATE TABLE employees AS
SELECT *
FROM classicmodels.employees;

SELECT * FROM employees;

DROP DATABASE IF EXISTS temp;

-- exercise01_example2 --
CREATE DATABASE IF NOT EXISTS temp2;

USE temp2;

CREATE TABLE customer AS
SELECT *
FROM sakila.customer;

SELECT * FROM customer;

DROP DATABASE IF EXISTS temp2;