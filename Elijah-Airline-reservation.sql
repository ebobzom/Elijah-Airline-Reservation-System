CREATE DATABASE tiidelab;
USE tiidelab;

CREATE TABLE users(
user_id INT(11) AUTO_INCREMENT PRIMARY KEY NOT NULL,
first_name VARCHAR(22) NOT NULL,
last_name VARCHAR(22) NOT NULL,
middle_name VARCHAR(22),
date_of_birth DATE,
created_date DATETIME,
email VARCHAR(32) UNIQUE NOT NULL,
password VARCHAR(256),
contact_address VARCHAR(256)
);

CREATE TABLE airport(
airport_id INT(11) AUTO_INCREMENT PRIMARY KEY NOT NULL,
airport_name VARCHAR(22) NOT NULL,
airport_address VARCHAR(256) NOT NULL,
airport_code VARCHAR(12),
created_date DATETIME
);

CREATE TABLE airline(
airline_id INT(11) AUTO_INCREMENT PRIMARY KEY NOT NULL,
airline_name VARCHAR(22),
airline_code VARCHAR(22),
created_date DATETIME
);

CREATE TABLE flight(
flight_id INT(11) AUTO_INCREMENT PRIMARY KEY NOT NULL,
departure_airport_id INT(11) NOT NULL,
arrival_airport_id INT(11) NOT NULL,
flight_code VARCHAR(22) NOT NULL,
economy_class_capacity INT(5) NOT NULL,
bussiness_class_capacity INT(5) NOT NULL,
duration VARCHAR(18) NOT NULL,
airline_id INT(11) NOT NULL,
FOREIGN KEY (departure_airport_id) REFERENCES airport(airport_id),
FOREIGN KEY (arrival_airport_id) REFERENCES airport(airport_id),
FOREIGN KEY (airline_id) REFERENCES airline(airline_id)
);

CREATE TABLE seats(
seat_id INT(11) AUTO_INCREMENT PRIMARY KEY NOT NULL,
seat_number INT(5) NOT NULL,
seat_class VARCHAR(15) NOT NULL,
flight_id INT(11) NOT NULL,
FOREIGN KEY (flight_id) REFERENCES flight(flight_id)
);

CREATE TABLE flight_schedule(
schedule_id INT(11) AUTO_INCREMENT PRIMARY KEY NOT NULL,
flight_id INT(11) NOT NULL,
departure_date DATE NOT NULL,
departure_time TIME NOT NULL,
gate VARCHAR(10) NOT NULL,
status VARCHAR(18) NOT NULL,
fare_price DECIMAL(18,2) NOT NULL,
created_date DATETIME NOT NULL,
FOREIGN KEY (flight_id) REFERENCES flight(flight_id)
);

CREATE TABLE reservation(
reservation_id INT(11) AUTO_iNCREMENT PRIMARY KEY NOT NULL,
user_id INT(11) NOT NULL,
flight_id INT(11) NOT NULL,
created_date DATETIME NOT NULL,
status VARCHAR(15) NOT NULL,
seat_id INT(5) NOT NULL,
FOREIGN KEY (user_id) REFERENCES users(user_id),
FOREIGN KEY (flight_id) REFERENCES flight(flight_id),
FOREIGN KEY (seat_id) REFERENCES seats(seat_id)
);

