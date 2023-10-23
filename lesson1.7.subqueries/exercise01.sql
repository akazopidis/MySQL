-- example 1.1 With LEFT JOIN
SELECT c.customerName, MAX(p.amount)
FROM customers c
	LEFT JOIN payments p ON p.customerNumber = c.customerNumber
GROUP BY c.customerNumber
ORDER BY 2 DESC;