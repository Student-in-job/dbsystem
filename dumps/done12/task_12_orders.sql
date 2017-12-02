
CREATE TABLE orders (
  order_id int(10) NOT NULL,
  employee_id int(10) DEFAULT NULL,
  customer_id int(10) DEFAULT NULL,
  order_date date DEFAULT NULL,
  ship_address longtext,
  ship_city varchar(50) DEFAULT NULL,
  payment_type varchar(50) DEFAULT NULL,
  status_id tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (order_id),
  KEY new_customeronorders (customer_id),
  KEY new_employeesonorders (employee_id),
  KEY new_orderstatus (status_id),
  CONSTRAINT new_customeronorders FOREIGN KEY (customer_id) REFERENCES customers (id),
  CONSTRAINT new_employeesonorders FOREIGN KEY (employee_id) REFERENCES employees (id),
  CONSTRAINT new_orderstatus FOREIGN KEY (status_id) REFERENCES orders_status (status_id)
);
INSERT INTO orders VALUES (30,9,27,'2006-01-15','789 27th street','las vegas','check',3);
INSERT INTO orders VALUES (31,3,4,'2006-01-20','123 4th street','new york','credit card',3);
INSERT INTO orders VALUES (32,4,12,'2006-01-22','123 12th street','new york','credit card',3);
INSERT INTO orders VALUES (33,6,8,'2006-01-30','123 8th street','portland','credit card',3);
INSERT INTO orders VALUES (34,9,4,'2006-02-06','123 4th street','new york','check',3);
INSERT INTO orders VALUES (35,3,29,'2006-02-10','789 29th street','denver','check',3);
INSERT INTO orders VALUES (36,4,3,'2006-02-23','123 3rd street','los angelas','cash',3);
INSERT INTO orders VALUES (37,8,6,'2006-03-06','123 6th street','milwaukee','credit card',3);
INSERT INTO orders VALUES (38,9,28,'2006-03-10','789 28th street','memphis','check',3);
INSERT INTO orders VALUES (39,3,8,'2006-03-22','123 8th street','portland','check',3);
INSERT INTO orders VALUES (40,4,10,'2006-03-24','123 10th street','chicago','credit card',3);
INSERT INTO orders VALUES (41,1,7,'2006-03-24','123 7th street','boise',NULL,0);
INSERT INTO orders VALUES (42,1,10,'2006-03-24','123 10th street','chicago',NULL,2);
INSERT INTO orders VALUES (43,1,11,'2006-03-24','123 11th street','miami',NULL,0);
INSERT INTO orders VALUES (44,1,1,'2006-03-24','123 1st street','seattle',NULL,0);
INSERT INTO orders VALUES (45,1,28,'2006-04-07','789 28th street','memphis','credit card',3);
INSERT INTO orders VALUES (46,7,9,'2006-04-05','123 9th street','salt lake city','check',3);
INSERT INTO orders VALUES (47,6,6,'2006-04-08','123 6th street','milwaukee','credit card',3);
INSERT INTO orders VALUES (48,4,8,'2006-04-05','123 8th street','portland','check',3);
INSERT INTO orders VALUES (50,9,25,'2006-04-05','789 25th street','chicago','cash',3);
INSERT INTO orders VALUES (51,9,26,'2006-04-05','789 26th street','miami','credit card',3);
INSERT INTO orders VALUES (55,1,29,'2006-04-05','789 29th street','denver','check',3);
INSERT INTO orders VALUES (56,2,6,'2006-04-03','123 6th street','milwaukee','check',3);
INSERT INTO orders VALUES (57,9,27,'2006-04-22','789 27th street','las vegas','check',0);
INSERT INTO orders VALUES (58,3,4,'2006-04-22','123 4th street','new york','credit card',3);
INSERT INTO orders VALUES (59,4,12,'2006-04-22','123 12th street','las vegas','credit card',0);
INSERT INTO orders VALUES (60,6,8,'2006-04-30','123 8th street','portland','credit card',3);
INSERT INTO orders VALUES (61,9,4,'2006-04-07','123 4th street','new york','check',0);
INSERT INTO orders VALUES (62,3,29,'2006-04-12','789 29th street','denver','check',0);
INSERT INTO orders VALUES (63,4,3,'2006-04-25','123 3rd street','los angelas','cash',3);
INSERT INTO orders VALUES (64,8,6,'2006-05-09','123 6th street','milwaukee','credit card',0);
INSERT INTO orders VALUES (65,9,28,'2006-05-11','789 28th street','memphis','check',0);
INSERT INTO orders VALUES (66,3,8,'2006-05-24','123 8th street','portland','check',0);
INSERT INTO orders VALUES (67,4,10,'2006-05-24','123 10th street','chicago','credit card',3);
INSERT INTO orders VALUES (68,1,7,'2006-05-24','123 7th street','boise',NULL,0);
INSERT INTO orders VALUES (69,1,10,'2006-05-24','123 10th street','chicago',NULL,0);
INSERT INTO orders VALUES (70,1,11,'2006-05-24','123 11th street','miami',NULL,0);
INSERT INTO orders VALUES (71,1,1,'2006-05-24','123 1st street','seattle',NULL,0);
INSERT INTO orders VALUES (72,1,28,'2006-06-07','789 28th street','memphis','credit card',3);
INSERT INTO orders VALUES (73,7,9,'2006-06-05','123 9th street','salt lake city','check',3);
INSERT INTO orders VALUES (74,6,6,'2006-06-08','123 6th street','milwaukee','credit card',3);
INSERT INTO orders VALUES (75,4,8,'2006-06-05','123 8th street','portland','check',3);
INSERT INTO orders VALUES (76,9,25,'2006-06-05','789 25th street','chicago','cash',3);
INSERT INTO orders VALUES (77,9,26,'2006-06-05','789 26th street','miami','credit card',3);
INSERT INTO orders VALUES (78,1,29,'2006-06-05','789 29th street','denver','check',3);
INSERT INTO orders VALUES (79,2,6,'2006-06-23','123 6th street','milwaukee','check',3);
INSERT INTO orders VALUES (80,2,4,'2006-04-25','123 4th street','new york',NULL,0);
INSERT INTO orders VALUES (81,2,3,'2006-04-25','123 3rd street','los angelas',NULL,0);
