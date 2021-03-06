create database Automobile

use Automobile

create table cars_for_sale (
    cars_for_sale_id int,
	manufacturers_id int,
    model_code int,
    vehicle_categories_code int,
	asking_price int,
	registration_yearr int,
	constraint pk_cars_for_sale primary key (cars_for_sale_id),
    constraint fk_cars_for_sale foreign key(model_code) references car_models(model_code),
    constraint fk_cars_for_sale2 foreign key (manufacturers_id) references car_manufacturers(manufacturers_id),
	constraint fk_cars_for_sale3 foreign key(vehicle_categories_code) references vehicle_categories(vehicle_categories_code)
);


create table car_models(
	model_code int,
	manufacturer_code int,
    model_name varchar(50),
	model_description text,
	constraint pk_car_models primary key(model_code),	
);


create table car_manufacturers(                                                                                                                     
	manufacturers_id int,
	manufacturers_fullname varchar(50),
	manufacturers_otherdetails text,
	constraint pk_car_manufacturers primary key(manufacturers_id),
);


create table vehicle_categories(
	vehicle_categories_code int,
	vehicle_categorie_description text,
	constraint pk_vehicle_categories primary key(vehicle_categories_code),
);


create table car_features(
	car_feature_id int,
	car_feature_description text,
	constraint pk_car_features primary key(car_feature_id),
);


create table features_on_cars_for_sale(
	cars_for_sale_id int,
	car_feature_id int,
	constraint pk_features_on_cars_for_sale primary key(cars_for_sale_id,car_feature_id),
	constraint fk_features_on_cars_for_sale foreign key (cars_for_sale_id) references cars_for_sale(cars_for_sale_id),
	constraint fk_features_on_cars_for_sale2 foreign key (car_feature_id) references car_features(car_feature_id),
);


create table customers(
	customer_id int,
	cell_mobile_phone int,
	email_address varchar(50),
	other_customer_details varchar(100),
	constraint pk_customers primary key(customer_id),
);


create table customer_preferences(
	customer_preferences_ID int,
	car_feature_id int,
	customer_id int,
	customer_preference_details text,
	constraint pk_customer_preferences primary key(customer_preferences_id),
	constraint fk_customer_preferences foreign key (car_feature_id) references car_features(car_feature_id),
	constraint fk_customer_preferences2 foreign key (customer_id) references customers(customer_id),
);


create table addresses(
	address_id int,
	customer_id int,
	address_line varchar(50),
    town_city varchar(50),
    country varchar(50),
    post_zip_code tinyint,
	constraint pk_addresses primary key(address_id),
	constraint fk_addresses foreign key(customer_id) references customers(customer_id),
);


create table payment_status(
	payment_status_code int,
	payment_status_description text,
	constraint pk_payment_status primary key(payment_status_code),
);


create table customer_payments(
	customer_payment_id int,
	car_sold_id int,
	customer_id int,
	payment_status_code int,	
	customer_payment_date varchar(50),
	actual_payment_amount int,
	constraint pk_customer_payments primary key(customer_payment_id),
    constraint fk_customer_payments2 foreign key (customer_id) references customers(customer_id),
	constraint fk_customer_payments3 foreign key(payment_status_code) references payment_status(payment_status_code),
);


insert into cars_for_sale(cars_for_sale_id, manufacturers_id, model_code, vehicle_categories_code, asking_price, registration_yearr)
values 
('1024 ',' 123 ',' 1914 ',' 23233 ',' 8000000 ',' 2016'),
('1025 ',' 124 ',' 1213 ',' 12121 ',' 3000000 ',' 2011'),
('1027 ',' 125 ',' 1344 ',' 12122 ',' 2000000 ',' 2012'),
('1028 ',' 126 ',' 1533 ',' 44434 ',' 6000000 ',' 2019'),
('1026 ',' 127 ',' 1648 ',' 34344 ',' 4000000 ',' 2011');

select * from [dbo].[cars_for_sale]


insert into car_models(model_code, manufacturer_code, model_name, model_description) 
values
('1914 ',' 16 ',' Giulia ',' An emotional, hot-blooded Italian car like the Giulia is sure get pulses racing in the usual entry-luxury crowd. A 280-hp 2.0-liter turbo four with an eight-speed automatic and rear-wheel drive are standard; all-wheel drive is optional. Leather seats, a dual exhaust, and a sporty flat-bottomed steering wheel with integrated push-button start also come standard. A 6.5-inch or optional 8.8-inch touchscreen provide connectivity; high-tech features like adaptive cruise control are also available.'),
('1213 ',' 19 ','Bugatti Veyron ',' Bugatti is sure get pulses racing in the usual entry-luxury crowd. A 280-hp 2.0-liter turbo four with an eight-speed automatic and rear-wheel drive are standard; all-wheel drive is optional. Leather seats, a dual exhaust, and a sporty flat-bottomed steering wheel with integrated push-button start also come standard. A 6.5-inch or optional 8.8-inch touchscreen provide connectivity; high-tech features like adaptive cruise control are also available.'),
('1344 ',' 16 ',' BMW ',' BMW is sure get pulses racing in the usual entry-luxury crowd. A 280-hp 2.0-liter turbo four with an eight-speed automatic and rear-wheel drive are standard; all-wheel drive is optional. Leather seats, a dual exhaust, and a sporty flat-bottomed steering wheel with integrated push-button start also come standard. A 6.5-inch or optional 8.8-inch touchscreen provide connectivity; high-tech features like adaptive cruise control are also available.'),
('1533 ',' 19 ',' SUZUKI ',' SUZUKI is sure get pulses racing in the usual entry-luxury crowd. A 280-hp 2.0-liter turbo four with an eight-speed automatic and rear-wheel drive are standard; all-wheel drive is optional. Leather seats, a dual exhaust, and a sporty flat-bottomed steering wheel with integrated push-button start also come standard. A 6.5-inch or optional 8.8-inch touchscreen provide connectivity; high-tech features like adaptive cruise control are also available.'),
('1648 ',' 18 ',' Audi ',' Audi is sure get pulses racing in the usual entry-luxury crowd. A 280-hp 2.0-liter turbo four with an eight-speed automatic and rear-wheel drive are standard; all-wheel drive is optional. Leather seats, a dual exhaust, and a sporty flat-bottomed steering wheel with integrated push-button start also come standard. A 5.5-inch or optional 9.8-inch touchscreen provide connectivity; high-tech features like adaptive cruise control are also available.');

