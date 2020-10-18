DROP DATABASE IF EXISTS pick;

CREATE DATABASE IF NOT EXISTS pick;

USE pick;

-- DROP SQL
DROP TABLE IF EXISTS club;
DROP TABLE IF EXISTS club_location;
DROP TABLE IF EXISTS class;
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS teacher;
DROP TABLE IF EXISTS activity;
DROP TABLE IF EXISTS changed_teacher;
DROP TABLE IF EXISTS prior_absence;
DROP TABLE IF EXISTS admin;
DROP TABLE IF EXISTS attendance;
DROP TABLE IF EXISTS notice;



-- 선생님(감독자) 테이블
CREATE TABLE IF NOT EXISTS teacher (
	id 		VARCHAR(16) 	NOT NULL,
    pw 		CHAR(128) 	NOT NULL,
    name 	VARCHAR(12) 	NOT NULL,
    office	VARCHAR(40)		NOT NULL,
    
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS club_location (
	location VARCHAR(20) NOT NULL,
    floor INT NOT NULL,
    priority INT NOT NULL,
    
    PRIMARY KEY(location)
);

-- MAIN TABLE CONFIGURATION
-- 동아리 테이블
CREATE TABLE IF NOT EXISTS club (
    name 		VARCHAR(20) 	NOT NULL,
    location 	VARCHAR(20) 	NOT NULL	UNIQUE,
    teacher 	VARCHAR(10),
    club_head 	VARCHAR(12),

    PRIMARY KEY (name),
    FOREIGN KEY(location) REFERENCES club_location(location) ON UPDATE CASCADE ON DELETE NO ACTION
);

-- 교실 테이블
CREATE TABLE IF NOT EXISTS class (
	name 		VARCHAR(20) 	NOT NULL,
    floor 		INT(1) 			NOT NULL,
    priority	INT 			NOT NULL,

    PRIMARY KEY (name)
);

-- 학생 테이블
CREATE TABLE IF NOT EXISTS student (
    num 		CHAR(4) 		NOT NULL,
    name 		VARCHAR(12) 	NOT NULL,
    club_name 	VARCHAR(20),
    class_name 	VARCHAR(20) 	NOT NULL,
    
    FOREIGN KEY (club_name) 	REFERENCES club(name) 	ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (class_name) 	REFERENCES class(name) 	ON UPDATE CASCADE,
    
    PRIMARY KEY (num)
);

-- 날짜 테이블 ( 특정 날짜에 어떤 선생님이 무슨 일을 하는지 )
CREATE TABLE IF NOT EXISTS activity (
	date 					DATE 			NOT NULL,
    schedule 				VARCHAR(28) 	NOT NULL,
    second_floor_teacher_id 	VARCHAR(16) 	NULL,
    third_floor_teacher_id 	VARCHAR(16) 	NULL,
    forth_floor_teacher_id 	VARCHAR(16) 	NULL,
    
    FOREIGN KEY (second_floor_teacher_id) 	REFERENCES teacher(id) ON UPDATE CASCADE,
    FOREIGN KEY (third_floor_teacher_id) 	REFERENCES teacher(id) ON UPDATE CASCADE,
    FOREIGN KEY (forth_floor_teacher_id) 	REFERENCES teacher(id) ON UPDATE CASCADE,
    
    PRIMARY KEY (date)
);

-- 출석 테이블 ( 메인 기능 , activity + teacher + student )
CREATE TABLE IF NOT EXISTS attendance (
	id				INT(11)			NOT NULL		AUTO_INCREMENT,
    date 			DATE 			NOT NULL,
    student_num 	CHAR(4) 		NOT NULL,
    period 			INT(11) 		NOT NULL,
    
	teacher_id 		VARCHAR(16) 	NOT NULL,
    state 			CHAR(4) 		NOT NULL,
    
    FOREIGN KEY (date) 			REFERENCES activity(date) 	ON UPDATE CASCADE,
    FOREIGN KEY (student_num) 	REFERENCES student(num) 	ON UPDATE CASCADE,
    FOREIGN KEY (teacher_id)	REFERENCES teacher(id)		ON UPDATE CASCADE,
    
    PRIMARY KEY (id)
);

-- 변경된 선생님 목록 테이블 ( 임시 테이블 )
CREATE TABLE IF NOT EXISTS changed_teacher (
	id 		VARCHAR(16) NOT NULL,
    date 	DATE 		NOT NULL,
    
    FOREIGN KEY (id) 	REFERENCES teacher(id) 		ON UPDATE CASCADE,
    FOREIGN KEY (date) 	REFERENCES activity(date) 	ON UPDATE CASCADE,
    
    PRIMARY KEY(id, date)
);

-- 사전 결석 테이블 ( activity{2} + student + teacher)
CREATE TABLE IF NOT EXISTS pre_absence (
	id 				INT(11) 	NOT NULL AUTO_INCREMENT,
    teacher_id		VARCHAR(16) NOT NULL,
	start_date 		DATE 		NOT NULL,
    end_date 		DATE 		NOT NULL,
    student_num 	CHAR(4) 	NOT NULL,
    start_period 	INT(11) 	NOT NULL,
    end_period 		INT(11) 	NOT NULL,
    state			CHAR(4)		NOT NULL,
    
    FOREIGN KEY (student_num) 	REFERENCES student(num) 	ON UPDATE CASCADE,
    FOREIGN KEY (teacher_id)	REFERENCES teacher(id)		ON UPDATE CASCADE,
    
    PRIMARY KEY (id)
);

-- 어드민 테이블
CREATE TABLE IF NOT EXISTS admin (
	id VARCHAR(16) NOT NULL,
    pw VARCHAR(80) NOT NULL,
    
    PRIMARY KEY (id)
);

-- 공지사항 테이블
CREATE TABLE IF NOT EXISTS notice (
	notice_id INT AUTO_INCREMENT,
    content VARCHAR(100) NOT NULL,
    admin_id VARCHAR(16) NOT NULL,
    category VARCHAR(20) NOT NULL,
    created_at DATETIME NOT NULL,
    
    PRIMARY KEY (notice_id),
    FOREIGN KEY (admin_id) REFERENCES admin(id) ON UPDATE CASCADE ON DELETE NO ACTION
);