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
	department_id 		INT AUTO_INCREMENT PRIMARY KEY,
	department_name 	VARCHAR(100)
);

CREATE TABLE positions
(
	 position_id 	INT AUTO_INCREMENT PRIMARY KEY,
	position_name 	ENUM("Dev","Test","Srum Master","PM")
);

CREATE TABLE accounts
(
	account_id 		INT AUTO_INCREMENT PRIMARY KEY,
	email			VARCHAR (50),
    username 		VARCHAR (100),
    fullname		VARCHAR (100),
    department_id 	INT,
    position_id 	INT,
    create_date 	DATE
);

CREATE TABLE `groups`
(
	group_id 	INT AUTO_INCREMENT PRIMARY KEY,
	group_name 	VARCHAR (100),
    creator_id 	INT,
    create_date DATE
);

CREATE TABLE group_accounts
(
	group_id 	INT,
	account_id 	INT,
	join_date 	DATE,
    PRIMARY KEY(group_id, account_id)
);

CREATE TABLE type_questions
(
	type_id 	INT AUTO_INCREMENT PRIMARY KEY,
	type_name 	ENUM("essay","multiple_choice")
);

CREATE TABLE category_questions
(
	category_id 	INT AUTO_INCREMENT PRIMARY KEY,
	category_name 	VARCHAR(100)
);

CREATE TABLE questions
(
	question_id 	INT AUTO_INCREMENT PRIMARY KEY,
	content			TEXT,
    category_id 	INT,
    type_id 		INT,
    creator_id 		INT,
    create_date 	DATE
);

CREATE TABLE answers
(
	answer_id 		INT AUTO_INCREMENT PRIMARY KEY,
    content			TEXT,
    question_id 	INT,
	iscorrect		BINARY
);

CREATE TABLE exams
(
	exam_id 			INT AUTO_INCREMENT PRIMARY KEY,
	`code`				CHAR(10),
    title 				VARCHAR(200),
    category_id 		INT,
    duration 			INT,
    creator_id 			INT,
    createdate 			DATE
);

CREATE TABLE exam_questions
(
	exam_id 		INT,
	question_id 	INT,
	PRIMARY KEY(exam_id,question_id)
);

SELECT * FROM exam_questions;
SELECT * FROM departments;


