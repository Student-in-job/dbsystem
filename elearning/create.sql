drop database elearning;
create schema if not exists elearning default character set utf8 collate utf8_general_ci ;
use elearning;

create table if not exists sys_conf (
name varchar(25) not null,
value varchar(225) not null,
primary key(name)
);

create table if not exists user (
  user_id int(11) not null auto_increment,
  user_name varchar(32) not null,
  user_surname varchar(32) not null,
  birthday date not null,
  gender char(1) not null,
  user_mail varchar(45) not null,
  passwords varchar(45) not null,
  addDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  user_deleted int(1) not null default 0,
  primary key (user_id),
  unique (user_mail)
);

create table if not exists area (
  area_id int(11) not null auto_increment,
  area_name varchar(20) not null,
  area_deleted int(1) not null default 0,
  addDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  unique(area_name),
  primary key (area_id));

create table if not exists program (
  program_id int(11) not null auto_increment,
  addDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  program_name varchar(100) not null,
  program_description text(3000) not null,
  program_min_level int(1) not null default 0,
  program_level int(1) not null,
  program_state varchar(10) not null default 'created',
  program_duration int(3) not null,
  user int(11) not null,
  area int(11) not null,
  program_controled int(1) not null default 0,
  program_typ varchar(10) not null,
  program_deleted int(1) not null default 0,
  primary key (program_id),
  constraint fk_program_user  foreign key (user) references user (user_id) on delete no action on update no action,
  constraint fk_program_area1 foreign key (area) references area (area_id) on delete no action on update no action);

create table if not exists material (
  material_id int(11) not null auto_increment,
  addDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  material_name varchar(50) not null,
  material_day int(3) not null,
  material_type varchar(10) not null,
  material_file text,
  program int(11) not null,
  material_text text(1000) not null,
  material_deleted int(1) not null default 0,
  primary key (material_id),
  constraint fk_material_program1 foreign key (program) references program (program_id) on delete no action on update no action
);

create table if not exists files (
  files_id int(11) not null auto_increment,
  addDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  files_name varchar(100) not null,
  files_title varchar(100) not null,
  material int(11) not null,
  files_type varchar(10),
  files_deleted int(1) not null default 0,
  primary key (files_id),
  constraint fk_files_program1 foreign key (material) references material (material_id) on delete no action on update no action

);

create table if not exists task (
  task_id int(11) not null auto_increment,
  addDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  task_name varchar(45) not null,
  task_day int(3) not null,
  task_period int(3) not null,
  task_text text(2000) not null,
  program int(11) not null,
  task_time int(11) not null,
  task_starttime int(11) not null,
  task_group int(11) not null,
  task_count int(11) not null,
  task_deleted int(1) not null default 0,
  primary key (task_id),
  constraint fk_task_program1 foreign key (program) references program (program_id) on delete no action on update no action
);

create table if not exists course (
  course_id int(11) not null auto_increment,
  addDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  course_start_date date not null,
  course_end_date date not null,
  program int(11) not null,
  course_public varchar(45) not null,
  course_deleted int(11) not null default 0,
  primary key (course_id),
  constraint fk_course_program1 foreign key (program) references program (program_id) on delete no action on update no action
);

create table if not exists user_has_course (
  user int(11) not null,
  addDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  course int(11) not null,
  user_has_course_datetime datetime not null,
  user_has_course_id int(11) not null auto_increment,
  user_has_course_deleted int(11) not null default 0,
  user_has_course_complited datetime default null,
  primary key (user_has_course_id),
  unique(user, course),
  constraint fk_user_has_course_user1  foreign key (user) references user (user_id) on delete no action on update no action,
  constraint fk_user_has_course_course1 foreign key (course) references course (course_id) on delete no action on update no action
);

create table if not exists accept_task (
  accept_task_id int(11) not null auto_increment,
  accept_task_key varchar(36) not null,
  addDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  accept_task_date datetime not null,
  accept_task_ball int(1) not null default 0,
  user_has_course int(11) not null,
  task int(11) not null,
  accept_task_deleted int(1) default 0,
  primary key (accept_task_id),
  constraint fk_mark_user_has_course1  foreign key (user_has_course)  references user_has_course (user_has_course_id)    on delete no action    on update no action,
  constraint fk_mark_task1  foreign key (task)  references task (task_id)    on delete no action    on update no action
);

create table if not exists externe (
  externe_id int(11) not null auto_increment,
  addDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  user int(11) not null,
  program int(11) not null,
  externe_datetime datetime not null,
  primary key (externe_id),
  constraint fk_externe_user1  foreign key (user)  references user (user_id)    on delete no action    on update no action,
  constraint fk_externe_program1  foreign key (program)  references program (program_id)    on delete no action    on update no action);

create table if not exists comments (
  comment_id int(11) not null auto_increment,
  addDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  comment_text text(2000) not null,
  user int(11) not null,
  course int(11) not null,
  commen_datetime datetime not null,
  commen_deleted int(1) not null default 0,
  primary key (comment_id),
  constraint fk_comment_user1  foreign key (user)  references user (user_id)    on delete no action    on update no action,
  constraint fk_comment_course1  foreign key (course)  references course (course_id)    on delete no action    on update no action);

