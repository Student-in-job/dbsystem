 
CREATE TABLE diagnosis (
  id int(11) NOT NULL,
  doctor_id int(11) NOT NULL,
  patient_id int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (id),
  KEY fk2 (doctor_id),
  KEY fk3 (patient_id),
  CONSTRAINT fk2 FOREIGN KEY (doctor_id) REFERENCES doctor (id),
  CONSTRAINT fk3 FOREIGN KEY (patient_id) REFERENCES patient (id)
);
INSERT INTO diagnosis VALUES (1,17,7,'болезнь куру ','2015-11-12');
INSERT INTO diagnosis VALUES (2,16,12,'болезнь штрюмпеля ','2015-10-13');
INSERT INTO diagnosis VALUES (3,16,21,'боковой амиотрофический склероз ','2016-10-21');
INSERT INTO diagnosis VALUES (4,15,31,'блефароспазм ','2017-01-11');
INSERT INTO diagnosis VALUES (5,14,43,'белая горячка ','2016-03-15');
INSERT INTO diagnosis VALUES (6,13,7,'боковой амиотрофический склероз ','2015-05-28');
INSERT INTO diagnosis VALUES (7,12,43,'акрания плода ','2016-03-19');
INSERT INTO diagnosis VALUES (8,11,24,'болезнь вильсона-коновалова ','2016-07-28');
INSERT INTO diagnosis VALUES (9,10,6,'болезнь куру ','2016-01-14');
INSERT INTO diagnosis VALUES (10,10,8,'болезнь меньера ','2016-05-17');
INSERT INTO diagnosis VALUES (11,9,2,'болезнь альцгеймера ','2016-02-14');
INSERT INTO diagnosis VALUES (12,8,15,'болезнь меньера ','2016-12-29');
INSERT INTO diagnosis VALUES (13,7,18,'болезнь рейно ','2016-08-19');
INSERT INTO diagnosis VALUES (14,6,17,'амавроз лебера ','2015-04-13');
INSERT INTO diagnosis VALUES (15,5,15,'атеросклероз сосудов головного мозга ','2015-06-04');
INSERT INTO diagnosis VALUES (16,4,12,'болезнь крейтцфельдта-якоба ','2015-10-20');
INSERT INTO diagnosis VALUES (17,3,1,'опухоли тонкого кишечника ','2016-05-09');
INSERT INTO diagnosis VALUES (18,2,15,'рак двенадцатиперстной кишки ','2015-08-18');
INSERT INTO diagnosis VALUES (19,1,27,'рак желудка ','2015-09-07');
INSERT INTO diagnosis VALUES (20,17,29,'цирроз печени ','2015-02-26');
INSERT INTO diagnosis VALUES (21,16,37,'рак червеобразного отростка. рак аппендикса.рак желчного протока. рак желчного пузыря ','2016-09-12');
INSERT INTO diagnosis VALUES (22,15,37,'колоректальный рак','2016-03-05');
INSERT INTO diagnosis VALUES (23,14,39,'рак желудка ','2015-10-13');
INSERT INTO diagnosis VALUES (24,13,27,'рак печени ','2015-05-17');
INSERT INTO diagnosis VALUES (25,13,14,'колоректальный рак','2016-03-15');
INSERT INTO diagnosis VALUES (26,14,4,'рак почек и надпочечникова. злокачественные опухоли надпочечников ','2015-12-14');
INSERT INTO diagnosis VALUES (27,16,15,'рак желудка ','2015-12-26');
INSERT INTO diagnosis VALUES (28,16,28,'рак печени ','2015-02-28');
INSERT INTO diagnosis VALUES (29,16,8,'рак толстого кишечника ','2015-10-13');
INSERT INTO diagnosis VALUES (30,14,38,'цирроз печени ','2016-02-10');
INSERT INTO diagnosis VALUES (31,16,4,'рак толстого кишечника ','2016-10-05');
INSERT INTO diagnosis VALUES (32,14,10,'рак почек и надпочечникова. злокачественные опухоли надпочечников ','2016-03-04');
INSERT INTO diagnosis VALUES (33,14,11,'рак поджелудочной железы ','2015-08-08');
INSERT INTO diagnosis VALUES (34,14,11,'рак желудка ','2015-04-24');
INSERT INTO diagnosis VALUES (35,16,15,'рак почек и надпочечникова. злокачественные опухоли надпочечников ','2017-01-15');
INSERT INTO diagnosis VALUES (36,16,14,'рак толстого кишечника ','2015-07-22');
INSERT INTO diagnosis VALUES (37,14,13,'цирроз печени ','2016-02-02');
INSERT INTO diagnosis VALUES (38,16,34,'колоректальный рак','2015-06-26');
INSERT INTO diagnosis VALUES (39,16,6,'криптофтальм ','2016-02-04');
INSERT INTO diagnosis VALUES (40,11,17,'лагофтальм ','2015-10-18');
INSERT INTO diagnosis VALUES (41,6,22,'блефароспазм ','2015-10-27');
INSERT INTO diagnosis VALUES (42,11,28,'абсцесс века ','2016-12-05');
INSERT INTO diagnosis VALUES (43,12,29,'синдром гунна ','2017-01-10');
INSERT INTO diagnosis VALUES (44,11,43,'криптофтальм ','2016-12-02');
INSERT INTO diagnosis VALUES (45,12,3,'синдром гунна ','2016-06-30');
INSERT INTO diagnosis VALUES (46,11,5,'отек века ','2016-03-02');
INSERT INTO diagnosis VALUES (47,10,3,'криптофтальм ','2016-11-03');
INSERT INTO diagnosis VALUES (48,12,42,'птоз верхнего века ','2016-07-16');
INSERT INTO diagnosis VALUES (49,2,9,'блефароспазм ','2016-10-24');
INSERT INTO diagnosis VALUES (50,12,15,'птоз верхнего века ','2015-07-20');
INSERT INTO diagnosis VALUES (51,11,7,'колобома века ','2016-01-11');
INSERT INTO diagnosis VALUES (52,11,11,'заворот века ','2016-02-20');
INSERT INTO diagnosis VALUES (53,12,19,'криптофтальм ','2015-10-14');
INSERT INTO diagnosis VALUES (54,12,11,'лагофтальм ','2015-08-06');
INSERT INTO diagnosis VALUES (55,12,12,'анкилоблефарон ','2015-12-15');
INSERT INTO diagnosis VALUES (56,12,13,'птоз верхнего века ','2016-10-13');
INSERT INTO diagnosis VALUES (57,14,12,'перелом плечевой кости ','2015-09-22');
INSERT INTO diagnosis VALUES (58,13,24,'перелом руки ','2016-10-25');
INSERT INTO diagnosis VALUES (59,6,31,'перелом стопы ','2016-06-09');
INSERT INTO diagnosis VALUES (60,9,23,'перелом голени ','2015-08-14');
INSERT INTO diagnosis VALUES (61,14,32,'перелом копчика ','2015-08-22');
INSERT INTO diagnosis VALUES (62,14,44,'перелом стопы ','2016-03-18');
INSERT INTO diagnosis VALUES (63,9,17,'перелом руки ','2016-02-18');
INSERT INTO diagnosis VALUES (64,6,15,'перелом копчика ','2016-07-21');
INSERT INTO diagnosis VALUES (65,9,7,'перелом ключицы ','2016-07-25');
INSERT INTO diagnosis VALUES (66,6,10,'перелом ключицы ','2015-05-20');
INSERT INTO diagnosis VALUES (67,13,11,'перелом ноги ','2016-08-03');
INSERT INTO diagnosis VALUES (68,13,15,'перелом ноги ','2016-07-16');
INSERT INTO diagnosis VALUES (69,9,19,'перелом позвоночника ','2015-05-23');
INSERT INTO diagnosis VALUES (70,6,12,'перелом ноги ','2015-12-21');
INSERT INTO diagnosis VALUES (71,10,11,'перелом ноги ','2015-10-03');
INSERT INTO diagnosis VALUES (72,1,10,'кретинизм ','2016-11-10');
INSERT INTO diagnosis VALUES (73,1,24,'диффузно-токсический зоб ','2015-11-18');
INSERT INTO diagnosis VALUES (74,1,26,'синдром кушинга','2015-12-16');
INSERT INTO diagnosis VALUES (75,1,29,'многоузловой зоб ','2015-12-07');
INSERT INTO diagnosis VALUES (76,5,35,'прогерия ','2016-02-27');
INSERT INTO diagnosis VALUES (77,5,38,'многоузловой зоб ','2015-04-13');
INSERT INTO diagnosis VALUES (78,5,40,'гормонопродуцирующая опухоль щитовидной железы ','2016-10-16');
INSERT INTO diagnosis VALUES (79,5,7,'синдром кушинга','2016-09-30');
INSERT INTO diagnosis VALUES (80,5,18,'мексидема щитовидной железы ','2015-05-19');
INSERT INTO diagnosis VALUES (81,5,28,'синдром протея ','2016-07-25');
INSERT INTO diagnosis VALUES (82,5,29,'прогерия ','2015-08-29');
INSERT INTO diagnosis VALUES (83,5,43,'гормонопродуцирующая опухоль щитовидной железы ','2015-09-11');
INSERT INTO diagnosis VALUES (84,1,8,'кретинизм ','2016-04-06');
INSERT INTO diagnosis VALUES (85,1,21,'многоузловой зоб ','2015-09-13');
INSERT INTO diagnosis VALUES (86,1,32,'синдром протея ','2015-03-02');
INSERT INTO diagnosis VALUES (87,1,46,'прогерия ','2016-12-21');
INSERT INTO diagnosis VALUES (88,1,14,'ожирение ','2015-03-08');
INSERT INTO diagnosis VALUES (89,5,16,'кретинизм ','2016-03-29');
INSERT INTO diagnosis VALUES (90,5,39,'кретинизм ','2015-07-06');
INSERT INTO diagnosis VALUES (91,1,21,'синдром дауна ','2016-10-18');
INSERT INTO diagnosis VALUES (92,1,22,'раннее половое созревание ','2016-11-17');
INSERT INTO diagnosis VALUES (93,5,47,'гипофизарный нанизм ','2015-10-03');
INSERT INTO diagnosis VALUES (94,1,45,'раннее половое созревание ','2016-02-08');
 

