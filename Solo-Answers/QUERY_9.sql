SELECT airports.name, COUNT(DISTINCT airlines.id) AS routes
FROM airports
INNER JOIN routes ON airports.id = routes.source_id OR airports.id = routes.destination_id
INNER JOIN airlines ON routes.airlines_id = airlines.id
WHERE airlines.active = 'Y'
GROUP BY airports.name
ORDER BY routes DESC LIMIT 1

