SELECT trip_package_trip_package_id
FROM trip_package_has_destination tphd
WHERE tphd.destination_destination_id IN (
    SELECT destination_id
    FROM destination
    WHERE country = 'Ireland'
)
GROUP BY trip_package_trip_package_id