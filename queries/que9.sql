SELECT country, COUNT(*) AS num_trip_packages
FROM destination, trip_package_has_destination
WHERE destination.destination_id = trip_package_has_destination.destination_destination_id
GROUP BY country
ORDER BY num_trip_packages DESC
LIMIT 1;
