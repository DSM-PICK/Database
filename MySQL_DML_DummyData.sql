use testdb_saturn;

DELETE FROM attendance;
DELETE FROM pre_absence;
DELETE FROM activity;
DELETE FROM student;
DELETE FROM class;
DELETE FROM club;
DELETE FROM club_location;
DELETE FROM teacher;

INSERT INTO teacher(id, pw, name) VALUES('aaa@gmail.com', 'd6f644b19812e97b5d871658d6d3400ecd4787faeb9b8990c1e7608288664be77257104a58d033bcf1a0e0945ff06468ebe53e2dff36e248424c7273117dac09', '김정은');
INSERT INTO teacher(id, pw, name) VALUES('bbb@gmail.com', '5edc1c6a4390075a3ca27f4d4161c46b374b1c3b2d63f846db6fff0c513203c3ac3b14a24a6f09d8bf21407a4842113b5d9aa359d266299c3d6cf9e92db66dbe', '안소희');
INSERT INTO teacher(id, pw, name) VALUES('ccc@gmail.com', '2b83283b8caf7e952ad6b0443a87cd9ee263bc32c4d78c5b678ac03556175059679b4b8513b021b16a27f6d2a35484703129129f35b6cdfe418ef6473b1f8f23', '조규석');
INSERT INTO teacher(id, pw, name) VALUES('ddd@gmail.com', '3ba2942ed1d05551d4360a2a7bb6298c2359061dc07b368949bd3fb7feca3344221257672d772ce456075b7cfa50fd7ce41eaefe529d056bf23dd665de668b78', '안희명');
INSERT INTO teacher(id, pw, name) VALUES('eee@gmail.com', '4e83a3339059f0cc30910ae3ca1d01d854a0fefd2f277776e044daad540bbdd5c79033a1c2eb851dffd258194bd58f5657e93fa21b70b5180e7d0efc60040cd4', '서현철');
INSERT INTO teacher(id, pw, name) VALUES('fff@gmail.com', 'd1d7e84d9049900299ee9c0b2c04b11bfa9a0437afc0bf03d8ce0e3fb8523919f13fa3a5130c5ba7987679c6f6945ca87655e746eb5345bdc8131298fa5a9b20', '엄영석');

INSERT INTO club_location(location, floor, priority) VALUES('2학년 1반', 3, 0);
INSERT INTO club_location(location, floor, priority) VALUES('2학년 2반', 3, 1);
INSERT INTO club_location(location, floor, priority) VALUES('2학년 3반', 3, 2);
INSERT INTO club_location(location, floor, priority) VALUES('2학년 4반', 3, 3);
INSERT INTO club_location(location, floor, priority) VALUES('정보보안 2실', 3, 4);
INSERT INTO club_location(location, floor, priority) VALUES('정보보안 1실', 3, 5);

INSERT INTO club(name, location, teacher, club_head) VALUES('DMS', '2학년 1반', 'aaa', '공영길');		-- 김정은쌤
INSERT INTO club(name, location, teacher, club_head) VALUES('시나브로', '2학년 2반', 'bbb', '누구노');	-- 안소희쌤
INSERT INTO club(name, location, teacher, club_head) VALUES('GRAM', '2학년 3반', 'ccc', '김민석');		-- 조규석쌤
INSERT INTO club(name, location, teacher, club_head) VALUES('EntryDSM', '2학년 4반', 'ddd', '정우영');	-- 안희명쌤
INSERT INTO club(name, location, teacher, club_head) VALUES('UP', '정보보안 2실', 'eee', '손정우');		-- 서현철쌤
INSERT INTO club(name, location, teacher, club_head) VALUES('INFO', '정보보안 1실', 'fff', '누구노');	-- 엄영석쌤

