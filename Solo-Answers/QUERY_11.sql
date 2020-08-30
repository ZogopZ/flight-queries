SELECT airlines.name, COUNT(DISTINCT flights.id) AS Count
FROM flights
INNER JOIN airplanes ON flights.airplanes_id = airplanes.id
INNER JOIN airlines_has_airplanes ON airplanes.id = airlines_has_airplanes.airplanes_id
INNER JOIN airlines ON airlines_has_airplanes.airlines_id = airlines.id
WHERE airplanes.manufacturer = 'Boeing'
GROUP BY airlines.name
ORDER BY airlines.name