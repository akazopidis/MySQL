-- exercise02_v1 --
SELECT orderNumber, orderDate, shippedDate
FROM orders
WHERE DATEDIFF(shippedDate, orderDate) >= 8;

-- exercise02_v2 --
SELECT orderNumber, orderDate, shippedDate
FROM orders
WHERE shippedDate >= DATE_ADD(orderDate, INTERVAL 8 DAY);