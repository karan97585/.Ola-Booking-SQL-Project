create database Ola;
use Ola;


#1. Retrieve all successful bookings:

create view Successful_Bookings as
Select * from bookings
where Booking_Status = 'success';

select * from Successful_Bookings;

-- 2. Find the average ride distance for each vehicle type:
 create view ride_distance_for_each_vehicle as
 select Vehicle_Type, avg(Ride_Distance)
 as avg_distance from Bookings
 group by Vehicle_Type;
 
 select*from ride_distance_for_each_vehicle; 

-- 3. Get the total number of cancelled rides by customers:
create view cancelled_rides_by_customers AS
select count(*) from bookings 
where Booking_status= 'Canceled by Customer';


select * from cancelled_rides_by_customers;


-- 4. List the top 5 customers who booked the highest number of rides:
create view top_5_customers as
select Customer_ID, count(Booking_ID) as total_rides
from bookings
group by Customer_ID 
order by total_rides desc limit 5;


select * from top_5_customers;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:

create view rides_cancelled_by_drivers_p_c_issues as
select count(*) from 
bookings
where Canceled_Rides_by_Driver= 'Personal & Car related issue';



select * from rides_cancelled_by_drivers_p_c_issues;

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:


create view Max_Min_Driver_Ratings as
select max(Driver_Ratings) as max_rating,
min(Driver_Ratings) as min_rating
from bookings 
where Vehicle_Type = 'Prime Sedan';

select * from Max_Min_Driver_Ratings ;

-- 7. Retrieve all rides where payment was made using UPI:


create view UPI_Payment as
select* from bookings
where Payment_Method = 'UPI';


select * from UPI_Payment;

-- 8. Find the average customer rating per vehicle type:

create view avg_customer_rating as
select Vehicle_Type, avg(Customer_Rating) as avg_customer_rating
from bookings
group by Vehicle_Type;


select * from avg_customer_rating;

-- 9. Calculate the total booking value of rides completed successfully:

create view rides_completed_successfully as
select sum(Booking_Value) as total_successfully_value
from bookings
where Booking_Status='success';

select * from rides_completed_successfully;



-- 10. List all incomplete rides along with the reason:

create view incomplete_rides_reason as
select Booking_ID,Incomplete_Rides_Reason
from bookings
where Incomplete_Rides = 'Yes';

select * from incomplete_rides_reason;







#1. Retrieve all successful bookings:

select * from Successful_Bookings;

#2. Find the average ride distance for each vehicle type:

 select*from ride_distance_for_each_vehicle; 

#3. Get the total number of cancelled rides by customers:

select * from cancelled_rides_by_customers;

#4. List the top 5 customers who booked the highest number of rides:

select * from top_5_customers;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:

select * from rides_cancelled_by_drivers_p_c_issues;

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

select * from Max_Min_Driver_Ratings ;

#7. Retrieve all rides where payment was made using UPI:

select * from UPI_Payment;

#8. Find the average customer rating per vehicle type:

select * from avg_customer_rating;

#9. Calculate the total booking value of rides completed successfully:

select * from rides_completed_successfully;

#10. List all incomplete rides along with the reason:

select * from incomplete_rides_reason;
