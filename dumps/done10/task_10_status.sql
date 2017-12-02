
CREATE TABLE 10_status (
  id_status int(11) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (id_status)
);

INSERT INTO 10_status VALUES (1,'new');
INSERT INTO 10_status VALUES (2,'pending');
INSERT INTO 10_status VALUES (3,'closed');

