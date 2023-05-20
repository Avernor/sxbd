SELECT name, surname
FROM employees
WHERE employees_AM IN (
  SELECT travel_guide_employee_AM
  FROM guided_tour
  WHERE trip_package_id IN (
    SELECT trip_package_trip_package_id
    FROM trip_package_has_destination
    WHERE destination_destination_id IN (
      SELECT destination_id
      FROM destination
      WHERE country = 'Germany'
    )
  )
);
