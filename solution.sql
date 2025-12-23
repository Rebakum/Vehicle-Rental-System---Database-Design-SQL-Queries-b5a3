--create database

create database vehicle_rental_db
  -------------------------------------
  -------------------------------------
  -- create Users table
 create table users(
  user_id serial primary key,
  name varchar(100) not null,
  email varchar(100) not null unique,
  password varchar(100) not null,
  phone varchar(20) not null,
  role varchar(20) not null
  check (role in ('Admin', 'Customer'))
  )
----------------------------------
  --Insert users data 
  -- CREATE EXTENSION IF NOT EXISTS pgcrypto;
create extension if not exists pgcrypto;

insert into users(
  name, email, password,phone,role
)
values
  ('Alice', 'alice@example.com', crypt('12345678', gen_salt('bf', 8)), '1234567890', 'Customer'),
('Bob', 'bob@example.com', crypt('12345678', gen_salt('bf', 8)), '0987654321', 'Admin'),
('Charlie', 'charlie@example.com',  crypt('12345678', gen_salt('bf', 8)), '1122334455', 'Customer')
  ---------------------------------
  select * from users
------------------------------------
-------------------------------------
  
  --create vehicle table
create table vehicles(
  vehicle_id serial primary key,
  name varchar(100) not null,
  type varchar(20) not null check(type in ('car', 'bike', 'truck')),
  model int not null,
  registration_number varchar(50) not null unique,
  rental_price decimal(10, 2) not null,
  status varchar(25) not null check(status in ('available', 'rented', 'maintenance'))
  )
------------------------------------
--Insert Vehicle data
insert into vehicles (name, type, model, registration_number, rental_price, status ) 
values
('Toyota Corolla', 'car', 2022, 'ABC-123', 50, 'available'),
('Honda Civic', 'car', 2021, 'DEF-456', 60, 'rented'),
('Yamaha R15', 'bike', 2023, 'GHI-789', 30, 'available'),
('Ford F-150', 'truck', 2020, 'JKL-012', 100, 'maintenance')
  -----------------------------------------
  select * from vehicles

--------------------------------------------
---------------------------------------------
-- Create table Bookings
create table bookings(
  booking_id serial primary key,
  user_id int not null references users(user_id),
  vehicle_id int not null references vehicles(vehicle_id),
  start_date date not null,
  end_date date not null,
  status varchar(50) not null check(status in ('pending', 'confirmed', 'completed', 'cancelled')),
  total_cost decimal(10,2) not null
 
)
-------------------------------------------------

  ---Insert bookings
insert into bookings(user_id, vehicle_id, start_date, end_date, status, total_cost)
values
  ( 1, 2, '2023-10-01', '2023-10-05', 'completed', 240),
( 1, 2, '2023-11-01', '2023-11-03', 'completed', 120),
( 3, 2, '2023-12-01', '2023-12-02', 'confirmed', 60),
( 1, 1, '2023-12-10', '2023-12-12', 'pending', 100);
----------------------------------------

select * from  bookings


-- Query 1: JOIN Retrieve booking information along with:
-- Customer name
-- Vehicle name
-- Concepts used: INNER JOIN

select bookings.booking_id,
users.name as customer_name,
vehicles.name as vehicle_name,
bookings.start_date,
bookings.end_date,
bookings.status
from bookings
inner join users on bookings.user_id = users.user_id
 inner join vehicles on bookings.vehicle_id = vehicles.vehicle_id
order by booking_id;
---------------------------------------
-- Query 2: EXISTS
-- Find all vehicles that have never been booked.

-- Concepts used: NOT EXISTS

select * from vehicles
where not exists(
    select * from bookings
    where bookings.vehicle_id = vehicles.vehicle_id
    
)
order by vehicle_id asc;
---------------------------------
-- Query 3: WHERE
-- Retrieve all available vehicles of a specific type (e.g. cars).

-- Concepts used: SELECT, WHERE

select * from vehicles
where status = 'available'
and type = 'car'
------------------------------------

-- Query 4: GROUP BY and HAVING
-- Find the total number of bookings for each vehicle and display only those vehicles that have more than 2 bookings.

-- Concepts used: GROUP BY, HAVING, COUNT

select vehicles.name as vehicle_name,
  count(*) as total_booking from bookings
join vehicles on bookings.vehicle_id = vehicles.vehicle_id
group by vehicles.name
having count(bookings.booking_id)>2
----------------------------

