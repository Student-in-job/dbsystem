 
CREATE TABLE doctor (
  id int(11) NOT NULL,
  department_id int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  surname varchar(128) NOT NULL,
  patronymic varchar(128) NOT NULL,
  birthday date NOT NULL,
  institution_id int(11) NOT NULL,
  PRIMARY KEY (id),
  KEY fk1 (department_id),
  KEY fk6 (institution_id),
  CONSTRAINT fk1 FOREIGN KEY (department_id) REFERENCES department (id),
  CONSTRAINT fk6 FOREIGN KEY (institution_id) REFERENCES institution (id)
);
INSERT INTO doctor VALUES (1,12,'григорий','зуйков','ростиславович ','1967-03-19',1);
INSERT INTO doctor VALUES (2,11,'алла','рябцева','ефимовна ','1967-12-05',2);
INSERT INTO doctor VALUES (3,12,'клара','шелыгина','германовна ','1968-03-22',3);
INSERT INTO doctor VALUES (4,11,'агния','яшнова','геннадиевна ','1968-08-10',2);
INSERT INTO doctor VALUES (5,10,'фома','огурцов','денисович ','1970-09-19',3);
INSERT INTO doctor VALUES (6,12,'тарас','арсеиньев','несторович ','1971-02-24',3);
INSERT INTO doctor VALUES (7,11,'валентин','верясов','эрнстович ','1971-03-02',2);
INSERT INTO doctor VALUES (8,10,'арсений','сизый','онисимович ','1973-01-16',3);
INSERT INTO doctor VALUES (9,12,'анфиса','чигракова','тимуровна ','1973-12-03',1);
INSERT INTO doctor VALUES (10,10,'станислав','коршунов','ульянович ','1974-01-17',2);
INSERT INTO doctor VALUES (11,8,'артемий','фуриков','онуфриевич ','1974-03-31',1);
INSERT INTO doctor VALUES (12,8,'платон','явлинский','якубович ','1974-12-23',1);
INSERT INTO doctor VALUES (13,12,'галина','кравчука','германовна ','1975-04-13',3);
INSERT INTO doctor VALUES (14,6,'сократ','апевалов','игоревич ','1976-09-18',3);
INSERT INTO doctor VALUES (15,9,'ефросиния','поникарова','георгиевна ','1976-10-17',3);
INSERT INTO doctor VALUES (16,6,'сократ','месяц','тимурович ','1976-12-02',2);
INSERT INTO doctor VALUES (17,2,'маргарита','большакова','захаровна ','1978-08-06',1);
 

