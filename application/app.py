# ----- CONFIGURE YOUR EDITOR TO USE 4 SPACES PER TAB ----- #
import settings
import sys,os
sys.path.append(os.path.join(os.path.split(os.path.abspath(__file__))[0], 'lib'))
import pymysql as db

def connection():
    ''' User this function to create your connections '''
    con = db.connect(
        host=settings.mysql_host, 
        user=settings.mysql_user, 
        password=settings.mysql_passwd, 
        db=settings.mysql_schema)
    
    return con

def  findTrips(x,a,b):
    
    # Create a new connection
    # Create a new connection
    con=connection()
    # Create a cursor on the connection
    cur=con.cursor()

    #How to connect a driver to a specific trip????
    query = """
        SELECT tp.cost_per_person,
        tp.max_num_participants,
        (SELECT COUNT(*) FROM reservation WHERE offer_trip_package_id = tp.trip_package_id AND travel_agency_branch_id = %s ),
        tp.max_num_participants - (SELECT COUNT(*) FROM reservation WHERE offer_trip_package_id = tp.trip_package_id AND travel_agency_branch_id = %s),
        (SELECT name FROM employees WHERE employees_AM = (SELECT driver_employee_AM FROM drivers WHERE travel_agency_branch_travel_agency_branch_id = %s LIMIT 1)),
        (SELECT surname FROM employees WHERE employees_AM = (SELECT driver_employee_AM FROM drivers WHERE travel_agency_branch_travel_agency_branch_id = %s LIMIT 1)),
        (SELECT name FROM employees WHERE employees_AM = (SELECT travel_guide_employee_AM FROM guided_tour WHERE trip_package_id = tp.trip_package_id LIMIT 1)),
        (SELECT surname FROM employees WHERE employees_AM = (SELECT travel_guide_employee_AM FROM guided_tour WHERE trip_package_id = tp.trip_package_id LIMIT 1)),
        tp.trip_start,
        tp.trip_end
        FROM trip_package tp
        WHERE tp.trip_package_id IN 
            (SELECT offer_trip_package_id FROM reservation WHERE travel_agency_branch_id = %s)
        AND tp.trip_start >= %s 
        AND tp.trip_end <= %s
    """
    cur.execute(query, (x, x, x, x, x, a, b))
    result = cur.fetchall()

    return [("cost_per_person","max_num_participants", "reservations", "empty seats", "driver name", "driver surname", "guide name", "guide surname", "trip_start", "trip_end"),] + list(result)


def findRevenue(x):
    
   # Create a new connection
    con=connection()
    
    # Create a cursor on the connection
    cur=con.cursor()

    return [("travel_agency_branch_id", "total_num_reservations", "total_income", "total_num_employees", "total_salary"),]

def bestClient(x):

    # Create a new connection
    con=connection()
    # Create a cursor on the connection
    cur=con.cursor()
    
    
    return [("first_name", "last_name", "total_countries_visited", "total_cities_visited", "list_of_attractions"),]
    

def giveAway(N):
    # Create a new connection
    con=connection()

    # Create a cursor on the connection
    cur=con.cursor()
    

    return [("string"),]
    

