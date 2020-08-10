use pick;

DELETE FROM student;
DELETE FROM club;
DELETE FROM class;
DELETE FROM activity;
DELETE FROM attendence;

INSERT INTO club(name, floor, location, priority) VALUES('DMS', 3, '2학년 1반', 0);
INSERT INTO club(name, floor, location, priority) VALUES('시나브로', 3, '2학년 2반', 1);
INSERT INTO club(name, floor, location, priority) VALUES('GRAM', 3, '2학년 3반', 2);
INSERT INTO club(name, floor, location, priority) VALUES('EntryDSM', 3, '2학년 4반', 3);
INSERT INTO club(name, floor, location, priority) VALUES('UP', 3, '정보보안 2실', 4);
INSERT INTO club(name, floor, location, priority) VALUES('INFO', 3, '정보보안 1실', 5);

INSERT INTO class(name, floor) VALUES('1학년 1반', 4);
INSERT INTO class(name, floor) VALUES('1학년 2반', 4);
INSERT INTO class(name, floor) VALUES('1학년 3반', 4);
INSERT INTO class(name, floor) VALUES('1학년 4반', 4);
INSERT INTO class(name, floor) VALUES('2학년 1반', 3);
INSERT INTO class(name, floor) VALUES('2학년 2반', 3);
INSERT INTO class(name, floor) VALUES('2학년 3반', 3);
INSERT INTO class(name, floor) VALUES('2학년 4반', 3);
INSERT INTO class(name, floor) VALUES('3학년 1반', 2);
INSERT INTO class(name, floor) VALUES('3학년 2반', 2);
INSERT INTO class(name, floor) VALUES('3학년 3반', 2);
INSERT INTO class(name, floor) VALUES('3학년 4반', 2);

INSERT INTO student(num, name, club_name, class_name) VALUES('2201', '김민석', 'UP', '2학년 4반');
INSERT INTO student(num, name, club_name, class_name) VALUES('2202', '공영길', 'UP', '2학년 4반');
INSERT INTO student(num, name, club_name, class_name) VALUES('2401', '김대웅', 'UP', '2학년 4반');
INSERT INTO student(num, name, club_name, class_name) VALUES('2411', '손정우', 'UP', '2학년 4반');
INSERT INTO student(num, name, club_name, class_name) VALUES('2415', '유시온', 'UP', '2학년 4반');
INSERT INTO student(num, name, club_name, class_name) VALUES('2417', '이진혁', 'UP', '2학년 4반');

INSERT INTO activity(date, schedule, two_floor_teacher_id, three_floor_teacher_id, four_floor_teacher_id) VALUES('2020-08-10', '동아리', 'root', 'bbb', 'ccc');
INSERT INTO activity(date, schedule, two_floor_teacher_id, three_floor_teacher_id, four_floor_teacher_id) VALUES('2020-08-11', '동아리', 'bbb', 'ccc', 'root');
INSERT INTO activity(date, schedule, two_floor_teacher_id, three_floor_teacher_id, four_floor_teacher_id) VALUES('2020-08-12', '동아리', 'dhwlddjgmanf', 'bbb', 'ccc');
INSERT INTO activity(date, schedule, two_floor_teacher_id, three_floor_teacher_id, four_floor_teacher_id) VALUES('2020-08-13', '동아리', 'bbb', 'dhwlddjgmanf', 'dhwlddjgmanf');
INSERT INTO activity(date, schedule, two_floor_teacher_id, three_floor_teacher_id, four_floor_teacher_id) VALUES('2020-08-14', '동아리', 'bbb', 'root', 'ccc');

INSERT INTO attendence(date, teacher_id, student_num, period, state) VALUES('2020-08-10', 'admin', '2201', '8', '출석');
INSERT INTO attendence(date, teacher_id, student_num, period, state) VALUES('2020-08-10', 'admin', '2201', '9', '출석');
INSERT INTO attendence(date, teacher_id, student_num, period, state) VALUES('2020-08-10', 'admin', '2201', '10', '출석');
INSERT INTO attendence(date, teacher_id, student_num, period, state) VALUES('2020-08-10', 'admin', '2202', '8', '출석');
INSERT INTO attendence(date, teacher_id, student_num, period, state) VALUES('2020-08-10', 'admin', '2202', '9', '출석');
INSERT INTO attendence(date, teacher_id, student_num, period, state) VALUES('2020-08-10', 'admin', '2202', '10', '출석');
INSERT INTO attendence(date, teacher_id, student_num, period, state) VALUES('2020-08-10', 'admin', '2401', '8', '출석');
INSERT INTO attendence(date, teacher_id, student_num, period, state) VALUES('2020-08-10', 'admin', '2401', '9', '출석');
INSERT INTO attendence(date, teacher_id, student_num, period, state) VALUES('2020-08-10', 'admin', '2401', '10', '출석');

select * from teacher;
select * from class;
select * from club;
select * from student;
select * from activity;
select * from attendence;