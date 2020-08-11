DROP DATABASE IF EXISTS pick;

CREATE DATABASE IF NOT EXISTS pick;

USE pick;

-- DROP SQL
DROP TABLE IF EXISTS club;
DROP TABLE IF EXISTS class;
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS teacher;
DROP TABLE IF EXISTS activity;
DROP TABLE IF EXISTS changed_teacher;
DROP TABLE IF EXISTS prior_absence;
DROP TABLE IF EXISTS admin;


-- MAIN TABLE CONFIGURATION
-- 동아리 테이블
CREATE TABLE IF NOT EXISTS club (
    name 		VARCHAR(20) 	NOT NULL,
    floor 		INT(1) 			NOT NULL,
    location 	VARCHAR(20) 	NOT NULL,
    priority 	INT(11) 		NOT NULL,

    PRIMARY KEY (name)
);

-- 교실 테이블
CREATE TABLE IF NOT EXISTS class (
	name 		VARCHAR(20) 	NOT NULL,
    floor 		INT(1) 			NOT NULL,

    PRIMARY KEY (name)
);

-- 학생 테이블
CREATE TABLE IF NOT EXISTS student (
    num 		CHAR(4) 		NOT NULL,
    name 		VARCHAR(12) 	NOT NULL,
    club_name 	VARCHAR(20) 	NOT NULL,
    class_name 	VARCHAR(20) 	NOT NULL,
    
    FOREIGN KEY (club_name) 	REFERENCES club(name) 	ON UPDATE CASCADE,
    FOREIGN KEY (class_name) 	REFERENCES class(name) 	ON UPDATE CASCADE,
    
    PRIMARY KEY (num)
);

-- 선생님(감독자) 테이블
CREATE TABLE IF NOT EXISTS teacher (
	id 		VARCHAR(16) 	NOT NULL,
    pw 		CHAR(128) 	NOT NULL,
    name 	VARCHAR(12) 	NOT NULL,
    token	VARCHAR(200),
    
    PRIMARY KEY (id)
);

-- 날짜 테이블 ( 특정 날짜에 어떤 선생님이 무슨 일을 하는지 )
CREATE TABLE IF NOT EXISTS activity (
	date 					DATE 			NOT NULL,
    schedule 				VARCHAR(28) 	NOT NULL,
    second_floor_teacher_id 	VARCHAR(16) 	NULL,
    third_floor_teacher_id 	VARCHAR(16) 	NULL,
    forth_floor_teacher_id 	VARCHAR(16) 	NULL,
    
    FOREIGN KEY (second_floor_teacher_id) 		REFERENCES teacher(id) ON UPDATE CASCADE,
    FOREIGN KEY (third_floor_teacher_id) 	REFERENCES teacher(id) ON UPDATE CASCADE,
    FOREIGN KEY (forth_floor_teacher_id) 	REFERENCES teacher(id) ON UPDATE CASCADE,
    
    PRIMARY KEY (date)
);

-- 출석 테이블 ( 메인 기능 , activity + teacher + student )
CREATE TABLE IF NOT EXISTS attendence (
    date 			DATE 			NOT NULL,
	teacher_id 		VARCHAR(16) 	NOT NULL,
    student_num 	CHAR(4) 		NOT NULL,
    period 			INT(11) 		NOT NULL,
    
    state 			CHAR(4) 		NOT NULL,
    content 		VARCHAR(40),
    
    FOREIGN KEY (date) 			REFERENCES activity(date) 	ON UPDATE CASCADE,
    FOREIGN KEY (teacher_id) 	REFERENCES teacher(id) 		ON UPDATE CASCADE,
    FOREIGN KEY (student_num) 	REFERENCES student(num) 	ON UPDATE CASCADE,
    
    PRIMARY KEY (
		date,
        teacher_id,
        student_num,
        period
	)
);

-- 변경된 선생님 목록 테이블 ( 임시 테이블 )
CREATE TABLE IF NOT EXISTS changed_teacher (
	id 		VARCHAR(16) NOT NULL,
    date 	DATE 		NOT NULL,
    
    FOREIGN KEY (id) 	REFERENCES teacher(id) 		ON UPDATE CASCADE,
    FOREIGN KEY (date) 	REFERENCES activity(date) 	ON UPDATE CASCADE
);

-- 사전 결석 테이블 ( activity{2} + student )
CREATE TABLE IF NOT EXISTS prior_absence (
	id 				INT(11) 	NOT NULL AUTO_INCREMENT,
	start_date 		DATE 		NOT NULL,
    end_date 		DATE 		NOT NULL,
    student_num 	CHAR(4) 	NOT NULL,
    start_period 	INT(11) 	NOT NULL,
    end_period 		INT(11) 	NOT NULL,
    
    FOREIGN KEY (start_date) 	REFERENCES activity(date) 	ON UPDATE CASCADE,
    FOREIGN KEY (end_date) 		REFERENCES activity(date) 	ON UPDATE CASCADE,
    FOREIGN KEY (student_num) 	REFERENCES student(num) 	ON UPDATE CASCADE,
    
    PRIMARY KEY (id)
);

-- 어드민 테이블
CREATE TABLE IF NOT EXISTS admin (
	id VARCHAR(16) NOT NULL,
    pw VARCHAR(80) NOT NULL,
    
    PRIMARY KEY (id)
)