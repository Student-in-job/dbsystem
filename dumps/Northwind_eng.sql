SET search_path TO Northwind_eng;

CREATE TABLE customers (
  id  int NOT NULL,
  company varchar(50) DEFAULT NULL,
  last_name varchar(50) DEFAULT NULL,
  first_name varchar(50) DEFAULT NULL,
  job_title varchar(50) DEFAULT NULL,
  address text,
  city varchar(50) DEFAULT NULL,
  PRIMARY KEY (id)
);
INSERT INTO customers VALUES (1,'company a','bedecs','anna','owner','123 1st street','seattle');
INSERT INTO customers VALUES (2,'company b','gratacos solsona','antonio','owner','123 2nd street','boston');
INSERT INTO customers VALUES (3,'company c','axen','thomas','purchasing representative','123 3rd street','los angelas');
INSERT INTO customers VALUES (4,'company d','lee','christina','purchasing manager','123 4th street','new york');
INSERT INTO customers VALUES (5,'company e','o’donnell','martin','owner','123 5th street','minneapolis');
INSERT INTO customers VALUES (6,'company f','perez-olaeta','francisco','purchasing manager','123 6th street','milwaukee');
INSERT INTO customers VALUES (7,'company g','xie','ming-yang','owner','123 7th street','boise');
INSERT INTO customers VALUES (8,'company h','andersen','elizabeth','purchasing representative','123 8th street','portland');
INSERT INTO customers VALUES (9,'company i','mortensen','sven','purchasing manager','123 9th street','salt lake city');
INSERT INTO customers VALUES (10,'company j','wacker','roland','purchasing manager','123 10th street','chicago');
INSERT INTO customers VALUES (11,'company k','krschne','peter','purchasing manager','123 11th street','miami');
INSERT INTO customers VALUES (12,'company l','edwards','john','purchasing manager','123 12th street','las vegas');
INSERT INTO customers VALUES (13,'company m','ludick','andre','purchasing representative','456 13th street','memphis');
INSERT INTO customers VALUES (14,'company n','grilo','carlos','purchasing representative','456 14th street','denver');
INSERT INTO customers VALUES (15,'company o','kupkova','helena','purchasing manager','456 15th street','honolulu');
INSERT INTO customers VALUES (16,'company p','goldschmidt','daniel','purchasing representative','456 16th street','san francisco');
INSERT INTO customers VALUES (17,'company q','bagel','jean philippe','owner','456 17th street','seattle');
INSERT INTO customers VALUES (18,'company r','autier miconi','catherine','purchasing representative','456 18th street','boston');
INSERT INTO customers VALUES (19,'company s','eggerer','alexander','accounting assistant','789 19th street','los angelas');
INSERT INTO customers VALUES (20,'company t','li','george','purchasing manager','789 20th street','new york');
INSERT INTO customers VALUES (21,'company u','tham','bernard','accounting manager','789 21th street','minneapolis');
INSERT INTO customers VALUES (22,'company v','ramos','luciana','purchasing assistant','789 22th street','milwaukee');
INSERT INTO customers VALUES (23,'company w','entin','michael','purchasing manager','789 23th street','portland');
INSERT INTO customers VALUES (24,'company x','hasselberg','jonas','owner','789 24th street','salt lake city');
INSERT INTO customers VALUES (25,'company y','rodman','john','purchasing manager','789 25th street','chicago');
INSERT INTO customers VALUES (26,'company z','liu','run','accounting assistant','789 26th street','miami');
INSERT INTO customers VALUES (27,'company aa','toh','karen','purchasing manager','789 27th street','las vegas');
INSERT INTO customers VALUES (28,'company bb','raghav','amritansh','purchasing manager','789 28th street','memphis');
INSERT INTO customers VALUES (29,'company cc','lee','soo jung','purchasing manager','789 29th street','denver');
CREATE TABLE employees (
  id  int NOT NULL,
  last_name varchar(50) DEFAULT NULL,
  first_name varchar(50) DEFAULT NULL,
  email_address varchar(50) DEFAULT NULL,
  job_title varchar(50) DEFAULT NULL,
  address text,
  city varchar(50) DEFAULT NULL,
  web_page text,
  PRIMARY KEY (id)
);
INSERT INTO  employees VALUES (1,'freehafer','nancy','nancy@northwindtraders.com','sales representative','123 1st avenue','seattle','#http://northwindtraders.com#');
INSERT INTO  employees VALUES (2,'cencini','andrew','andrew@northwindtraders.com','vice president ,  sales','123 2nd avenue','bellevue','http://northwindtraders.com#http://northwindtraders.com/#');
INSERT INTO  employees VALUES (3,'kotas','jan','jan@northwindtraders.com','sales representative','123 3rd avenue','redmond','http://northwindtraders.com#http://northwindtraders.com/#');
INSERT INTO  employees VALUES (4,'sergienko','mariya','mariya@northwindtraders.com','sales representative','123 4th avenue','kirkland','http://northwindtraders.com#http://northwindtraders.com/#');
INSERT INTO  employees VALUES (5,'thorpe','steven','steven@northwindtraders.com','sales manager','123 5th avenue','seattle','http://northwindtraders.com#http://northwindtraders.com/#');
INSERT INTO  employees VALUES (6,'neipper','michael','twines@northwindtraders.com','sales representative','123 6th avenue','redmond','http://northwindtraders.com#http://northwindtraders.com/#');
INSERT INTO  employees VALUES (7,'zare','robert','robert@northwindtraders.com','sales representative','123 7th avenue','seattle','http://northwindtraders.com#http://northwindtraders.com/#');
INSERT INTO  employees VALUES (8,'giussani','laura','laura@northwindtraders.com','sales coordinator','123 8th avenue','redmond','http://northwindtraders.com#http://northwindtraders.com/#');
INSERT INTO  employees VALUES (9,'hellung-larsen','anne','bunnyben@northwindtraders.com','sales representative','123 9th avenue','seattle','http://northwindtraders.com#http://northwindtraders.com/#');
CREATE TABLE  products (
  id  int NOT NULL,
  product_code varchar(25) DEFAULT NULL,
  product_name varchar(50) DEFAULT NULL,
  standard_cost decimal(19,4) DEFAULT NULL,
  list_price decimal(19,4) DEFAULT NULL,
  quantity_per_unit varchar(50) DEFAULT NULL,
  PRIMARY KEY (id)
);

