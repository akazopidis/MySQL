-- exercise04 --
SELECT CONCAT(e2.firstName, ' ', e2.lastName) AS supervisor,
    COUNT(e2.employeeNumber) AS total_employees
FROM employees e1 JOIN employees e2
	ON e1.reportsTo = e2.employeeNumber
GROUP BY e2.employeeNumber;

-- exercise05 --
SELECT DISTINCT o.city
FROM employees e1
	RIGHT JOIN employees e2 ON e1.reportsTo = e2.employeeNumber
    JOIN offices o ON e2.officeCode = o.officeCode
GROUP BY e2.employeeNumber
HAVING COUNT(e1.employeeNumber) = 0;

/*
SELECT CONCAT(e2.firstName, ' ', e2.lastName) AS supervisor,
    COUNT(e1.employeeNumber) AS employees,
    o.city
FROM employees e1 
	RIGHT JOIN employees e2 ON e1.reportsTo = e2.employeeNumber
    JOIN offices o ON e2.officeCode = o.officeCode -- panw ston pinaka e2 kanw join giati autos afora ton proistameno
GROUP BY supervisor
HAVING COUNT(e1.employeeNumber) = 0;
*/
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    




