/*create table if not exists schedules (
  schedules_id int(11) not null auto_increment,
  course int(11) not null,
  schedules_deleted int(1) not null default 0,
  primary key (schedules_id),
  constraint fk_schedule_course1  foreign key (course)  references course (course_id)    on delete no action    on update no action);*/


create table if not exists schedule_has_material (
  material int(11) not null,
  addDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  course int(11) not null,
  date_time datetime not null,
  schedule_has_material_deleted int (1) default 0,
  primary key (material, course),
  constraint fk_material_has_schedule_material1  foreign key (material)  references material (material_id)    on delete no action    on update no action,
  constraint fk_material_has_schedule_schedule1  foreign key (course)  references course (course_id)    on delete no action    on update no action);

create table if not exists schedule_has_task (
  task int(11) not null,
  addDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  course int(11) not null,
  date_time datetime not null,
  schedule_has_task_deleted int(1) default 0,
  primary key (task, course),
  constraint fk_task_has_schedule_task1  foreign key (task)  references task (task_id)    on delete no action    on update no action,
  constraint fk_task_has_schedule_schedule1  foreign key (course)  references course (course_id)    on delete no action    on update no action);

create table if not exists test (
  test_id int(11) not null auto_increment,
  addDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  test_name varchar(50) not null,
  test_day int(3) not null,
  test_time int(5) not null,
  test_text text not null,
  program int(11) not null,
  test_deleted int(1) not null default 0,
  primary key (test_id),
  constraint fk_test_program1  foreign key (program)  references program (program_id)    on delete no action    on update no action);

create table if not exists test_task (
  #test_task_no int,
  test_task_id int(11) not null auto_increment,
  addDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  test_task_text varchar(200) not null,
  test_task_answer varchar(100) not null,
  test_task_v1 varchar(100) not null,
  test_task_v2 varchar(100) not null,
  test_task_v3 varchar(100) not null,
  test_task_v4 varchar(100) not null,
  test_task_ball int(3) not null default 0,
  test_task_deleted int(1) not null default 0,
  test int(11) not null,
  primary key (test_task_id),
  constraint fk_test_task_test1  foreign key (test)  references test (test_id)    on delete no action    on update no action);

create table if not exists schedule_has_test (
  course int(11) not null,
  addDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  test int(11) not null,
  date_time datetime not null,
  schedule_has_test_deleted int(1) default 0,
  primary key (course, test),
  constraint fk_schedule_has_test_schedule1  foreign key (course)  references course (course_id)    on delete no action    on update no action,
  constraint fk_schedule_has_test_test1  foreign key (test)  references test (test_id)    on delete no action    on update no action);

create table if not exists accept_test (
  accept_test_id int(11) not null auto_increment,
  addDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  accept_test_date datetime not null,
  accept_test_ball int(11) null default null,
  user_has_course int(11) not null,
  test int(11) not null,
  accept_test_deleted int(1) default 0,
  primary key (accept_test_id),
  constraint fk_accept_test_user_has_course1  foreign key (user_has_course)  references user_has_course (user_has_course_id)    on delete no action    on update no action,
  constraint fk_accept_test_task1  foreign key (test)  references test (test_id)    on delete no action    on update no action);

create table if not exists externe_has_test (
  externe int(11) not null,
  addDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  test int(11) not null,
  externe_has_test_datetime datetime not null,
  externe_has_test_ball int(11) not null,
  primary key (externe, test),
  constraint fk_externe_has_test1_externe1  foreign key (externe)  references externe (externe_id)    on delete no action    on update no action,
  constraint fk_externe_has_test1_test1  foreign key (test)  references test (test_id)    on delete no action    on update no action);

create table if not exists externe_has_task (
  externe int(11) not null,
  addDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  task int(11) not null,
  externe_has_task_datetime datetime not null,
  externe_has_task_accept varchar(10) not null,
  primary key (externe, task),
  constraint fk_externe_has_task_externe1  foreign key (externe)  references externe (externe_id)    on delete no action    on update no action,
  constraint fk_externe_has_task_task1  foreign key (task)  references task (task_id)    on delete no action    on update no action);

create view test_result as select (select user from user_has_course where user_has_course_id=user_has_course) as 'user',
test,
max(accept_test_ball) as 'ball', 
(select sum(test_task_ball) from test_task where test=accept_test.test and test_task_deleted=0) as 'max' 
from accept_test 
group by user, test;

CREATE EVENT closer_course ON SCHEDULE EVERY 1 DAY 
DO update user_has_course set user_has_course_complited = now() 
where (select course_end_date from course where course_id = course) < now()
and user_has_course_complited is null;


/*create database task;
CREATE USER 'tuter'@'localhost' IDENTIFIED BY 'qwerty';
CREATE USER 'student'@'localhost' IDENTIFIED BY 'qwerty';
grant alter, select, create, delete, drop, index, update  on task to 'tuter'@'localhost';
grant select on task to 'student'@'localhost';*/