select * from [dbo].[car_models]


insert into car_manufacturers(manufacturers_id, manufacturers_fullname, manufacturers_otherdetails)
values
('123 ',' sourav paul ',' buisinessman'),
('124 ',' ahad riyal ',' teacher'),
('125 ',' nahid hossain ',' buisinessman'),
('126 ',' rayhan rohan ',' buisinessman'),
('127 ',' nime molla ',' teacher');

select * from [dbo].[car_manufacturers]


insert into vehicle_categories(vehicle_categories_code, vehicle_categorie_description)
values
('23233 ','  most high speed car'),
('12121 ','  most smoth car'),
('12122 ','  classic car'),
('44434 ','  smart car'),
('34344 ','  luxurious car');

select * from[dbo].[vehicle_categories]


insert into car_features(car_feature_id, car_feature_description)
values
('21692 ',' 2016-12-27 12:00:00'),
('51892 ',' 2016-12-27 12:00:00'),
('71910 ',' 2016-12-27 12:00:00'),
('82092 ',' 2016-12-28 12:00:00'),
('12169 ',' 2016-12-28 12:00:00');

select * from [dbo].[car_features]


insert into features_on_cars_for_sale(cars_for_sale_id, car_feature_id)
values 
('1024 ',' 21692'),
('1025 ',' 51892'),
('1027 ',' 71910'),
('1028 ',' 82092'),
('1026 ',' 12169');

select * from [dbo].[features_on_cars_for_sale]


insert into customers(customer_id, cell_mobile_phone, email_address, other_customer_details)
values
('610512 ',' 01783536875 ',' mafi@admin.com ',' buisinessman'),
('775512 ',' 01983536875 ',' employee@employee.com ',' buisinessman'),
('135402 ',' 01797436875 ',' kanti@das.com ',' buisinessman'),
('175512 ',' 01883536875 ',' sagor@employee.com ',' buisinessman'),
('275512 ',' 01989336875 ',' sabuj@employee.com ',' buisinessman');

select * from [dbo].[customers]


insert into customer_preferences(customer_preferences_ID, car_feature_id, customer_id, customer_preference_details)
values 
('17946 ',' 21692 ',' 610512 ',' buisinessman'),
('17956 ',' 51892 ',' 775512 ',' buisinessman'),
('17966 ',' 71910 ',' 135402 ',' buisinessman'),
('17977 ',' 71910 ',' 175512 ',' buisinessman'),
('17988 ',' 71910 ',' 275512 ',' buisinessman');

select * from [dbo].[customer_preferences]


insert into addresses(address_id, customer_id, address_line, town_city, country, post_zip_code)
values 
('6567 ',' 610512 ',' 20_01_30 ',' bikrampur ',' bangladesh ',' 55'),
('8754 ',' 775512 ',' 37_06_10 ',' barisal ',' bangladesh ',' 66'),
('4567 ',' 135402 ',' 67_56_30 ',' cumilla ',' bangladesh ',' 77'),
('8756 ',' 175512 ',' 20_76_90 ',' gazipur ',' bangladesh ',' 22'),
('5654 ',' 275512 ',' 76_08_76 ',' thakurgaon ',' bangladesh ',' 99');

select * from [dbo].[addresses]


insert into payment_status(payment_status_code, payment_status_description)
values 
('56484623 ',' paid'),
('56484633 ',' not paid'),
('56484644 ',' paid'),
('56484655 ',' paid'),
('56484666 ',' paid');

select * from [dbo].[payment_status]


insert into customer_payments(customer_payment_id, car_sold_id, customer_id, payment_status_code, customer_payment_date, actual_payment_amount)
values 
('17201001 ',' 476582 ',' 610512 ',' 56484623 ',' 11-04-09 ',' 2000000'),
('17201002 ',' 476583 ',' 775512 ',' 56484633 ',' 03-05-09 ',' 6000000'),
('17201003 ',' 476584 ',' 135402 ',' 56484644 ',' 07-16-10 ',' 4000000'),
('17201004 ',' 476585 ',' 175512 ',' 56484655 ',' 09-12-11 ',' 5500000'),
('17201005 ',' 476586 ',' 275512 ',' 56484666 ',' 12-04-12 ',' 9000000');

select * from [dbo].[customer_payments]

select avg(actual_payment_amount) as avg_amount from customer_payments
select * from customer_payments where actual_payment_amount>4000000
select * from cars_for_sale where registration_yearr>2017
select MIN(actual_payment_amount) as min_price from customer_payments
select Max(actual_payment_amount) as max_price from customer_payments
select Sum(actual_payment_amount) as Total_sale from customer_payments
select count(*) as new_car_count from cars_for_sale where registration_yearr>2015
select model_name from car_models where model_code='1213'
select  manufacturers_fullname from  car_manufacturers

