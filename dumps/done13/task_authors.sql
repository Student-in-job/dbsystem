
DROP TABLE IF EXISTS authors;

CREATE TABLE `authors` (
  code_author int(11) NOT NULL DEFAULT '0',
  name_author varchar(75) DEFAULT NULL,
  birthday date DEFAULT NULL,
  PRIMARY KEY (code_author)
);
INSERT INTO authors VALUES (1,'васильков василий иннокентиевич','1991-09-12');
INSERT INTO authors VALUES (2,'ромашкова жоржетта тихомировна','1974-03-03');
INSERT INTO authors VALUES (3,'полевой илья михайлович','1994-10-03');
INSERT INTO authors VALUES (4,'сотникова феруза владимировна','1994-05-11');
INSERT INTO authors VALUES (5,'нуруллаева галина николаевна','1959-07-14');
INSERT INTO authors VALUES (6,'бунин иван алексеевич','1870-10-22');
INSERT INTO authors VALUES (7,'азимов айзек','1950-09-11');
INSERT INTO authors VALUES (8,'роулинг джоан кейт','1960-06-30');
INSERT INTO authors VALUES (9,'жданова светлана','1980-12-15');
INSERT INTO authors VALUES (10,'санечкина ольга','1874-07-28');
INSERT INTO authors VALUES (11,'алишер навои','1441-02-09');
INSERT INTO authors VALUES (12,'абдулла кодирий','1894-04-10');
INSERT INTO authors VALUES (13,'а.с. пушкин','1799-06-06');
INSERT INTO authors VALUES (14,'януш корчак','1902-02-05');
INSERT INTO authors VALUES (15,'лев толстой','1828-09-09');
INSERT INTO authors VALUES (16,'михаил булгаков','1799-06-06');
INSERT INTO authors VALUES (17,'гоголь ','1828-09-09');
INSERT INTO authors VALUES (133,'ссаныч ссан ссанович','1977-09-01');
