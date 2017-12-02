
CREATE TABLE products (
  id int(10) NOT NULL,
  product_code varchar(25) DEFAULT NULL,
  product_name varchar(50) DEFAULT NULL,
  standard_cost decimal(19,4) DEFAULT NULL,
  list_price decimal(19,4) DEFAULT NULL,
  quantity_per_unit varchar(50) DEFAULT NULL,
  PRIMARY KEY (id)
);
INSERT INTO products VALUES (1,'nwtb-1','northwind traders chai',13.5000,18.0000,'10 boxes x 20 bags');
INSERT INTO products VALUES (3,'nwtco-3','northwind traders syrup',7.5000,10.0000,'12 - 550 ml bottles');
INSERT INTO products VALUES (4,'nwtco-4','northwind traders cajun seasoning',16.5000,22.0000,'48 - 6 oz jars');
INSERT INTO products VALUES (5,'nwto-5','northwind traders olive oil',16.0125,21.3500,'36 boxes');
INSERT INTO products VALUES (6,'nwtjp-6','northwind traders boysenberry spread',18.7500,25.0000,'12 - 8 oz jars');
INSERT INTO products VALUES (7,'nwtdfn-7','northwind traders dried pears',22.5000,30.0000,'12 - 1 lb pkgs.');
INSERT INTO products VALUES (8,'nwts-8','northwind traders curry sauce',30.0000,40.0000,'12 - 12 oz jars');
INSERT INTO products VALUES (14,'nwtdfn-14','northwind traders walnuts',17.4375,23.2500,'40 - 100 g pkgs.');
INSERT INTO products VALUES (17,'nwtcfv-17','northwind traders fruit cocktail',29.2500,39.0000,'15.25 oz');
INSERT INTO products VALUES (19,'nwtbgm-19','northwind traders chocolate biscuits mix',6.9000,9.2000,'10 boxes x 12 pieces');
INSERT INTO products VALUES (20,'nwtjp-6','northwind traders marmalade',60.7500,81.0000,'30 gift boxes');
INSERT INTO products VALUES (21,'nwtbgm-21','northwind traders scones',7.5000,10.0000,'24 pkgs. x 4 pieces');
INSERT INTO products VALUES (34,'nwtb-34','northwind traders beer',10.5000,14.0000,'24 - 12 oz bottles');
INSERT INTO products VALUES (40,'nwtcm-40','northwind traders crab meat',13.8000,18.4000,'24 - 4 oz tins');
INSERT INTO products VALUES (41,'nwtso-41','northwind traders clam chowder',7.2375,9.6500,'12 - 12 oz cans');
INSERT INTO products VALUES (43,'nwtb-43','northwind traders coffee',34.5000,46.0000,'16 - 500 g tins');
INSERT INTO products VALUES (48,'nwtca-48','northwind traders chocolate',9.5625,12.7500,'10 pkgs');
INSERT INTO products VALUES (51,'nwtdfn-51','northwind traders dried apples',39.7500,53.0000,'50 - 300 g pkgs.');
INSERT INTO products VALUES (52,'nwtg-52','northwind traders long grain rice',5.2500,7.0000,'16 - 2 kg boxes');
INSERT INTO products VALUES (56,'nwtp-56','northwind traders gnocchi',28.5000,38.0000,'24 - 250 g pkgs.');
INSERT INTO products VALUES (57,'nwtp-57','northwind traders ravioli',14.6250,19.5000,'24 - 250 g pkgs.');
INSERT INTO products VALUES (65,'nwts-65','northwind traders hot pepper sauce',15.7875,21.0500,'32 - 8 oz bottles');
INSERT INTO products VALUES (66,'nwts-66','northwind traders tomato sauce',12.7500,17.0000,'24 - 8 oz jars');
INSERT INTO products VALUES (72,'nwtd-72','northwind traders mozzarella',26.1000,34.8000,'24 - 200 g pkgs.');
INSERT INTO products VALUES (74,'nwtdfn-74','northwind traders almonds',7.5000,10.0000,'5 kg pkg.');
INSERT INTO products VALUES (77,'nwtco-77','northwind traders mustard',9.7500,13.0000,'12 boxes');
INSERT INTO products VALUES (80,'nwtdfn-80','northwind traders dried plums',3.0000,3.5000,'1 lb bag');
INSERT INTO products VALUES (81,'nwtb-81','northwind traders green tea',2.0000,2.9900,'20 bags per box');
INSERT INTO products VALUES (82,'nwtc-82','northwind traders granola',2.0000,4.0000,NULL);
INSERT INTO products VALUES (83,'nwtcs-83','northwind traders potato chips',0.5000,1.8000,NULL);
INSERT INTO products VALUES (85,'nwtbgm-85','northwind traders brownie mix',9.0000,12.4900,'3 boxes');
INSERT INTO products VALUES (86,'nwtbgm-86','northwind traders cake mix',10.5000,15.9900,'4 boxes');
INSERT INTO products VALUES (87,'nwtb-87','northwind traders tea',2.0000,4.0000,'100 count per box');
INSERT INTO products VALUES (88,'nwtcfv-88','northwind traders pears',1.0000,1.3000,'15.25 oz');
INSERT INTO products VALUES (89,'nwtcfv-89','northwind traders peaches',1.0000,1.5000,'15.25 oz');
INSERT INTO products VALUES (90,'nwtcfv-90','northwind traders pineapple',1.0000,1.8000,'15.25 oz');
INSERT INTO products VALUES (91,'nwtcfv-91','northwind traders cherry pie filling',1.0000,2.0000,'15.25 oz');
INSERT INTO products VALUES (92,'nwtcfv-92','northwind traders green beans',1.0000,1.2000,'14.5 oz');
INSERT INTO products VALUES (93,'nwtcfv-93','northwind traders corn',1.0000,1.2000,'14.5 oz');
INSERT INTO products VALUES (94,'nwtcfv-94','northwind traders peas',1.0000,1.5000,'14.5 oz');
INSERT INTO products VALUES (95,'nwtcm-95','northwind traders tuna fish',0.5000,2.0000,'5 oz');
INSERT INTO products VALUES (96,'nwtcm-96','northwind traders smoked salmon',2.0000,4.0000,'5 oz');
INSERT INTO products VALUES (97,'nwtc-82','northwind traders hot cereal',3.0000,5.0000,NULL);
INSERT INTO products VALUES (98,'nwtso-98','northwind traders vegetable soup',1.0000,1.8900,NULL);
INSERT INTO products VALUES (99,'nwtso-99','northwind traders chicken soup',1.0000,1.9500,NULL);
