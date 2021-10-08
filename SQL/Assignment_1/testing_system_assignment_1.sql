CREATE DATABASE IF NOT EXISTS testing_system;
USE testing_system;

DROP TABLE IF EXISTS departments,
	positions,
    accounts,
    `groups`,
    group_accounts,
    type_questions,
    category_questions,
    questions,
    answers,
    exams,
    exam_questions
    ;
CREATE TABLE departments
(
	department_id 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- SIGNED -128 -> 127, UNSIGNED 0 - 255 
	department_name 	VARCHAR(100) NOT NULL
);

CREATE TABLE positions
(
	 position_id 	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	position_name 	ENUM("Dev","Test","Srum Master", "PM") DEFAULT "Dev"
);

CREATE TABLE accounts
(
	account_id 		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	email			VARCHAR (50) UNIQUE NOT NULL,
    username 		VARCHAR (100) UNIQUE NOT NULL,
    fullname		VARCHAR (100) NOT NULL,
    gender 			BIT DEFAULT 1,
    department_id 	TINYINT UNSIGNED,
    position_id 	TINYINT UNSIGNED,
    create_date 	DATE
);

CREATE TABLE `groups`
(
	group_id 	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	group_name 	VARCHAR (100) NOT NULL,
    creator_id 	INT UNSIGNED,
    create_date DATE
);

CREATE TABLE group_accounts
(
	group_id 	TINYINT UNSIGNED,
	account_id 	INT UNSIGNED,
	join_date 	DATE,
    PRIMARY KEY(group_id, account_id)
);

CREATE TABLE type_questions
(
	type_id 	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	type_name 	ENUM("essay","multiple_choice") DEFAULT "multiple_choice"
);

CREATE TABLE category_questions
(
	category_id 	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	category_name 	VARCHAR(100) NOT NULL
);

CREATE TABLE questions
(
	question_id 	INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	content			TEXT,
    category_id 	TINYINT UNSIGNED,
    type_id 		TINYINT UNSIGNED,
    creator_id 		INT UNSIGNED,
    create_date 	DATE
);

CREATE TABLE answers
(
	answer_id 		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    content			TEXT,
    question_id 	INT UNSIGNED,
	iscorrect		BIT DEFAULT 1
);

CREATE TABLE exams
(
	exam_id 			INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	`code`				CHAR(10) UNIQUE NOT NULL,
    title 				VARCHAR(200) NOT NULL,
    category_id 		TINYINT UNSIGNED,
    duration 			TINYINT UNSIGNED,
    creator_id 			INT UNSIGNED,
    createdate 			DATE
);

CREATE TABLE exam_questions
(
	exam_id 		INT UNSIGNED,
	question_id 	INT UNSIGNED,
	PRIMARY KEY(exam_id,question_id)
);




