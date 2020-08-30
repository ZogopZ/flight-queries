SELECT code, name, COUNT(DISTINCT airplanes_id) AS Planes, COUNT(DISTINCT routes.id) AS routes
FROM airlines
INNER JOIN airlines_has_airplanes ON airlines.id = airlines_has_airplanes.airlines_id
INNER JOIN routes ON airlines.id = routes.airlines_id
GROUP BY airlines.id
HAVING Planes > 5 AND Routes > 5