SELECT airports.name, COUNT(DISTINCT flights_has_passengers.passengers_id) AS visitors
FROM airlines
INNER JOIN routes ON airlines.id = routes.airlines_id
INNER JOIN flights ON routes.id = flights.routes_id
INNER JOIN flights_has_passengers ON flights.id = flights_has_passengers.flights_id
INNER JOIN airports ON routes.source_id = airports.id OR routes.destination_id = airports.id
WHERE airlines.name = 'Aegean Airlines'
AND flights.date BETWEEN '2011-01-01' AND '2015-01-01'
GROUP BY airports.name