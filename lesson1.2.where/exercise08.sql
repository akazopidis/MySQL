SELECT DISTINCT GovernmentForm
FROM country
WHERE GovernmentForm NOT IN ('Republic', 'Constitutional Monarchy')
ORDER BY GovernmentForm ASC;