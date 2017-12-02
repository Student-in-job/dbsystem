
DROP TABLE IF EXISTS publishing_house;

CREATE TABLE publishing_house (
  code_publish int(11) NOT NULL DEFAULT '0',
  publish varchar(75) DEFAULT NULL,
  city varchar(75) DEFAULT NULL,
  PRIMARY KEY (code_publish)
);
INSERT INTO publishing_house VALUES (1,'помидор','демьяново');
INSERT INTO publishing_house VALUES (2,'пулковское','карши');
INSERT INTO publishing_house VALUES (3,'паровозное','калуга');
INSERT INTO publishing_house VALUES (4,'печенька','ташкент');
INSERT INTO publishing_house VALUES (5,'дворцовое','самара');
INSERT INTO publishing_house VALUES (6,'зараман','демьяново');
INSERT INTO publishing_house VALUES (7,'наташа','москва');
INSERT INTO publishing_house VALUES (8,'шарк','ташкент');
INSERT INTO publishing_house VALUES (9,'литрес','питер');
INSERT INTO publishing_house VALUES (10,'творчас','калуга');
INSERT INTO publishing_house VALUES (11,'полиграфия москва ','москва ');
INSERT INTO publishing_house VALUES (12,'нашириет','тошкент');
INSERT INTO publishing_house VALUES (13,'питер','питербург');
INSERT INTO publishing_house VALUES (14,'звезда','тошкент');
