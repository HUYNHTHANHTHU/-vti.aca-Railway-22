CREATE DATABASE IF NOT EXISTS testing_exam;
USE testing_exam;

DROP TABLE IF EXISTS customer,
	`order`,
    car
		;
CREATE TABLE customer
(
	customer_id 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
	`name` 	VARCHAR(100) NOT NULL,
    phone  INT,
    email VARCHAR (50) UNIQUE NOT NULL,
    address VARCHAR(100) NOT NULL,
    note TEXT
);

CREATE TABLE `order`
(
	order_id 	INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	customer_id 	INT UNSIGNED AUTO_INCREMENT,
    carid 			INT,
    amount		INT default 1,
    saleprice INT,
    orderdate DATE,
    deliverydate DATE,
    deliveryaddress VARCHAR(100) NOT NULL,
    `status` ENUM ("order_ing", "order_already", "ware_house"),
	note TEXT,
        PRIMARY KEY(account_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE car
(
car_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
maker ENUM ("HONDA", "TOYOTA", "NISSAN"),
model VARCHAR(100) NOT NULL,
`year` DATE,
color VARCHAR(100) NOT NULL,
note TEXT,
FOREIGN KEY (car_id) REFERENCES `order`(car_id)
);

CREATE TABLE car_order
(
	order_id 	INT UNSIGNED,
	car_id 	INT UNSIGNED,
	join_date 	DATE,
	PRIMARY KEY(customer_id),
    PRIMARY KEY(order_id, car_id),
    FOREIGN KEY(order_id) REFERENCES `order`(order_id),
    FOREIGN KEY(car_id) REFERENCES car(car_id)
);

