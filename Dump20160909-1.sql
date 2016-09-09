CREATE DATABASE  IF NOT EXISTS `elearning` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `elearning`;
-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: elearning
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
-- Table structure for table `accept_task`
--

DROP TABLE IF EXISTS `accept_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accept_task` (
  `accept_id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `accept_datetime` datetime NOT NULL,
  `user_has_course` int(11) NOT NULL,
  `task` int(11) NOT NULL,
  `accept_state` varchar(10) NOT NULL,
  PRIMARY KEY (`accept_id`),
  KEY `fk_mark_user_has_course1` (`user_has_course`),
  KEY `fk_mark_task1` (`task`),
  CONSTRAINT `fk_mark_task1` FOREIGN KEY (`task`) REFERENCES `task` (`task_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_mark_user_has_course1` FOREIGN KEY (`user_has_course`) REFERENCES `user_has_course` (`user_has_course_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accept_task`
--

LOCK TABLES `accept_task` WRITE;
/*!40000 ALTER TABLE `accept_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `accept_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accept_test`
--

DROP TABLE IF EXISTS `accept_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accept_test` (
  `accept_test_id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `accept_test_date` datetime NOT NULL,
  `accept_test_ball` int(11) DEFAULT NULL,
  `user_has_course` int(11) NOT NULL,
  `test` int(11) NOT NULL,
  `accept_test_deleted` int(1) DEFAULT '0',
  PRIMARY KEY (`accept_test_id`),
  KEY `fk_accept_test_user_has_course1` (`user_has_course`),
  KEY `fk_accept_test_task1` (`test`),
  CONSTRAINT `fk_accept_test_task1` FOREIGN KEY (`test`) REFERENCES `test` (`test_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_accept_test_user_has_course1` FOREIGN KEY (`user_has_course`) REFERENCES `user_has_course` (`user_has_course_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accept_test`
--

LOCK TABLES `accept_test` WRITE;
/*!40000 ALTER TABLE `accept_test` DISABLE KEYS */;
INSERT INTO `accept_test` VALUES (1,'2016-09-08 13:13:53','2016-09-08 18:13:53',11,1,1,0),(2,'2016-09-08 13:15:22','2016-09-08 18:15:22',8,2,1,0),(3,'2016-09-08 13:15:58','2016-09-08 18:15:58',3,3,1,0);
/*!40000 ALTER TABLE `accept_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area` (
  `area_id` int(11) NOT NULL AUTO_INCREMENT,
  `area_name` varchar(20) NOT NULL,
  `area_deleted` int(1) NOT NULL DEFAULT '0',
  `addDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`area_id`),
  UNIQUE KEY `area_name` (`area_name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (1,'MySQL',0,'2016-09-08 11:17:04'),(2,'PostgreSQL',0,'2016-09-08 11:17:04'),(3,'Oracle',0,'2016-09-08 11:17:04'),(4,'Azure',0,'2016-09-08 11:17:04'),(5,'mongoDB',0,'2016-09-08 11:17:04'),(6,'MariaDB',0,'2016-09-08 11:17:04'),(7,'cassandra',0,'2016-09-08 11:17:04'),(8,'Titan',0,'2016-09-07 11:17:04'),(9,'H2',0,'2016-09-06 11:17:04'),(10,'BaseX',0,'2016-09-06 11:17:04'),(11,'Berkeley DB',0,'2016-09-06 11:17:04'),(12,'CouchDB',0,'2016-09-06 11:17:04'),(13,'SQLite',0,'2016-09-06 11:17:04'),(14,'Neo4j',0,'2016-09-06 11:17:04'),(15,'Ingres',0,'2016-09-06 11:17:04');
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comment_text` text NOT NULL,
  `user` int(11) NOT NULL,
  `course` int(11) NOT NULL,
  `commen_datetime` datetime NOT NULL,
  `commen_deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_id`),
  KEY `fk_comment_user1` (`user`),
  KEY `fk_comment_course1` (`course`),
  CONSTRAINT `fk_comment_course1` FOREIGN KEY (`course`) REFERENCES `course` (`course_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_user1` FOREIGN KEY (`user`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `course_start_date` date NOT NULL,
  `course_end_date` date NOT NULL,
  `program` int(11) NOT NULL,
  `course_public` varchar(45) NOT NULL,
  `course_deleted` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`course_id`),
  KEY `fk_course_program1` (`program`),
  CONSTRAINT `fk_course_program1` FOREIGN KEY (`program`) REFERENCES `program` (`program_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'2016-09-08 13:13:42','2016-09-08','2016-09-13',1,'0',0),(2,'2016-09-08 13:15:18','2016-09-08','2016-09-13',1,'0',0),(3,'2016-09-08 13:15:52','2016-09-08','2016-09-13',1,'0',0);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `externe`
--

DROP TABLE IF EXISTS `externe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `externe` (
  `externe_id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user` int(11) NOT NULL,
  `program` int(11) NOT NULL,
  `externe_datetime` datetime NOT NULL,
  PRIMARY KEY (`externe_id`),
  KEY `fk_externe_user1` (`user`),
  KEY `fk_externe_program1` (`program`),
  CONSTRAINT `fk_externe_program1` FOREIGN KEY (`program`) REFERENCES `program` (`program_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_externe_user1` FOREIGN KEY (`user`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `externe`
--

LOCK TABLES `externe` WRITE;
/*!40000 ALTER TABLE `externe` DISABLE KEYS */;
/*!40000 ALTER TABLE `externe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `externe_has_task`
--

DROP TABLE IF EXISTS `externe_has_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `externe_has_task` (
  `externe` int(11) NOT NULL,
  `addDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `task` int(11) NOT NULL,
  `externe_has_task_datetime` datetime NOT NULL,
  `externe_has_task_accept` varchar(10) NOT NULL,
  PRIMARY KEY (`externe`,`task`),
  KEY `fk_externe_has_task_task1` (`task`),
  CONSTRAINT `fk_externe_has_task_externe1` FOREIGN KEY (`externe`) REFERENCES `externe` (`externe_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_externe_has_task_task1` FOREIGN KEY (`task`) REFERENCES `task` (`task_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `externe_has_task`
--

LOCK TABLES `externe_has_task` WRITE;
/*!40000 ALTER TABLE `externe_has_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `externe_has_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `externe_has_test`
--

DROP TABLE IF EXISTS `externe_has_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `externe_has_test` (
  `externe` int(11) NOT NULL,
  `addDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `test` int(11) NOT NULL,
  `externe_has_test_datetime` datetime NOT NULL,
  `externe_has_test_ball` int(11) NOT NULL,
  PRIMARY KEY (`externe`,`test`),
  KEY `fk_externe_has_test1_test1` (`test`),
  CONSTRAINT `fk_externe_has_test1_externe1` FOREIGN KEY (`externe`) REFERENCES `externe` (`externe_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_externe_has_test1_test1` FOREIGN KEY (`test`) REFERENCES `test` (`test_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `externe_has_test`
--

LOCK TABLES `externe_has_test` WRITE;
/*!40000 ALTER TABLE `externe_has_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `externe_has_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `files_id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `files_name` varchar(100) NOT NULL,
  `files_title` varchar(100) NOT NULL,
  `material` int(11) NOT NULL,
  `files_type` varchar(10) DEFAULT NULL,
  `files_deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`files_id`),
  KEY `fk_files_program1` (`material`),
  CONSTRAINT `fk_files_program1` FOREIGN KEY (`material`) REFERENCES `material` (`material_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (1,'2016-09-08 12:54:19','Без имени 1.doc','Лекция 1',1,'document',0),(2,'2016-09-08 12:57:35','Без имени 1_1.doc','Лекция 2',2,'document',0),(3,'2016-09-08 13:03:48','ONLINE EDUCATION SYSTEM.pptx','Лекция 3',3,'document',0),(4,'2016-09-08 13:04:42','ONLINE EDUCATION SYSTEM_1.pptx','Лекция 4',4,'document',0),(5,'2016-09-08 13:57:16','1.mp4','Обзор',1,'video',0);
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material` (
  `material_id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `material_name` varchar(50) NOT NULL,
  `material_day` int(3) NOT NULL,
  `material_type` varchar(10) NOT NULL,
  `material_file` text,
  `program` int(11) NOT NULL,
  `material_text` text NOT NULL,
  `material_deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`material_id`),
  KEY `fk_material_program1` (`program`),
  CONSTRAINT `fk_material_program1` FOREIGN KEY (`program`) REFERENCES `program` (`program_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
INSERT INTO `material` VALUES (1,'2016-09-08 12:50:49','Введение',1,'Lecture','<p id=\"id_1\">В 2012 году облачные вычисления, не так давно пришедшие в виде определенной концепции в мир IT, стали больше чем простой идеей &ndash; они стали трендом в бизнесе и даже науке. Аналитическая <a name=\"keyword1\"></a><span class=\"keyword\">фирма</span> <a name=\"keyword2\"></a><span class=\"keyword\">IDC</span>, специализирующаяся на исследованиях рынка информационных технологий, предсказывает, что к 2016 году рынок облачных услуг увеличится более чем на 130%, что в конкретных цифрах означает увеличение на 43 миллиарда долларов.</p>\r\n<div id=\"mark_1\" class=\"lecture_mark\">&nbsp;</div>\r\n<p><a name=\"sect2\"></a></p>\r\n<h3>Краткая история облачных вычислений</h3>\r\n<p id=\"id_2\">Самым важным вопросом, на который необходимо ответить при рассмотрении истории появления этого термина, это <a name=\"keyword3\"></a><span class=\"keyword\">определение</span> этого термина. До сих пор нельзя однозначно сказать, кто впервые использовал термин \"облако\", но, <a name=\"keyword4\"></a><span class=\"keyword\">по</span> некоторым источникам, происхождение термина относится к традиции использовать облака в рисунках компьютерных коммуникационных инфраструктур. В общем смысле термин \"облако\" используется как <a name=\"keyword5\"></a><span class=\"keyword\">синоним</span> термину \"<a name=\"keyword6\"></a><span class=\"keyword\">Интернет</span>\", в конкретных же реализациях под \"облаком\" могут пониматься как удалённые серверы, так и <a name=\"keyword7\"></a><span class=\"keyword\">сетевая инфраструктура</span>, так и всё целиком.</p>\r\n<div id=\"mark_2\" class=\"lecture_mark\">&nbsp;</div>\r\n<p id=\"id_3\">Однако необходимо понимать, что \"облако\", <a name=\"keyword8\"></a><span class=\"keyword\">по</span> мнению авторов, не является концепцией революционной, возникшей в один момент, но является концепцией эволюционной, выросшей из идей и технологий, начало которых датируется 50-ми годами 20-го века, когда владельцы больших мейн-фреймов (академические учреждения и корпорации), стремились оптимизировать загрузку этих мощностей таким образом, чтобы получить от этого максимальную эффективность и <a name=\"keyword9\"></a><span class=\"keyword\">прибыль</span>. Стремление к оптимизации привело к возникновению идеи удалённого доступа на временной основе, когда пользователи использовали существующие ресурсы всё доступное время, таким образом нивелируя проблему простаивания ресурсов.</p>\r\n<div id=\"mark_3\" class=\"lecture_mark\">&nbsp;</div>\r\n<p id=\"id_4\">Следующими важнейшими вехами в истории концепции облачных вычислений стало заявление Джона МакКарти, компьютерный исследователь, известный своими разработками (создатель термина \"<a name=\"keyword10\"></a><span class=\"keyword\">Artificial</span> <a name=\"keyword11\"></a><span class=\"keyword\">Intelligence</span>\" и языка программирования <a name=\"keyword12\"></a><span class=\"keyword\">Lisp</span>), о том, что \"вычислительные мощности могут когда-нибудь стать публично доступными ресурсами\", и выпуск в 1966 году книги Дугласа Пархилла \"The<a name=\"keyword13\"></a><span class=\"keyword\">Challenge</span> of the <a name=\"keyword14\"></a><span class=\"keyword\">Computer</span> <a name=\"keyword15\"></a><span class=\"keyword\">Utility</span>\", в которой он описал практически все основные характеристики существующих сегодня облаков, а также впервые употребив сравнение с электрической сетью.</p>\r\n<div id=\"mark_4\" class=\"lecture_mark\">&nbsp;</div>\r\n<div id=\"id_5\">\r\n<div><img src=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/1/files/01_01.png\" alt=\"\" /></div>\r\n</div>\r\n<div id=\"mark_5\" class=\"lecture_mark\">&nbsp;</div>\r\n<p id=\"id_6\">Далее, более 40 лет, история облачных вычислений продолжала развиваться, концепция постепенно выкристаллизовывалась, до тех пор, пока в 2006 года компания Amazon не запустила платформу Amazon <a name=\"keyword16\"></a><span class=\"keyword\">Web</span> <a name=\"keyword17\"></a><span class=\"keyword\">Service</span> (AWS), модернизировав свои центры обработки данных, которые, как и большинство компьютерных инфраструктур, использовали лишь 10% от их емкости. Можно считать, что компания Amazon сыграла ключевую роль в открытии рынка облачных вычислений во всем мире, оптимизировав как собственные ресурсы, так и начав получать с ранее простаивавших ресурсов <a name=\"keyword18\"></a><span class=\"keyword\">прибыль</span>. Спустя всего несколько лет, в 2008 году, были анонсированы облачные платформы от Microsoft и Google,<a name=\"keyword19\"></a><span class=\"keyword\">Windows</span> Azure и Google <a name=\"keyword20\"></a><span class=\"keyword\">App</span> <a name=\"keyword21\"></a><span class=\"keyword\">Engine</span> соответственно. В 2010 году увидел свет первый выпуск платформы <a name=\"keyword22\"></a><span class=\"keyword\">Windows</span> Azure. Начиная с примерно 2008 года рынок облачных вычислений начал стремительно вырастать, заполняясь как топовыми игроками (Amazon, Microsoft, Salesforce, Google, HP, Dell, AT&amp;T, RackSpace), так и организациями, предлагающими облачные ресурсы для решения конкретных задач (<a name=\"keyword23\"></a><span class=\"keyword\">Engine</span> Yard, gCloud3, OrangeScape). В последнее время облачными вычислениями начали всерьёз интересоваться исследователи и научные учреждения (в т.ч. академические), начали защищаться научные работы об облачных вычислениях.</p>\r\n<div id=\"mark_6\" class=\"lecture_mark\">&nbsp;</div>\r\n<p><a name=\"sect3\"></a></p>\r\n<h3>Обзор облачных технологий</h3>\r\n<p id=\"id_7\">Говоря о том, что такое облачные технологии и облачные вычисления, всегда необходимо помнить о том, как определяются основные характеристики любого настоящего облака &ndash; наличие пула ресурсов, самообслуживание, эластичность и <a name=\"keyword24\"></a><span class=\"keyword\">оплата</span> на основе использования. Эти характеристики были выведены National Institute of Standards <a name=\"keyword25\"></a><span class=\"keyword\">and</span> <a name=\"keyword26\"></a><span class=\"keyword\">Technology</span> (<a name=\"keyword27\"></a><span class=\"keyword\">NIST</span>). Авторы для описания облачных сервисов используют принцип 4-3-2. Первая цифра, 4, используется для описания четырех основных характеристик облачного сервиса.</p>\r\n<div id=\"mark_7\" class=\"lecture_mark\">&nbsp;</div>\r\n<p id=\"id_8\"><strong>Pooled Resources</strong>: существует мнение, что облаком называется большая виртуализированная <a name=\"keyword28\"></a><span class=\"keyword\">инфраструктура</span>. Данное утверждение является верным, но, тем не менее, облака используют виртуализацию, но виртуализацию с добавленной функциональностью. <a name=\"keyword29\"></a><span class=\"keyword\">Механизмы</span>, стоящие за облаком, объединяют ресурсы в единый <a name=\"keyword30\"></a><span class=\"keyword\">пул</span>, который позволяет работающим в реальном времени автоматическим сервисам платформы динамически разворачивать и масштабировать пользовательские и служебные ресурсы.</p>\r\n<div id=\"mark_8\" class=\"lecture_mark\">&nbsp;</div>\r\n<p id=\"id_9\"><strong>Self Service</strong>: Перед и после того, как <a name=\"keyword31\"></a><span class=\"keyword\">пользователь</span> развернул свои ресурсы, облако должно предоставлять возможность управлять ими с помощью средств самообслуживания для того, чтобы, например, преобразовывать их в более выгодные для бизнеса конфигурации в пределах<a name=\"keyword32\"></a><span class=\"keyword\">SLA</span>. Таким образом для облака нет необходимости в наличии проведения коммуникаций пользователя с живым человеком, который должен управлять ресурсами. Ресурсы фактически управляются пользователем, логически и физически они контролируются облачной платформой.</p>\r\n<div id=\"mark_9\" class=\"lecture_mark\">&nbsp;</div>\r\n<p id=\"id_10\"><strong>Elastic</strong> &ndash; эластичность заключается в возможности динамического масштабирования <a name=\"keyword33\"></a><span class=\"keyword\">по</span> запросу за очень короткое время.</p>\r\n<div id=\"mark_10\" class=\"lecture_mark\">&nbsp;</div>\r\n<p id=\"id_11\"><strong>Usage Based</strong> &ndash; Модель оплаты <a name=\"keyword34\"></a><span class=\"keyword\">по</span> факту использования содержит в себе свод правил, регламентирующих, что <a name=\"keyword35\"></a><span class=\"keyword\">пользователь</span> платит только тогда, когда использует выделенные мощности. Это позволяет перенаправить часть ресурсов, ранее использовавшихся для оплаты поддержки и обслуживания, например, периодически простаивающего оборудования, на бизнес-задачи организации и реализовать ту необходимую гибкость, которая лежит в основе эффективного использования ресурсов. Экономия очевидна &ndash; благодаря объединению ресурсов в пулы и модели оплаты <a name=\"keyword36\"></a><span class=\"keyword\">по</span> факту использования многие <a name=\"keyword37\"></a><span class=\"keyword\">расходы</span> становятся излишними, их можно избежать, и построить ту инфраструктуру, которая максимально отвечает бизнес-сценариям организации, на то время, которое она должна существовать.</p>\r\n<div id=\"mark_11\" class=\"lecture_mark\">&nbsp;</div>\r\n<p id=\"id_12\">Вторая цифра принципа 4-3-2, характеризует три основных метода поставки облачных сервисов: Infrastructure-As-A-<a name=\"keyword38\"></a><span class=\"keyword\">Service</span>, Platform-As-A-<a name=\"keyword39\"></a><span class=\"keyword\">Service</span> и Software-As-A-<a name=\"keyword40\"></a><span class=\"keyword\">Service</span>. В настоящее время существует широкая <a name=\"keyword41\"></a><span class=\"keyword\">таксономия</span> терминов, сужающих <a name=\"keyword42\"></a><span class=\"keyword\">контекст</span>, например, MBaaS (Mobile-Backend-As-A-<a name=\"keyword43\"></a><span class=\"keyword\">Service</span>) и Metal-As-<a name=\"keyword44\"></a><span class=\"keyword\">Service</span>, но в общем смысле все сводится к трем методам. В индустрии определены три типа поставок облачных сервисов:</p>\r\n<div id=\"mark_12\" class=\"lecture_mark\">&nbsp;</div>\r\n<ul id=\"id_13\">\r\n<li>IaaS &ndash; набор связанных с инфраструктурой возможностей (ОС, сетевое подключение, т.д.), предоставляемых клиенту на основе модели \"оплаты-за-использование\" и могущих использоваться для размещения приложений.</li>\r\n<li>PaaS &ndash; функциональность более высокого уровня, связанная с платформой и предоставляемая как сервис для разработчиков приложений. С PaaS разработчики абстрагируются от низлежащей инфраструктуры.</li>\r\n<li>SaaS &ndash; приложения, предлагаемые в качестве сервисов, когда организации просто потребляют и используют приложение. Традиционно же организация платила бы за использование приложения или приложение монетизировалось бы через доход от рекламы.</li>\r\n</ul>\r\n<div id=\"mark_13\" class=\"lecture_mark\">&nbsp;</div>\r\n<p id=\"id_17\">Важно заметить, что эти три типа сервисов могут существовать отдельно или в комбинации друг с другом: предложения типа SaaS необязательно могут быть разработаны над предложениями PaaS, так как решения, основанные на использовании PaaS, часто предоставляются как SaaS, предложения же типа PaaS &ndash; больше, чем просто работающая на IaaS платформа. Симбиоз трех методов поставки облачных сервисов, разумеется, должен предваряться серьезным анализом и часто целым переосмыслением архитектуры сервиса, который должен работать в облаке.</p>\r\n<div id=\"mark_17\" class=\"lecture_mark\">&nbsp;</div>\r\n<div id=\"id_18\">\r\n<div><img src=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/1/files/01_02.png\" alt=\"\" /></div>\r\n</div>\r\n<div id=\"mark_18\" class=\"lecture_mark\">&nbsp;</div>\r\n<div id=\"id_19\">\r\n<div><img src=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/1/files/01_03.jpg\" alt=\"\" /></div>\r\n</div>\r\n<div id=\"mark_19\" class=\"lecture_mark\">&nbsp;</div>\r\n<p id=\"id_20\">Следующей цифрой в принципе 4-3-2, характеризуется тип облака. Тип облака влияет на размещенные в нем сервисы достаточно опосредовано &ndash; для конечного пользователя использование сервиса, размещенного в приватном облаке или размещенного в публичном, может не нести никакого различия &ndash; использование практически всегда полностью прозрачно. Аналогично методам поставки, существуют дополнительные термины, характеризующие тип облака, например, Community <a name=\"keyword45\"></a><span class=\"keyword\">Cloud</span>, но данные типы так или иначе являются либо развитием, либо симбиозом приватного или публичного типов.</p>\r\n<div id=\"mark_20\" class=\"lecture_mark\">&nbsp;</div>\r\n<div id=\"id_21\">\r\n<div><img src=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/1/files/01_04.jpg\" alt=\"\" /></div>\r\n</div>\r\n<div id=\"mark_21\" class=\"lecture_mark\">&nbsp;</div>\r\n<p id=\"id_22\">Таким образом, принцип 4-3-2 позволяет охарактеризовать любой облачный сервис либо платформу таким образом, чтобы можно было понять, действительно ли (на высоком уровне) сервис является облачным либо он является простым виртуализованным сервисом, находящимся под управлением живых людей и не предоставляет стандартные для облаков преимущества.</p>\r\n<div id=\"mark_22\" class=\"lecture_mark\">&nbsp;</div>\r\n<p><a name=\"sect4\"></a></p>\r\n<h3>Сценарии, подходящие для облаков</h3>\r\n<div id=\"id_23\">\r\n<div><img src=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/1/files/01_05.jpg\" alt=\"\" /></div>\r\n</div>\r\n<div id=\"mark_23\" class=\"lecture_mark\">&nbsp;</div>\r\n<p id=\"id_24\">Для облака подходит определенный набор типов нагрузок. Первый - это <strong>\"включение/выключение\"</strong>, для которого характерна ситуация, в которой в один момент времени необходимо обсчитать какую-либо задачу, будь она научная, технологическая или бизнес. В этом случае мощности простаивают ровно то время, которое они не требуются, что не является эффективным подходом. Типичный пример такого типа нагрузок &ndash; научные задачи на суперкомпьютерных кластерах.</p>\r\n<div id=\"mark_24\" class=\"lecture_mark\">&nbsp;</div>\r\n<p id=\"id_25\">Второй тип &ndash; <strong>быстрый рост</strong> &ndash; характерен для успешных стартапов и проектов, когда, например, после анонсирования вашего проекта на популярном ресурсе мощностей для обслуживания клиентов может просто не хватить. В этом случае оперативное <a name=\"keyword46\"></a><span class=\"keyword\">развертывание</span>дополняющей аппаратно-программной инфраструктуры может занять время, в течении которого проект может быть вообще недоступен. Развернуть мощности мгновенно в локальном центре обработки данных и установить на них соответствующее <a name=\"keyword47\"></a><span class=\"keyword\">программное обеспечение</span>, добавив ресурсы в ротацию балансировщика нагрузки, практически невозможно.</p>\r\n<div id=\"mark_25\" class=\"lecture_mark\">&nbsp;</div>\r\n<p id=\"id_26\">Третий тип &ndash; <strong>непредсказуемый всплеск</strong> &ndash; характерен для успешных стартапов, внезапный или неосторожный анонс сразу после запуска (без соответствующего нагрузочного тестирования и обработки сценариев) может вызвать резкий наплыв посетителей.</p>\r\n<div id=\"mark_26\" class=\"lecture_mark\">&nbsp;</div>\r\n<p id=\"id_27\">И, четвертый тип, это, например, сервис для подачи налоговой отчетности &ndash; в какой-то определенный период происходит нагрузка, и он, в целом, скорее всего будет неизменен, что позволяет запланировать задачи <a name=\"keyword48\"></a><span class=\"keyword\">по</span> масштабированию таким образом, чтобы этот процесс происходил наиболее эффективно и экономично.</p>\r\n<div id=\"mark_27\" class=\"lecture_mark\">&nbsp;</div>\r\n<p id=\"id_28\">Все эти сценарии отлично подходят для переноса в облако.</p>',1,'Описание курса, его целей, обзор облачных технологий. Облачные тренды История облачных вычислений. Обзор платформы Windows Azure.\r\nОглавление',0),(2,'2016-09-08 12:57:21','Первое облачное приложение',2,'Lecture','<h3>Создание нового Web-сайта</h3>\r\n<p id=\"id_1\">Для начала работы с <a name=\"keyword1\"></a><span class=\"keyword\">Web</span>-сайтом создадим новый <a name=\"keyword2\"></a><span class=\"keyword\">Web</span>-сайт на портале управления <a name=\"keyword3\"></a><span class=\"keyword\">Windows</span> Azure, который будет служить контейнером. Для этого нажмем <strong>New | Web Sites | Quick Create</strong>. Введем DNS-имя <a name=\"keyword4\"></a><span class=\"keyword\">Web</span>-сайта, которое будет использоваться для доступа к нему.</p>\r\n<div id=\"mark_1\" class=\"lecture_mark\">&nbsp;</div>\r\n<div id=\"id_2\"><a name=\"image.2.1\"></a>\r\n<div><a class=\"lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_01.png\" rel=\"lightbox\"><img src=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_01sm.jpg\" alt=\"Создание нового сайта\" /></a></div>\r\n<br /><a class=\"objectName lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_01.png\" rel=\"lightbox\">увеличить изображение</a><br /><strong>Рис. 2.1. </strong>Создание нового сайта</div>\r\n<div id=\"mark_2\" class=\"lecture_mark\">&nbsp;</div>\r\n<p id=\"id_3\">После развертывания <a name=\"keyword5\"></a><span class=\"keyword\">Web</span>-сайта перейдем на стандартную страницу, которая разворачивается автоматически.</p>\r\n<div id=\"mark_3\" class=\"lecture_mark\">&nbsp;</div>\r\n<div id=\"id_4\"><a name=\"image.2.2\"></a>\r\n<div><a class=\"lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_02.png\" rel=\"lightbox\"><img src=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_02sm.jpg\" alt=\"Страница управления сайтом\" /></a></div>\r\n<br /><a class=\"objectName lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_02.png\" rel=\"lightbox\">увеличить изображение</a><br /><strong>Рис. 2.2. </strong>Страница управления сайтом</div>\r\n<div id=\"mark_4\" class=\"lecture_mark\">&nbsp;</div>\r\n<div id=\"id_5\"><a name=\"image.2.3\"></a>\r\n<div><a class=\"lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_03.png\" rel=\"lightbox\"><img src=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_03sm.jpg\" alt=\"Развернутый сайт\" /></a></div>\r\n<br /><a class=\"objectName lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_03.png\" rel=\"lightbox\">увеличить изображение</a><br /><strong>Рис. 2.3. </strong>Развернутый сайт</div>\r\n<div id=\"mark_5\" class=\"lecture_mark\">&nbsp;</div>\r\n<p id=\"id_6\">Вернемся на панель управления <a name=\"keyword6\"></a><span class=\"keyword\">Web</span>-сайтом и нажмем на ссылку <strong>Download publish profile</strong> для того, чтобы загрузить профиль публикации, который будет использоваться в <a name=\"keyword7\"></a><span class=\"keyword\">Visual Studio</span> 2012 для развертывания <a name=\"keyword8\"></a><span class=\"keyword\">Web</span>-сайта.</p>\r\n<div id=\"mark_6\" class=\"lecture_mark\">&nbsp;</div>\r\n<p id=\"id_7\">Запустим <a name=\"keyword9\"></a><span class=\"keyword\">Visual Studio</span> 2012 в режиме администратора и создадим новый проект <a name=\"keyword10\"></a><span class=\"keyword\">ASP</span>.<a name=\"keyword11\"></a><span class=\"keyword\">NET</span> MVC 4, нажав <strong>New Project</strong> и выбрав тип проекта <a name=\"keyword12\"></a><span class=\"keyword\">ASP</span>.<a name=\"keyword13\"></a><span class=\"keyword\">NET</span> MVC 4 <a name=\"keyword14\"></a><span class=\"keyword\">Web</span> <a name=\"keyword15\"></a><span class=\"keyword\">Application</span>.</p>\r\n<div id=\"mark_7\" class=\"lecture_mark\">&nbsp;</div>\r\n<div id=\"id_8\"><a name=\"image.2.4\"></a>\r\n<div><a class=\"lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_04.png\" rel=\"lightbox\"><img src=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_04sm.jpg\" alt=\"Создание проекта на MVC4 в Visual Studio 2012\" /></a></div>\r\n<br /><a class=\"objectName lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_04.png\" rel=\"lightbox\">увеличить изображение</a><br /><strong>Рис. 2.4. </strong>Создание проекта на MVC4 в Visual Studio 2012</div>\r\n<div id=\"mark_8\" class=\"lecture_mark\">&nbsp;</div>\r\n<p id=\"id_9\">Выберем <strong>Internet Application</strong>. Нажмем правой кнопкой мыши на имени проекта и выберем <strong>Publish</strong>.</p>\r\n<div id=\"mark_9\" class=\"lecture_mark\">&nbsp;</div>\r\n<div id=\"id_10\"><a name=\"image.2.5\"></a>\r\n<div><a class=\"lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_05.png\" rel=\"lightbox\"><img src=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_05sm.jpg\" alt=\"Развертывания приложения\" /></a></div>\r\n<br /><a class=\"objectName lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_05.png\" rel=\"lightbox\">увеличить изображение</a><br /><strong>Рис. 2.5. </strong>Развертывания приложения</div>\r\n<div id=\"mark_10\" class=\"lecture_mark\">&nbsp;</div>\r\n<p id=\"id_11\">В диалоговом окне <strong>Publish Web</strong> нажмем кнопку <strong>Import</strong> и выберем загруженный ранее профиль публикации. После процесса импортирования нажмем <strong>Publish</strong> для развертывания проекта в <a name=\"keyword16\"></a><span class=\"keyword\">Windows</span> Azure <a name=\"keyword17\"></a><span class=\"keyword\">Web</span> Sites.</p>\r\n<div id=\"mark_11\" class=\"lecture_mark\">&nbsp;</div>\r\n<div id=\"id_12\"><a name=\"image.2.6\"></a>\r\n<div><a class=\"lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_06.png\" rel=\"lightbox\"><img src=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_06sm.jpg\" alt=\"Выбор  профиля публикации\" /></a></div>\r\n<br /><a class=\"objectName lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_06.png\" rel=\"lightbox\">увеличить изображение</a><br /><strong>Рис. 2.6. </strong>Выбор профиля публикации</div>\r\n<div id=\"mark_12\" class=\"lecture_mark\">&nbsp;</div>\r\n<div id=\"id_13\"><a name=\"image.2.7\"></a>\r\n<div><a class=\"lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_07.png\" rel=\"lightbox\"><img src=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_07sm.jpg\" alt=\"Развертывания приложения\" /></a></div>\r\n<br /><a class=\"objectName lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_07.png\" rel=\"lightbox\">увеличить изображение</a><br /><strong>Рис. 2.7. </strong>Развертывания приложения</div>\r\n<div id=\"mark_13\" class=\"lecture_mark\">&nbsp;</div>\r\n<p id=\"id_14\">Зайдем на <a name=\"keyword18\"></a><span class=\"keyword\">Web</span>-сайт.</p>\r\n<div id=\"mark_14\" class=\"lecture_mark\">&nbsp;</div>\r\n<div id=\"id_15\"><a name=\"image.2.8\"></a>\r\n<div><a class=\"lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_08.png\" rel=\"lightbox\"><img src=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_08sm.jpg\" alt=\"Интерфейс развернутого сайта\" /></a></div>\r\n<br /><a class=\"objectName lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_08.png\" rel=\"lightbox\">увеличить изображение</a><br /><strong>Рис. 2.8. </strong>Интерфейс развернутого сайта</div>',1,'Использование облачной платформы Windows Azure для разработки приложений не требует специальных знаний и навыков. Большинство инструментальных средств, использующихся в процессе разработки, знакомы разработчику, который еще не использовал облачные платформы. Для развертывания приложений на платформу существует два базовых сервиса, предоставляющих разный уровень доступной функциональности – Windows Azure Web Sites и Windows Azure Cloud Services, подробнее о которых будет рассказано в соответствующих главах. Рассмотрим создание и развертывание простого веб-приложения ASP.NET MVC 4 с помощью сервисов Windows Azure Web Sites и Windows Azure Cloud Services и Visual Studio 2012.',0),(3,'2016-09-08 13:03:37','Быстрый старт в облаке с Windows Azure Web Sites',4,'Lecture','<h3>Создание нового Web-сайта</h3>\r\n<p id=\"id_1\">Для начала работы с <a name=\"keyword1\"></a><span class=\"keyword\">Web</span>-сайтом создадим новый <a name=\"keyword2\"></a><span class=\"keyword\">Web</span>-сайт на портале управления <a name=\"keyword3\"></a><span class=\"keyword\">Windows</span> Azure, который будет служить контейнером. Для этого нажмем <strong>New | Web Sites | Quick Create</strong>. Введем DNS-имя <a name=\"keyword4\"></a><span class=\"keyword\">Web</span>-сайта, которое будет использоваться для доступа к нему.</p>\r\n<div id=\"mark_1\" class=\"lecture_mark\">&nbsp;</div>\r\n<div id=\"id_2\"><a name=\"image.2.1\"></a>\r\n<div><a class=\"lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_01.png\" rel=\"lightbox\"><img src=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_01sm.jpg\" alt=\"Создание нового сайта\" /></a></div>\r\n<br /><a class=\"objectName lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_01.png\" rel=\"lightbox\">увеличить изображение</a><br /><strong>Рис. 2.1. </strong>Создание нового сайта</div>\r\n<div id=\"mark_2\" class=\"lecture_mark\">&nbsp;</div>\r\n<p id=\"id_3\">После развертывания <a name=\"keyword5\"></a><span class=\"keyword\">Web</span>-сайта перейдем на стандартную страницу, которая разворачивается автоматически.</p>\r\n<div id=\"mark_3\" class=\"lecture_mark\">&nbsp;</div>\r\n<div id=\"id_4\"><a name=\"image.2.2\"></a>\r\n<div><a class=\"lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_02.png\" rel=\"lightbox\"><img src=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_02sm.jpg\" alt=\"Страница управления сайтом\" /></a></div>\r\n<br /><a class=\"objectName lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_02.png\" rel=\"lightbox\">увеличить изображение</a><br /><strong>Рис. 2.2. </strong>Страница управления сайтом</div>\r\n<div id=\"mark_4\" class=\"lecture_mark\">&nbsp;</div>\r\n<div id=\"id_5\"><a name=\"image.2.3\"></a>\r\n<div><a class=\"lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_03.png\" rel=\"lightbox\"><img src=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_03sm.jpg\" alt=\"Развернутый сайт\" /></a></div>\r\n<br /><a class=\"objectName lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_03.png\" rel=\"lightbox\">увеличить изображение</a><br /><strong>Рис. 2.3. </strong>Развернутый сайт</div>\r\n<div id=\"mark_5\" class=\"lecture_mark\">&nbsp;</div>\r\n<p id=\"id_6\">Вернемся на панель управления <a name=\"keyword6\"></a><span class=\"keyword\">Web</span>-сайтом и нажмем на ссылку <strong>Download publish profile</strong> для того, чтобы загрузить профиль публикации, который будет использоваться в <a name=\"keyword7\"></a><span class=\"keyword\">Visual Studio</span> 2012 для развертывания <a name=\"keyword8\"></a><span class=\"keyword\">Web</span>-сайта.</p>\r\n<div id=\"mark_6\" class=\"lecture_mark\">&nbsp;</div>\r\n<p id=\"id_7\">Запустим <a name=\"keyword9\"></a><span class=\"keyword\">Visual Studio</span> 2012 в режиме администратора и создадим новый проект <a name=\"keyword10\"></a><span class=\"keyword\">ASP</span>.<a name=\"keyword11\"></a><span class=\"keyword\">NET</span> MVC 4, нажав <strong>New Project</strong> и выбрав тип проекта <a name=\"keyword12\"></a><span class=\"keyword\">ASP</span>.<a name=\"keyword13\"></a><span class=\"keyword\">NET</span> MVC 4 <a name=\"keyword14\"></a><span class=\"keyword\">Web</span> <a name=\"keyword15\"></a><span class=\"keyword\">Application</span>.</p>\r\n<div id=\"mark_7\" class=\"lecture_mark\">&nbsp;</div>\r\n<div id=\"id_8\"><a name=\"image.2.4\"></a>\r\n<div><a class=\"lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_04.png\" rel=\"lightbox\"><img src=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_04sm.jpg\" alt=\"Создание проекта на MVC4 в Visual Studio 2012\" /></a></div>\r\n<br /><a class=\"objectName lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_04.png\" rel=\"lightbox\">увеличить изображение</a><br /><strong>Рис. 2.4. </strong>Создание проекта на MVC4 в Visual Studio 2012</div>\r\n<div id=\"mark_8\" class=\"lecture_mark\">&nbsp;</div>\r\n<p id=\"id_9\">Выберем <strong>Internet Application</strong>. Нажмем правой кнопкой мыши на имени проекта и выберем <strong>Publish</strong>.</p>\r\n<div id=\"mark_9\" class=\"lecture_mark\">&nbsp;</div>\r\n<div id=\"id_10\"><a name=\"image.2.5\"></a>\r\n<div><a class=\"lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_05.png\" rel=\"lightbox\"><img src=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_05sm.jpg\" alt=\"Развертывания приложения\" /></a></div>\r\n<br /><a class=\"objectName lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_05.png\" rel=\"lightbox\">увеличить изображение</a><br /><strong>Рис. 2.5. </strong>Развертывания приложения</div>\r\n<div id=\"mark_10\" class=\"lecture_mark\">&nbsp;</div>\r\n<p id=\"id_11\">В диалоговом окне <strong>Publish Web</strong> нажмем кнопку <strong>Import</strong> и выберем загруженный ранее профиль публикации. После процесса импортирования нажмем <strong>Publish</strong> для развертывания проекта в <a name=\"keyword16\"></a><span class=\"keyword\">Windows</span> Azure <a name=\"keyword17\"></a><span class=\"keyword\">Web</span> Sites.</p>\r\n<div id=\"mark_11\" class=\"lecture_mark\">&nbsp;</div>\r\n<div id=\"id_12\"><a name=\"image.2.6\"></a>\r\n<div><a class=\"lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_06.png\" rel=\"lightbox\"><img src=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_06sm.jpg\" alt=\"Выбор  профиля публикации\" /></a></div>\r\n<br /><a class=\"objectName lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_06.png\" rel=\"lightbox\">увеличить изображение</a><br /><strong>Рис. 2.6. </strong>Выбор профиля публикации</div>\r\n<div id=\"mark_12\" class=\"lecture_mark\">&nbsp;</div>\r\n<div id=\"id_13\"><a name=\"image.2.7\"></a>\r\n<div><a class=\"lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_07.png\" rel=\"lightbox\"><img src=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_07sm.jpg\" alt=\"Развертывания приложения\" /></a></div>\r\n<br /><a class=\"objectName lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_07.png\" rel=\"lightbox\">увеличить изображение</a><br /><strong>Рис. 2.7. </strong>Развертывания приложения</div>\r\n<div id=\"mark_13\" class=\"lecture_mark\">&nbsp;</div>\r\n<p id=\"id_14\">Зайдем на <a name=\"keyword18\"></a><span class=\"keyword\">Web</span>-сайт.</p>\r\n<div id=\"mark_14\" class=\"lecture_mark\">&nbsp;</div>\r\n<div id=\"id_15\"><a name=\"image.2.8\"></a>\r\n<div><a class=\"lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_08.png\" rel=\"lightbox\"><img src=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_08sm.jpg\" alt=\"Интерфейс развернутого сайта\" /></a></div>\r\n<br /><a class=\"objectName lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_08.png\" rel=\"lightbox\">увеличить изображение</a><br /><strong>Рис. 2.8. </strong>Интерфейс развернутого сайта</div>',1,'Использование сервиса Windows Azure Web Sites, описание сценария простого веб-сайта ASP.NET MVC 4, который необходимо развернуть в облако и в дальнейшем производить его масштабирование.',0),(4,'2016-09-08 13:04:24','Подготовка рабочего окружения',3,'Lecture','<h3>Создание нового Web-сайта</h3>\r\n<p id=\"id_1\">Для начала работы с <a name=\"keyword1\"></a><span class=\"keyword\">Web</span>-сайтом создадим новый <a name=\"keyword2\"></a><span class=\"keyword\">Web</span>-сайт на портале управления <a name=\"keyword3\"></a><span class=\"keyword\">Windows</span> Azure, который будет служить контейнером. Для этого нажмем <strong>New | Web Sites | Quick Create</strong>. Введем DNS-имя <a name=\"keyword4\"></a><span class=\"keyword\">Web</span>-сайта, которое будет использоваться для доступа к нему.</p>\r\n<div id=\"mark_1\" class=\"lecture_mark\">&nbsp;</div>\r\n<div id=\"id_2\"><a name=\"image.2.1\"></a>\r\n<div><a class=\"lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_01.png\" rel=\"lightbox\"><img src=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_01sm.jpg\" alt=\"Создание нового сайта\" /></a></div>\r\n<br /><a class=\"objectName lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_01.png\" rel=\"lightbox\">увеличить изображение</a><br /><strong>Рис. 2.1. </strong>Создание нового сайта</div>\r\n<div id=\"mark_2\" class=\"lecture_mark\">&nbsp;</div>\r\n<p id=\"id_3\">После развертывания <a name=\"keyword5\"></a><span class=\"keyword\">Web</span>-сайта перейдем на стандартную страницу, которая разворачивается автоматически.</p>\r\n<div id=\"mark_3\" class=\"lecture_mark\">&nbsp;</div>\r\n<div id=\"id_4\"><a name=\"image.2.2\"></a>\r\n<div><a class=\"lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_02.png\" rel=\"lightbox\"><img src=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_02sm.jpg\" alt=\"Страница управления сайтом\" /></a></div>\r\n<br /><a class=\"objectName lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_02.png\" rel=\"lightbox\">увеличить изображение</a><br /><strong>Рис. 2.2. </strong>Страница управления сайтом</div>\r\n<div id=\"mark_4\" class=\"lecture_mark\">&nbsp;</div>\r\n<div id=\"id_5\"><a name=\"image.2.3\"></a>\r\n<div><a class=\"lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_03.png\" rel=\"lightbox\"><img src=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_03sm.jpg\" alt=\"Развернутый сайт\" /></a></div>\r\n<br /><a class=\"objectName lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_03.png\" rel=\"lightbox\">увеличить изображение</a><br /><strong>Рис. 2.3. </strong>Развернутый сайт</div>\r\n<div id=\"mark_5\" class=\"lecture_mark\">&nbsp;</div>\r\n<p id=\"id_6\">Вернемся на панель управления <a name=\"keyword6\"></a><span class=\"keyword\">Web</span>-сайтом и нажмем на ссылку <strong>Download publish profile</strong> для того, чтобы загрузить профиль публикации, который будет использоваться в <a name=\"keyword7\"></a><span class=\"keyword\">Visual Studio</span> 2012 для развертывания <a name=\"keyword8\"></a><span class=\"keyword\">Web</span>-сайта.</p>\r\n<div id=\"mark_6\" class=\"lecture_mark\">&nbsp;</div>\r\n<p id=\"id_7\">Запустим <a name=\"keyword9\"></a><span class=\"keyword\">Visual Studio</span> 2012 в режиме администратора и создадим новый проект <a name=\"keyword10\"></a><span class=\"keyword\">ASP</span>.<a name=\"keyword11\"></a><span class=\"keyword\">NET</span> MVC 4, нажав <strong>New Project</strong> и выбрав тип проекта <a name=\"keyword12\"></a><span class=\"keyword\">ASP</span>.<a name=\"keyword13\"></a><span class=\"keyword\">NET</span> MVC 4 <a name=\"keyword14\"></a><span class=\"keyword\">Web</span> <a name=\"keyword15\"></a><span class=\"keyword\">Application</span>.</p>\r\n<div id=\"mark_7\" class=\"lecture_mark\">&nbsp;</div>\r\n<div id=\"id_8\"><a name=\"image.2.4\"></a>\r\n<div><a class=\"lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_04.png\" rel=\"lightbox\"><img src=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_04sm.jpg\" alt=\"Создание проекта на MVC4 в Visual Studio 2012\" /></a></div>\r\n<br /><a class=\"objectName lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_04.png\" rel=\"lightbox\">увеличить изображение</a><br /><strong>Рис. 2.4. </strong>Создание проекта на MVC4 в Visual Studio 2012</div>\r\n<div id=\"mark_8\" class=\"lecture_mark\">&nbsp;</div>\r\n<p id=\"id_9\">Выберем <strong>Internet Application</strong>. Нажмем правой кнопкой мыши на имени проекта и выберем <strong>Publish</strong>.</p>\r\n<div id=\"mark_9\" class=\"lecture_mark\">&nbsp;</div>\r\n<div id=\"id_10\"><a name=\"image.2.5\"></a>\r\n<div><a class=\"lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_05.png\" rel=\"lightbox\"><img src=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_05sm.jpg\" alt=\"Развертывания приложения\" /></a></div>\r\n<br /><a class=\"objectName lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_05.png\" rel=\"lightbox\">увеличить изображение</a><br /><strong>Рис. 2.5. </strong>Развертывания приложения</div>\r\n<div id=\"mark_10\" class=\"lecture_mark\">&nbsp;</div>\r\n<p id=\"id_11\">В диалоговом окне <strong>Publish Web</strong> нажмем кнопку <strong>Import</strong> и выберем загруженный ранее профиль публикации. После процесса импортирования нажмем <strong>Publish</strong> для развертывания проекта в <a name=\"keyword16\"></a><span class=\"keyword\">Windows</span> Azure <a name=\"keyword17\"></a><span class=\"keyword\">Web</span> Sites.</p>\r\n<div id=\"mark_11\" class=\"lecture_mark\">&nbsp;</div>\r\n<div id=\"id_12\"><a name=\"image.2.6\"></a>\r\n<div><a class=\"lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_06.png\" rel=\"lightbox\"><img src=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_06sm.jpg\" alt=\"Выбор  профиля публикации\" /></a></div>\r\n<br /><a class=\"objectName lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_06.png\" rel=\"lightbox\">увеличить изображение</a><br /><strong>Рис. 2.6. </strong>Выбор профиля публикации</div>\r\n<div id=\"mark_12\" class=\"lecture_mark\">&nbsp;</div>\r\n<div id=\"id_13\"><a name=\"image.2.7\"></a>\r\n<div><a class=\"lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_07.png\" rel=\"lightbox\"><img src=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_07sm.jpg\" alt=\"Развертывания приложения\" /></a></div>\r\n<br /><a class=\"objectName lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_07.png\" rel=\"lightbox\">увеличить изображение</a><br /><strong>Рис. 2.7. </strong>Развертывания приложения</div>\r\n<div id=\"mark_13\" class=\"lecture_mark\">&nbsp;</div>\r\n<p id=\"id_14\">Зайдем на <a name=\"keyword18\"></a><span class=\"keyword\">Web</span>-сайт.</p>\r\n<div id=\"mark_14\" class=\"lecture_mark\">&nbsp;</div>\r\n<div id=\"id_15\"><a name=\"image.2.8\"></a>\r\n<div><a class=\"lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_08.png\" rel=\"lightbox\"><img src=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_08sm.jpg\" alt=\"Интерфейс развернутого сайта\" /></a></div>\r\n<br /><a class=\"objectName lightbox-processed\" href=\"http://www.intuit.ru/EDI/07_12_15_3/1449440387-22429/tutorial/1246/objects/2/files/02_08.png\" rel=\"lightbox\">увеличить изображение</a><br /><strong>Рис. 2.8. </strong>Интерфейс развернутого сайта</div>',1,'Установка Windows Azure SDK для .NET.',0);
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program` (
  `program_id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `program_name` varchar(100) NOT NULL,
  `program_description` text NOT NULL,
  `program_min_level` int(1) NOT NULL DEFAULT '0',
  `program_level` int(1) NOT NULL,
  `program_state` varchar(10) NOT NULL DEFAULT 'created',
  `program_duration` int(3) NOT NULL,
  `user` int(11) NOT NULL,
  `area` int(11) NOT NULL,
  `program_controled` int(1) NOT NULL DEFAULT '0',
  `program_typ` varchar(10) NOT NULL,
  `program_deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`program_id`),
  KEY `fk_program_user` (`user`),
  KEY `fk_program_area1` (`area`),
  CONSTRAINT `fk_program_area1` FOREIGN KEY (`area`) REFERENCES `area` (`area_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_program_user` FOREIGN KEY (`user`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program`
--

LOCK TABLES `program` WRITE;
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
INSERT INTO `program` VALUES (1,'2016-09-08 11:56:17','Академия Microsoft: Microsoft Windows Azure','Курс для магистров и аспирантов с теоретическими лекциями, лабораторными работами и практическими занятиями по облачной платформе Microsoft Windows Azure, ее архитектуре, функциональности, конкретных сценариях применения и практиках использования.\r\nКурс содержит обзор концепций, трендов и истории облачных вычислений, особое внимание посвящено подробному описанию архитектуры, функциональности современной облачной платформы Microsoft Windows Azure. Для иллюстрации функциональности и практического закрепления навыков используются реальные примеры и сценарии, посвященные различным аспектам проектирования и создания проектов на Windows Azure. Для описания действий пользователя используются текстовые описания и скриншоты.',0,2,'active',5,2,4,0,'Standart',0);
/*!40000 ALTER TABLE `program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_has_material`
--

DROP TABLE IF EXISTS `schedule_has_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule_has_material` (
  `material` int(11) NOT NULL,
  `addDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `course` int(11) NOT NULL,
  `date_time` datetime NOT NULL,
  `schedule_has_material_deleted` int(1) DEFAULT '0',
  PRIMARY KEY (`material`,`course`),
  KEY `fk_material_has_schedule_schedule1` (`course`),
  CONSTRAINT `fk_material_has_schedule_material1` FOREIGN KEY (`material`) REFERENCES `material` (`material_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_material_has_schedule_schedule1` FOREIGN KEY (`course`) REFERENCES `course` (`course_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_has_material`
--

LOCK TABLES `schedule_has_material` WRITE;
/*!40000 ALTER TABLE `schedule_has_material` DISABLE KEYS */;
INSERT INTO `schedule_has_material` VALUES (1,'2016-09-08 13:13:42',1,'2016-09-09 00:00:00',0),(1,'2016-09-08 13:15:18',2,'2016-09-09 00:00:00',0),(1,'2016-09-08 13:15:53',3,'2016-09-09 00:00:00',0),(2,'2016-09-08 13:13:42',1,'2016-09-10 00:00:00',0),(2,'2016-09-08 13:15:18',2,'2016-09-10 00:00:00',0),(2,'2016-09-08 13:15:53',3,'2016-09-10 00:00:00',0),(3,'2016-09-08 13:13:43',1,'2016-09-12 00:00:00',0),(3,'2016-09-08 13:15:18',2,'2016-09-12 00:00:00',0),(3,'2016-09-08 13:15:53',3,'2016-09-12 00:00:00',0),(4,'2016-09-08 13:13:42',1,'2016-09-11 00:00:00',0),(4,'2016-09-08 13:15:18',2,'2016-09-11 00:00:00',0),(4,'2016-09-08 13:15:53',3,'2016-09-11 00:00:00',0);
/*!40000 ALTER TABLE `schedule_has_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_has_task`
--

DROP TABLE IF EXISTS `schedule_has_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule_has_task` (
  `task` int(11) NOT NULL,
  `addDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `course` int(11) NOT NULL,
  `date_time` datetime NOT NULL,
  `schedule_has_tsak_deleted` int(1) DEFAULT '0',
  PRIMARY KEY (`task`,`course`),
  KEY `fk_task_has_schedule_schedule1` (`course`),
  CONSTRAINT `fk_task_has_schedule_schedule1` FOREIGN KEY (`course`) REFERENCES `course` (`course_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_task_has_schedule_task1` FOREIGN KEY (`task`) REFERENCES `task` (`task_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_has_task`
--

LOCK TABLES `schedule_has_task` WRITE;
/*!40000 ALTER TABLE `schedule_has_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule_has_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_has_test`
--

DROP TABLE IF EXISTS `schedule_has_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule_has_test` (
  `course` int(11) NOT NULL,
  `addDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `test` int(11) NOT NULL,
  `date_time` datetime NOT NULL,
  `schedule_has_test_deleted` int(1) DEFAULT '0',
  PRIMARY KEY (`course`,`test`),
  KEY `fk_schedule_has_test_test1` (`test`),
  CONSTRAINT `fk_schedule_has_test_schedule1` FOREIGN KEY (`course`) REFERENCES `course` (`course_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_schedule_has_test_test1` FOREIGN KEY (`test`) REFERENCES `test` (`test_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_has_test`
--

LOCK TABLES `schedule_has_test` WRITE;
/*!40000 ALTER TABLE `schedule_has_test` DISABLE KEYS */;
INSERT INTO `schedule_has_test` VALUES (1,'2016-09-08 13:13:43',1,'2016-09-13 00:00:00',0),(2,'2016-09-08 13:15:18',1,'2016-09-13 00:00:00',0),(3,'2016-09-08 13:15:53',1,'2016-09-13 00:00:00',0);
/*!40000 ALTER TABLE `schedule_has_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_conf`
--

DROP TABLE IF EXISTS `sys_conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_conf` (
  `name` varchar(25) NOT NULL,
  `value` varchar(225) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_conf`
--

LOCK TABLES `sys_conf` WRITE;
/*!40000 ALTER TABLE `sys_conf` DISABLE KEYS */;
INSERT INTO `sys_conf` VALUES ('FileDir','uploadFiles/'),('LogPath','/home/ksinn/Log.txt'),('RealPath','/home/ksinn/NetBeansProjects/dbsystem/elearning/build/web/');
/*!40000 ALTER TABLE `sys_conf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `task_name` varchar(45) NOT NULL,
  `task_day` int(3) NOT NULL,
  `task_type` varchar(10) NOT NULL,
  `task_text` text NOT NULL,
  `program` int(11) NOT NULL,
  `task_db_index` varchar(45) NOT NULL,
  `task_answer` text NOT NULL,
  `task_ball` int(11) NOT NULL,
  `task_time` int(11) NOT NULL,
  `task_deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`task_id`),
  KEY `fk_task_program1` (`program`),
  CONSTRAINT `fk_task_program1` FOREIGN KEY (`program`) REFERENCES `program` (`program_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `test_id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `test_name` varchar(50) NOT NULL,
  `test_day` int(3) NOT NULL,
  `test_time` int(5) NOT NULL,
  `test_text` text NOT NULL,
  `program` int(11) NOT NULL,
  `test_deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`test_id`),
  KEY `fk_test_program1` (`program`),
  CONSTRAINT `fk_test_program1` FOREIGN KEY (`program`) REFERENCES `program` (`program_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,'2016-09-08 11:56:17','Exam',5,5,'Required final exam for the program Академия Microsoft: Microsoft Windows Azure',1,0);
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_task`
--

DROP TABLE IF EXISTS `test_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_task` (
  `test_task_id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `test_task_text` varchar(200) NOT NULL,
  `test_task_answer` varchar(100) NOT NULL,
  `test_task_v1` varchar(100) NOT NULL,
  `test_task_v2` varchar(100) NOT NULL,
  `test_task_v3` varchar(100) NOT NULL,
  `test_task_v4` varchar(100) NOT NULL,
  `test_task_ball` int(3) NOT NULL DEFAULT '0',
  `test_task_deleted` int(1) NOT NULL DEFAULT '0',
  `test` int(11) NOT NULL,
  PRIMARY KEY (`test_task_id`),
  KEY `fk_test_task_test1` (`test`),
  CONSTRAINT `fk_test_task_test1` FOREIGN KEY (`test`) REFERENCES `test` (`test_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_task`
--

LOCK TABLES `test_task` WRITE;
/*!40000 ALTER TABLE `test_task` DISABLE KEYS */;
INSERT INTO `test_task` VALUES (1,'2016-09-08 13:07:29','Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor','*Lorem ipsum dolor','Lorem ipsum dolor','Lorem ipsum dolor','Lorem ipsum dolor','Lorem ipsum dolor',4,0,1),(2,'2016-09-08 13:08:15','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','!!Duis et volutpat magna. ','Duis et volutpat magna. ','Duis et volutpat magna. ','Duis et volutpat magna. ','Duis et volutpat magna. ',3,0,1),(3,'2016-09-08 13:08:29','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','!!Duis et volutpat magna. ','Duis et volutpat magna. ','Duis et volutpat magna. ','Duis et volutpat magna. ','Duis et volutpat magna. ',4,0,1);
/*!40000 ALTER TABLE `test_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(32) NOT NULL,
  `user_surname` varchar(32) NOT NULL,
  `birthday` date NOT NULL,
  `gender` char(1) NOT NULL,
  `user_mail` varchar(45) NOT NULL,
  `passwords` varchar(45) NOT NULL,
  `addDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_mail` (`user_mail`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Kseniya','Andreeva','1994-03-09','w','ksinn@mail.ru','qwerty','2016-09-08 11:25:55',0),(2,'Vataliy','Pak','1986-05-18','m','vitalik.pak@gmail.com','qwerty','2016-08-27 08:48:00',0),(3,'Nata','Kim','1993-08-24','w','kim@mail.ru','qwerty','2016-08-27 08:54:43',0),(4,'Джавлон','Обидов','1993-05-09','m','javlonboy09@gmail.com','qwerty','2016-08-31 06:32:34',0),(5,'Джавлон','Обидов','1993-05-09','m','4javlonboy09@gmail.com','qwerty','2015-08-24 06:32:34',0),(6,'Alisher','Kayumov','1994-03-09','m','ksinn1@mail.ru','qwerty','2015-09-01 13:31:26',0),(7,'Наталья','Шивцова','1994-03-09','w','ksinn2@mail.ru','qwerty','2015-09-01 13:31:26',0),(8,'Бобур','Джураев','1994-03-09','m','ksinn3@mail.ru','qwerty','2015-09-01 13:31:26',0),(9,'Азизa','Хакимовa','1994-03-09','w','ksinn4@mail.ru','qwerty','2015-09-01 13:31:26',0),(10,'Гияс','Мухомедов','1994-03-09','m','ksinn5@mail.ru','qwerty','2015-09-01 13:31:26',0),(11,'Парвина','Азизова','1994-03-09','w','ksinn6@mail.ru','qwerty','2015-09-01 13:31:26',0),(12,'Дима','Бавент','1994-03-09','m','ksinn7@mail.ru','qwerty','2015-09-01 13:31:26',0),(13,'Ихтиерa','Нерматовa','1994-03-09','w','ksinn8@mail.ru','qwerty','2015-09-01 13:31:26',0),(14,'Фахридина','Мирзаирова','1994-03-09','w','ksinn9@mail.ru','qwerty','2015-09-01 13:31:26',0),(15,'Шохрух','Комолов','1994-03-09','m','ksinn10@mail.ru','qwerty','2015-09-01 13:31:26',0),(16,'Анвар','Ашерматов','1994-03-09','m','ksinn11@mail.ru','qwerty','2015-09-01 13:31:26',0),(17,'Атоджон','Атоев','1994-03-09','m','ksinn12@mail.ru','qwerty','2015-09-01 13:31:26',0),(18,'Эдуард','Маер','1994-03-09','m','ksinn13@mail.ru','qwerty','2015-09-01 13:31:26',0),(19,'Мохинабону','Нуридинова','1994-03-09','w','ksinn14@mail.ru','qwerty','2015-09-01 13:31:26',0),(20,'Дамир','Зияддинов','1994-03-09','m','ksinn15@mail.ru','qwerty','2015-09-01 13:31:26',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_has_course`
--

DROP TABLE IF EXISTS `user_has_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_has_course` (
  `user` int(11) NOT NULL,
  `addDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `course` int(11) NOT NULL,
  `user_has_course_datetime` datetime NOT NULL,
  `user_has_course_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_has_course_deleted` int(11) NOT NULL DEFAULT '0',
  `user_has_course_complited` datetime DEFAULT NULL,
  PRIMARY KEY (`user_has_course_id`),
  UNIQUE KEY `user` (`user`,`course`),
  KEY `fk_user_has_course_course1` (`course`),
  CONSTRAINT `fk_user_has_course_course1` FOREIGN KEY (`course`) REFERENCES `course` (`course_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_course_user1` FOREIGN KEY (`user`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_has_course`
--

LOCK TABLES `user_has_course` WRITE;
/*!40000 ALTER TABLE `user_has_course` DISABLE KEYS */;
INSERT INTO `user_has_course` VALUES (3,'2016-09-08 13:13:43',1,'2016-09-08 18:13:43',1,0,'2016-09-08 18:14:43'),(1,'2016-09-08 13:15:18',2,'2016-09-08 18:15:18',2,0,'2016-09-08 18:15:33'),(4,'2016-09-08 13:15:53',3,'2016-09-08 18:15:53',3,0,'2016-09-08 18:16:07');
/*!40000 ALTER TABLE `user_has_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'elearning'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `closer_course` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = '' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `closer_course` ON SCHEDULE EVERY 1 DAY STARTS '2016-09-08 16:17:04' ON COMPLETION NOT PRESERVE ENABLE DO update user_has_course set user_has_course_complited = now() 
where (select course_end_date from course where course_id = course) < now()
and user_has_course_complited is null */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'elearning'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-09 10:57:51
