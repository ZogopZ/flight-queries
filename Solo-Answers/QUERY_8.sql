SELECT COUNT(*) AS Count
FROM 
(
SELECT COUNT(DISTINCT flights_id) AS flights_per_passenger
FROM flights_has_passengers
INNER JOIN flights ON flights_has_passengers.flights_id = flights.id
INNER JOIN routes ON flights.routes_id = routes.id
INNER JOIN airports ON routes.source_id = (SELECT id FROM airports WHERE city = 'Athens')
WHERE flights.date BETWEEN '2010-01-01' AND '2015-01-01'
GROUP BY passengers_id
HAVING flights_per_passenger > 5
) AS answer