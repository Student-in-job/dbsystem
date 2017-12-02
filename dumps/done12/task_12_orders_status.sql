
CREATE TABLE orders_status (
  status_id tinyint(3) unsigned NOT NULL,
  status_name varchar(50) DEFAULT NULL,
  PRIMARY KEY (status_id)
);
INSERT INTO orders_status VALUES (0,'new');
INSERT INTO orders_status VALUES (1,'invoiced');
INSERT INTO orders_status VALUES (2,'shipped');
INSERT INTO orders_status VALUES (3,'closed');
