SELECT offer_trip_package_id, COUNT(*) AS num_reservations
FROM reservation
WHERE DATE BETWEEN '2021-01-01' AND '2021-12-31'
AND offer_id IN (
  SELECT offer_id
  FROM offer
  WHERE trip_package_id IN (
    SELECT trip_package_trip_package_id
    FROM trip_package_has_destination
    WHERE destination_destination_id IN (
      SELECT destination_id
      FROM destination
      WHERE name = 'Paris'
    )
  )
)
GROUP BY offer_trip_package_id;
