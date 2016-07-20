drop database elearning;
create schema if not exists elearning default character set utf8 collate utf8_general_ci ;
use elearning;
create table if not exists user (
  user_id int(11) not null auto_increment,
  user_name varchar(20) not null,
  user_surname varchar(20) not null,
  birthday date not null,
  gender char(1) not null,
  user_mail varchar(45) not null,
  passwords varchar(45) not null,
  date_reg date not null,
  user_deleted int(1) not null default 0,
  primary key (user_id),
  unique (user_mail)
);

create table if not exists area (
  area_id int(11) not null auto_increment,
  area_name varchar(45) not null,
  area_deleted int(1) not null default 0,
  primary key (area_id));

create table if not exists program (
  program_id int(11) not null auto_increment,
  program_name varchar(45) not null,
  program_description text(2000) not null,
  program_min_level int(1) not null default 0,
  program_level int(1) not null,
  program_state varchar(10) not null default 'created',
  program_duration int(3) not null,
  teacher int(11) not null,
  area int(11) not null,
  program_date date not null,
  program_controled int(1) not null default 0,
  program_typ varchar(10) not null,
  program_deleted int(1) not null default 0,
  primary key (program_id),
  constraint fk_program_user  foreign key (teacher) references user (user_id) on delete no action on update no action,
  constraint fk_program_area1 foreign key (area) references area (area_id) on delete no action on update no action);

create table if not exists files (
  file_id int(11) not null auto_increment,
  file_url varchar(255) not null,
  file_ext varchar(10),
  primary key (file_id)
);

create table if not exists texts (
  text_id int(11) not null auto_increment,
  text_lecture text not null,
  primary key (text_id)
);

create table if not exists material (
  material_id int(11) not null auto_increment,
  material_name varchar(200) not null,
  material_day int(3) not null,
  material_type varchar(10) not null,
  program int(11) not null,
  material_text text(200) not null,
  material_deleted int(1) not null default 0,
  texts int(11) default null,
  files int(11) default null,
  primary key (material_id),
  constraint fk_material_program1 foreign key (program) references program (program_id) on delete no action on update no action,
  constraint fk_material_file1 foreign key (files) references files (file_id) on delete no action on update no action,
  constraint fk_material_text1 foreign key (texts) references texts (text_id) on delete no action on update no action

);

create table if not exists task (
  task_id int(11) not null auto_increment,
  task_name varchar(45) not null,
  task_day int(3) not null,
  task_type varchar(10) not null,
  task_text text(2000) not null,
  program int(11) not null,
  task_db_index varchar(45) not null,
  task_answer varchar(200) not null,
  task_ball int(11) not null,
  primary key (task_id),
  constraint fk_task_program1 foreign key (program) references program (program_id) on delete no action on update no action
);

create table if not exists course (
  course_id int(11) not null auto_increment,
  course_date date not null,
  program int(11) not null,
  course_public varchar(45) not null,
  course_deleted int(11) not null default 0,
  primary key (course_id),
  constraint fk_course_program1 foreign key (program) references program (program_id) on delete no action on update no action
);

create table if not exists user_has_course (
  user int(11) not null,
  course int(11) not null,
  user_has_course_datetime datetime not null,
  user_has_course_id int(11) not null auto_increment,
  user_has_course_deleted int(11) not null default 0,
  primary key (user_has_course_id),
  constraint fk_user_has_course_user1  foreign key (user) references user (user_id) on delete no action on update no action,
  constraint fk_user_has_course_course1 foreign key (course) references course (course_id) on delete no action on update no action
);

create table if not exists accept_task (
  accept_id int(11) not null auto_increment,
  accept_datetime datetime not null,
  user_has_course int(11) not null,
  task int(11) not null,
  accept_state varchar(10) not null,
  primary key (accept_id),
  constraint fk_mark_user_has_course1  foreign key (user_has_course)  references user_has_course (user_has_course_id)    on delete no action    on update no action,
  constraint fk_mark_task1  foreign key (task)  references task (task_id)    on delete no action    on update no action
);

create table if not exists externe (
  externe_id int(11) not null auto_increment,
  user int(11) not null,
  program int(11) not null,
  externe_datetime datetime not null,
  primary key (externe_id),
  constraint fk_externe_user1  foreign key (user)  references user (user_id)    on delete no action    on update no action,
  constraint fk_externe_program1  foreign key (program)  references program (program_id)    on delete no action    on update no action);

