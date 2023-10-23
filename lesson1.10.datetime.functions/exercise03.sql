-- exercise03 --
SELECT orderNumber AS id,
	DATE_FORMAT(orderDate,'%d/%m/%Y') AS 'order',
    DATE_FORMAT(requiredDate,'%d/%m/%Y') AS 'required',
    DATE_FORMAT(shippedDate,'%a, %D %M %Y') AS 'shipped'
FROM orders;