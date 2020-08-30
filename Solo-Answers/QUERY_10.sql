SELECT name
FROM
(
SELECT airlines.name, COUNT(DISTINCT passengers.id) AS travelers
FROM airlines
INNER JOIN routes ON airlines.id = routes.airlines_id
INNER JOIN flights ON routes.id = flights.routes_id
INNER JOIN flights_has_passengers ON flights.id = flights_has_passengers.flights_id
INNER JOIN passengers ON flights_has_passengers.passengers_id = passengers.id
WHERE passengers.year_of_birth > 1994
GROUP BY airlines.name
ORDER BY travelers DESC LIMIT 1
) AS answer
