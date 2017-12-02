SET search_path TO combined_Students__Library;




CREATE TABLE authors (
  code_author int NOT NULL DEFAULT '0',
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




CREATE TABLE publishing_house (
  code_publish int NOT NULL DEFAULT '0',
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




CREATE TABLE books (
  code_book int NOT NULL DEFAULT '0',
  title_book varchar(75) DEFAULT NULL,
  code_author int DEFAULT NULL,
  pages decimal(10,0) DEFAULT NULL,
  code_publish int DEFAULT NULL,
  PRIMARY KEY (code_book),
  CONSTRAINT fk_book FOREIGN KEY (code_publish) REFERENCES publishing_house (code_publish),
  CONSTRAINT fk_books FOREIGN KEY (code_author) REFERENCES authors (code_author)
);
INSERT INTO books VALUES (1,'загадочная шкатулка',1,57,1);
INSERT INTO books VALUES (2,'пушистые комочки',2,190,2);
INSERT INTO books VALUES (3,'зелёные буболашки',3,392,3);
INSERT INTO books VALUES (4,'золотые пески татуина',4,189,4);
INSERT INTO books VALUES (5,'удивительные приключения дроида',5,44,5);
INSERT INTO books VALUES (6,'темные аллеи',6,150,6);
INSERT INTO books VALUES (7,'я - робот',7,350,7);
INSERT INTO books VALUES (8,'гарри поттер',8,450,8);
INSERT INTO books VALUES (9,'алауэн',9,127,9);
INSERT INTO books VALUES (10,'и все-таки оно есть',10,180,10);
INSERT INTO books VALUES (11,'хамса',11,1500,12);
INSERT INTO books VALUES (12,'уткан кунлар',12,450,14);
INSERT INTO books VALUES (13,'евгение онегин',13,800,11);
INSERT INTO books VALUES (14,'когда я снова стану маленьким',14,290,13);
INSERT INTO books VALUES (15,'война и мир',15,756,12);
INSERT INTO books VALUES (16,'мастер и маргарита',16,428,13);
INSERT INTO books VALUES (17,'тарас бульба',17,240,14);
INSERT INTO books VALUES (18,'жолынай',14,190,14);
INSERT INTO books VALUES (19,'крылья ангела',13,392,10);
INSERT INTO books VALUES (20,'пестрые пушистики',11,189,13);
INSERT INTO books VALUES (21,'звездопад на востоке',5,44,2);
INSERT INTO books VALUES (22,'вредина',3,57,4);
INSERT INTO books VALUES (999,'золотые-молодые',1,158,2);




CREATE TABLE deliveries (
  code_delivery int NOT NULL DEFAULT '0',
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




CREATE TABLE purchases (
  code_book int DEFAULT NULL,
  date_order date DEFAULT NULL,
  code_delivery int DEFAULT NULL,
  type_purchase varchar(25) DEFAULT NULL,
  cost decimal(10,0) DEFAULT NULL,
  amount int DEFAULT NULL,
  code_purchase int NOT NULL DEFAULT '0',
  PRIMARY KEY (code_purchase),
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



CREATE TABLE groups (
  code_group int NOT NULL DEFAULT '0',
  name_group varchar(20) DEFAULT NULL,
  num_course int DEFAULT NULL,
  name_speciality varchar(40) DEFAULT NULL,
  PRIMARY KEY (code_group)
);
INSERT INTO groups VALUES (1,'226-13',3,'режиссура');
INSERT INTO groups VALUES (2,'221-12',4,'актёрское мастерство');
INSERT INTO groups VALUES (3,'225-14',2,'терапевтическое отделение');
INSERT INTO groups VALUES (4,'223-15',1,'информационная безопасность');
INSERT INTO groups VALUES (5,'227-13',3,'генная инженерия');
INSERT INTO groups VALUES (6,'224-13',3,'ит-сервис');
INSERT INTO groups VALUES (8,'226-14',2,'библиотека ведение');
INSERT INTO groups VALUES (9,'227-15',1,'мультимедия');
INSERT INTO groups VALUES (10,'228-13',3,'компьютеоная инженерия');
INSERT INTO groups VALUES (11,'225-14',2,'телекоммуникации');
INSERT INTO groups VALUES (12,'223-15',1,'профессиональное образование');
INSERT INTO groups VALUES (13,'227-13',3,'ит');


CREATE TABLE students (
  code_stud int NOT NULL DEFAULT '0',
  surname varchar(20) DEFAULT NULL,
  name varchar(15) DEFAULT NULL,
  lastname varchar(25) DEFAULT NULL,
  birthday date DEFAULT NULL,
  phone decimal(10,0) DEFAULT NULL,
  code_group int DEFAULT NULL,
  PRIMARY KEY (code_stud),
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


CREATE TABLE lectors (
  code_lector int NOT NULL DEFAULT '0',
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


CREATE TABLE subjects (
  code_subject int NOT NULL DEFAULT '0',
  name_subject varchar(30) DEFAULT NULL,
  count_hours int DEFAULT NULL,
  PRIMARY KEY (code_subject)
);
INSERT INTO subjects VALUES (1,'математика',124);
INSERT INTO subjects VALUES (2,'политология',118);
INSERT INTO subjects VALUES (3,'анатомия',130);
INSERT INTO subjects VALUES (4,'физика',142);
INSERT INTO subjects VALUES (5,'обж',122);
INSERT INTO subjects VALUES (6,'выш-мат',124);
INSERT INTO subjects VALUES (7,'инжинерная психология',118);
INSERT INTO subjects VALUES (8,'схематехника',130);
INSERT INTO subjects VALUES (9,'субд',142);
INSERT INTO subjects VALUES (10,'философия',122);
INSERT INTO subjects VALUES (11,'решение проблем',118);
INSERT INTO subjects VALUES (12,'аназиз бизнес систем',130);
INSERT INTO subjects VALUES (13,'программирование',122);


CREATE TABLE progress (
  code_stud int DEFAULT NULL,
  code_subject int DEFAULT NULL,
  code_lector int DEFAULT NULL,
  date_exam date DEFAULT NULL,
  estimate int DEFAULT NULL,
  code_progress int NOT NULL DEFAULT '0',
  PRIMARY KEY (code_progress),
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
