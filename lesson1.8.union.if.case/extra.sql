-- case
SELECT CASE productLine
		WHEN 'Classic Cars' THEN 'Ground Vehicles'
		WHEN 'Motorcycles' THEN 'Ground Vehicles'
		WHEN 'Trucks and Buses' THEN 'Ground Vehicles'
		WHEN 'Vintage Cars' THEN 'Ground Vehicles'
		WHEN 'Trains' THEN 'Ground Vehicles'
		WHEN 'Vintage Cars' THEN 'Ground Vehicles'
		WHEN 'Ships' THEN 'Sea Vehicles'
		WHEN 'Planes' THEN 'Air Vehicles'
        END AS productLine
FROM productlines;

-- joins
SELECT *
FROM productlines pl
	JOIN products pr ON pr.productLine = pl.productLine
    JOIN orderdetails od ON od.productCode = pr.productCode
    JOIN orders o ON od.orderNumber = o.orderNumber
WHERE status = 'Shipped';

-- sub1
SELECT o.orderNumber,
	o.customerNumber,
    od.priceEach*od.quantityOrdered AS price,
    CASE pl.productLine
		WHEN 'Classic Cars' THEN 'Ground Vehicles'
		WHEN 'Motorcycles' THEN 'Ground Vehicles'
		WHEN 'Trucks and Buses' THEN 'Ground Vehicles'
		WHEN 'Vintage Cars' THEN 'Ground Vehicles'
		WHEN 'Trains' THEN 'Ground Vehicles'
		WHEN 'Vintage Cars' THEN 'Ground Vehicles'
		WHEN 'Ships' THEN 'Sea Vehicles'
		WHEN 'Planes' THEN 'Air Vehicles'
        END AS vehicleType
FROM productlines pl
	JOIN products pr ON pr.productLine = pl.productLine
    JOIN orderdetails od ON od.productCode = pr.productCode
    JOIN orders o ON od.orderNumber = o.orderNumber
WHERE status = 'Shipped';

-- sub2
SELECT c.customerNumber, o.country
FROM customers c
	JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber
    JOIN offices o ON e.officeCode = o.officeCode
WHERE o.country IN ('USA','France');

-- example 4.1
SELECT country, vehicleType, SUM(price) AS totalAmount
FROM (
	SELECT o.orderNumber,
	o.customerNumber,
    od.priceEach*od.quantityOrdered AS price,
    CASE pl.productLine
		WHEN 'Classic Cars' THEN 'Ground Vehicles'
		WHEN 'Motorcycles' THEN 'Ground Vehicles'
		WHEN 'Trucks and Buses' THEN 'Ground Vehicles'
		WHEN 'Vintage Cars' THEN 'Ground Vehicles'
		WHEN 'Trains' THEN 'Ground Vehicles'
		WHEN 'Vintage Cars' THEN 'Ground Vehicles'
		WHEN 'Ships' THEN 'Sea Vehicles'
		WHEN 'Planes' THEN 'Air Vehicles'
        END AS vehicleType
FROM productlines pl
	JOIN products pr ON pr.productLine = pl.productLine
    JOIN orderdetails od ON od.productCode = pr.productCode
    JOIN orders o ON od.orderNumber = o.orderNumber
WHERE status = 'Shipped'
    ) ovt
    JOIN (
		SELECT c.customerNumber, o.country
		FROM customers c
			JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber
			JOIN offices o ON e.officeCode = o.officeCode
		WHERE o.country IN ('USA','France')
		) oc ON ovt.customerNumber = oc.customerNumber
GROUP BY country, vehicleType
ORDER BY totalAmount DESC;

-- example 4.1 WITHOUT subqueries
SELECT offices.country,
	CASE productlines.productLine
		WHEN 'Classic Cars' THEN 'Ground Vehicles'
		WHEN 'Motorcycles' THEN 'Ground Vehicles'
		WHEN 'Trains' THEN 'Ground Vehicles'
		WHEN 'Trucks and Buses' THEN 'Ground Vehicles'
		WHEN 'Vintage Cars' THEN 'Ground Vehicles'
        WHEN 'Planes' THEN 'Air Vehicles'
        WHEN 'Ships' THEN 'Sea Vehicles'
        END AS vehicleType
    ,
    SUM(orderdetails.quantityOrdered*orderdetails.priceEach) AS total_amount
FROM productlines
	JOIN products ON products.productLine = productlines.productLine
    JOIN orderdetails ON orderdetails.productCode = products.productCode
    JOIN orders ON orderdetails.orderNumber = orders.orderNumber
    JOIN customers ON orders.customerNumber = customers.customerNumber
    JOIN employees ON customers.salesRepEmployeeNumber = employees.employeeNumber
    JOIN offices ON employees.officeCode = offices.officeCode
WHERE offices.country IN ('USA','France')
	AND orders.status = 'Shipped'
GROUP BY 1,2
ORDER BY 3 DESC;