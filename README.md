# .Ola-Booking-SQL-Project
Analyze Ola ride bookings using SQL to find trends in rides, cancellations, and ratings 



This repository contains SQL queries designed to analyze various aspects of Ola booking data. The queries are structured to provide insights into booking success rates, ride statistics, customer behavior, driver performance, and payment trends.

Database Setup
To use these queries, you'll need a database named Ola and a table within it, likely named bookings, with columns corresponding to the fields used in the queries (e.g., Booking_Status, Vehicle_Type, Ride_Distance, Customer_ID, Driver_Ratings, Payment_Method, Booking_Value, Incomplete_Rides, Incomplete_Rides_Reason, Canceled_Rides_by_Driver, Customer_Rating, Booking_ID).

Initial Database Commands:

SQL

CREATE DATABASE Ola;
USE Ola;
(Note: The table schema for bookings is not provided here, but it's essential for the queries to run correctly. You would typically create this table and populate it with data before running the analysis queries.)

Analysis Queries
The following queries (and their corresponding views) are included in this project to answer specific analytical questions about Ola bookings.

1. Retrieve all successful bookings
This view provides a complete list of all bookings that were successfully completed.

SQL

CREATE VIEW Successful_Bookings AS
SELECT *
FROM bookings
WHERE Booking_Status = 'success';
To retrieve the data:

SQL

SELECT * FROM Successful_Bookings;


2. Find the average ride distance for each vehicle type
This query calculates the average ride distance for each distinct vehicle type available.

SQL

CREATE VIEW ride_distance_for_each_vehicle AS
SELECT Vehicle_Type, AVG(Ride_Distance) AS avg_distance
FROM Bookings
GROUP BY Vehicle_Type;
To retrieve the data:

SQL

SELECT * FROM ride_distance_for_each_vehicle;


3. Get the total number of canceled rides by customers
This view shows the total count of rides that were canceled by customers.

SQL

CREATE VIEW cancelled_rides_by_customers AS
SELECT COUNT(*) AS total_cancelled_by_customer
FROM bookings
WHERE Booking_Status = 'Canceled by Customer';
To retrieve the data:

SQL

SELECT * FROM cancelled_rides_by_customers;


4. List the top 5 customers who booked the highest number of rides
This view identifies the top 5 customers based on the total number of rides they have booked.

SQL

CREATE VIEW top_5_customers AS
SELECT Customer_ID, COUNT(Booking_ID) AS total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC
LIMIT 5;
To retrieve the data:

SQL

SELECT * FROM top_5_customers;


5. Get the number of rides canceled by drivers due to personal and car-related issues
This view provides the count of rides that drivers canceled specifically due to personal or car-related issues.

SQL

CREATE VIEW rides_cancelled_by_drivers_p_c_issues AS
SELECT COUNT(*) AS total_driver_cancellations_personal_car
FROM bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';
To retrieve the data:

SQL

SELECT * FROM rides_cancelled_by_drivers_p_c_issues;


6. Find the maximum and minimum driver ratings for Prime Sedan bookings
This view calculates the highest and lowest driver ratings specifically for bookings made with 'Prime Sedan' vehicles.

SQL

CREATE VIEW Max_Min_Driver_Ratings AS
SELECT MAX(Driver_Ratings) AS max_rating, MIN(Driver_Ratings) AS min_rating
FROM bookings
WHERE Vehicle_Type = 'Prime Sedan';
To retrieve the data:

SQL

SELECT * FROM Max_Min_Driver_Ratings;


7. Retrieve all rides where payment was made using UPI
This view lists all ride bookings where the payment method used was UPI.

SQL

CREATE VIEW UPI_Payment AS
SELECT *
FROM bookings
WHERE Payment_Method = 'UPI';
To retrieve the data:

SQL

SELECT * FROM UPI_Payment;


8. Find the average customer rating per vehicle type
This query calculates the average customer rating for each vehicle type.

SQL

CREATE VIEW avg_customer_rating AS
SELECT Vehicle_Type, AVG(Customer_Rating) AS avg_customer_rating
FROM bookings
GROUP BY Vehicle_Type;
To retrieve the data:

SQL

SELECT * FROM avg_customer_rating;


9. Calculate the total booking value of rides completed successfully
This view sums up the Booking_Value for all rides that were completed successfully.

SQL

CREATE VIEW rides_completed_successfully AS
SELECT SUM(Booking_Value) AS total_successfully_value
FROM bookings
WHERE Booking_Status = 'success';
To retrieve the data:

SQL

SELECT * FROM rides_completed_successfully;


10. List all incomplete rides along with the reason
This view identifies all rides marked as incomplete and provides the specific reason for their incompletion.

SQL

CREATE VIEW incomplete_rides_reason AS
SELECT Booking_ID, Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides = 'Yes';
To retrieve the data:

SQL

SELECT * FROM incomplete_rides_reason






