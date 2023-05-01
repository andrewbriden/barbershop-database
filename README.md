<h1 align="center">Barbershop Database Project</h1>

## Project Information
* Name: [Andrew Briden]
* Date: [5/01/2023]

## Domain Description
The barbershop database is designed to store information related to a barbershop, especially with a loyal customer-base. While new customers can be added, the database provides the structure to track customer activity and services, while also keeping track of typical barber shop entities, including appointments, barbers, customers, feedback, and loyalty points. The main purpose of this database is to provide more streamlined customer analytics to better improve the experience of customers.

## Entities and Relationships
The Barbershop Database will include several entities, each with unique functions that work together and are related in various ways.

```Barber```: This entity contains the information of what individual barber is working. This will include a unique number identifier and their name.

```Customer```: This entity contains individual customer’s data, including a unique number identifier, name, email, and phone number.

```Appointment```: This entity contains information about each individual appointment being made at the barber shop. It will include the date, time, customer ID, barber ID, and service ID. These unique ID’s allow for quick insights on the barbershop’s activities.

```Service```: This entity contains the services the barbershop provides, with a service ID that allows for a unique identifying categorization, the name, and the price.

```Payment```: This entity holds the individual payment information, including a unique identifying ID, the amount paid, the type of payment, and corresponding appointment ID.
		 	 	 		
```Feedback```: This entity contains information about the feedback for each corresponding appointment. The entities include the feedback ID, rating (between 1-5), comment, and appointment ID.

```Product```: This entity contains information about individual products, including the product ID, name, description, and per-use price.

```Loyalty_membership```: This entity contains information about individual loyalty memberships, including the customer ID, start date, and points. Each loyalty membership is assigned a unique identifier to ensure that its information can be easily tracked and accessed.

## Components
* [DDL File](link)
* [DML Seed File](link)
## Entity-Relationship Diagram 
![Entity-Relationship Diagram](https://github.com/andrewbriden/Barber-Shop-/blob/main/er.png)

## Relational Schema
```
barber(barber_id, name)
customer(customer_id, name, email, phone)
appointment(appointment_id, appointment_date, appointment_time, customer_id, barber_id, service_id)
service(service_id, name, price)
payment(payment_id, amount, type, appointment_id)
feedback(feedback_id, rating, comment, appointment_id)
product(product_id, name, description, per_use_price)
loyalty_membership(customer_id, start_date, points)
```
## Boyce–Codd Normal Form Decomposition 



