SELECT passengers.name, passengers.surname, COUNT(*) AS times
FROM passengers, flights_has_passengers
WHERE flights_id IN (SELECT id 
					 FROM flights
					 WHERE routes_id IN (SELECT id 
										 FROM routes
										 WHERE source_id IN (SELECT id 
															 FROM airports 
                                                             WHERE name = 'Athens El. Venizelos'))
								         AND date BETWEEN '2014-01-01' AND '2015-01-01')
AND passengers.id = flights_has_passengers.passengers_id
GROUP BY passengers_id
HAVING times > 4
ORDER BY name