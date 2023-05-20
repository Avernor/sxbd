SELECT travel_guide_employee_AM
FROM guided_tour
WHERE trip_package_id IN (
  SELECT trip_package_id
  FROM trip_package
  WHERE trip_start BETWEEN '2019-01-01' AND '2019-12-31'
)
GROUP BY travel_guide_employee_AM
HAVING COUNT(*) > 3;