INSERT INTO  products VALUES (1,'nwtb-1','northwind traders chai',13.5000,18.0000,'10 boxes x 20 bags');
INSERT INTO  products VALUES (3,'nwtco-3','northwind traders syrup',7.5000,10.0000,'12 - 550 ml bottles');
INSERT INTO  products VALUES (4,'nwtco-4','northwind traders cajun seasoning',16.5000,22.0000,'48 - 6 oz jars');
INSERT INTO  products VALUES (5,'nwto-5','northwind traders olive oil',16.0125,21.3500,'36 boxes');
INSERT INTO  products VALUES (6,'nwtjp-6','northwind traders boysenberry spread',18.7500,25.0000,'12 - 8 oz jars');
INSERT INTO  products VALUES (7,'nwtdfn-7','northwind traders dried pears',22.5000,30.0000,'12 - 1 lb pkgs.');
INSERT INTO  products VALUES (8,'nwts-8','northwind traders curry sauce',30.0000,40.0000,'12 - 12 oz jars');
INSERT INTO  products VALUES (14,'nwtdfn-14','northwind traders walnuts',17.4375,23.2500,'40 - 100 g pkgs.');
INSERT INTO  products VALUES (17,'nwtcfv-17','northwind traders fruit cocktail',29.2500,39.0000,'15.25 oz');
INSERT INTO  products VALUES (19,'nwtbgm-19','northwind traders chocolate biscuits mix',6.9000,9.2000,'10 boxes x 12 pieces');
INSERT INTO  products VALUES (20,'nwtjp-6','northwind traders marmalade',60.7500,81.0000,'30 gift boxes');
INSERT INTO  products VALUES (21,'nwtbgm-21','northwind traders scones',7.5000,10.0000,'24 pkgs. x 4 pieces');
INSERT INTO  products VALUES (34,'nwtb-34','northwind traders beer',10.5000,14.0000,'24 - 12 oz bottles');
INSERT INTO  products VALUES (40,'nwtcm-40','northwind traders crab meat',13.8000,18.4000,'24 - 4 oz tins');
INSERT INTO  products VALUES (41,'nwtso-41','northwind traders clam chowder',7.2375,9.6500,'12 - 12 oz cans');
INSERT INTO  products VALUES (43,'nwtb-43','northwind traders coffee',34.5000,46.0000,'16 - 500 g tins');
INSERT INTO  products VALUES (48,'nwtca-48','northwind traders chocolate',9.5625,12.7500,'10 pkgs');
INSERT INTO  products VALUES (51,'nwtdfn-51','northwind traders dried apples',39.7500,53.0000,'50 - 300 g pkgs.');
INSERT INTO  products VALUES (52,'nwtg-52','northwind traders long grain rice',5.2500,7.0000,'16 - 2 kg boxes');
INSERT INTO  products VALUES (56,'nwtp-56','northwind traders gnocchi',28.5000,38.0000,'24 - 250 g pkgs.');
INSERT INTO  products VALUES (57,'nwtp-57','northwind traders ravioli',14.6250,19.5000,'24 - 250 g pkgs.');
INSERT INTO  products VALUES (65,'nwts-65','northwind traders hot pepper sauce',15.7875,21.0500,'32 - 8 oz bottles');
INSERT INTO  products VALUES (66,'nwts-66','northwind traders tomato sauce',12.7500,17.0000,'24 - 8 oz jars');
INSERT INTO  products VALUES (72,'nwtd-72','northwind traders mozzarella',26.1000,34.8000,'24 - 200 g pkgs.');
INSERT INTO  products VALUES (74,'nwtdfn-74','northwind traders almonds',7.5000,10.0000,'5 kg pkg.');
INSERT INTO  products VALUES (77,'nwtco-77','northwind traders mustard',9.7500,13.0000,'12 boxes');
INSERT INTO  products VALUES (80,'nwtdfn-80','northwind traders dried plums',3.0000,3.5000,'1 lb bag');
INSERT INTO  products VALUES (81,'nwtb-81','northwind traders green tea',2.0000,2.9900,'20 bags per box');
INSERT INTO  products VALUES (82,'nwtc-82','northwind traders granola',2.0000,4.0000,NULL);
INSERT INTO  products VALUES (83,'nwtcs-83','northwind traders potato chips',0.5000,1.8000,NULL);
INSERT INTO  products VALUES (85,'nwtbgm-85','northwind traders brownie mix',9.0000,12.4900,'3 boxes');
INSERT INTO  products VALUES (86,'nwtbgm-86','northwind traders cake mix',10.5000,15.9900,'4 boxes');
INSERT INTO  products VALUES (87,'nwtb-87','northwind traders tea',2.0000,4.0000,'100 count per box');
INSERT INTO  products VALUES (88,'nwtcfv-88','northwind traders pears',1.0000,1.3000,'15.25 oz');
INSERT INTO  products VALUES (89,'nwtcfv-89','northwind traders peaches',1.0000,1.5000,'15.25 oz');
INSERT INTO  products VALUES (90,'nwtcfv-90','northwind traders pineapple',1.0000,1.8000,'15.25 oz');
INSERT INTO  products VALUES (91,'nwtcfv-91','northwind traders cherry pie filling',1.0000,2.0000,'15.25 oz');
INSERT INTO  products VALUES (92,'nwtcfv-92','northwind traders green beans',1.0000,1.2000,'14.5 oz');
INSERT INTO  products VALUES (93,'nwtcfv-93','northwind traders corn',1.0000,1.2000,'14.5 oz');
INSERT INTO  products VALUES (94,'nwtcfv-94','northwind traders peas',1.0000,1.5000,'14.5 oz');
INSERT INTO  products VALUES (95,'nwtcm-95','northwind traders tuna fish',0.5000,2.0000,'5 oz');
INSERT INTO  products VALUES (96,'nwtcm-96','northwind traders smoked salmon',2.0000,4.0000,'5 oz');
INSERT INTO  products VALUES (97,'nwtc-82','northwind traders hot cereal',3.0000,5.0000,NULL);
INSERT INTO  products VALUES (98,'nwtso-98','northwind traders vegetable soup',1.0000,1.8900,NULL);
INSERT INTO  products VALUES (99,'nwtso-99','northwind traders chicken soup',1.0000,1.9500,NULL);
CREATE TABLE  orders_status (
  status_id int NOT NULL,
  status_name varchar(50) DEFAULT NULL,
  PRIMARY KEY (status_id)
);

