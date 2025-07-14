Create Database Ola;
use Ola;
select * from `bookings - july` 
where Booking_Status = 'Success';
#1. Retrieve all successful bookings
select * successful_bookings;
Create view Successful_Bookings as 
select * from `bookings - july` where Booking_Status = 'Success';
#2.  Find the average ride distance for each vehicle type:
create view ride_distance_for_each_vehicle as 
select vehicle_type, avg(ride_distance)
from `bookings - july`
group by vehicle_type;

select * from ride_distance_for_each_vehicle;
#3.  Get the total number of canceled rides by customers:
create view canceled_rides_by_customers as
select count(*)
 from `bookings - july`
 where booking_status = 'canceled by customer';
 
 select * from canceled_rides_by_customers;
#4.  List the top 5 customers who booked the highest no. of rides:
create view top_5_customers as
select customer_id, count(booking_id) as total_rides
 from `bookings - july`
 group by customer_id
 order by total_rides desc limit 5;
 
 select * from top_5_customers;
 

#5.  Get the no. of rides canceled by drivers due to personal and car-related issues:
create view rides_canceled_by_drivers_P_C_Issues as
select count(*) from `bookings - july` 
where canceled_rides_by_driver = 'Personal and Car-related issues';
#6. Find the max and min driver ratings for Prime Sedan bookings:
create view max_and_min_driver_ratings as
select max(Driver_Ratings) as max_rating,
min(Driver_Ratings) as min_rating
from `bookings - july` where vehicle_type = 'Prime Sedan';

#7. Retrive all rides where payment was made using UPI:
create view payment_using_UPI as 
select *
from `bookings - july`
where payment_method = 'UPI';

#8.  Find the avg customer rating per vehicle type:
create view avg_customer_rating as
select vehicle_type, avg(customer_rating) as avg_customer_rating
from `bookings - july`
group by vehicle_type;

#9. Calculate the total booking value of rides completed successfully:
create view total_ride_booking_value as 
select sum(booking_value) as total_successful_ride_value
from `bookings - july` where booking_status = 'Success';

#10. List all the incomplete rides along with the reason:
create view incomplete_rides_and_reasons as 
select booking_id, incomplete_rides_reason
from `bookings - july`
where incomplete_rides = 'Yes';


