
DROP TABLE IF EXISTS books;

CREATE TABLE books (
  code_book int(11) NOT NULL DEFAULT '0',
  title_book varchar(75) DEFAULT NULL,
  code_author int(11) DEFAULT NULL,
  pages decimal(10,0) DEFAULT NULL,
  code_publish int(11) DEFAULT NULL,
  PRIMARY KEY (code_book),
  KEY fk_books (code_author),
  KEY fk_book (code_publish),
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