INSERT INTO class(name, floor, priority) VALUES('1학년 1반', 4, 0);
INSERT INTO class(name, floor, priority) VALUES('1학년 2반', 4, 1);
INSERT INTO class(name, floor, priority) VALUES('1학년 3반', 4, 2);
INSERT INTO class(name, floor, priority) VALUES('1학년 4반', 4, 3);
INSERT INTO class(name, floor, priority) VALUES('2학년 1반', 3, 0);
INSERT INTO class(name, floor, priority) VALUES('2학년 2반', 3, 1);
INSERT INTO class(name, floor, priority) VALUES('2학년 3반', 3, 2);
INSERT INTO class(name, floor, priority) VALUES('2학년 4반', 3, 3);
INSERT INTO class(name, floor, priority) VALUES('3학년 1반', 2, 0);
INSERT INTO class(name, floor, priority) VALUES('3학년 2반', 2, 1);
INSERT INTO class(name, floor, priority) VALUES('3학년 3반', 2, 2);
INSERT INTO class(name, floor, priority) VALUES('3학년 4반', 2, 3);

INSERT INTO student(num, name, club_name, class_name) VALUES('2201', '김민석', 'GRAM', '2학년 2반');
INSERT INTO student(num, name, club_name, class_name) VALUES('2202', '공영길', 'DMS', '2학년 2반');
INSERT INTO student(num, name, club_name, class_name) VALUES('2401', '김대웅', 'EntryDSM', '2학년 4반');
INSERT INTO student(num, name, club_name, class_name) VALUES('2411', '손정우', 'UP', '2학년 4반');
INSERT INTO student(num, name, club_name, class_name) VALUES('2415', '유시온', 'UP', '2학년 4반');
INSERT INTO student(num, name, club_name, class_name) VALUES('2417', '이진혁', 'UP', '2학년 4반');
INSERT INTO student(num, name, club_name, class_name) VALUES('2418', '정우영', 'EntryDSM', '2학년 4반');

INSERT INTO activity(date, schedule, second_floor_teacher_id, third_floor_teacher_id, forth_floor_teacher_id) VALUES('2020-10-11', 'club', 'aaa@gmail.com', 'bbb@gmail.com', 'ccc@gmail.com');
INSERT INTO activity(date, schedule, second_floor_teacher_id, third_floor_teacher_id, forth_floor_teacher_id) VALUES('2020-10-12', 'club', 'bbb@gmail.com', 'ccc@gmail.com', 'ddd@gmail.com');
INSERT INTO activity(date, schedule, second_floor_teacher_id, third_floor_teacher_id, forth_floor_teacher_id) VALUES('2020-10-13', 'club', 'ccc@gmail.com', 'ddd@gmail.com', 'eee@gmail.com');
INSERT INTO activity(date, schedule, second_floor_teacher_id, third_floor_teacher_id, forth_floor_teacher_id) VALUES('2020-10-14', 'club', 'ddd@gmail.com', 'eee@gmail.com', 'fff@gmail.com');
INSERT INTO activity(date, schedule, second_floor_teacher_id, third_floor_teacher_id, forth_floor_teacher_id) VALUES('2020-10-15', 'club', 'eee@gmail.com', 'fff@gmail.com', 'aaa@gmail.com');

-- INSERT INTO attendance(date, student_num, period, teacher_id, state) VALUES('2020-10-11', '2417', '8', 'aaa', '출석');
-- INSERT INTO attendance(date, student_num, period, teacher_id, state) VALUES('2020-10-11', '2417', '9', 'aaa', '출석');
-- INSERT INTO attendance(date, student_num, period, teacher_id, state) VALUES('2020-10-11', '2417', '10', 'aaa', '출석');

-- INSERT INTO attendance(date, student_num, period, teacher_id, state) VALUES('2020-10-11', '2415', '8', 'aaa', '출석');
-- INSERT INTO attendance(date, student_num, period, teacher_id, state) VALUES('2020-10-11', '2415', '9', 'aaa', '출석');
-- INSERT INTO attendance(date, student_num, period, teacher_id, state) VALUES('2020-10-11', '2415', '10', 'aaa', '출석');

INSERT INTO pre_absence(teacher_id, start_date, end_date, student_num, start_period, end_period, state) values('aaa@gmail.com', '2020-10-10', '2020-10-20', '2417', 1, 10, '현체');
INSERT INTO pre_absence(teacher_id, start_date, end_date, student_num, start_period, end_period, state) values('aaa@gmail.com', '2020-10-12', '2020-10-12', '2415', 7, 7, '공결');
INSERT INTO pre_absence(teacher_id, start_date, end_date, student_num, start_period, end_period, state) values('aaa@gmail.com', '2020-10-12', '2020-10-13', '2411', 1, 10, '외출');

select * from teacher;