INSERT INTO  orders_status VALUES (0,'new');
INSERT INTO  orders_status VALUES (1,'invoiced');
INSERT INTO  orders_status VALUES (2,'shipped');
INSERT INTO  orders_status VALUES (3,'closed');

CREATE TABLE  orders (
  order_id  int NOT NULL,
  employee_id  int DEFAULT NULL,
  customer_id  int DEFAULT NULL,
  order_date date DEFAULT NULL,
  ship_address text,
  ship_city varchar(50) DEFAULT NULL,
  payment_type varchar(50) DEFAULT NULL,
  status_id int DEFAULT NULL,
  PRIMARY KEY (order_id),
  CONSTRAINT new_customeronorders FOREIGN KEY (customer_id) REFERENCES  customers (id),
  CONSTRAINT new_employeesonorders FOREIGN KEY (employee_id) REFERENCES  employees (id),
  CONSTRAINT new_orderstatus FOREIGN KEY (status_id) REFERENCES  orders_status (status_id)
);
INSERT INTO  orders VALUES (30,9,27,'2006-01-15','789 27th street','las vegas','check',3);
INSERT INTO  orders VALUES (31,3,4,'2006-01-20','123 4th street','new york','credit card',3);
INSERT INTO  orders VALUES (32,4,12,'2006-01-22','123 12th street','new york','credit card',3);
INSERT INTO  orders VALUES (33,6,8,'2006-01-30','123 8th street','portland','credit card',3);
INSERT INTO  orders VALUES (34,9,4,'2006-02-06','123 4th street','new york','check',3);
INSERT INTO  orders VALUES (35,3,29,'2006-02-10','789 29th street','denver','check',3);
INSERT INTO  orders VALUES (36,4,3,'2006-02-23','123 3rd street','los angelas','cash',3);
INSERT INTO  orders VALUES (37,8,6,'2006-03-06','123 6th street','milwaukee','credit card',3);
INSERT INTO  orders VALUES (38,9,28,'2006-03-10','789 28th street','memphis','check',3);
INSERT INTO  orders VALUES (39,3,8,'2006-03-22','123 8th street','portland','check',3);
INSERT INTO  orders VALUES (40,4,10,'2006-03-24','123 10th street','chicago','credit card',3);
INSERT INTO  orders VALUES (41,1,7,'2006-03-24','123 7th street','boise',NULL,0);
INSERT INTO  orders VALUES (42,1,10,'2006-03-24','123 10th street','chicago',NULL,2);
INSERT INTO  orders VALUES (43,1,11,'2006-03-24','123 11th street','miami',NULL,0);
INSERT INTO  orders VALUES (44,1,1,'2006-03-24','123 1st street','seattle',NULL,0);
INSERT INTO  orders VALUES (45,1,28,'2006-04-07','789 28th street','memphis','credit card',3);
INSERT INTO  orders VALUES (46,7,9,'2006-04-05','123 9th street','salt lake city','check',3);
INSERT INTO  orders VALUES (47,6,6,'2006-04-08','123 6th street','milwaukee','credit card',3);
INSERT INTO  orders VALUES (48,4,8,'2006-04-05','123 8th street','portland','check',3);
INSERT INTO  orders VALUES (50,9,25,'2006-04-05','789 25th street','chicago','cash',3);
INSERT INTO  orders VALUES (51,9,26,'2006-04-05','789 26th street','miami','credit card',3);
INSERT INTO  orders VALUES (55,1,29,'2006-04-05','789 29th street','denver','check',3);
INSERT INTO  orders VALUES (56,2,6,'2006-04-03','123 6th street','milwaukee','check',3);
INSERT INTO  orders VALUES (57,9,27,'2006-04-22','789 27th street','las vegas','check',0);
INSERT INTO  orders VALUES (58,3,4,'2006-04-22','123 4th street','new york','credit card',3);
INSERT INTO  orders VALUES (59,4,12,'2006-04-22','123 12th street','las vegas','credit card',0);
INSERT INTO  orders VALUES (60,6,8,'2006-04-30','123 8th street','portland','credit card',3);
INSERT INTO  orders VALUES (61,9,4,'2006-04-07','123 4th street','new york','check',0);
INSERT INTO  orders VALUES (62,3,29,'2006-04-12','789 29th street','denver','check',0);
INSERT INTO  orders VALUES (63,4,3,'2006-04-25','123 3rd street','los angelas','cash',3);
INSERT INTO  orders VALUES (64,8,6,'2006-05-09','123 6th street','milwaukee','credit card',0);
INSERT INTO  orders VALUES (65,9,28,'2006-05-11','789 28th street','memphis','check',0);
INSERT INTO  orders VALUES (66,3,8,'2006-05-24','123 8th street','portland','check',0);
INSERT INTO  orders VALUES (67,4,10,'2006-05-24','123 10th street','chicago','credit card',3);
INSERT INTO  orders VALUES (68,1,7,'2006-05-24','123 7th street','boise',NULL,0);
INSERT INTO  orders VALUES (69,1,10,'2006-05-24','123 10th street','chicago',NULL,0);
INSERT INTO  orders VALUES (70,1,11,'2006-05-24','123 11th street','miami',NULL,0);
INSERT INTO  orders VALUES (71,1,1,'2006-05-24','123 1st street','seattle',NULL,0);
INSERT INTO  orders VALUES (72,1,28,'2006-06-07','789 28th street','memphis','credit card',3);
INSERT INTO  orders VALUES (73,7,9,'2006-06-05','123 9th street','salt lake city','check',3);
INSERT INTO  orders VALUES (74,6,6,'2006-06-08','123 6th street','milwaukee','credit card',3);
INSERT INTO  orders VALUES (75,4,8,'2006-06-05','123 8th street','portland','check',3);
INSERT INTO  orders VALUES (76,9,25,'2006-06-05','789 25th street','chicago','cash',3);
INSERT INTO  orders VALUES (77,9,26,'2006-06-05','789 26th street','miami','credit card',3);
INSERT INTO  orders VALUES (78,1,29,'2006-06-05','789 29th street','denver','check',3);
INSERT INTO  orders VALUES (79,2,6,'2006-06-23','123 6th street','milwaukee','check',3);
INSERT INTO  orders VALUES (80,2,4,'2006-04-25','123 4th street','new york',NULL,0);
INSERT INTO  orders VALUES (81,2,3,'2006-04-25','123 3rd street','los angelas',NULL,0);
CREATE TABLE  order_details (
  id  int NOT NULL,
  order_id  int DEFAULT NULL,
  product_id  int DEFAULT NULL,
  quantity decimal(18,4) DEFAULT NULL,
  unit_price decimal(19,4) DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT new_orderdetails FOREIGN KEY (order_id) REFERENCES  orders (order_id) ON DELETE CASCADE,
  CONSTRAINT new_productsonorders FOREIGN KEY (product_id) REFERENCES  products (id)
);

