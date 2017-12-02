CREATE TABLE employees (
  id int(10) NOT NULL,
  last_name varchar(50) DEFAULT NULL,
  first_name varchar(50) DEFAULT NULL,
  email_address varchar(50) DEFAULT NULL,
  job_title varchar(50) DEFAULT NULL,
  address longtext,
  city varchar(50) DEFAULT NULL,
  web_page longtext,
  PRIMARY KEY (id)
);
INSERT INTO employees VALUES (1,'freehafer','nancy','nancy@northwindtraders.com','sales representative','123 1st avenue','seattle','#http://northwindtraders.com#');
INSERT INTO employees VALUES (2,'cencini','andrew','andrew@northwindtraders.com','vice president ,  sales','123 2nd avenue','bellevue','http://northwindtraders.com#http://northwindtraders.com/#');
INSERT INTO employees VALUES (3,'kotas','jan','jan@northwindtraders.com','sales representative','123 3rd avenue','redmond','http://northwindtraders.com#http://northwindtraders.com/#');
INSERT INTO employees VALUES (4,'sergienko','mariya','mariya@northwindtraders.com','sales representative','123 4th avenue','kirkland','http://northwindtraders.com#http://northwindtraders.com/#');
INSERT INTO employees VALUES (5,'thorpe','steven','steven@northwindtraders.com','sales manager','123 5th avenue','seattle','http://northwindtraders.com#http://northwindtraders.com/#');
INSERT INTO employees VALUES (6,'neipper','michael','twines@northwindtraders.com','sales representative','123 6th avenue','redmond','http://northwindtraders.com#http://northwindtraders.com/#');
INSERT INTO employees VALUES (7,'zare','robert','robert@northwindtraders.com','sales representative','123 7th avenue','seattle','http://northwindtraders.com#http://northwindtraders.com/#');
INSERT INTO employees VALUES (8,'giussani','laura','laura@northwindtraders.com','sales coordinator','123 8th avenue','redmond','http://northwindtraders.com#http://northwindtraders.com/#');
INSERT INTO employees VALUES (9,'hellung-larsen','anne','bunnyben@northwindtraders.com','sales representative','123 9th avenue','seattle','http://northwindtraders.com#http://northwindtraders.com/#');

