SELECT CONCAT(addressLine1, ' ', addressLine2, ', ', state, ', ',country) AS address
FROM offices
WHERE country = 'USA';