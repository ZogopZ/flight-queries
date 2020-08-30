SELECT airlines.name, COUNT(DISTINCT passengers_id) AS passengers
FROM airlines
INNER JOIN routes ON airlines.id = routes.airlines_id
INNER JOIN airports ON routes.airlines_id = airlines.id
INNER JOIN flights ON routes.id = flights.routes_id
INNER JOIN flights_has_passengers ON flights.id = flights_has_passengers.flights_id
WHERE routes.source_id IN (SELECT id FROM airports WHERE city = 'London')
OR routes.destination_id IN (SELECT id FROM airports WHERE city = 'London')
GROUP BY airlines.name
ORDER BY passengers ASC, airlines.name LIMIT 5