INSERT INTO  order_details VALUES (27,30,34,100.0000,14.0000);
INSERT INTO  order_details VALUES (28,30,80,30.0000,3.5000);
INSERT INTO  order_details VALUES (29,31,7,10.0000,30.0000);
INSERT INTO  order_details VALUES (30,31,51,10.0000,53.0000);
INSERT INTO  order_details VALUES (31,31,80,10.0000,3.5000);
INSERT INTO  order_details VALUES (32,32,1,15.0000,18.0000);
INSERT INTO  order_details VALUES (33,32,43,20.0000,46.0000);
INSERT INTO  order_details VALUES (34,33,19,30.0000,9.2000);
INSERT INTO  order_details VALUES (35,34,19,20.0000,9.2000);
INSERT INTO  order_details VALUES (36,35,48,10.0000,12.7500);
INSERT INTO  order_details VALUES (37,36,41,200.0000,9.6500);
INSERT INTO  order_details VALUES (38,37,8,17.0000,40.0000);
INSERT INTO  order_details VALUES (39,38,43,300.0000,46.0000);
INSERT INTO  order_details VALUES (40,39,48,100.0000,12.7500);
INSERT INTO  order_details VALUES (41,40,81,200.0000,2.9900);
INSERT INTO  order_details VALUES (42,41,43,300.0000,46.0000);
INSERT INTO  order_details VALUES (43,42,6,10.0000,25.0000);
INSERT INTO  order_details VALUES (44,42,4,10.0000,22.0000);
INSERT INTO  order_details VALUES (45,42,19,10.0000,9.2000);
INSERT INTO  order_details VALUES (46,43,80,20.0000,3.5000);
INSERT INTO  order_details VALUES (47,43,81,50.0000,2.9900);
INSERT INTO  order_details VALUES (48,44,1,25.0000,18.0000);
INSERT INTO  order_details VALUES (49,44,43,25.0000,46.0000);
INSERT INTO  order_details VALUES (50,44,81,25.0000,2.9900);
INSERT INTO  order_details VALUES (51,45,41,50.0000,9.6500);
INSERT INTO  order_details VALUES (52,45,40,50.0000,18.4000);
INSERT INTO  order_details VALUES (53,46,57,100.0000,19.5000);
INSERT INTO  order_details VALUES (54,46,72,50.0000,34.8000);
INSERT INTO  order_details VALUES (55,47,34,300.0000,14.0000);
INSERT INTO  order_details VALUES (56,48,8,25.0000,40.0000);
INSERT INTO  order_details VALUES (57,48,19,25.0000,9.2000);
INSERT INTO  order_details VALUES (59,50,21,20.0000,10.0000);
INSERT INTO  order_details VALUES (60,51,5,25.0000,21.3500);
INSERT INTO  order_details VALUES (61,51,41,30.0000,9.6500);
INSERT INTO  order_details VALUES (62,51,40,30.0000,18.4000);
INSERT INTO  order_details VALUES (66,56,48,10.0000,12.7500);
INSERT INTO  order_details VALUES (67,55,34,87.0000,14.0000);
INSERT INTO  order_details VALUES (68,79,7,30.0000,30.0000);
INSERT INTO  order_details VALUES (69,79,51,30.0000,53.0000);
INSERT INTO  order_details VALUES (70,78,17,40.0000,39.0000);
INSERT INTO  order_details VALUES (71,77,6,90.0000,25.0000);
INSERT INTO  order_details VALUES (72,76,4,30.0000,22.0000);
INSERT INTO  order_details VALUES (73,75,48,40.0000,12.7500);
INSERT INTO  order_details VALUES (74,74,48,40.0000,12.7500);
INSERT INTO  order_details VALUES (75,73,41,10.0000,9.6500);
INSERT INTO  order_details VALUES (76,72,43,5.0000,46.0000);
INSERT INTO  order_details VALUES (77,71,40,40.0000,18.4000);
INSERT INTO  order_details VALUES (78,70,8,20.0000,40.0000);
INSERT INTO  order_details VALUES (79,69,80,15.0000,3.5000);
INSERT INTO  order_details VALUES (80,67,74,20.0000,10.0000);
INSERT INTO  order_details VALUES (81,60,72,40.0000,34.8000);
INSERT INTO  order_details VALUES (82,63,3,50.0000,10.0000);
INSERT INTO  order_details VALUES (83,63,8,3.0000,40.0000);
INSERT INTO  order_details VALUES (84,58,20,40.0000,81.0000);
INSERT INTO  order_details VALUES (85,58,52,40.0000,7.0000);
INSERT INTO  order_details VALUES (86,80,56,10.0000,38.0000);
INSERT INTO  order_details VALUES (90,81,81,0.0000,2.9900);
INSERT INTO  order_details VALUES (91,81,56,0.0000,38.0000);
