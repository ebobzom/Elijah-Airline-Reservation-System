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

insert into reservation(
user_id, flight_id, created_date, status, seat_id)
VALUES(1, 1, now(), 'booked', 1);

select * from reservation;

insert into flight_schedule(
schedule_id,
flight_id,
departure_date,
departure_time,
gate,
status,
fare_price,
created_date
) VALUES(1, 1, '2020-03-12', '11:00', 22, 'DELAYED', 19234.2345, now());

drop table users;
drop table flight_schedule;
drop table airport;
drop table airline;
drop table flight;
drop table seats;

insert into users(first_name, last_name, middle_name, date_of_birth, created_date, email, password, contact_address)
VALUES('elijah', 'bobzom', 'dinko', '1990-01-27', now(), 'ebobzom@gmail.com', '123456', 'No 12 Turaki Street Zaria');

insert into airport(airport_name, airport_address, airport_code, created_date)
VALUES('Aminu Kano', 'kano', 'BNZ08', now());

insert into airline(airline_name, airline_code, created_date)
VALUES('Arik', 'KSZ08', now());

insert into flight(
departure_airport_id, 
arrival_airport_id,
flight_code,
economy_class_capacity,
bussiness_class_capacity,
duration,
airline_id
) VALUES(
1, 1, 'BNSR5', 50, 80, '2HRS',1
);

insert into seats(seat_number, seat_class, flight_id) 
VALUES(1, 'economy', 1);

select * from airport;
select * from airline;
SELECT * FROM flight;
SELECT * FROM seats;
select * from flight_schedule;

DELETE FROM users where user_id = 1;
SELECT * FROM users;