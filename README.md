# Air Cargo - Passenger, Route, and Ticket Analysis

## Project Overview

Air Cargo is an aviation company that provides both passenger and freight air transportation services. This project involves preparing reports to improve the company’s ease of travel and booking services, focusing on regular passengers, busiest routes, and ticket sales details. By analyzing this data, Air Cargo can increase customer satisfaction and enhance its operational efficiency.

## Project Objective

As a DBA expert, your tasks include:
- Identifying regular customers to provide offers.
- Analyzing the busiest routes to determine the number of aircraft needed.
- Preparing ticket sales analysis to improve overall operations.
  
This will help Air Cargo become a more customer-centric airline and enhance its position in the aviation industry.

## Dataset Description

The project uses four key datasets:

### 1. **Customer Table**  
Contains details about the customers.
- `customer_id`: Unique ID of the customer.
- `first_name`: First name of the customer.
- `last_name`: Last name of the customer.
- `date_of_birth`: Date of birth of the customer.
- `gender`: Gender of the customer.

### 2. **Passengers on Flights Table**  
Contains information about passengers' travel details.
- `aircraft_id`: Aircraft ID.
- `route_id`: Route ID from departure to arrival location.
- `customer_id`: Customer ID.
- `depart`: Departure airport.
- `arrival`: Arrival airport.
- `seat_num`: Seat number.
- `class_id`: Travel class ID.
- `travel_date`: Date of travel.
- `flight_num`: Flight number for the route.

### 3. **Ticket Details Table**  
Contains ticket purchasing details.
- `p_date`: Ticket purchase date.
- `customer_id`: Customer ID.
- `aircraft_id`: Aircraft ID.
- `class_id`: Travel class ID.
- `no_of_tickets`: Number of tickets purchased.
- `a_code`: Airport code.
- `price_per_ticket`: Price per ticket.
- `brand`: Aviation service provider.

### 4. **Routes Table**  
Contains details about the routes.
- `route_id`: Route ID.
- `flight_num`: Flight number.
- `origin_airport`: Departure airport.
- `destination_airport`: Arrival airport.
- `aircraft_id`: Aircraft ID.
- `distance_miles`: Distance between departure and arrival locations.

## Key Operations to Perform

1. **Create an ER Diagram**  
   - Develop an ER diagram for the Air Cargo database to visualize relationships.

2. **Create Route Details Table**  
   - Write a query to create the `route_details` table with fields like `route_id`, `flight_num`, `origin_airport`, `destination_airport`, `aircraft_id`, and `distance_miles`.
   - Implement a check constraint for `flight_num` and a unique constraint for `route_id`.
   - Ensure `distance_miles` is greater than 0.

3. **Passengers on Routes 01 to 25**  
   - Write a query to display all passengers who traveled on routes 01 to 25.

4. **Business Class Passengers and Revenue**  
   - Write a query to identify the number of business class passengers and total revenue from the `ticket_details` table.

5. **Display Full Name of Customers**  
   - Write a query to display the full name of customers by extracting the `first_name` and `last_name` from the `customer` table.

6. **Registered and Booked Customers**  
   - Write a query to extract customers who have both registered and booked a ticket using the `customer` and `ticket_details` tables.

7. **Customers by Brand (Emirates)**  
   - Write a query to identify customers by their `customer_id` and brand (e.g., Emirates) from the `ticket_details` table.

8. **Economy Plus Passengers**  
   - Write a query using `Group By` and `Having` clauses to identify Economy Plus passengers.

9. **Revenue Check**  
   - Write a query using the `IF` clause to check if the revenue has crossed 10,000.

10. **Grant Database Access**  
    - Write a query to create and grant access to a new user for database operations.

11. **Maximum Ticket Price by Class**  
    - Write a query to find the maximum ticket price for each class using window functions.

12. **Optimize Passenger Query for Route 4**  
    - Write a query to improve performance in extracting passengers whose `route_id` is 4.

13. **View Execution Plan for Route ID 4**  
    - Write a query to view the execution plan of the `passengers_on_flights` table for `route_id` 4.

14. **Total Ticket Price Calculation**  
    - Write a query using the `ROLLUP` function to calculate the total price of tickets booked by a customer across different aircraft IDs.

15. **Business Class Customer View**  
    - Write a query to create a view displaying only business class customers along with the airline brand.

16. **Stored Procedure for Passengers on Route Range**  
    - Write a stored procedure to get passenger details for routes defined at runtime, and handle errors if the table doesn’t exist.

17. **Stored Procedure for Routes over 2000 Miles**  
    - Write a stored procedure to extract details of routes with a distance greater than 2000 miles.

18. **Stored Procedure for Categorizing Flights by Distance**  
    - Write a stored procedure to categorize flights as:
      - **Short Distance Travel (SDT)**: 0 <= distance <= 2000 miles
      - **Intermediate Distance Travel (IDT)**: 2000 < distance <= 6500 miles
      - **Long Distance Travel (LDT)**: > 6500 miles.

19. **Complimentary Services by Class**  
    - Write a stored function to specify whether complimentary services are provided for each class:
      - **Yes** for Business and Economy Plus.
      - **No** for other classes.

20. **Customer with Last Name Ending in Scott**  
    - Write a query using a cursor to extract the first record of a customer whose last name ends with "Scott".

## Conclusion

By completing this project, you will develop a deeper understanding of managing aviation data and running complex queries to improve the company's operational efficiency. This will help Air Cargo improve its customer service, optimize route planning, and ensure smooth ticket sales processes.

## Tools Used
- **MySQL** (or any RDBMS for SQL queries)
- **ER Diagram Software** (e.g., MySQL Workbench)

