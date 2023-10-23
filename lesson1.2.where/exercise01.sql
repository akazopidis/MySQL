SELECT checkNumber, paymentDate, amount
FROM payments
WHERE customerNumber = 398 
	AND (paymentDate >= '2004-01-01' AND paymentDate <= '2004-12-31');