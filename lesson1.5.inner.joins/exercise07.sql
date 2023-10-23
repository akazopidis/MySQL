-- 7.1
-- Non-EQUI-JOIN
SELECT * 
FROM payments p JOIN orders o
	ON p.paymentDate > o.orderDate;
    
-- 7.2
-- EQUI-JOIN
SELECT * 
FROM customers c JOIN employees e
	ON c.contactFirstName = e.firstName AND
       c.contactLastName = e.lastName;

-- 7.3
-- -- Non-EQUI-JOIN
SELECT * 
FROM customers c JOIN employees e
	ON NOT (c.contactFirstName > e.firstName OR
       c.contactLastName <> e.lastName);

-- 7.4
-- NATURAL-JOIN
SELECT * 
FROM employees NATURAL JOIN offices;
