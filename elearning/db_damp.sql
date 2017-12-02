CREATE DATABASE  IF NOT EXISTS `elearning_test` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `elearning_test`;
-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: elearning_test
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth`
--

DROP TABLE IF EXISTS `auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth` (
  `user` varchar(32) NOT NULL,
  `factor` enum('phone','key') DEFAULT NULL,
  `mods` char(1) NOT NULL,
  `result` int(11) NOT NULL,
  `addDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `fk_auth_user` (`user`),
  CONSTRAINT `fk_auth_user` FOREIGN KEY (`user`) REFERENCES `user` (`mail`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth`
--

LOCK TABLES `auth` WRITE;
/*!40000 ALTER TABLE `auth` DISABLE KEYS */;
INSERT INTO `auth` VALUES ('ksinnd@gmail.com','key','i',1,'2016-12-03 12:44:17'),('ksinnd@gmail.com','key','i',1,'2016-12-03 12:46:02'),('ksinnd@gmail.com',NULL,'o',1,'2016-12-03 12:46:07'),('ksinnd@gmail.com',NULL,'o',1,'2016-12-03 13:09:18'),('ksinnd@gmail.com',NULL,'o',1,'2016-12-03 13:09:28'),('vitalik.pak@gmail.com',NULL,'o',1,'2016-12-03 13:14:42'),('ksinnd@gmail.com','key','i',0,'2016-12-04 04:11:09'),('ksinnd@gmail.com','key','i',0,'2016-12-04 04:11:21'),('vitalik.pak@gmail.com','key','i',1,'2016-12-04 04:15:10'),('vitalik.pak@gmail.com',NULL,'o',1,'2016-12-04 04:15:35'),('ksinnd@gmail.com','key','i',0,'2016-12-04 04:23:42'),('vitalik.pak@gmail.com','key','i',1,'2016-12-04 04:24:06'),('ksinnd@gmail.com','key','i',0,'2016-12-04 05:05:46'),('ksinnd@gmail.com','key','i',1,'2016-12-04 05:05:59'),('ksinnd@gmail.com',NULL,'o',1,'2016-12-04 05:06:19'),('ksinnd@gmail.com','key','i',1,'2016-12-04 05:06:41'),('ksinnd@gmail.com',NULL,'o',1,'2016-12-04 05:07:39'),('ksinnd@gmail.com','key','i',1,'2016-12-04 05:07:50'),('ksinnd@gmail.com',NULL,'o',1,'2016-12-04 05:08:09'),('ksinnd@gmail.com','key','i',0,'2016-12-04 05:08:20'),('vitalik.pak@gmail.com','key','i',1,'2016-12-04 05:08:36'),('vitalik.pak@gmail.com',NULL,'o',1,'2016-12-04 05:09:07'),('vitalik.pak@gmail.com','key','i',1,'2016-12-04 05:09:19'),('vitalik.pak@gmail.com',NULL,'o',1,'2016-12-04 05:09:21'),('ksinnd@gmail.com','key','i',0,'2016-12-04 05:09:30'),('vitalik.pak@gmail.com','key','i',1,'2016-12-04 05:10:08'),('ksinnd@gmail.com',NULL,'o',1,'2016-12-05 06:45:58'),('ksinnd@gmail.com',NULL,'o',1,'2016-12-05 06:54:14'),('vitalik.pak@gmail.com',NULL,'o',1,'2016-12-10 12:15:47'),('vitalik.pak@gmail.com',NULL,'o',1,'2016-12-10 12:29:54'),('ksinnd@gmail.com',NULL,'o',1,'2016-12-10 12:32:52'),('vitalik.pak@gmail.com',NULL,'o',1,'2016-12-10 12:34:10');
/*!40000 ALTER TABLE `auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `start_date` date NOT NULL,
  `program` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `closed` int(11) DEFAULT '0',
  `open` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_course_program` (`program`),
  CONSTRAINT `fk_course_program` FOREIGN KEY (`program`) REFERENCES `program` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (9,'2017-10-27 14:44:50','2017-11-02',133,0,0,0);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `duration` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_program_user` (`user`),
  CONSTRAINT `fk_program_user` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program`
--

LOCK TABLES `program` WRITE;
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
INSERT INTO `program` VALUES (133,'2017-10-27 13:41:16','Test program','Заканчиваем. Предыдущие части: [1], [2]. Комбинации для запоминания: undo/redo, поиск/замена.\r\nСкриншот Scribus с справкой по nano\r\nВ конце топика — ссылка на PDF\'ку c обобщённой шпаргалкой и её исходник (на картинке скриншот редактора).\r\n\r\nОтмена действий по-умолчанию не работает и требует запуска редактора с опцией «поддержка отмены» (да, nano по-умолчанию не поддерживает undo). Ключ командной строки -u.\r\n\r\nnano -u sometext.\r\n\r\nПосле этого начинают работать команды:\r\n\r\nAlt-U — undo\r\nAlt-E — redo.\r\n\r\nЗаметим, что в справке (Ctrl-G) оно появляется тоже, только если запустить nano с опцией -u.\r\n\r\nЕсли nano запущен без -u, то единственной формой undo является отмена вырезанных по Ctrl-K строк обратным их вставлением — Ctrl-U.\r\n\r\nС поиском чуть лучше.\r\n\r\nпоиск — Ctrl-W Хотя заявлена поддержка регэкспов, мне её не удалось добиться, так что поиск просто по подстроке.\r\nПовторный поиск (без появления диалога) — Alt-W\r\nЗамена Ctrl-\\\r\nПовторной замены нет, так как при замене выдаётся запрос «да/нет, отмена, всё».\r\n\r\nМногобуфферность (возможность иметь несколько открытых файлов).\r\n\r\nВключается командой Alt-F. После этого работают кнопки Alt-< и Alt-> (или они же без шифта: Alt-., Alt-, (альт точка, альт запятая)).\r\n\r\nПоследняя фича: возможность вводить текст по коду: Esc 255 — вставляет заданный десятичный код (255), а для ввода младших кодов ASCII можно использовать комбинацию Alt-V нужная кнопка, например, Alt-V Ctrl-Z.\r\nПожалуй, на этом редактор можно считать освоенным, остальные его фичи (изменение отступа для абзаца, выравание для абзаца и т.д.) уже не нужны для комфортной работы в аварийной ситуации.',3,1,0);
/*!40000 ALTER TABLE `program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_code`
--

DROP TABLE IF EXISTS `sms_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_code` (
  `sms_code` int(11) NOT NULL,
  `user` int(11) DEFAULT NULL,
  `addDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `user` (`user`),
  CONSTRAINT `fk_sms_code_user` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_code`
--

LOCK TABLES `sms_code` WRITE;
/*!40000 ALTER TABLE `sms_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `study`
--

DROP TABLE IF EXISTS `study`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `study` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `addDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `course` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `completed` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`user`,`course`),
  KEY `fk_teaching_course` (`course`),
  CONSTRAINT `fk_teaching_course` FOREIGN KEY (`course`) REFERENCES `course` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_teaching_user` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study`
--

LOCK TABLES `study` WRITE;
/*!40000 ALTER TABLE `study` DISABLE KEYS */;
INSERT INTO `study` VALUES (1,2,'2017-10-28 07:25:32',9,0,0),(2,1,'2017-10-28 07:25:57',9,0,0);
/*!40000 ALTER TABLE `study` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `group_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(64) NOT NULL,
  `day` int(11) NOT NULL,
  `program` int(11) NOT NULL,
  `total_count` int(11) NOT NULL,
  `passing_count` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `starttime` int(11) NOT NULL,
  `period` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `service` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `task_service_fk` (`service`),
  CONSTRAINT `task_service_fk` FOREIGN KEY (`service`) REFERENCES `task_service` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,6,'2017-10-27 14:05:28','Task for SELECT',1,133,10,4,20,16,1,0,2),(1,7,'2017-10-27 14:06:34','Task for UPDATE',2,133,10,4,30,16,1,0,1),(1,8,'2017-10-27 14:23:11','Task for DELETE',3,133,10,4,30,16,3,0,2);
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_service`
--

DROP TABLE IF EXISTS `task_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `url` varchar(128) NOT NULL,
  `service_key` varchar(128) NOT NULL,
  `my_key` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`),
  UNIQUE KEY `my_key` (`my_key`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_service`
