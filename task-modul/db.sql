drop database task_modul;
create database task_modul default character set utf8 collate utf8_general_ci;
use task_modul;

create table task_group (
id int not null auto_increment,
owner_id int not null,
public int not null default 1,
addDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
deleted int not null default 0,
active int not null default 0,
group_name varchar(32) not null default 'unknown',
primary key (id)
);

create table if not exists task (
id int not null auto_increment,
group_id int not null,
addDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
question text(2000) not null,
answer text(1000) not null,
ball int not null default 1,
times int not null default 3,
deleted int not null default 0,
primary key (id),
constraint fk_task_group foreign key (group_id) references task_group(id)
);

create table if not exists works (
id int not null auto_increment,
WORK_KEY varchar(64) not null,
user_id int not null,
group_id int not null,
times TIMESTAMP not null,
live_time bigint not null,
count int not null,
primary key (id),
constraint fk_work_group foreign key (group_id) references task_group(id),
unique(WORK_KEY)
);

create table if not exists task_result(
id int not null auto_increment,
work_id int not null,
task_id int not null,
result int not null,
times timestamp not null DEFAULT CURRENT_TIMESTAMP,
total_time int not null,
primary key (id),
constraint fk_task_result foreign key (task_id) references task(id),
constraint fk_work_result foreign key (work_id) references works(id)
);

insert into task_group(owner_id) values (1);
insert into task(group_id,question,answer, times) values (1, 'qwerty1?', 'select * from 1_task', 1), (1, 'qwerty2?', 'select * from 1_task', 5), (1, 'qwerty3?', 'select * from 1_task', 2);
insert into works(WORK_KEY, user_id, group_id, times, count, live_time) value ('cdsv4sd4v6df4v6', 1, 1, now(), 3, 100*60);