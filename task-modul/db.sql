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
times int not null default 5,
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
time_live int not null,
mods varchar(5) not null,
count int not null,
primary key (id),
constraint fk_work_group foreign key (group_id) references task_group(id),
unique(WORK_KEY)
);

create table if not exists task_result(
work_id int not null,
task int not null,
result int not null,
times timestamp DEFAULT CURRENT_TIMESTAMP,
constraint fk_task_result foreign key (task) references task(id),
constraint fk_work_result foreign key (work_id) references works(id)
);

insert into task_group(owner_id) values (1);
insert into task(group_id,question,answer) value (1, 'qwerty?', 'select * from 1_task');
insert into works(WORK_KEY, user_id, group_id, times, , mods, count);