
CREATE TABLE customers (
  id int(10) NOT NULL,
  company varchar(50) DEFAULT NULL,
  last_name varchar(50) DEFAULT NULL,
  first_name varchar(50) DEFAULT NULL,
  job_title varchar(50) DEFAULT NULL,
  address longtext,
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
INSERT INTO customers VALUES (255,'sony','paola','petrova','seler',NULL,NULL);
INSERT INTO customers VALUES (2545,'sony','bob','barley','seler',NULL,NULL);
