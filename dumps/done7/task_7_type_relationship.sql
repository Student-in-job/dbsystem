
CREATE TABLE type_relationship (
  id int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (id)
);
INSERT INTO type_relationship VALUES (1,'родственник');
INSERT INTO type_relationship VALUES (2,'друг');
INSERT INTO type_relationship VALUES (3,'знакомый');
INSERT INTO type_relationship VALUES (4,'коллега');
INSERT INTO type_relationship VALUES (5,'сослуживец');
INSERT INTO type_relationship VALUES (6,'одноклассник');
