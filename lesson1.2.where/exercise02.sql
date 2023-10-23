SELECT *
FROM payments
WHERE (amount >= 5000 AND amount <=15000)
	AND (paymentDate >= '2004-01-01' AND paymentDate <= '2004-12-31');