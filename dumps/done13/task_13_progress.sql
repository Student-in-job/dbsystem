
CREATE TABLE progress (
  code_stud int(11) DEFAULT NULL,
  code_subject int(11) DEFAULT NULL,
  code_lector int(11) DEFAULT NULL,
  date_exam date DEFAULT NULL,
  estimate int(11) DEFAULT NULL,
  code_progress int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (code_progress),
  KEY fk_progress (code_subject),
  KEY fk_progres (code_lector),
  KEY fk_progre (code_stud),
  CONSTRAINT fk_progre FOREIGN KEY (code_stud) REFERENCES students (code_stud),
  CONSTRAINT fk_progres FOREIGN KEY (code_lector) REFERENCES lectors (code_lector),
  CONSTRAINT fk_progress FOREIGN KEY (code_subject) REFERENCES subjects (code_subject)
);
INSERT INTO progress VALUES (1,1,1,'2013-09-17',5,1);
INSERT INTO progress VALUES (2,2,2,'2014-12-29',4,2);
INSERT INTO progress VALUES (3,3,3,'2012-10-19',3,3);
INSERT INTO progress VALUES (4,4,4,'2012-09-20',5,4);
INSERT INTO progress VALUES (5,5,5,'2013-09-17',4,5);
INSERT INTO progress VALUES (6,6,6,'2013-09-17',5,6);
INSERT INTO progress VALUES (7,7,7,'2014-12-29',4,7);
INSERT INTO progress VALUES (8,8,8,'2012-10-19',3,8);
INSERT INTO progress VALUES (9,9,9,'2012-09-20',5,9);
INSERT INTO progress VALUES (10,10,10,'2013-09-17',4,10);
INSERT INTO progress VALUES (1,1,11,'2013-09-17',5,11);
INSERT INTO progress VALUES (2,9,12,'2014-12-29',4,12);
INSERT INTO progress VALUES (3,10,13,'2012-10-19',3,13);
INSERT INTO progress VALUES (4,11,14,'2012-09-20',3,14);
INSERT INTO progress VALUES (5,12,15,'2013-09-17',5,15);
INSERT INTO progress VALUES (10,1,1,'2015-12-21',5,16);
INSERT INTO progress VALUES (2,2,2,'2015-12-16',5,17);
INSERT INTO progress VALUES (15,3,3,'2016-01-17',5,18);
INSERT INTO progress VALUES (5,4,4,'2015-12-22',5,19);
INSERT INTO progress VALUES (3,5,5,'2015-12-23',5,20);
