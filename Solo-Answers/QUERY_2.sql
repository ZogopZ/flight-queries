SELECT model, manufacturer, COUNT(*) AS count
FROM airplanes
JOIN flights 
	ON flights.airplanes_id IN (SELECT airplanes_id
								FROM flights
								WHERE date BETWEEN '2011-02-01' AND '2014-07-17' 
								AND routes_id IN (SELECT id
												  FROM routes
											      WHERE source_id IN (SELECT id FROM airports WHERE city = 'ATHENS')
											      AND destination_id IN (SELECT id FROM airports WHERE city = 'LONDON')))
WHERE airplanes.id IN (SELECT airplanes_id
					  FROM airlines_has_airplanes
                      WHERE airlines_id IN (SELECT id FROM airlines WHERE name = 'Olympic Airways'))
GROUP BY model
												
												
												
             