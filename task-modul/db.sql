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

insert into task_group(owner_id) values (1);