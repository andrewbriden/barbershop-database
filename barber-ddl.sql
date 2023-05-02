/**************************************************

File: barber-ddl.sql
Author: Andrew Briden
Description: DDL SQL file barbershop.db 
Date: 05/01/23

**************************************************/

DROP TABLE IF EXISTS barber;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS appointment;
DROP TABLE IF EXISTS service;
DROP TABLE IF EXISTS payment;
DROP TABLE IF EXISTS feedback;
DROP TABLE IF EXISTS loyalty_membership;

CREATE TABLE barber (
  barber_id INT PRIMARY KEY,
  name VARCHAR(50)
);

CREATE TABLE customer (
  customer_id INT PRIMARY KEY,
  name VARCHAR(50),
  email VARCHAR(50),
  phone VARCHAR(20)
);

CREATE TABLE appointment (
  appointment_id INT PRIMARY KEY,
  appointment_date DATE,
  appointment_time TIME,
  customer_id INT,
  barber_id INT,
  service_id INT,
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  FOREIGN KEY (barber_id) REFERENCES barber(barber_id),
  FOREIGN KEY (service_id) REFERENCES service(service_id)
);

CREATE TABLE service (
  service_id INT PRIMARY KEY,
  name VARCHAR(50),
  price DECIMAL(10, 2)
);

CREATE TABLE payment (
  payment_id INT PRIMARY KEY,
  amount DECIMAL(10, 2),
  type VARCHAR(50),
  appointment_id INT,
  FOREIGN KEY (appointment_id) REFERENCES appointment(appointment_id)
);

CREATE TABLE feedback (
  feedback_id INT PRIMARY KEY,
  rating INT,
  comment VARCHAR(255),
  appointment_id INT,
  FOREIGN KEY (appointment_id) REFERENCES appointment(appointment_id)
);


CREATE TABLE loyalty_membership (
  customer_id INT,
  start_date DATE,
  points INT,
  PRIMARY KEY (customer_id, start_date),
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);
