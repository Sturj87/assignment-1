## Question # 1

SELECT COUNT(*) 
FROM planes
WHERE speed IS NOT NULL;

SELECT 
    MIN(speed + 0) AS min_speed_numeric, 
    MAX(speed + 0) AS max_speed_numeric
FROM 
    planes
WHERE 
    speed REGEXP '^[0-9]+$';


# Question # 2

SELECT SUM(distance) AS total_distance
FROM flights
WHERE year = 2013 AND month = 1;

SELECT SUM(distance) AS total_distance
FROM flights
WHERE year = 2013
AND month = 1
AND tailnum IS NULL;

# Question # 3
SELECT manufacturer, SUM(distance) AS total_distance
FROM flights
INNER JOIN planes ON flights.tailnum = planes.tailnum
WHERE flights.year = 2013
AND flights.month = 7
AND flights.day= 5
GROUP BY manufacturer;

SELECT planes.manufacturer, SUM(flights.distance) AS total_distance
FROM flights
LEFT OUTER JOIN planes ON flights.tailnum = planes.tailnum
WHERE flights.year= 2013
AND flights.month = 7
AND flights.day = 5
GROUP BY planes.manufacturer;

# Question# 4 
# What are the top 5 airlines with the highest average departure delays for flights departing from New York airports in July 2023, 
# and what are their corresponding average departure delay times?

SELECT 
    airlines.name AS airline_name,
    AVG(flights.dep_delay) AS avg_departure_delay
FROM 
    flights
JOIN 
    airlines ON flights.carrier = airlines.carrier
JOIN 
    airports ON flights.origin = airports.faa
WHERE 
    flights.year = 2023 AND flights.month = 7 
    AND airports.dst = 'NY'
GROUP BY 
    airlines.name
ORDER BY 
    avg_departure_delay DESC
LIMIT 
    5;


