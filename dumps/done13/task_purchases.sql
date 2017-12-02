
DROP TABLE IF EXISTS purchases;

CREATE TABLE purchases (
  code_book int(11) DEFAULT NULL,
  date_order date DEFAULT NULL,
  code_delivery int(11) DEFAULT NULL,
  type_purchase varchar(25) DEFAULT NULL,
  cost decimal(10,0) DEFAULT NULL,
  amount int(11) DEFAULT NULL,
  code_purchase int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (code_purchase),
  KEY fk_purchases (code_book),
  KEY fk_purchase (code_delivery),
  CONSTRAINT fk_purchase FOREIGN KEY (code_delivery) REFERENCES deliveries (code_delivery),
  CONSTRAINT fk_purchases FOREIGN KEY (code_book) REFERENCES books (code_book)
);
INSERT INTO purchases VALUES (1,'2012-08-30',1,'розница',3804,1,1);
INSERT INTO purchases VALUES (2,'2013-04-12',2,'оптом',44565,12,2);
INSERT INTO purchases VALUES (3,'2012-07-24',3,'оптом',68574,19,3);
INSERT INTO purchases VALUES (4,'2012-08-06',4,'розница',12005,4,4);
INSERT INTO purchases VALUES (5,'2012-07-29',5,'розница',15786,5,5);
INSERT INTO purchases VALUES (6,'2014-03-30',6,'розница',3804,1,6);
INSERT INTO purchases VALUES (7,'2014-08-12',7,'оптом',44565,12,7);
INSERT INTO purchases VALUES (8,'2015-07-24',8,'розница',68574,19,8);
INSERT INTO purchases VALUES (9,'2015-08-06',9,'оптом',24,4,9);
INSERT INTO purchases VALUES (10,'2015-09-29',10,'розница',15786,5,10);
INSERT INTO purchases VALUES (13,'2011-01-01',11,'розница',25,1,11);
INSERT INTO purchases VALUES (11,'2012-02-02',12,'оптом',35,100,12);
INSERT INTO purchases VALUES (13,'2012-03-03',13,'розница',45,1,13);
INSERT INTO purchases VALUES (14,'2012-02-05',14,'оптом',80,50,14);
INSERT INTO purchases VALUES (11,'2010-02-02',13,'оптом',10,80,15);
INSERT INTO purchases VALUES (13,'2015-02-12',11,'розница',55,2,16);
INSERT INTO purchases VALUES (12,'2009-02-02',12,'розница',65,4,17);
INSERT INTO purchases VALUES (5,'2013-08-30',17,'1',3804,1,18);
INSERT INTO purchases VALUES (20,'2014-04-12',18,'1',44565,12,19);
INSERT INTO purchases VALUES (21,'2013-07-24',19,'1',68574,19,20);
INSERT INTO purchases VALUES (22,'2015-08-06',20,'0',12005,4,21);
INSERT INTO purchases VALUES (5,'2012-11-29',20,'0',15786,5,22);
