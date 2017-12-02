 
CREATE TABLE patient (
  id int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  surname varchar(128) NOT NULL,
  patronymic varchar(128) NOT NULL,
  birthday date NOT NULL,
  sex enum('w','m') NOT NULL,
  PRIMARY KEY (id)
);
INSERT INTO patient VALUES (1,'аркадий','толбанов','карлович ','1994-10-30','m');
INSERT INTO patient VALUES (2,'георгий','агапов','иванович ','1997-06-24','m');
INSERT INTO patient VALUES (3,'эдуард','капшуков','аполлинариевич ','1998-09-06','m');
INSERT INTO patient VALUES (4,'савелий','богоносцев','никитевич ','1999-10-12','m');
INSERT INTO patient VALUES (5,'измаил','алеев','адамович ','2005-12-06','m');
INSERT INTO patient VALUES (6,'эрнест','трунин','эдуардович ','2010-08-19','m');
INSERT INTO patient VALUES (7,'мефодий','пишенин','демьянович ','2013-01-29','m');
INSERT INTO patient VALUES (8,'демьян','дерновой','леонович','2015-09-20','m');
INSERT INTO patient VALUES (9,'регина','меншикова','марковна ','1944-12-29','w');
INSERT INTO patient VALUES (10,'эвелина','пузакова','тимуровна ','1946-07-13','w');
INSERT INTO patient VALUES (11,'людмила','кярбера','кузьмевна ','1946-08-08','w');
INSERT INTO patient VALUES (12,'светлана','баландина','виталиевна ','1946-10-27','w');
INSERT INTO patient VALUES (13,'любовь','пелёвина','ипполитовна ','1953-11-21','w');
INSERT INTO patient VALUES (14,'ариадна','лигачёва','петровна ','1955-02-27','w');
INSERT INTO patient VALUES (15,'раиса','савинкова','афанасиевна ','1955-11-15','w');
INSERT INTO patient VALUES (16,'ариадна','чемериса','петровна ','1971-10-23','w');
INSERT INTO patient VALUES (17,'ефросиния','аксёнова','иларионовна ','1972-12-02','w');
INSERT INTO patient VALUES (18,'римма','бикулова','тихоновна ','1977-03-23','w');
INSERT INTO patient VALUES (19,'эвелина','терехова','александровна ','1977-08-05','w');
INSERT INTO patient VALUES (20,'эльвира','оспищева','серафимовна ','1980-05-29','w');
INSERT INTO patient VALUES (21,'лилия','ожогина','георгиевна ','1981-10-15','w');
INSERT INTO patient VALUES (22,'таисия','янчурова','станиславовна ','1982-06-10','w');
INSERT INTO patient VALUES (23,'татьяна','сподарева','карповна ','1991-01-10','w');
INSERT INTO patient VALUES (24,'жанна','кононова','мефодиевна ','1995-08-16','w');
INSERT INTO patient VALUES (25,'эвелина','должикова','давидовна ','1998-05-15','w');
INSERT INTO patient VALUES (26,'наталия','бурда','ростиславовна ','1998-12-28','w');
INSERT INTO patient VALUES (27,'ульяна','дубровина','яновна ','2001-12-10','w');
INSERT INTO patient VALUES (28,'татьяна','шапиро','виталиевна ','2004-08-18','w');
INSERT INTO patient VALUES (29,'инга','борисюка','семеновна ','2007-04-28','w');
INSERT INTO patient VALUES (30,'лариса','диденкова','игоревна ','2009-03-17','w');
INSERT INTO patient VALUES (31,'дина','колобкова','вячеславовна ','2012-06-22','w');
INSERT INTO patient VALUES (32,'ариадна','чилаева','всеволодовна ','2016-09-15','w');
INSERT INTO patient VALUES (33,'эмма','якина','игоревна ','2016-10-29','w');
INSERT INTO patient VALUES (34,'владлена','якимычева','тихоновна ','1935-09-22','w');
INSERT INTO patient VALUES (35,'ангелина','труфанова','потаповна ','1937-10-17','w');
INSERT INTO patient VALUES (36,'ираида','кашарина','леонидовна ','1939-05-25','w');
INSERT INTO patient VALUES (37,'екатерина','остапюка','федотовна ','1940-11-12','w');
INSERT INTO patient VALUES (38,'зинаида','яковалева','ефимовна ','1942-05-06','w');
INSERT INTO patient VALUES (39,'бронислава','минеева','степановна ','1946-07-10','w');
INSERT INTO patient VALUES (40,'ариадна','ясюлевича','якововна ','1949-07-22','w');
INSERT INTO patient VALUES (41,'маргарита','митрохина','данииловна ','1951-05-16','w');
INSERT INTO patient VALUES (42,'анастасия','гершельмана','елисеевна ','1955-01-20','w');
INSERT INTO patient VALUES (43,'ефросиния','кузубова','михеевна ','1957-01-16','w');
INSERT INTO patient VALUES (44,'раиса','коллерова','феликсовна ','1961-03-14','w');
INSERT INTO patient VALUES (45,'арина','сушилова','олеговна ','1968-11-23','w');
INSERT INTO patient VALUES (46,'агния','гринина','игоревна ','1969-01-06','w');
INSERT INTO patient VALUES (47,'валентина','левковича','георгиевна ','1976-11-23','w');
INSERT INTO patient VALUES (48,'мария','слукина','романовна ','1978-07-26','w');
 

