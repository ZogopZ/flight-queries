SELECT 'YES' AS Answer 
FROM 
(
	SELECT COUNT(airlines.id) AS airlines_with_route 
	FROM airlines
	WHERE id IN (SELECT airlines_id 
				 FROM routes
				 WHERE (source_id IN (SELECT id FROM airports WHERE name = 'London Gatwick')
						OR
						destination_id IN (SELECT id FROM airports WHERE name = 'London Gatwick')))
	HAVING airlines_with_route > 5
) AS alias_answer

UNION

SELECT 'NO' AS Answer 
FROM 
(
	SELECT COUNT(airlines.id) AS airlines_with_route 
	FROM airlines
	WHERE id IN (SELECT airlines_id 
				 FROM routes
				 WHERE (source_id IN (SELECT id FROM airports WHERE name = 'London Gatwick')
						OR
						destination_id IN (SELECT id FROM airports WHERE name = 'London Gatwick')))
	HAVING airlines_with_route <= 5
) AS alias_answer
    