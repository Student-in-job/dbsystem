
CREATE TABLE students (
  code_stud int(11) NOT NULL DEFAULT '0',
  surname varchar(20) DEFAULT NULL,
  `name` varchar(15) DEFAULT NULL,
  lastname varchar(25) DEFAULT NULL,
  birthday date DEFAULT NULL,
  phone decimal(10,0) DEFAULT NULL,
  code_group int(11) DEFAULT NULL,
  PRIMARY KEY (code_stud),
  KEY fk_students (code_group),
  CONSTRAINT fk_students FOREIGN KEY (code_group) REFERENCES groups (code_group)
);
INSERT INTO students VALUES (1,'шишкин','василий','петрович','1992-02-18',2265467,1);
INSERT INTO students VALUES (2,'семкина','валерия','семёновна','1994-01-17',2315456,2);
INSERT INTO students VALUES (3,'сидоров','алексей','владимирович','1991-09-11',5649001,3);
INSERT INTO students VALUES (4,'прачаева','нигора','олеговна','1993-01-19',6680909,4);
INSERT INTO students VALUES (5,'тупикова','эмма','арменовна','1990-07-01',2349193,5);
INSERT INTO students VALUES (6,'королев','умид','викторович','1995-09-24',4716349,2);
INSERT INTO students VALUES (7,'шевцова','наталья','анатольевна','1995-02-27',1687176,6);
INSERT INTO students VALUES (8,'халдаров','ербол','ибрагимович','1994-07-19',9647284,10);
INSERT INTO students VALUES (9,'ибрагимов','тимур','ибрагимович','1991-09-12',7724224,8);
INSERT INTO students VALUES (10,'бердибаев','рустам','абаевич','1992-05-24',9995999,9);
INSERT INTO students VALUES (11,'турсунов','руслан','кизларбекович','1990-11-01',4563467,4);
INSERT INTO students VALUES (12,'халдарова','динара','ибрагимовна','1992-02-18',2265467,1);
INSERT INTO students VALUES (13,'худоймуратова','марина','юрьевна','1994-01-17',2315456,11);
INSERT INTO students VALUES (14,'сидоренко','максим','андрееврч','1991-09-11',5649001,12);
INSERT INTO students VALUES (15,'складской','евгений','александрович','1993-01-19',6680909,13);
INSERT INTO students VALUES (16,'рутковская','виктория','станиславовна','1990-07-01',2349193,5);
INSERT INTO students VALUES (17,'komolov','shohrux','alisher ugli','1994-07-25',9280094,1);
INSERT INTO students VALUES (18,'abdullayev','anvar','azamat ugli','1993-01-20',1231241,3);
INSERT INTO students VALUES (19,'ashuraliyev','baxodir','nurbek ugli','1992-12-10',2345324,4);
INSERT INTO students VALUES (20,'atoyev','alijon','bekzod ugli','1994-02-16',3452341,13);
INSERT INTO students VALUES (21,'berdiboyev','doston','rahmatillo ugli','1994-09-05',9896763,2);
