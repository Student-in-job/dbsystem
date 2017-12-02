
CREATE TABLE subjects (
  code_subject int(11) NOT NULL DEFAULT '0',
  name_subject varchar(30) DEFAULT NULL,
  count_hours int(11) DEFAULT NULL,
  PRIMARY KEY (code_subject)
);
INSERT INTO subjects VALUES (1,'математика',124);
INSERT INTO subjects VALUES (2,'политология',118);
INSERT INTO subjects VALUES (3,'анатомия',130);
INSERT INTO subjects VALUES (4,'физика',142);
INSERT INTO subjects VALUES (5,'обж',122);
INSERT INTO subjects VALUES (6,'выш-мат',124);
INSERT INTO subjects VALUES (7,'инжинерная психология',118);
INSERT INTO subjects VALUES (8,'схематехника',130);
INSERT INTO subjects VALUES (9,'субд',142);
INSERT INTO subjects VALUES (10,'философия',122);
INSERT INTO subjects VALUES (11,'решение проблем',118);
INSERT INTO subjects VALUES (12,'аназиз бизнес систем',130);
INSERT INTO subjects VALUES (13,'программирование',122);
