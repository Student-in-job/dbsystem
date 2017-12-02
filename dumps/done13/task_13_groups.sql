
CREATE TABLE groups (
  code_group int(11) NOT NULL DEFAULT '0',
  name_group varchar(20) DEFAULT NULL,
  num_course int(11) DEFAULT NULL,
  name_speciality varchar(40) DEFAULT NULL,
  PRIMARY KEY (code_group)
);
INSERT INTO groups VALUES (1,'226-13',3,'режиссура');
INSERT INTO groups VALUES (2,'221-12',4,'актёрское мастерство');
INSERT INTO groups VALUES (3,'225-14',2,'терапевтическое отделение');
INSERT INTO groups VALUES (4,'223-15',1,'информационная безопасность');
INSERT INTO groups VALUES (5,'227-13',3,'генная инженерия');
INSERT INTO groups VALUES (6,'224-13',3,'ит-сервис');
INSERT INTO groups VALUES (8,'226-14',2,'библиотека ведение');
INSERT INTO groups VALUES (9,'227-15',1,'мультимедия');
INSERT INTO groups VALUES (10,'228-13',3,'компьютеоная инженерия');
INSERT INTO groups VALUES (11,'225-14',2,'телекоммуникации');
INSERT INTO groups VALUES (12,'223-15',1,'профессиональное образование');
INSERT INTO groups VALUES (13,'227-13',3,'ит');