create table if not exists comments (
  comment_id int(11) not null auto_increment,
  comment_text text(2000) not null,
  user int(11) not null,
  course int(11) not null,
  commen_datetime datetime not null,
  commen_deleted int(1) not null default 0,
  primary key (comment_id),
  constraint fk_comment_user1  foreign key (user)  references user (user_id)    on delete no action    on update no action,
  constraint fk_comment_course1  foreign key (course)  references course (course_id)    on delete no action    on update no action);

create table if not exists schedules (
  schedule_id int(11) not null auto_increment,
  course int(11) not null,
  schedule_deleted int(1) not null default 0,
  primary key (schedule_id),
  constraint fk_schedule_course1  foreign key (course)  references course (course_id)    on delete no action    on update no action);

create table if not exists material_has_schedule (
  material int(11) not null,
  schedules int(11) not null,
  date_time datetime not null,
  primary key (material, schedules),
  constraint fk_material_has_schedule_material1  foreign key (material)  references material (material_id)    on delete no action    on update no action,
  constraint fk_material_has_schedule_schedule1  foreign key (schedules)  references schedules (schedule_id)    on delete no action    on update no action);

create table if not exists task_has_schedule (
  task int(11) not null,
  schedules int(11) not null,
  date_time datetime not null,
  primary key (task, schedules),
  constraint fk_task_has_schedule_task1  foreign key (task)  references task (task_id)    on delete no action    on update no action,
  constraint fk_task_has_schedule_schedule1  foreign key (schedules)  references schedules (schedule_id)    on delete no action    on update no action);

create table if not exists test (
  test_id int(11) not null auto_increment,
  test_name varchar(45) not null,
  test_day int(3) not null,
  program int(11) not null,
  test_deleted int(1) not null default 0,
  primary key (test_id),
  constraint fk_test_program1  foreign key (program)  references program (program_id)    on delete no action    on update no action);

create table if not exists test_task (
  test_task_id int(11) not null auto_increment,
  test_task_no int(3) not null,
  test_task_text varchar(200) not null,
  test_task_answer varchar(200) not null,
  test_task_v1 varchar(200) not null,
  test_task_v2 varchar(200) not null,
  test_task_v3 varchar(200) not null,
  test_task_v4 varchar(200) not null,
  test_task_ball int(3) not null default 0,
test_task_deleted int(1) not null default 0,
  test int(11) not null,
  primary key (test_task_id),
  constraint fk_test_task_test1  foreign key (test)  references test (test_id)    on delete no action    on update no action);

create table if not exists schedule_has_test (
  schedules int(11) not null,
  test int(11) not null,
  date_time datetime not null,
  primary key (schedules, test),
  constraint fk_schedule_has_test_schedule1  foreign key (schedules)  references schedules (schedule_id)    on delete no action    on update no action,
  constraint fk_schedule_has_test_test1  foreign key (test)  references test (test_id)    on delete no action    on update no action);

create table if not exists accept_test (
  accept_test_id int(11) not null auto_increment,
  accept_test_date datetime not null,
  accept_test_ball int(11) null default null,
  user_has_course int(11) not null,
  task int(11) not null,
  primary key (accept_test_id),
  constraint fk_accept_test_user_has_course1  foreign key (user_has_course)  references user_has_course (user_has_course_id)    on delete no action    on update no action,
  constraint fk_accept_test_task1  foreign key (task)  references task (task_id)    on delete no action    on update no action);

create table if not exists externe_has_test (
  externe int(11) not null,
  test int(11) not null,
  externe_has_test_datetime datetime not null,
  externe_has_test_ball int(11) not null,
  primary key (externe, test),
  constraint fk_externe_has_test1_externe1  foreign key (externe)  references externe (externe_id)    on delete no action    on update no action,
  constraint fk_externe_has_test1_test1  foreign key (test)  references test (test_id)    on delete no action    on update no action);

create table if not exists externe_has_task (
  externe int(11) not null,
  task int(11) not null,
  externe_has_task_datetime datetime not null,
  externe_has_task_accept varchar(10) not null,
  primary key (externe, task),
  constraint fk_externe_has_task_externe1  foreign key (externe)  references externe (externe_id)    on delete no action    on update no action,
  constraint fk_externe_has_task_task1  foreign key (task)  references task (task_id)    on delete no action    on update no action);

