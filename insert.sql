INSERT INTO user (user_name, user_surname, birthday, gender, user_mail, passwords, date_reg, user_deleted) VALUES ('Kseniya', 'Andreeva', '1994-03-09', 'w', 'ksinn@mail.ru', 'qwerty', '2016-07-15', '0');

Insert into area(area_name) values("MySQL");

INSERT INTO program (program_name, program_description, program_min_level, program_level, program_state, program_duration, teacher, area, program_date, program_controled, program_typ, program_deleted) VALUES ('DML and DDL', 'Data Definition Language (DDL) statements are used to define the database structure or schema. Data Manipulation Language (DML) statements are used for managing data within schema objects.', '0', '1', 'created', '9', '1', '1', '2016-07-15', '0', 'Mini', '0');

INSERT INTO material (material_name, material_day, material_type, material_file, program, material_text, material_deleted) VALUES ('What are the difference between DDL and DML commands?', '1', 'lecture', '<h3>DDL</h3> <p> Data Definition Language (DDL) statements are used to define the database structure or schema. Some examples: CREATE - to create objects in the database ALTER - alters the structure of the database DROP - delete objects from the database TRUNCATE - remove all records from a table, including all spaces allocated for the records are removed COMMENT - add comments to the data dictionary RENAME - rename an object </p> <h3>DML</h3> <p> Data Manipulation Language (DML) statements are used for managing data within schema objects. Some examples: SELECT - retrieve data from the a database INSERT - insert data into a table UPDATE - updates existing data within a table DELETE - deletes all records from a table, the space for the records remain MERGE - UPSERT operation (insert or update) CALL - call a PL/SQL or Java subprogram EXPLAIN PLAN - explain access path to data LOCK TABLE - control concurrency </p> <h3>DCL</h3> <p> Data Control Language (DCL) statements. Some examples: GRANT - gives user\'s access privileges to database REVOKE - withdraw access privileges given with the GRANT command </p> <h3>TCL</h3> <p> Transaction Control (TCL) statements are used to manage the changes made by DML statements. It allows statements to be grouped together into logical transactions. COMMIT - save work done SAVEPOINT - identify a point in a transaction to which you can later roll back ROLLBACK - restore database to original since the last COMMIT SET TRANSACTION - Change transaction options like isolation level and what rollback segment to use</p>', '1', 'What are the difference between DDL, DML and DCL commands?', '0');

INSERT INTO test (test_name, test_day, program, test_deleted) VALUES ('DDL and DML commands.', '2', '1', '0');

INSERT INTO test_task (test_task_no, test_task_text, test_task_answer, test_task_v1, test_task_v2, test_task_v3, test_task_v4, test_task_ball, test, test_task_deleted) VALUES ('1', 'Whot is comands of DDL?', 'ALTER', 'SELECT', 'INSERT', 'UPDATE', 'DELETE', '2', '1', '0');




