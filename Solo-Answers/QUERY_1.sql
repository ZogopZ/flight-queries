SELECT COUNT(*) AS flights
FROM (SELECT *
	  FROM (SELECT flights.id
			FROM flights
			WHERE flights.routes_id IN (SELECT routes.id
										FROM routes
										WHERE routes.source_id = '3941') 
			UNION ALL
			SELECT flights_id
			FROM flights_has_passengers
			GROUP BY flights_id 
			HAVING COUNT(flights_id) BETWEEN 5 AND 7) AS flights_union
	  GROUP BY flights_union.id
	  HAVING COUNT(flights_union.id) = 2) AS QUERY_1
