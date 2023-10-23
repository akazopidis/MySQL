-- exercise01_v1 --
DROP PROCEDURE IF EXISTS min_max;

DELIMITER $$
CREATE PROCEDURE min_max()
BEGIN
	DECLARE min_country VARCHAR(80);
	DECLARE max_country VARCHAR(80);

	SELECT name
    INTO min_country
	FROM country
	WHERE population = (
		SELECT MIN(Population)
        FROM country
        WHERE Population > 0
    );

	SELECT name
    INTO max_country
	FROM country
	WHERE population = (
		SELECT MAX(Population)
        FROM country
        WHERE Population > 0
    );
    
    SELECT min_country, max_country;
END$$
DELIMITER ;

CALL min_max();

-- exercise01_v2 --
DROP PROCEDURE IF EXISTS min_max;

DELIMITER $$
CREATE PROCEDURE min_max()
BEGIN
	SELECT name, Population
	FROM country
	WHERE population = (
		SELECT MIN(Population)
        FROM country
        WHERE Population > 0
    ) OR population = (
		SELECT MAX(Population)
        FROM country
        WHERE Population > 0
    )
    ORDER BY Population;
END$$
DELIMITER ;

CALL min_max();

-- exercise01_v3 --
DROP PROCEDURE IF EXISTS min_max;

DELIMITER $$
CREATE PROCEDURE min_max()
BEGIN
	SELECT name AS Country, Population
	FROM country
	WHERE population = (
		SELECT MIN(Population)
        FROM country
        WHERE Population > 0
    )
	UNION
	SELECT name AS Country, Population
	FROM country
	WHERE population = (
		SELECT MAX(Population)
        FROM country
        WHERE Population > 0
    )
    ORDER BY Population DESC;
END$$
DELIMITER ;

CALL min_max();

-- exercise01_v4 --
DROP PROCEDURE IF EXISTS min_max;

DELIMITER $$
CREATE PROCEDURE min_max()
BEGIN
	DECLARE min_population INT;
    DECLARE max_population INT;
    
    SET min_population = (
		SELECT MIN(Population)
        FROM country
        WHERE Population > 0
        );
        
	SET max_population = (
		SELECT MAX(Population)
        FROM country
        WHERE Population > 0
        );
        
	SELECT IF (Population = min_population, "MIN Population", "Max Population") AS Population_status,
    Name,Population
    FROM country
    WHERE population IN (min_population, max_population);
END$$
DELIMITER ;

CALL min_max();




















































