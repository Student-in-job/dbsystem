CREATE TABLE 10_bank (
  id_bank int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `code` varchar(45) DEFAULT NULL,
  id_country int(11) NOT NULL,
  PRIMARY KEY (id_bank),
  KEY fk_bank_country1_idx (id_country),
  CONSTRAINT fk_bank_country1 FOREIGN KEY (id_country) REFERENCES 10_country (id_country) ON DELETE NO ACTION ON UPDATE NO ACTION
);

INSERT INTO 10_bank VALUES (1,'bank of america','bou',1);
INSERT INTO 10_bank VALUES (2,'usbank','usb',1);
INSERT INTO 10_bank VALUES (3,'сбербанк','sb',2);
INSERT INTO 10_bank VALUES (4,'втб банк москвы','vtb',2);
INSERT INTO 10_bank VALUES (5,'альфа банк','ab',2);
INSERT INTO 10_bank VALUES (6,'росбанк','rb',2);
INSERT INTO 10_bank VALUES (7,'ipak yuli','iy',3);
INSERT INTO 10_bank VALUES (8,'nbu','nbu',3);
INSERT INTO 10_bank VALUES (9,'qishlok qurilish','qq',3);
INSERT INTO 10_bank VALUES (10,'uzsanoatqurilish','usq',3);
INSERT INTO 10_bank VALUES (11,'asaka','asa',3);
INSERT INTO 10_bank VALUES (12,'kazkommertsbank ','kz',4);
INSERT INTO 10_bank VALUES (13,'atf bank jsc','atf',4);
INSERT INTO 10_bank VALUES (14,'nurbank jsc','nb',4);
INSERT INTO 10_bank VALUES (15,'bank pekao','bp',8);
INSERT INTO 10_bank VALUES (16,'ing bsk','ing',8);
INSERT INTO 10_bank VALUES (17,'agbank','agb',7);
INSERT INTO 10_bank VALUES (18,'liberty 10_bank ','lb',6);
INSERT INTO 10_bank VALUES (19,'swedbank','sd',11);
INSERT INTO 10_bank VALUES (20,'inbank','ing',11);
INSERT INTO 10_bank VALUES (21,'lhv pank','lhb',11);
INSERT INTO 10_bank VALUES (22,'tallinna äripank','ta',11);
INSERT INTO 10_bank VALUES (23,'ojsc kyrgyzpromstroibank','kg',5);
INSERT INTO 10_bank VALUES (24,'ameriabank','am',12);
INSERT INTO 10_bank VALUES (25,'absolutbank','abs',13);
INSERT INTO 10_bank VALUES (26,'belarusbank','bb',13);
INSERT INTO 10_bank VALUES (27,'privatbank','pb',14);
INSERT INTO 10_bank VALUES (28,'oschadbank','ob',14);
INSERT INTO 10_bank VALUES (29,'raiffeisen 10_bank aval','rba',14);
INSERT INTO 10_bank VALUES (30,'unicredit ','uc',14);
INSERT INTO 10_bank VALUES (31,'ukrgasbank','ugb',14);
INSERT INTO 10_bank VALUES (32,'first ukrainian international bank','fuib',14);
INSERT INTO 10_bank VALUES (33,'alfa-bank','ab',14);
INSERT INTO 10_bank VALUES (34,'otp bank','otp',14);
INSERT INTO 10_bank VALUES (35,'pivdennyi bank','pb',14);
INSERT INTO 10_bank VALUES (36,'hana bank','hb',15);
INSERT INTO 10_bank VALUES (37,'standard chartered','sc',15);
INSERT INTO 10_bank VALUES (38,'hsbc','hsbc',16);
INSERT INTO 10_bank VALUES (39,'agricultural bank of china','abc',16);
INSERT INTO 10_bank VALUES (40,'china everbright bank','ceb',16);
INSERT INTO 10_bank VALUES (41,'hua xia bank','hxb',16);
INSERT INTO 10_bank VALUES (42,'bank of dalian','bod',16);
INSERT INTO 10_bank VALUES (43,'bank of beijing','bob',16);
INSERT INTO 10_bank VALUES (44,'bank of ningbo','bon',16);
INSERT INTO 10_bank VALUES (45,'china zheshang bank','czb',16);
INSERT INTO 10_bank VALUES (46,'china development bank','chd',16);
INSERT INTO 10_bank VALUES (47,'bank mandiri','bm',17);
INSERT INTO 10_bank VALUES (48,'bnp paribas','bnp',20);
INSERT INTO 10_bank VALUES (49,'credit agricole','ca',20);

