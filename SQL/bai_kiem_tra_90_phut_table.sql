CREATE DATABASE IF NOT EXISTS testing_exam;
USE testing_exam;

DROP TABLE IF EXISTS 	customer,
						`order`,
						car
							;
CREATE TABLE customer
(
	customer_id 		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
	`name` 				VARCHAR(100) NOT NULL,
    phone  				VARCHAR(11) NOT NULL,
    email 				VARCHAR (50) UNIQUE NOT NULL,
    address 			VARCHAR(100) NOT NULL,
    note 				TEXT
 );


CREATE TABLE car
(
car_id 		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
maker 		ENUM ("HONDA", "TOYOTA", "NISSAN"),
model 		VARCHAR(100) NOT NULL,
`year`		DATE,
color 		VARCHAR(100) NOT NULL,
note 		TEXT
);

CREATE TABLE `order`
(
	order_id 			INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	customer_id 		INT UNSIGNED,
    car_id 				INT UNSIGNED,
    amount				INT default 1,
    saleprice 			INT,
    orderdate 			DATE,
    deliverydate	 	DATE,
    deliveryaddress 	VARCHAR(100) NOT NULL,
    `status` 			ENUM ("0", "1", "2"),
	note 				TEXT,
	FOREIGN KEY(customer_id) REFERENCES customer (customer_id),
    FOREIGN KEY (car_id) REFERENCES  car(car_id)
	);


