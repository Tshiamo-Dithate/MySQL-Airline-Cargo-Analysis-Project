-- AIR CARGO ANALYSIS PROJECT
-- BY: TSHIAMO EDWIN DITHATE

CREATE DATABASE AirCargo;
USE AirCargo;
SHOW TABLES;

-- 1. An ER diagram for the given airlines database is displayed in the source code sections.

/* 2. Write a query to create route_details table using suitable data types for the fields, such as route_id, flight_num,
 origin_airport, destination_airport, aircraft_id, and distance_miles.*/
 
 CREATE TABLE route_details(
 route_id INT PRIMARY KEY NOT NULL,
 flight_num INT NOT NULL,
 origin_airport VARCHAR(100) NOT NULL,
 destination_airport VARCHAR(100) NOT NULL,
 aircraft_id VARCHAR(100) NOT NULL,
 distance_miles INT NOT NULL,
CONSTRAINT flight_num_check CHECK ((substr(flight_num,1,2) = 11)),
CONSTRAINT routes_chk_1 CHECK ((distance_miles > 0)) );

SELECT * FROM ticket_details;

/* 3. Write a query to display all the passengers (customers) who have travelled in routes 01 to 25.
Take data  from the passengers_on_flights table. */
Select * from passengers_on_flights WHERE route_id between 1 AND 25;
select * from passengers_on_flights;

-- 4. Write a query to identify the number of passengers and total revenue in business class from the ticket_details table.

Select Count(customer_id) AS 'NO. OF PASSENGER' , sum(Price_per_ticket) AS REVENUE from ticket_details Where class_id='Bussiness' ;

-- 5. Write a query to display the full name of the customer by extracting the first name and last name from the customer table.

Select  CUSTOMER_ID, concat(first_name,last_name) AS  "FULL NAME"  , date_of_birth,gender from customer;

/* 6. Write a query to extract the customers who have registered and booked a ticket. 
Use data from the customer and ticket_details tables. */

select TD.customer_id , c.first_name, c.last_name
from ticket_details as TD
left join
customer as c
on TD.customer_id = c.customer_id;

/* 7. Write a query to identify the customer’s first name and last name based on
their customer ID and brand (Emirates) from the ticket_details table.*/

select c.first_name, c.last_name, TD.brand
from aircargo.ticket_details TD
left join customer c
on TD.customer_id = c.customer_id
where brand = 'Emirates';

/* 8. Write a query to identify the customers who have travelled by Economy
Plus class using Group By and Having clause on the passengers_on_flights table.*/

select c.first_name, c.last_name, PF.customer_id, PF.class_id
from passengers_on_flights PF
left join customer c
on PF.customer_id = c.customer_id
group by 1,2,3,4
having class_id = "Economy Plus";


/*9. Write a query to identify whether the revenue has crossed 10000 using
the IF clause on the ticket_details table.*/

select 
if(sum(price_per_ticket)>1000, "Yes, Revenue is high", "NO") as Revenue_check
from ticket_details;

-- 10. Write a query to create and grant access to a new user to perform operations on a database.

select user, host from mysql.user;
create user edwin@localhost;
show grants for edwin@localhost;
grant all on aircargo.* to edwin@localhost;
show grants for edwin@localhost;

-- 11. Write a query to find the maximum ticket price for each class using window functions on the ticket_details table.

with edwin as (
select class_id, price_per_ticket as Max_price_per_ticket, rank()over(partition by class_id order by price_per_ticket desc)
as rank_ticket from ticket_details)
select distinct * from edwin
where rank_ticket = 1;

/* 12. Write a query to extract the passengers whose route ID is 4 by
 improving the speed and performance of the passengers_on_flights table.*/
 
 select * from passengers_on_flights;
 
 select PF.customer_id, c.first_name, c.last_name
 from passengers_on_flights PF
 left join customer c
 on PF.customer_id = c.customer_id
 where pd.route_id = 4;
 
 -- 13. For the route ID 4, write a query to view the execution plan of the passengers_on_flights table.
 
 select aircraft_id,depart, arrival, flight_num
 from aircargo.passengers_on_flights
 where route_id = 4;
 
 /* 14. Write a query to calculate the total price of all tickets booked by a customer 
 across different aircraft IDs using rollup function.*/
 
 select sum(price_per_ticket), aircraft_id
 from aircargo.ticket_details
 group by aircraft_id with rollup;
 
 /* 15. Write a query to create a view with only business class customers along with the brand of airlines.*/
 
 create view brand
 as select c.first_name, c.last_name,TD.customer_id,TD.class_id,TD.brand
 from aircargo.ticket_details as TD
 left join customer as c
 on TD.customer_id = c.customer_id
 where class_id = "Business";
 
 /* 16. Write a query to create a stored procedure to get the details of all passengers 
 flying between a range of routes defined in run time. Also, return an error message if the table doesn't exist.*/
 
 DELIMITER $$
 create procedure route2(in route_id1 int, in route_id2 int)
 begin
 declare continue handler for sqlstate '42S02'
 begin
 select "No Record available" as Message;
 end;
 
 select RD.route_id, PF.customer_id, c.first_name, c.last_name from routes RD
 inner join passengers_on_flights PF
 on RD.route_id = PF.route_id
 left join customer c
 using (customer_id)
 where RD.route_id between route_id1 and route_id2;
 
 select * from route;
 end $$
 DELIMITER ;
 call route2(5, 7 );  
 
 /* 17. Write a query to create a stored procedure that extracts all
 the details from the routes table where the travelled distance is more than 2000 miles.*/
 
 DELIMITER @@
 create procedure disntance()
 begin
 select * from routes
 where distance_miles > 2000;
 end @@
 
 /* 18. Write a query to create a stored procedure that groups the distance travelled by each
 flight into three categories. The categories are, short distance travel (SDT) for >=0 AND <= 2000 miles,
 intermediate distance travel (IDT) for >2000 AND <=6500, and long-distance travel (LDT) for >6500.*/
 
 create procedure distancegrouping(in flight_num1 int)
 begin 
 select *,
 case
 when distance_miles>=0 and distance_miles<=2000 then "Short Distance"
 when distance_miles>=2000 and distance_miles<=6500 then "Intermediate Distance"
 else "Long distance"
 end as category
 from routes
 where flight_num=flight_num1;
 end @@
 
 call distancegrouping(1111);
 
 /* 19. Write a query to extract ticket purchase date, customer ID, class ID and specify if the complimentary 
 services are provided for the specific class using a stored function in stored procedure on the ticket_details table.*/
 
 DELIMITER %%
 create procedure complementary_service(in customer_id1 int)
 begin
 select p_date, customer_id, class_id,
 case
 when class_id = "Business" or class_id = "Economy Plus" then "complementary services"
 else "No Complimentary Services"
 end as service_distribution
 from ticket_details
 where customer_id = customer_id1;
 end%%
 
 call complementary_service(27);
 
 /* 20. Write a query to extract the first record of the customer whose last
 name ends with Scott using a cursor from the customer table.*/
 
 delimiter $$
 create procedure firstrecord()
 begin declare a varchar(20);
 declare b varchar(20);
 declare c int;
 declare cursor_1 cursor for select first_name, last_name, customer_id from customer
 where last_name = "scott";
 open cursor_1;
 fetch cursor_1 into a, b, c;
 select a as first_name, b as last_name, c as customer_id;
 close cursor_1;
 end $$
 delimiter ;
 call firstrecord();
 
 
 
 
 
 
