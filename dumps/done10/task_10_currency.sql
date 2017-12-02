
CREATE TABLE 10_currency (
  id_currency int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  symbol varchar(45) DEFAULT NULL,
  id_country int(11) DEFAULT NULL,
  PRIMARY KEY (id_currency),
  KEY fk_currency_country1_idx (id_country),
  CONSTRAINT fk_currency_country1 FOREIGN KEY (id_country) REFERENCES 10_country (id_country) ON DELETE NO ACTION ON UPDATE NO ACTION
);

INSERT INTO 10_currency VALUES (1,'доллары','$',1);
INSERT INTO 10_currency VALUES (2,'рубли','rub',2);
INSERT INTO 10_currency VALUES (3,'евро','€',NULL);


