SELECT name, surname
FROM
(
	SELECT passengers.*, airplanes_id, airlines_id, airlines.name AS airlines_name, COUNT(DISTINCT airlines.name) AS different_airlines
	FROM passengers
	INNER JOIN flights_has_passengers ON passengers.id = flights_has_passengers.passengers_id
	INNER JOIN flights ON flights_has_passengers.flights_id = flights.id
	INNER JOIN routes ON flights.routes_id = routes.id
	INNER JOIN airlines ON routes.airlines_id = airlines.id
	GROUP BY passengers.id
	HAVING different_airlines = 1
) AS alias_last
WHERE airlines_name = 'British Airways'
ORDER BY name
