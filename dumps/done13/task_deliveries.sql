
DROP TABLE IF EXISTS deliveries;

CREATE TABLE deliveries (
  code_delivery int(11) NOT NULL DEFAULT '0',
  name_delivery varchar(50) DEFAULT NULL,
  name_company varchar(30) DEFAULT NULL,
  address varchar(50) DEFAULT NULL,
  phone decimal(10,0) DEFAULT NULL,
  inn decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (code_delivery)
);
INSERT INTO deliveries VALUES (1,'кряхтенко игорь васильевич','крях и компания','г. москва ,  ул. краснопенная ,  47',2213489,909874567);
INSERT INTO deliveries VALUES (2,'федоренко фёкла филлиповна','фёклышко','г. самара ,  ул. пионерская ,  139',1236574,80941372);
INSERT INTO deliveries VALUES (3,'пёрышкова александра дмитриевна','как с гуся вода','г. ташкент ,  ул. новомосковская ,  12',4217381,777393001);
INSERT INTO deliveries VALUES (4,'мурашкин павел андреевич','клуб и па','г. калуга ,  ул. весёлая ,  1',6745890,333900102);
INSERT INTO deliveries VALUES (5,'замерзший алексей викторович','шкатулка','г. карши ,  ул. гагарина ,  24',2276627,301459003);
INSERT INTO deliveries VALUES (6,'замонов зиед исмагилович','крупинка счастья','г. франкфурт ,  ул. трещоток ,  47',1234567,958741654);
INSERT INTO deliveries VALUES (7,'трухлянов петр михайлович','тромбон','г. ташкент ,  ул. буюк ипак йули ,  56',1236574,265897459);
INSERT INTO deliveries VALUES (8,'цоконов иван мигельевич','ямщик','г. москва ,  ул. новомосковская ,  25',2654785,777254701);
INSERT INTO deliveries VALUES (9,'зефиров илья валерьевич','маршмеллоу','г. липецк ,  ул. толстого ,  67',5648215,222555487);
INSERT INTO deliveries VALUES (10,'колобков александр дмитриевич','жукус','г. ташкент ,  ул. абая ,  24',3534568,301215264);
INSERT INTO deliveries VALUES (11,'комолов ш.','звезда','амиртемур 108/2',123456789,123456789);
INSERT INTO deliveries VALUES (12,'олимов шерзод','роял','чилонзор',456789123,456789123);
INSERT INTO deliveries VALUES (13,'иван иванов','полиграфия№1','москва',789456123,789456123);
INSERT INTO deliveries VALUES (14,'чай з.с.','чай','питербург',123789456,123789456);
INSERT INTO deliveries VALUES (17,'жакыбаев ергали сапарович','мастер класс','г. алма-ата ,  ул. байтерек ,  37',2615275,909647284);
INSERT INTO deliveries VALUES (18,'заитов ильдар григорьевич','злодовей','г. томск ,  ул. детская ,  365',7654321,807606330);
INSERT INTO deliveries VALUES (19,'зайцева марина евгеневна','миротворец','г. ташкент ,  ул. новомосковская ,  12',2600732,222345672);
INSERT INTO deliveries VALUES (20,'рысбеков кайрбек баратович','шин кала','г. жамбул ,  ул. дорожная ,  1',6745890,905676785);
INSERT INTO deliveries VALUES (21,'валенков станистлав николаевич','сундук','г. фергана ,  ул. найман ,  64',2898681,190719940);