--

LOCK TABLES `task_service` WRITE;
/*!40000 ALTER TABLE `task_service` DISABLE KEYS */;
INSERT INTO `task_service` VALUES (1,'SQLTask','tomcat.cybercloud.uz/SQLTask','elearning-main_12345','sql-task_12345'),(2,'Test','tomcat.cybercloud.uz/test','123456789','987654321');
/*!40000 ALTER TABLE `task_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `surname` varchar(32) NOT NULL,
  `mail` varchar(32) NOT NULL,
  `addDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mail` (`mail`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Kseniya','Andreeva','ksinnd@gmail.com','2016-11-30 15:32:16',0),(2,'Vitaliy','Pak','vitalik.pak@gmail.com','2016-12-02 12:31:51',0),(3,'dil','shod','dilyarosa@gmail.com','2016-12-03 06:23:46',0),(4,'Abror','Abdugafforov','abdugafforov6047@gmail.com','2016-12-06 12:01:11',0),(5,'Behruzjon','\rAbdullayev','baxtiyorabdulllayev@gmail.com','2016-12-06 12:01:11',0),(6,'Shaxzod','\rAbduraximov','abduraximovshaxzod56@gmail.com','2016-12-06 12:01:11',0),(7,'Inom','\rAbduraxmonov','bestinom419@gmail.com','2016-12-06 12:01:11',0),(8,'Akram','\rAkhmedov','mr.akram.aaa@gmail.com','2016-12-06 12:01:11',0),(9,'Oybek','\rAllayorov','oybekallayorov@gmail.com','2016-12-06 12:01:11',0),(10,'Hojiakbar','\rHakimov','hakimovhojiakbarb@gmail.com','2016-12-06 12:01:12',0),(11,'Mehriddin','\rHaydarov','haydarovmehriddin1994@gmail.com','2016-12-06 12:01:12',0),(12,'Shahzodbek','\rKhurboyev','xurboyev95@gmail.com','2016-12-06 12:01:12',0),(13,'Davlatyor','\rKhusanboyev','davlat4ikkorean@gmail.com','2016-12-06 12:01:12',0),(14,'Shuxrat','\rKurbonaliyev','shuhrat0594@gmail.com','2016-12-06 12:01:12',0),(15,'Karim','\rMajidov','majidov.karim.1995@gmail.com','2016-12-06 12:01:12',0),(16,'Samandar','\rMamatov','samandarqulmamatov1995@gmail.com','2016-12-06 12:01:12',0),(17,'Mirokil','\rYorikulov','manner.manner.m@gmail.com','2016-12-06 12:01:12',0),(18,'Akromjon','\rObidov','akobidov777@gmail.com','2016-12-06 12:01:12',0),(19,'Nodirbek','\rPolvonov','polvonovnodirbek22@gmail.com','2016-12-06 12:01:12',0),(20,'Sherzodbek','\rQo\'chqorov','admiralsherzod@gmail.com','2016-12-06 12:01:12',0),(21,'Dilshoda','\rQurbonalieva','dilshoda660@gmail.com','2016-12-06 12:01:12',0),(22,'Lobar','\rRasulova','lobarrasulova595@gmail.com','2016-12-06 12:01:12',0),(23,'Sardor','\rSalimov','rockefeller9191@gmail.com','2016-12-06 12:01:12',0),(24,'Sardor','\rSharifov','sardorsx5@gmail.com','2016-12-06 12:01:12',0),(25,'Islam','\rTagaev','tagaev9090@gmail.com','2016-12-06 12:01:12',0),(26,'Murod','\rTuraev','murod.turaev.9495@gmail.com','2016-12-06 12:01:12',0),(27,'Jamoliddin','\rUraimov','jamoliddinnet@gmail.com','2016-12-06 12:01:12',0),(28,'Tursunoy','\rUsmonova','tusmonova@gmail.com','2016-12-06 12:01:12',0),(29,'Javlon','\rXudoyorov','xudoyorov.javlon@gmail.com','2016-12-06 12:01:12',0),(30,'Zohid','\rZulfiqorov','zulfiqorovzohid@gmail.com','2016-12-06 12:01:12',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_key`
--

DROP TABLE IF EXISTS `users_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_key` (
  `secret_key` varchar(16) NOT NULL,
  `secret_type` enum('phone','key') DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `addDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `secret_key` (`secret_key`),
  UNIQUE KEY `user` (`user`),
  CONSTRAINT `fk_users_key_user` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_key`
--

LOCK TABLES `users_key` WRITE;
/*!40000 ALTER TABLE `users_key` DISABLE KEYS */;
INSERT INTO `users_key` VALUES ('+998946501394','phone',3,'2016-12-06 06:52:04'),('HFZCZO7YXENEXECF','key',2,'2016-12-04 06:54:39'),('OPKRVO6YTS4BS3YO','key',1,'2017-10-24 12:08:18');
/*!40000 ALTER TABLE `users_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work`
--

DROP TABLE IF EXISTS `work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `study` int(11) NOT NULL,
  `work_key` varchar(36) NOT NULL,
  `task` int(11) NOT NULL,
  `completed` int(11) NOT NULL DEFAULT '0',
  `deleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `work_key` (`work_key`),
  KEY `fk_accept_task_task` (`task`),
  KEY `fk_accept_task_teaching` (`study`),
  CONSTRAINT `fk_accept_task_task` FOREIGN KEY (`task`) REFERENCES `task` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_accept_task_teaching` FOREIGN KEY (`study`) REFERENCES `study` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work`
--

LOCK TABLES `work` WRITE;
/*!40000 ALTER TABLE `work` DISABLE KEYS */;
INSERT INTO `work` VALUES (1,'2017-11-04 11:14:21',2,'04c7e32c-a45f-40b8-a2e6-2ae1950508c6',8,-1,0),(2,'2017-11-04 11:17:41',2,'00683d70-093c-40fb-b59f-09dcd70d5305',8,-1,0);
/*!40000 ALTER TABLE `work` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'elearning_test'
--

--
-- Dumping routines for database 'elearning_test'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-21 10:42:35
