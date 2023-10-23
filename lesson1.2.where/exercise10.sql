SELECT SUM(quantityOrdered * priceEach) AS total_price
FROM orderdetails
WHERE orderNumber BETWEEN 10100 AND 10199;
