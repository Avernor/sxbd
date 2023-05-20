SELECT  tp.cost_per_person,
        tp.max_num_participants,
        (SELECT COUNT(*) FROM reservation WHERE offer_trip_package_id = tp.trip_package_id AND travel_agency_branch_id = 5 ),
        tp.max_num_participants - (SELECT COUNT(*) FROM reservation WHERE offer_trip_package_id = tp.trip_package_id AND travel_agency_branch_id = 5),
        (SELECT name FROM employees WHERE employees_AM = (SELECT driver_employee_AM FROM drivers WHERE travel_agency_branch_travel_agency_branch_id = 5 LIMIT 1)),
        (SELECT surname FROM employees WHERE employees_AM = (SELECT driver_employee_AM FROM drivers WHERE travel_agency_branch_travel_agency_branch_id = 5 LIMIT 1)),
        (SELECT name FROM employees WHERE employees_AM = (SELECT travel_guide_employee_AM FROM travel_guide WHERE travel_agency_branch_travel_agency_branch_id = 5 LIMIT 1)),
        (SELECT surname FROM employees WHERE employees_AM = (SELECT travel_guide_employee_AM FROM travel_guide WHERE travel_agency_branch_travel_agency_branch_id = 5 LIMIT 1)),
        tp.trip_start,
        tp.trip_end
        FROM trip_package tp
		WHERE trip_start BETWEEN '2020-01-01' AND '2021-01-01'