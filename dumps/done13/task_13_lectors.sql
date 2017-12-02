
CREATE TABLE lectors (
  code_lector int(11) NOT NULL DEFAULT '0',
  name_lector varchar(40) DEFAULT NULL,
  science varchar(30) DEFAULT NULL,
  post varchar(30) DEFAULT NULL,
  date_ date DEFAULT NULL,
  PRIMARY KEY (code_lector)
);
INSERT INTO lectors VALUES (1,'хушвактов бердибай юнусович','доктор наук','преподаватель','2001-03-30');
INSERT INTO lectors VALUES (2,'ситников петр сергеевич','бакалавр','ассистент','2013-08-08');
INSERT INTO lectors VALUES (3,'пирожкова валерия анатольевна','профессор','преподаватель','2008-09-17');
INSERT INTO lectors VALUES (4,'секундантова лидия геннадиевна','доктор наук','старший преподаватель','2007-07-18');
INSERT INTO lectors VALUES (5,'фасолькин сергей михайлович','доцент','старший преподаватель','2002-01-17');
INSERT INTO lectors VALUES (6,'чай зоя сергеевна','доцент','старший преподаватель','2002-03-30');
INSERT INTO lectors VALUES (7,'рысюкова юлия васильевна','доцент','преподователь','2009-08-08');
INSERT INTO lectors VALUES (8,'абдуллаев ахмед маллаевич','профессор','старший преподаватель','1996-09-17');
INSERT INTO lectors VALUES (9,'пак виталий станиславович','магистр','преподаватель','2010-08-18');
INSERT INTO lectors VALUES (10,'турсунова мастура тохировна','магистр','асистент','2013-07-17');
INSERT INTO lectors VALUES (11,'мирзаев миракзам ахатович','доктор наук','заведующий кафедрой','2001-03-30');
INSERT INTO lectors VALUES (12,'мухамедова тамила тимуровна','магистр','ассистент','2013-08-08');
INSERT INTO lectors VALUES (13,'семидетко анна валерьевна','профессор','преподаватель','2008-09-17');
INSERT INTO lectors VALUES (14,'федоренко наталья тельмановна','доктор наук','старший преподаватель','2007-07-18');
INSERT INTO lectors VALUES (15,'крамаренко иван иванович','доцент','старший преподаватель','2002-01-17');
