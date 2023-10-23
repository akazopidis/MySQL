-- ex02 --
SELECT c.Name AS Country, cl.Language, cl.Percentage
FROM countrylanguage cl JOIN country c 
	ON cl.CountryCode = c.Code;
    
-- ex03 --
SELECT pr.productName, 
	pl.textDescription AS productLine, 
	pr.quantityInStock
FROM products pr JOIN productlines pl
	ON pr.productLine = pl.productLine;

-- ex04 --
SELECT c.customerName AS customer,
	c.city AS city,
    SUM(p.amount) AS total_amount,
	creditLimit AS credit_limit
FROM payments p JOIN customers c
	ON p.customerNumber = c.customerNumber
WHERE c.country IN ('USA','France')
GROUP BY p.customerNumber
ORDER BY creditLimit DESC;








