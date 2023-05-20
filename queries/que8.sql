SELECT employees.name, employees.surname, COUNT(guided_tour.tourist_attraction_id) AS num_attractions
FROM employees, travel_guide_has_languages, languages, guided_tour 
WHERE employees.employees_AM = travel_guide_has_languages.travel_guide_employee_AM
AND travel_guide_has_languages.languages_id = languages.languages_id
AND employees.employees_AM = guided_tour.travel_guide_employee_AM
AND languages.name = 'English'
GROUP BY employees.employees_AM, employees.name, employees.surname;
