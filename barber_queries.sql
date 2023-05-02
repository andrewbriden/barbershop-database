/**************************************************

File: barber-queries.sql
Author: Andrew Briden
Description: Six SQL Queries and Results 
Date: 05/01/23

**************************************************/


/* 
QUERY 1:

Give the total revenue generated by each barber in 2022.
*/

SELECT barber.name, SUM(payment.amount) AS total_revenue
FROM barber
JOIN appointment ON barber.barber_id = appointment.barber_id
JOIN payment ON appointment.appointment_id = payment.appointment_id
WHERE appointment.appointment_date BETWEEN '2022-01-01' AND '2023-12-31'
GROUP BY barber.barber_id;

/* 

 Result:

 John Lennon|380
 Paul McCartney|335
 George Harrison|345
 Ringo Starr|340

*/


/* 
QUERY 2:

Give the total revenue of each loyalty member customer’s activity.
*/
SELECT customer.name, SUM(payment.amount) AS total_revenue
FROM customer
JOIN loyalty_membership ON customer.customer_id = loyalty_membership.customer_id
JOIN appointment ON customer.customer_id = appointment.customer_id
JOIN payment ON appointment.appointment_id = payment.appointment_id
GROUP BY customer.customer_id;

/* 
Result: 

 Freddie Mercury|65
 David Bowie|50
 Elvis Presley|65
 Bob Dylan|65
 John Lennon|50
 Paul McCartney|65
 Mick Jagger|65
 Keith Richards|50
 George Harrison|65
 Bruce Springsteen|65
 Billy Joel|50
 Stevie Wonder|65
 Phil Collins|65
 Eric Clapton|50
 John Bon Jovi|65
 Kurt Cobain|65
 Eddie Vedder|50
 Anthony Kiedis|65
 Bono|65
 Robert Plant|55
 Roger Daltrey|35
 Pete Townshend|45
 Steve Perry|40
 Axl Rose|35
 Ozzy Osbourne|45

*/


/* 
QUERY 3:

Give the name and average rating of services with an average greater than 3.					
*/

SELECT service.name, AVG(feedback.rating) AS average_rating
FROM service
LEFT JOIN appointment ON service.service_id = appointment.service_id
LEFT JOIN feedback ON appointment.appointment_id = feedback.appointment_id
GROUP BY service.service_id
HAVING AVG(feedback.rating) > 3;

/* 
Result:

Haircut|3.04347826086957
Beard Trim|3.1304347826087
Shave|3.25

*/ 


/* 
QUERY 4:

Give the customers with the highest loyalty points.
*/

SELECT customer.name, loyalty_membership.points
FROM customer
JOIN loyalty_membership ON customer.customer_id = loyalty_membership.customer_id
WHERE loyalty_membership.points >= (
  SELECT MAX(points)
  FROM loyalty_membership
  WHERE customer_id != customer.customer_id
);

/* 
Result: 

Freddie Mercury|300
David Bowie|300
Elvis Presley|300
Bob Dylan|300

*/

/* 
QUERY 5:

Give the barbers and the most appointments for each service. 
*/ 

SELECT service.name, barber.name, COUNT(*) AS num_appointments
FROM service
JOIN appointment ON service.service_id = appointment.service_id
JOIN barber ON appointment.barber_id = barber.barber_id
GROUP BY service.name, barber.barber_id
HAVING COUNT(*) = (
  SELECT MAX(counts.num_appointments)
  FROM (
    SELECT appointment.service_id, appointment.barber_id, COUNT(*) AS num_appointments
    FROM appointment
    GROUP BY appointment.service_id, appointment.barber_id
  ) AS counts
  WHERE counts.service_id = service.service_id AND counts.barber_id = barber.barber_id
);

/* 
Result: 

 Beard Trim|John Lennon|6
 Beard Trim|Paul McCartney|6
 Beard Trim|George Harrison|5
 Beard Trim|Ringo Starr|6
 Haircut|John Lennon|6
 Haircut|Paul McCartney|6
 Haircut|George Harrison|6
 Haircut|Ringo Starr|5
 Shave|John Lennon|7
 Shave|Paul McCartney|5
 Shave|George Harrison|6
 Shave|Ringo Starr|6

 */
 

 /* 
QUERY 6:

Give the average number of appointments made in all:
*/

SELECT service.name, barber.name, COUNT(*) AS num_appointments
FROM service
JOIN appointment ON service.service_id = appointment.service_id
JOIN barber ON appointment.barber_id = barber.barber_id
GROUP BY service.name, barber.barber_id
HAVING COUNT(*) = (
  SELECT MAX(counts.num_appointments)
  FROM (
    SELECT appointment.service_id, appointment.barber_id, COUNT(*) AS num_appointments
    FROM appointment
    GROUP BY appointment.service_id, appointment.barber_id
  ) AS counts
  WHERE counts.service_id = service.service_id AND counts.barber_id = barber.barber_id
);

/* 
Result:

2.8 

*/
