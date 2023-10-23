-- exercise02 --
SELECT p.productName,
	p.quantityInStock,
    p.buyPrice,
    TRUNCATE(1.1*POWER(p.buyPrice, 1.1),2) AS sellprice,
    TRUNCATE((TRUNCATE(1.1*POWER(p.buyPrice, 1.1),2)-p.buyPrice)*p.quantityInStock,2) AS profit
FROM products p;