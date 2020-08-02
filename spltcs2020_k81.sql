-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: spltcs2020
-- ------------------------------------------------------
-- Server version	5.7.29-0ubuntu0.18.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (2,'Editor'),(1,'Viewer');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (2,1,32),(6,1,36),(9,1,40),(10,1,44),(14,1,48),(16,1,52),(18,1,56),(11,1,60),(5,1,68),(8,1,72),(13,1,80),(15,1,84),(12,1,92),(3,1,96),(7,1,100),(17,1,120),(19,1,124),(1,1,128),(4,1,132),(25,2,29),(26,2,30),(27,2,31),(28,2,32),(29,2,33),(30,2,34),(31,2,35),(32,2,36),(33,2,37),(34,2,38),(35,2,39),(36,2,40),(37,2,41),(38,2,42),(39,2,43),(40,2,44),(41,2,45),(42,2,46),(43,2,47),(44,2,48),(45,2,49),(46,2,50),(47,2,51),(48,2,52),(49,2,53),(50,2,54),(51,2,55),(52,2,56),(53,2,57),(54,2,58),(55,2,59),(56,2,60),(57,2,65),(58,2,66),(59,2,67),(60,2,68),(61,2,69),(62,2,70),(63,2,71),(64,2,72),(65,2,77),(66,2,78),(67,2,79),(68,2,80),(69,2,81),(70,2,82),(71,2,83),(72,2,84),(73,2,117),(74,2,118),(75,2,119),(76,2,120),(77,2,121),(78,2,122),(79,2,123),(80,2,124),(81,2,125),(82,2,126),(83,2,127),(20,2,128),(21,2,129),(22,2,130),(23,2,131),(24,2,132);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add group',6,'add_spltcsgroup'),(22,'Can change group',6,'change_spltcsgroup'),(23,'Can delete group',6,'delete_spltcsgroup'),(24,'Can view group',6,'view_spltcsgroup'),(25,'Can add user',7,'add_spltcsuser'),(26,'Can change user',7,'change_spltcsuser'),(27,'Can delete user',7,'delete_spltcsuser'),(28,'Can view user',7,'view_spltcsuser'),(29,'Can add category',8,'add_category'),(30,'Can change category',8,'change_category'),(31,'Can delete category',8,'delete_category'),(32,'Can view category',8,'view_category'),(33,'Can add item',9,'add_item'),(34,'Can change item',9,'change_item'),(35,'Can delete item',9,'delete_item'),(36,'Can view item',9,'view_item'),(37,'Can add item history',10,'add_itemhistory'),(38,'Can change item history',10,'change_itemhistory'),(39,'Can delete item history',10,'delete_itemhistory'),(40,'Can view item history',10,'view_itemhistory'),(41,'Can add item query',11,'add_itemquery'),(42,'Can change item query',11,'change_itemquery'),(43,'Can delete item query',11,'delete_itemquery'),(44,'Can view item query',11,'view_itemquery'),(45,'Can add location',12,'add_location'),(46,'Can change location',12,'change_location'),(47,'Can delete location',12,'delete_location'),(48,'Can view location',12,'view_location'),(49,'Can add Make/Model',13,'add_makemodel'),(50,'Can change Make/Model',13,'change_makemodel'),(51,'Can delete Make/Model',13,'delete_makemodel'),(52,'Can view Make/Model',13,'view_makemodel'),(53,'Can add role',14,'add_role'),(54,'Can change role',14,'change_role'),(55,'Can delete role',14,'delete_role'),(56,'Can view role',14,'view_role'),(57,'Can add user parameters',15,'add_userparameters'),(58,'Can change user parameters',15,'change_userparameters'),(59,'Can delete user parameters',15,'delete_userparameters'),(60,'Can view user parameters',15,'view_userparameters'),(65,'Can add email',17,'add_email'),(66,'Can change email',17,'change_email'),(67,'Can delete email',17,'delete_email'),(68,'Can view email',17,'view_email'),(69,'Can add person or group',18,'add_entity'),(70,'Can change person or group',18,'change_entity'),(71,'Can delete person or group',18,'delete_entity'),(72,'Can view person or group',18,'view_entity'),(77,'Can add voice phone',20,'add_voicephone'),(78,'Can change voice phone',20,'change_voicephone'),(79,'Can delete voice phone',20,'delete_voicephone'),(80,'Can view voice phone',20,'view_voicephone'),(81,'Can add SMS phone',21,'add_smsphone'),(82,'Can change SMS phone',21,'change_smsphone'),(83,'Can delete SMS phone',21,'delete_smsphone'),(84,'Can view SMS phone',21,'view_smsphone'),(89,'Can add applicability item',23,'add_applicabilityitem'),(90,'Can change applicability item',23,'change_applicabilityitem'),(91,'Can delete applicability item',23,'delete_applicabilityitem'),(92,'Can view applicability item',23,'view_applicabilityitem'),(93,'Can add job',24,'add_job'),(94,'Can change job',24,'change_job'),(95,'Can delete job',24,'delete_job'),(96,'Can view job',24,'view_job'),(97,'Can add action',25,'add_action'),(98,'Can change action',25,'change_action'),(99,'Can delete action',25,'delete_action'),(100,'Can view action',25,'view_action'),(101,'Can add vari field object',26,'add_varifieldobject'),(102,'Can change vari field object',26,'change_varifieldobject'),(103,'Can delete vari field object',26,'delete_varifieldobject'),(104,'Can view vari field object',26,'view_varifieldobject'),(105,'Can add Variable Field',27,'add_varifieldspec'),(106,'Can change Variable Field',27,'change_varifieldspec'),(107,'Can delete Variable Field',27,'delete_varifieldspec'),(108,'Can view Variable Field',27,'view_varifieldspec'),(109,'Can add Value for a variable field',28,'add_varifieldvalue'),(110,'Can change Value for a variable field',28,'change_varifieldvalue'),(111,'Can delete Value for a variable field',28,'delete_varifieldvalue'),(112,'Can view Value for a variable field',28,'view_varifieldvalue'),(113,'Can add vari field spec choice',29,'add_varifieldspecchoice'),(114,'Can change vari field spec choice',29,'change_varifieldspecchoice'),(115,'Can delete vari field spec choice',29,'delete_varifieldspecchoice'),(116,'Can view vari field spec choice',29,'view_varifieldspecchoice'),(117,'Can add item x role',30,'add_itemxrole'),(118,'Can change item x role',30,'change_itemxrole'),(119,'Can delete item x role',30,'delete_itemxrole'),(120,'Can view item x role',30,'view_itemxrole'),(121,'Can add make model x category',31,'add_makemodelxcategory'),(122,'Can change make model x category',31,'change_makemodelxcategory'),(123,'Can delete make model x category',31,'delete_makemodelxcategory'),(124,'Can view make model x category',31,'view_makemodelxcategory'),(125,'Can add entity x roll',32,'add_entityxroll'),(126,'Can change entity x roll',32,'change_entityxroll'),(127,'Can delete entity x roll',32,'delete_entityxroll'),(128,'Can view entity x roll',32,'view_entityxroll'),(129,'Can add list',33,'add_roll'),(130,'Can change list',33,'change_roll'),(131,'Can delete list',33,'delete_roll'),(132,'Can view list',33,'view_roll'),(133,'Can add ticket',34,'add_ticket'),(134,'Can change ticket',34,'change_ticket'),(135,'Can delete ticket',34,'delete_ticket'),(136,'Can view ticket',34,'view_ticket'),(137,'Can add user parameters',35,'add_userparameters'),(138,'Can change user parameters',35,'change_userparameters'),(139,'Can delete user parameters',35,'delete_userparameters'),(140,'Can view user parameters',35,'view_userparameters'),(141,'Can add ticket query',36,'add_ticketquery'),(142,'Can change ticket query',36,'change_ticketquery'),(143,'Can delete ticket query',36,'delete_ticketquery'),(144,'Can view ticket query',36,'view_ticketquery'),(145,'Can add ticket response',37,'add_ticketresponse'),(146,'Can change ticket response',37,'change_ticketresponse'),(147,'Can delete ticket response',37,'delete_ticketresponse'),(148,'Can view ticket response',37,'view_ticketresponse');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_spltcs_users_spltcsuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_spltcs_users_spltcsuser_id` FOREIGN KEY (`user_id`) REFERENCES `spltcs_users_spltcsuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-05-08 19:51:28.102194','1','Non-Windows Tablet',1,'[{\"added\": {}}]',8,1),(2,'2020-05-08 19:51:45.448927','2','Desktop PC',1,'[{\"added\": {}}]',8,1),(3,'2020-05-08 19:51:54.867967','3','Laptop PC',1,'[{\"added\": {}}]',8,1),(4,'2020-05-08 19:52:05.411735','4','Windows Tablet',1,'[{\"added\": {}}]',8,1),(5,'2020-05-08 19:52:17.792556','5','Desktop Phone',1,'[{\"added\": {}}]',8,1),(6,'2020-05-08 19:52:26.335919','6','Mobile Phone',1,'[{\"added\": {}}]',8,1),(7,'2020-05-08 19:53:05.340552','1','Non-Lendable Public PC',1,'[{\"added\": {}}]',14,1),(8,'2020-05-08 19:53:22.193920','2','Lendable Public PC',1,'[{\"added\": {}}]',14,1),(9,'2020-05-08 19:53:33.509868','3','Lendable Device',1,'[{\"added\": {}}]',14,1),(10,'2020-05-08 19:54:10.454726','3','Lendable Device',3,'',14,1),(11,'2020-05-08 19:54:35.201911','1','Non-Lendable Public Device',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',14,1),(12,'2020-05-08 19:54:41.780964','2','Non-Lendable Public Device',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',14,1),(13,'2020-05-08 19:54:52.754620','2','Lendable Public Device',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',14,1),(14,'2020-05-08 21:23:27.529882','4','Staff Device',1,'[{\"added\": {}}]',14,1),(15,'2020-05-08 21:24:13.140671','4','Staff Device',3,'',14,1),(16,'2020-05-29 18:28:10.399688','1','Dell Optiplex 390',1,'[{\"added\": {}}]',13,1),(17,'2020-05-29 18:34:34.221505','2','Dell Latitude E5470',1,'[{\"added\": {}}]',13,1),(18,'2020-05-29 18:35:54.503645','3','Dell Latitude E6440',1,'[{\"added\": {}}]',13,1),(19,'2020-05-29 18:37:28.025924','4','Dell Latitude 3340',1,'[{\"added\": {}}]',13,1),(20,'2020-05-29 18:39:21.473400','5','Dell Optiplex 5040',1,'[{\"added\": {}}]',13,1),(21,'2020-05-29 18:52:03.705997','6','Dell Latitude 5290',1,'[{\"added\": {}}]',13,1),(22,'2020-05-29 18:54:05.608273','7','Dell Latitude E6430',1,'[{\"added\": {}}]',13,1),(23,'2020-05-29 18:55:22.736055','8','Dell Latitude 5500',1,'[{\"added\": {}}]',13,1),(24,'2020-05-29 18:56:53.033518','9','Dell Vostro 1710',1,'[{\"added\": {}}]',13,1),(25,'2020-05-29 18:57:40.239912','10','Microsoft Surface Pro 4',1,'[{\"added\": {}}]',13,1),(26,'2020-05-29 19:52:04.902864','1','Morgan Memorial Library',1,'[{\"added\": {}}]',12,1),(27,'2020-05-29 19:52:24.219271','2','North Suffolk Library',1,'[{\"added\": {}}]',12,1),(28,'2020-05-29 19:52:39.320327','3','Chuckatuck Library',1,'[{\"added\": {}}]',12,1),(29,'2020-05-29 19:54:14.608380','4','Library to Go',1,'[{\"added\": {}}]',12,1),(30,'2020-06-07 11:43:10.913867','1','inventory | item ',1,'[{\"added\": {}}]',29,1),(31,'2020-06-07 11:44:10.558825','1','Polaris Login',1,'[{\"added\": {}}]',27,1),(32,'2020-06-07 11:44:40.796058','1','Polaris Login',3,'',27,1),(33,'2020-06-07 11:45:02.115801','1','inventory | role ',2,'[{\"changed\": {\"fields\": [\"Content type\"]}}]',29,1),(34,'2020-06-07 11:45:35.149078','2','Polaris Login',1,'[{\"added\": {}}]',27,1),(35,'2020-06-07 11:45:53.668103','2','Polaris Login',2,'[{\"changed\": {\"fields\": [\"vari_field_objects\"]}}]',27,1),(36,'2020-06-07 14:35:12.249488','4','Staff',1,'[{\"added\": {}}]',14,1),(37,'2020-06-07 14:35:40.717594','3','Location Services Portable',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',14,1),(38,'2020-06-22 17:53:17.062522','1','Viewer',1,'[{\"added\": {}}]',6,1),(39,'2020-06-22 17:54:25.218415','2','Editor',1,'[{\"added\": {}}]',6,1),(40,'2020-06-22 18:09:14.565678','2','Ted',1,'[{\"added\": {}}]',7,1),(41,'2020-06-22 18:10:00.354704','2','Ted',3,'',7,1),(42,'2020-06-22 18:11:25.948051','3','Ted',1,'[{\"added\": {}}]',7,1),(43,'2020-06-22 18:21:28.616233','3','Ted',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Staff status\", \"Superuser status\"]}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(17,'entities','email'),(18,'entities','entity'),(32,'entities','entityxroll'),(33,'entities','roll'),(21,'entities','smsphone'),(20,'entities','voicephone'),(8,'inventory','category'),(9,'inventory','item'),(10,'inventory','itemhistory'),(11,'inventory','itemquery'),(30,'inventory','itemxrole'),(12,'inventory','location'),(13,'inventory','makemodel'),(31,'inventory','makemodelxcategory'),(14,'inventory','role'),(15,'inventory','userparameters'),(25,'maintenance','action'),(23,'maintenance','applicabilityitem'),(24,'maintenance','job'),(5,'sessions','session'),(6,'spltcs_users','spltcsgroup'),(7,'spltcs_users','spltcsuser'),(34,'trouble','ticket'),(36,'trouble','ticketquery'),(37,'trouble','ticketresponse'),(35,'trouble','userparameters'),(26,'varifields','varifieldobject'),(27,'varifields','varifieldspec'),(29,'varifields','varifieldspecchoice'),(28,'varifields','varifieldvalue');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-05-08 14:46:55.546239'),(2,'contenttypes','0002_remove_content_type_name','2020-05-08 14:46:55.718074'),(3,'auth','0001_initial','2020-05-08 14:46:55.875635'),(4,'auth','0002_alter_permission_name_max_length','2020-05-08 14:46:56.318669'),(5,'auth','0003_alter_user_email_max_length','2020-05-08 14:46:56.333762'),(6,'auth','0004_alter_user_username_opts','2020-05-08 14:46:56.351560'),(7,'auth','0005_alter_user_last_login_null','2020-05-08 14:46:56.366865'),(8,'auth','0006_require_contenttypes_0002','2020-05-08 14:46:56.374334'),(9,'auth','0007_alter_validators_add_error_messages','2020-05-08 14:46:56.387740'),(10,'auth','0008_alter_user_username_max_length','2020-05-08 14:46:56.401036'),(11,'auth','0009_alter_user_last_name_max_length','2020-05-08 14:46:56.417104'),(12,'auth','0010_alter_group_name_max_length','2020-05-08 14:46:56.448477'),(13,'auth','0011_update_proxy_permissions','2020-05-08 14:46:56.462370'),(14,'spltcs_users','0001_initial','2020-05-08 14:46:56.643124'),(15,'admin','0001_initial','2020-05-08 14:46:57.312230'),(16,'admin','0002_logentry_remove_auto_add','2020-05-08 14:46:57.541460'),(17,'admin','0003_logentry_add_action_flag_choices','2020-05-08 14:46:57.558293'),(18,'entities','0001_initial','2020-05-08 14:46:57.940351'),(19,'entities','0002_auto_20200508_1446','2020-05-08 14:46:58.874547'),(20,'inventory','0001_initial','2020-05-08 14:46:59.218597'),(21,'inventory','0002_auto_20200508_1446','2020-05-08 14:47:01.782907'),(22,'maintenance','0001_initial','2020-05-08 14:47:02.933963'),(23,'sessions','0001_initial','2020-05-08 14:47:03.893839'),(24,'varifields','0001_initial','2020-05-08 14:47:04.241067'),(25,'inventory','0003_itemquery_paginate_by','2020-05-15 19:43:31.434806'),(26,'inventory','0004_auto_20200607_2146','2020-06-07 21:46:41.845364'),(27,'inventory','0005_auto_20200608_0057','2020-06-08 00:57:41.562494'),(28,'inventory','0006_auto_20200611_1750','2020-06-11 17:50:49.216332'),(29,'entities','0003_auto_20200617_1112','2020-06-18 21:34:08.507641'),(30,'entities','0004_auto_20200617_1147','2020-06-18 21:34:08.838524'),(31,'inventory','0007_auto_20200617_1112','2020-06-18 21:34:08.935703'),(32,'entities','0005_auto_20200619_1510','2020-06-20 14:15:49.512708'),(33,'inventory','0008_auto_20200619_1510','2020-06-20 14:15:49.564004'),(34,'trouble','0001_initial','2020-06-30 18:23:42.243228'),(35,'trouble','0002_auto_20200623_1346','2020-06-30 18:23:43.274474'),(36,'trouble','0003_auto_20200623_1347','2020-06-30 18:23:43.543849'),(37,'trouble','0004_auto_20200623_1536','2020-06-30 18:23:43.631165'),(38,'inventory','0009_auto_20200701_1853','2020-07-01 18:58:09.012498'),(39,'trouble','0005_auto_20200701_1853','2020-07-01 18:58:09.078101'),(40,'inventory','0010_auto_20200710_1811','2020-07-11 10:43:28.491086'),(41,'inventory','0011_auto_20200711_1110','2020-07-11 11:10:28.506977'),(42,'inventory','0012_auto_20200713_2014','2020-07-13 20:14:44.644293'),(43,'inventory','0013_auto_20200713_2024','2020-07-13 20:24:40.620623');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('01m4kzetkm7uhuawj1orare5smzcl6by','YTgwYjI2ZDU5YjNlY2JmN2IxMzdiMWJkMzVlZGQ0ZmZiOTBmNmM5ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjOWM4NjNmZDM0NmFkNjM5ZWE0ZGI1NzY0ZTVhYzBhMmJiMDA5ZDYyIn0=','2020-07-21 20:13:34.611569'),('07q1641ufqxo39proa6uq9pk4ffdr5b1','YTgwYjI2ZDU5YjNlY2JmN2IxMzdiMWJkMzVlZGQ0ZmZiOTBmNmM5ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjOWM4NjNmZDM0NmFkNjM5ZWE0ZGI1NzY0ZTVhYzBhMmJiMDA5ZDYyIn0=','2020-08-12 16:47:29.475080'),('45wllb38scwbi5lfia0mh2qjvycns47y','YTgwYjI2ZDU5YjNlY2JmN2IxMzdiMWJkMzVlZGQ0ZmZiOTBmNmM5ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjOWM4NjNmZDM0NmFkNjM5ZWE0ZGI1NzY0ZTVhYzBhMmJiMDA5ZDYyIn0=','2020-06-16 18:41:49.784952'),('55uzylpy3xzxvv3jvkjbrynha1bpzw0h','YTgwYjI2ZDU5YjNlY2JmN2IxMzdiMWJkMzVlZGQ0ZmZiOTBmNmM5ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjOWM4NjNmZDM0NmFkNjM5ZWE0ZGI1NzY0ZTVhYzBhMmJiMDA5ZDYyIn0=','2020-06-12 19:51:38.772502'),('9wnbmxpnbri8bvyj46bfoga4hlgzy7x1','YTgwYjI2ZDU5YjNlY2JmN2IxMzdiMWJkMzVlZGQ0ZmZiOTBmNmM5ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjOWM4NjNmZDM0NmFkNjM5ZWE0ZGI1NzY0ZTVhYzBhMmJiMDA5ZDYyIn0=','2020-05-22 19:48:29.674970'),('9zzek8edij5ciqzwcacg1o88nxq0gplt','YTgwYjI2ZDU5YjNlY2JmN2IxMzdiMWJkMzVlZGQ0ZmZiOTBmNmM5ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjOWM4NjNmZDM0NmFkNjM5ZWE0ZGI1NzY0ZTVhYzBhMmJiMDA5ZDYyIn0=','2020-06-27 04:50:40.685399'),('cglp3851scdabg1ys8v9dvbya85ou5ls','YTgwYjI2ZDU5YjNlY2JmN2IxMzdiMWJkMzVlZGQ0ZmZiOTBmNmM5ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjOWM4NjNmZDM0NmFkNjM5ZWE0ZGI1NzY0ZTVhYzBhMmJiMDA5ZDYyIn0=','2020-06-27 10:29:21.126123'),('d8p37n11y8497uvm3afkxzqm7bejtrlj','YTgwYjI2ZDU5YjNlY2JmN2IxMzdiMWJkMzVlZGQ0ZmZiOTBmNmM5ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjOWM4NjNmZDM0NmFkNjM5ZWE0ZGI1NzY0ZTVhYzBhMmJiMDA5ZDYyIn0=','2020-06-29 18:16:21.065711'),('f2pdoir71eb5zfd340fqs16h5oukcokl','YTgwYjI2ZDU5YjNlY2JmN2IxMzdiMWJkMzVlZGQ0ZmZiOTBmNmM5ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjOWM4NjNmZDM0NmFkNjM5ZWE0ZGI1NzY0ZTVhYzBhMmJiMDA5ZDYyIn0=','2020-07-25 10:42:51.158268'),('h9qyqh1lyg8bgsrbnrwmtb9pzpjxkm4d','YTgwYjI2ZDU5YjNlY2JmN2IxMzdiMWJkMzVlZGQ0ZmZiOTBmNmM5ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjOWM4NjNmZDM0NmFkNjM5ZWE0ZGI1NzY0ZTVhYzBhMmJiMDA5ZDYyIn0=','2020-08-10 14:06:14.244236'),('imol29orxvqzxvsouatjehq0sr8zai6w','YTgwYjI2ZDU5YjNlY2JmN2IxMzdiMWJkMzVlZGQ0ZmZiOTBmNmM5ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjOWM4NjNmZDM0NmFkNjM5ZWE0ZGI1NzY0ZTVhYzBhMmJiMDA5ZDYyIn0=','2020-05-30 00:31:03.551473'),('kfjfghtti9h3lhkgo5vrmdxetog4xssu','YTgwYjI2ZDU5YjNlY2JmN2IxMzdiMWJkMzVlZGQ0ZmZiOTBmNmM5ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjOWM4NjNmZDM0NmFkNjM5ZWE0ZGI1NzY0ZTVhYzBhMmJiMDA5ZDYyIn0=','2020-05-29 19:07:52.737027'),('mbtvyc6qh0z3h95hqc9sy2d8lgc1h7yz','YTgwYjI2ZDU5YjNlY2JmN2IxMzdiMWJkMzVlZGQ0ZmZiOTBmNmM5ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjOWM4NjNmZDM0NmFkNjM5ZWE0ZGI1NzY0ZTVhYzBhMmJiMDA5ZDYyIn0=','2020-07-31 18:16:22.506800'),('n0371z6h1q0kpnpme7ao4b4zi2ymyr9n','NjViOTk1NGM1YmNjMWRhZjMzZTQ4NWM2M2Q4ZWUyNTg5NjZkNTJkNjp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyNGQ4NDMxMTFmZjI2ODdhZWMxMGZmMmVhNGI3OWE0ZmRkMzk4ZDdhIn0=','2020-07-14 11:08:26.455686'),('nahju2fleizpr4vd2512be1ixmo6two4','YTgwYjI2ZDU5YjNlY2JmN2IxMzdiMWJkMzVlZGQ0ZmZiOTBmNmM5ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjOWM4NjNmZDM0NmFkNjM5ZWE0ZGI1NzY0ZTVhYzBhMmJiMDA5ZDYyIn0=','2020-05-29 19:41:22.792116'),('oen9bwusotffepdrv4w88hke8ys5e9n6','YTgwYjI2ZDU5YjNlY2JmN2IxMzdiMWJkMzVlZGQ0ZmZiOTBmNmM5ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjOWM4NjNmZDM0NmFkNjM5ZWE0ZGI1NzY0ZTVhYzBhMmJiMDA5ZDYyIn0=','2020-06-17 17:04:40.599416'),('pn68guqqqeg95cmjrdof1hce5xdw5dw7','YTgwYjI2ZDU5YjNlY2JmN2IxMzdiMWJkMzVlZGQ0ZmZiOTBmNmM5ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjOWM4NjNmZDM0NmFkNjM5ZWE0ZGI1NzY0ZTVhYzBhMmJiMDA5ZDYyIn0=','2020-07-14 18:00:38.784259'),('qn2rxrkr714ybz8205u6kvjcglkgv6ga','YTgwYjI2ZDU5YjNlY2JmN2IxMzdiMWJkMzVlZGQ0ZmZiOTBmNmM5ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjOWM4NjNmZDM0NmFkNjM5ZWE0ZGI1NzY0ZTVhYzBhMmJiMDA5ZDYyIn0=','2020-06-19 16:28:42.758793'),('refbps4mlqumaimbrue7bg6mqtteugdi','YTgwYjI2ZDU5YjNlY2JmN2IxMzdiMWJkMzVlZGQ0ZmZiOTBmNmM5ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjOWM4NjNmZDM0NmFkNjM5ZWE0ZGI1NzY0ZTVhYzBhMmJiMDA5ZDYyIn0=','2020-06-30 15:48:47.306100'),('ska2y8nrl873w1rn3zfy6xuvkunwch5u','YTgwYjI2ZDU5YjNlY2JmN2IxMzdiMWJkMzVlZGQ0ZmZiOTBmNmM5ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjOWM4NjNmZDM0NmFkNjM5ZWE0ZGI1NzY0ZTVhYzBhMmJiMDA5ZDYyIn0=','2020-07-07 18:27:11.142432'),('tt4v6s433klvjth45nyquxxuzfjr94i7','YTgwYjI2ZDU5YjNlY2JmN2IxMzdiMWJkMzVlZGQ0ZmZiOTBmNmM5ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjOWM4NjNmZDM0NmFkNjM5ZWE0ZGI1NzY0ZTVhYzBhMmJiMDA5ZDYyIn0=','2020-06-26 18:23:43.971298'),('vv3qr6ke1xp897nf08nkoh4umwxmdsvp','YTgwYjI2ZDU5YjNlY2JmN2IxMzdiMWJkMzVlZGQ0ZmZiOTBmNmM5ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjOWM4NjNmZDM0NmFkNjM5ZWE0ZGI1NzY0ZTVhYzBhMmJiMDA5ZDYyIn0=','2020-07-25 10:54:40.559783'),('vxu4048hc4on08beo5vx5cndo9r5bhf6','YTgwYjI2ZDU5YjNlY2JmN2IxMzdiMWJkMzVlZGQ0ZmZiOTBmNmM5ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjOWM4NjNmZDM0NmFkNjM5ZWE0ZGI1NzY0ZTVhYzBhMmJiMDA5ZDYyIn0=','2020-07-29 19:32:54.186802'),('x7g5geilterdjabvvl5rag4f2pryxnvt','YTgwYjI2ZDU5YjNlY2JmN2IxMzdiMWJkMzVlZGQ0ZmZiOTBmNmM5ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjOWM4NjNmZDM0NmFkNjM5ZWE0ZGI1NzY0ZTVhYzBhMmJiMDA5ZDYyIn0=','2020-07-07 18:03:12.117843');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entities_email`
--

DROP TABLE IF EXISTS `entities_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entities_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(254) NOT NULL,
  `is_primary` tinyint(1) NOT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `name` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_email_entity_id_b7025c95_fk_entities_entity_id` (`entity_id`),
  CONSTRAINT `entities_email_entity_id_b7025c95_fk_entities_entity_id` FOREIGN KEY (`entity_id`) REFERENCES `entities_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entities_email`
--

LOCK TABLES `entities_email` WRITE;
/*!40000 ALTER TABLE `entities_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `entities_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entities_entity`
--

DROP TABLE IF EXISTS `entities_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entities_entity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `entity_type` int(11) DEFAULT NULL,
  `full_name` varchar(75) NOT NULL,
  `job_title` varchar(50) NOT NULL,
  `member_of_id` int(11) DEFAULT NULL,
  `short_name` varchar(10) NOT NULL,
  `sort_code` varchar(10) NOT NULL,
  `supervisor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_entity_member_of_id_6a14584b_fk_entities_entity_id` (`member_of_id`),
  KEY `entities_entity_supervisor_id_9a753fc1_fk_entities_entity_id` (`supervisor_id`),
  KEY `entities_entity_user_id_26381a8a_fk_spltcs_users_spltcsuser_id` (`user_id`),
  CONSTRAINT `entities_entity_member_of_id_6a14584b_fk_entities_entity_id` FOREIGN KEY (`member_of_id`) REFERENCES `entities_entity` (`id`),
  CONSTRAINT `entities_entity_supervisor_id_9a753fc1_fk_entities_entity_id` FOREIGN KEY (`supervisor_id`) REFERENCES `entities_entity` (`id`),
  CONSTRAINT `entities_entity_user_id_26381a8a_fk_spltcs_users_spltcsuser_id` FOREIGN KEY (`user_id`) REFERENCES `spltcs_users_spltcsuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entities_entity`
--

LOCK TABLES `entities_entity` WRITE;
/*!40000 ALTER TABLE `entities_entity` DISABLE KEYS */;
INSERT INTO `entities_entity` VALUES (1,NULL,3,'Technology and Content Strategy','',NULL,'TCS','|',NULL),(2,NULL,10,'Kendra Hawkins','Technology and Content Strategy Manager',1,'Kendra','|',NULL),(3,1,10,'Benjamin Goldberg','Library Services Coordinator / Tech Support',1,'Ben','|',2),(4,NULL,2,'City of Suffolk','',NULL,'COS','|',NULL),(5,NULL,2,'Suffolk Public Library','',4,'SPL','|',NULL);
/*!40000 ALTER TABLE `entities_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entities_entityxroll`
--

DROP TABLE IF EXISTS `entities_entityxroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entities_entityxroll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_id` int(11) NOT NULL,
  `roll_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_entityxroll_entity_id_8690165f_fk_entities_entity_id` (`entity_id`),
  KEY `entities_entityxroll_roll_id_38e141ce_fk_entities_roll_id` (`roll_id`),
  CONSTRAINT `entities_entityxroll_entity_id_8690165f_fk_entities_entity_id` FOREIGN KEY (`entity_id`) REFERENCES `entities_entity` (`id`),
  CONSTRAINT `entities_entityxroll_roll_id_38e141ce_fk_entities_roll_id` FOREIGN KEY (`roll_id`) REFERENCES `entities_roll` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entities_entityxroll`
--

LOCK TABLES `entities_entityxroll` WRITE;
/*!40000 ALTER TABLE `entities_entityxroll` DISABLE KEYS */;
INSERT INTO `entities_entityxroll` VALUES (1,3,1);
/*!40000 ALTER TABLE `entities_entityxroll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entities_roll`
--

DROP TABLE IF EXISTS `entities_roll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entities_roll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `sort_code` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entities_roll`
--

LOCK TABLES `entities_roll` WRITE;
/*!40000 ALTER TABLE `entities_roll` DISABLE KEYS */;
INSERT INTO `entities_roll` VALUES (1,'SPL Phone List','|');
/*!40000 ALTER TABLE `entities_roll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entities_smsphone`
--

DROP TABLE IF EXISTS `entities_smsphone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entities_smsphone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(15) NOT NULL,
  `is_primary` tinyint(1) NOT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `name` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_smsphone_entity_id_43e57150_fk_entities_entity_id` (`entity_id`),
  CONSTRAINT `entities_smsphone_entity_id_43e57150_fk_entities_entity_id` FOREIGN KEY (`entity_id`) REFERENCES `entities_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entities_smsphone`
--

LOCK TABLES `entities_smsphone` WRITE;
/*!40000 ALTER TABLE `entities_smsphone` DISABLE KEYS */;
/*!40000 ALTER TABLE `entities_smsphone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entities_voicephone`
--

DROP TABLE IF EXISTS `entities_voicephone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entities_voicephone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(15) NOT NULL,
  `is_primary` tinyint(1) NOT NULL,
  `extension` varchar(30) NOT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `name` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_voicephone_entity_id_3bfb689f_fk_entities_entity_id` (`entity_id`),
  CONSTRAINT `entities_voicephone_entity_id_3bfb689f_fk_entities_entity_id` FOREIGN KEY (`entity_id`) REFERENCES `entities_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entities_voicephone`
--

LOCK TABLES `entities_voicephone` WRITE;
/*!40000 ALTER TABLE `entities_voicephone` DISABLE KEYS */;
/*!40000 ALTER TABLE `entities_voicephone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_category`
--

DROP TABLE IF EXISTS `inventory_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_category`
--

LOCK TABLES `inventory_category` WRITE;
/*!40000 ALTER TABLE `inventory_category` DISABLE KEYS */;
INSERT INTO `inventory_category` VALUES (1,'Non-Windows Tablet',''),(2,'Desktop PC',''),(3,'Laptop PC',''),(4,'Windows Tablet',''),(5,'Desktop Phone',''),(6,'Mobile Phone','');
/*!40000 ALTER TABLE `inventory_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_item`
--

DROP TABLE IF EXISTS `inventory_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `familiar_name` varchar(30) NOT NULL,
  `serial_number` varchar(30) NOT NULL,
  `asset_number` varchar(30) NOT NULL,
  `barcode` varchar(50) NOT NULL,
  `hostname` varchar(50) NOT NULL,
  `condition` int(11) DEFAULT NULL,
  `inventory` int(11) DEFAULT NULL,
  `notes` longtext NOT NULL,
  `borrower_id` int(11) DEFAULT NULL,
  `home_id` int(11) DEFAULT NULL,
  `keeper_id` int(11) DEFAULT NULL,
  `lessor_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `makemodel_id` int(11) DEFAULT NULL,
  `inventoried` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `inventory_item_borrower_id_c2a62518_fk_entities_entity_id` (`borrower_id`),
  KEY `inventory_item_home_id_969b5720_fk_inventory_location_id` (`home_id`),
  KEY `inventory_item_keeper_id_30484fff_fk_entities_entity_id` (`keeper_id`),
  KEY `inventory_item_lessor_id_ff438217_fk_entities_entity_id` (`lessor_id`),
  KEY `inventory_item_location_id_acbf3502_fk_inventory_location_id` (`location_id`),
  KEY `inventory_item_makemodel_id_f8ccdc49_fk_inventory_makemodel_id` (`makemodel_id`),
  CONSTRAINT `inventory_item_borrower_id_c2a62518_fk_entities_entity_id` FOREIGN KEY (`borrower_id`) REFERENCES `entities_entity` (`id`),
  CONSTRAINT `inventory_item_home_id_969b5720_fk_inventory_location_id` FOREIGN KEY (`home_id`) REFERENCES `inventory_location` (`id`),
  CONSTRAINT `inventory_item_keeper_id_30484fff_fk_entities_entity_id` FOREIGN KEY (`keeper_id`) REFERENCES `entities_entity` (`id`),
  CONSTRAINT `inventory_item_lessor_id_ff438217_fk_entities_entity_id` FOREIGN KEY (`lessor_id`) REFERENCES `entities_entity` (`id`),
  CONSTRAINT `inventory_item_location_id_acbf3502_fk_inventory_location_id` FOREIGN KEY (`location_id`) REFERENCES `inventory_location` (`id`),
  CONSTRAINT `inventory_item_makemodel_id_f8ccdc49_fk_inventory_makemodel_id` FOREIGN KEY (`makemodel_id`) REFERENCES `inventory_makemodel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_item`
--

LOCK TABLES `inventory_item` WRITE;
/*!40000 ALTER TABLE `inventory_item` DISABLE KEYS */;
INSERT INTO `inventory_item` VALUES (1,'Amy Bowen','FBF7LS1','1777','','LIBW7DT-FBF7LS1',NULL,NULL,'',NULL,2,NULL,NULL,NULL,1,'2020-07-01'),(2,'Marisha Jackson','FBF8LS1','1785','','LIBW7DT-FBF8LS1',NULL,NULL,'',NULL,1,NULL,NULL,NULL,1,'2020-07-01'),(3,'Lakecha Green','FBK7LS1','1797','','LIBW7DT-FBK7LS1',NULL,NULL,'',NULL,1,NULL,NULL,NULL,1,'2020-07-01'),(4,'Torree Tucker','FBG8LS1','1768','','LIBW7DT-FBG8LS1',NULL,NULL,'',NULL,1,NULL,NULL,NULL,1,'2020-07-01'),(5,'Sarah Townsend','FBH9LS1','1790','','LIBW7DT-FBH9LS1',NULL,NULL,'',NULL,1,NULL,NULL,NULL,1,'2020-07-01'),(6,'Raynell Carpenter','J909YF2','4525','','LIBW7LT-J909YF2',NULL,NULL,'',NULL,2,NULL,NULL,NULL,2,'2020-07-01'),(7,'Shared (Location Services)','FCH5LS1','1815','','LIBW7DT-FCH5LS1',NULL,NULL,'',NULL,1,NULL,NULL,NULL,1,'2020-07-01'),(8,'Tamra Mabrey','FBG7LS1','1804','','LIBW7DT-FBG7LS1',NULL,NULL,'',NULL,1,NULL,NULL,NULL,1,'2020-07-01'),(9,'Ben Goldberg','F349YF2','4528','','LIBW7LT-F349YF2',NULL,NULL,'',NULL,1,NULL,NULL,NULL,2,'2020-07-01'),(10,'Ben Goldberg','FBDGLS1','1770','','LIBW7DT-FBDGLS1',NULL,NULL,'',NULL,1,NULL,NULL,NULL,1,'2020-07-01'),(11,'Jane Gagne','FCH7LS1','1803','','LIBW7DT-FCH7LS1',NULL,NULL,'',NULL,1,NULL,NULL,NULL,1,'2020-07-01'),(12,'Bill Edwards-Bodmer','FBHBLS1','1784','','LIBW7DT-FBHBLS1',NULL,NULL,'',NULL,1,NULL,NULL,NULL,1,'2020-07-01'),(13,'Exec Secretary','FCH6LS1','1817','','LIBW7DT-FCH6LS1',NULL,NULL,'',NULL,1,NULL,NULL,NULL,1,'2020-07-01'),(14,'','FBF6LS1','1769','','LIBW7DT-FBF6LS1',NULL,NULL,'',NULL,2,NULL,NULL,NULL,1,'2020-07-01'),(15,'Thomas Farrar','FBF5LS1','1766','','LIBW7DT-FBF5LS1',NULL,NULL,'',NULL,1,NULL,NULL,NULL,1,'2020-07-01'),(16,'YFS Office','FBJ6LS1','1786','','LIBW7DT-FBJ6LS1',NULL,NULL,'',NULL,1,NULL,NULL,NULL,1,'2020-07-01'),(17,'Shared','FCHFLS1','1802','','LIBW7DT-FCHFLS1',NULL,NULL,'',NULL,3,NULL,NULL,NULL,1,'2020-07-01'),(18,'Tamra Mabrey','J9BS162','3278','','LIBW7LT-J9BS162',NULL,NULL,'',NULL,4,NULL,NULL,NULL,3,'2020-07-01'),(19,'Matt Thompson','FBD6LS1','1779','','LIBW7DT-FBD6LS1',NULL,NULL,'',NULL,2,NULL,NULL,NULL,1,'2020-07-01'),(20,'Kiersten Winslow','FBFFLS1','1798','','LIBW7DT-FBFFLS1',NULL,NULL,'',NULL,2,NULL,NULL,NULL,1,'2020-07-01'),(21,'NSL Inventory','5Z8B682','3277','823091004221430','LIBW8LT-5Z8B682',NULL,NULL,'',NULL,2,NULL,NULL,2,4,'2020-07-01'),(22,'Dionne Baker','FBK4LS1','1795','','LIBW7DT-FBK4LS1',NULL,NULL,'',NULL,2,NULL,NULL,NULL,1,'2020-07-01'),(23,'Tiffany Duck','FBG5LS1','1805','','LIBW7DT-FBG5LS1',NULL,NULL,'',NULL,2,NULL,NULL,NULL,1,'2020-07-01'),(24,'Bill Edwards-Bodmer','FCHBLS1','1818','','LIBW7DT-FCHBLS1',NULL,NULL,'',NULL,2,NULL,NULL,NULL,1,'2020-07-01'),(25,'Sean Dorsey','FBD8LS1','1808','','LIBW7DT-FBD8LS1',NULL,NULL,'',NULL,2,NULL,NULL,NULL,1,'2020-07-01'),(26,'Cory Bland','FBJ4LS1','1783','','LIBW7DT-FBJ4LS1',NULL,NULL,'',NULL,2,NULL,NULL,NULL,1,'2020-07-01'),(27,'Shared (Worktable)','FBFCLS1','1778','','LIBW7DT-FBFCLS1',NULL,NULL,'',NULL,2,NULL,NULL,NULL,1,'2020-07-01'),(28,'Cheryl Amico','FBH4LS1','1812','','LIBW7DT-FBH4LS1',NULL,NULL,'',NULL,2,NULL,NULL,NULL,1,'2020-07-01'),(29,'Sarah Townsend','3B6L8C2','4491','','LIBW7DT-3B6L8C2',NULL,NULL,'',NULL,1,NULL,NULL,NULL,5,'2020-07-01'),(30,'LaSandra Adams','4NF2DD2','4052','','LIBW7DT-4NF2DD2',NULL,NULL,'',NULL,1,NULL,NULL,NULL,5,'2020-07-01'),(31,'Monica Patterson','FBH5LS1','1789','','LIBW7DT-FBH5LS1',NULL,NULL,'',NULL,1,NULL,NULL,NULL,1,'2020-07-01'),(32,'Jennifer Brown','FBJ9LS1','1771','','LIBW7DT-FBJ9LS1',NULL,NULL,'',NULL,1,NULL,NULL,NULL,1,'2020-07-01'),(33,'Ashley Reed','FBJGLS1','1801','','LIBW7DT-FBJGLS1',NULL,NULL,'',NULL,2,NULL,NULL,NULL,1,'2020-07-01'),(34,'Upstairs Workroom','1XX7LV1','','823091005159052','LIBW7LT-1XX7LV1',NULL,NULL,'',NULL,1,NULL,NULL,NULL,7,'2020-07-02'),(35,'MML Inventory','DY8B682','3274','823091005187731','LIBW10L-DY8B682',NULL,NULL,'',NULL,1,NULL,NULL,NULL,4,'2020-07-01'),(36,'Clint Rudy','F7G5DD2','4493','','LIBW10D-F7G5DD2',NULL,NULL,'',NULL,1,NULL,NULL,NULL,5,'2020-07-01'),(37,'Upstairs Workroom','GJ5XXZ1','1665','823091005159045','LIBW7LT-GJ5XXZ1',NULL,NULL,'',NULL,1,NULL,NULL,NULL,3,'2020-07-01'),(38,'OPS','J42T162','3303','823091005172501','LIBW7LT-J42T162',NULL,NULL,'',NULL,2,NULL,NULL,NULL,3,'2020-07-01'),(39,'AnneMarie Welch','44R4L22','2920','','LIBW10L-44R4L22',NULL,NULL,'',NULL,1,NULL,NULL,NULL,8,'2020-07-01'),(40,'TCS Office','60D3GH1','4123','','LIBW7LT-60D3GH1',NULL,NULL,'',NULL,2,NULL,NULL,NULL,9,'2020-07-01'),(41,'NSL Roving','FY8B682','3285','823091004221452','LIBW8LT-FY8B682',NULL,NULL,'',NULL,2,NULL,NULL,NULL,4,'2020-07-01'),(42,'NSL Roving','BZ8B682','3272','823091004221414','LIBW8LT-BZ8B682',NULL,NULL,'',NULL,2,NULL,NULL,NULL,4,'2020-07-01'),(43,'NSL Roving','GY8B682','3276','823091005187244','LIBW8LT-GY8B682',NULL,NULL,'',NULL,2,NULL,NULL,NULL,4,'2020-07-01'),(44,'MML roving','G149YF2','04521','','LIBW7LT-G149YF2',NULL,NULL,'',NULL,1,NULL,NULL,NULL,2,'2020-07-01'),(45,'Workroom computer (right)','FBH8LS1','01767','','LIBW10D-FBH8LS1',3,6,'',NULL,1,NULL,NULL,1,1,'2020-07-01'),(46,'Shared','FBJ5LS1','1794','','LIBW7DT-FBJ5LS1',NULL,NULL,'',NULL,1,NULL,NULL,NULL,1,'2020-07-01'),(47,'Natalie S.','FBGGLS1','1781','','LIBW7DT-FBGGLS1',NULL,NULL,'',NULL,1,NULL,NULL,NULL,1,'2020-07-01'),(48,'Youth Services','FBGCLS1','1776','','LIBW7DT-FBGCLS1',NULL,NULL,'',NULL,2,NULL,NULL,NULL,1,'2020-07-01'),(49,'Asa Heyward','9LD1WT2','5081','','LIBW10T-9LD1WT2',NULL,NULL,'',NULL,1,NULL,NULL,NULL,6,'2020-07-01'),(50,'Deborah Ward','B571WT2','5082','','LIBW10T-B571WT2',NULL,NULL,'',NULL,1,NULL,NULL,NULL,6,'2020-07-01'),(51,'Monica Patterson','-H51WT2','5083','','LIBW10T-H51WT2',NULL,NULL,'',NULL,1,NULL,NULL,NULL,6,'2020-07-01'),(52,'Sarah Townsend','5D09YF2','4522','','LIBW7LT-5D09YF2',NULL,NULL,'',NULL,1,NULL,NULL,NULL,2,'2020-07-01'),(53,'MML Workroom Laptop','82N9562','4036','','LIBW7LT-82N9562',NULL,NULL,'',NULL,1,NULL,NULL,NULL,3,'2020-07-01'),(54,'Megan Mulvey','FBHGLS1','1809','','LIBW7DT-FBHGLS1',NULL,NULL,'',NULL,1,NULL,NULL,NULL,1,'2020-07-01'),(55,'Kim and Jillian','BFQ3HX1','1874','','LIBW?DT-BFQ3HX1',NULL,NULL,'',NULL,1,NULL,NULL,NULL,1,'2020-07-01'),(56,'Joseph Ficklen','F921DD2','4940','','LIBW7DT-F921DD2',NULL,NULL,'',NULL,1,NULL,NULL,NULL,5,'2020-07-01'),(57,'AnneMarie Welch','3BL68C2','4049','','LIBW7DT-33BL68C2',NULL,NULL,'',NULL,1,NULL,NULL,NULL,5,'2020-07-01'),(58,'Richard & Joe','F921DD2','4490','','LIBW?DT-F921DD2',NULL,NULL,'',NULL,1,NULL,NULL,NULL,5,'2020-07-01'),(59,'Jennifer Brown','H45Y202','','','LIBW10T-H45Y202',NULL,NULL,'',NULL,1,NULL,NULL,NULL,10,'2020-07-01'),(60,'Megan Mulvey','44F6O52','','','LIBW10T-44F6O52',NULL,NULL,'',NULL,1,NULL,NULL,NULL,10,'2020-07-01'),(61,'Programming Laptop','3Z8B682','3271','','LIBW8LT-3Z8B682',NULL,NULL,'',NULL,2,NULL,NULL,NULL,4,'2020-07-01'),(62,'Programming Laptop','4Z8B682','3286','','LIBW8LT-4Z8B682',NULL,NULL,'',NULL,2,NULL,NULL,NULL,4,'2020-07-01'),(63,'Programming Laptop','7Z8B682','3273','','LIBW8LT-7Z8B682',NULL,NULL,'',NULL,2,NULL,NULL,NULL,4,'2020-07-01'),(64,'Programming Laptop','8Z8B682','3281','','LIBW8LT-8Z8B682',NULL,NULL,'',NULL,2,NULL,NULL,NULL,4,'2020-07-01'),(65,'Programming Laptop','1Z8B682','3275','823091005246933','LIBW10L-1Z8B682',NULL,NULL,'',NULL,2,NULL,NULL,NULL,4,'2020-07-01'),(66,'Programming Laptop','2Z8B682','3280','823091005315647','LIBW10L-2Z8B682',NULL,NULL,'',NULL,2,NULL,NULL,NULL,4,'2020-07-01'),(67,'TCS Office','9Z8B682','3284','','LIBW8LT-9Z8B682',NULL,NULL,'',NULL,2,NULL,NULL,2,4,'2020-07-01'),(68,'Programming Laptop','HY8B682','3287','','LIBW8LT-HY8B682',NULL,NULL,'',NULL,2,NULL,NULL,NULL,4,'2020-07-01'),(69,'Programming Laptop','JY8B682','3282','823091004221478','LIBW8LT-JY8B682',NULL,NULL,'',NULL,2,NULL,NULL,NULL,4,'2020-07-01'),(70,'Bill Edwards-Bodmer','9MD1WT2','5079','','LIBW10T-9MD1WT2',NULL,NULL,'',NULL,2,NULL,NULL,NULL,6,'2020-07-01'),(72,'April Watkins','7471WT2','5080','','LIBW10T-7471WT2',NULL,NULL,'',NULL,2,NULL,NULL,NULL,6,'2020-07-01'),(73,'Ted Chaney Laptop','B249YF2','4526','','LIBW7LT-B249YF2',NULL,NULL,'',NULL,2,NULL,NULL,NULL,2,'2020-07-01'),(74,'Angie Sumner','FCH8LS1','1811','','LIBW7DT-FCH8LS1',NULL,NULL,'',NULL,2,NULL,NULL,NULL,1,'2020-07-01'),(75,'TCS Office','FBG9LS1','1799','','LIBW7DT-FBG9LS1',NULL,NULL,'',NULL,2,NULL,NULL,NULL,1,'2020-07-01'),(76,'Kendra Hawkins','FCH8LS1','1811','','LIBW7DT-FCH8LS1',NULL,NULL,'',NULL,2,NULL,NULL,NULL,1,'2020-07-01'),(77,'Melissa Mitchell','FCHCLS1','1814','','LIBW7DT-FCHCLS1',NULL,NULL,'',NULL,2,NULL,NULL,NULL,1,'2020-07-01'),(78,'Tiffany Duck','TTGKLD3','','','LIBW10T-TTGKLD3',NULL,NULL,'',NULL,2,NULL,NULL,NULL,10,'2020-07-01'),(79,'Monica Patterson','H571WT2','','','LIBW10T-H571WT2',NULL,NULL,'',NULL,1,NULL,NULL,NULL,6,'2020-07-01'),(80,'Rov-ipad1','DMRML4PVF182','3290','823091004260377','',3,3,'',NULL,2,NULL,NULL,2,12,'2020-07-01'),(81,'Rov-ipad5','DMPHR0J0DNQV','','','',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,12,'2020-07-01'),(82,'Rov-ipad2','DMPHM1QTDNQV','1827','','',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,13,'2020-07-01'),(83,'Rov-ipad2','DMPHM1QTDNQV','1827','','',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,13,'2020-07-01'),(84,'Rov-ipad2','DMPHM1QTDNQV','1827','','',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,13,'2020-07-01'),(85,'[copy]Rov-ipad2','DMPHM1QTDNQV','1827','','',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,13,'2020-07-01'),(86,'iPad Pro #1','DLXQF9B4GMLF','3299','823091005172386','',NULL,NULL,'',NULL,4,NULL,NULL,4,14,'2020-07-01'),(98,'MML Express #2','FBFBLS1','1819','','LIBW10DT-FBFBLS1',3,3,'',NULL,1,5,NULL,1,1,'2020-07-01'),(99,'MML Public PC #6','FBG4LS1','01807','','LIBW10D-FBG4LS1',3,3,'',NULL,1,5,NULL,1,1,'2020-07-02'),(100,'MML Public PC #3','FBJ8LS1','1800','','LIBW10D-FBJ8LS1',3,3,'',NULL,1,NULL,NULL,1,1,'2020-07-01'),(101,'MML Public PC #4','FBJ8LS1','01813','','LIBW10D-FBFGLS1',3,3,'',NULL,1,NULL,NULL,1,1,'2020-07-02'),(102,'MML Public PC #5','FBH7LS1','1792','','LIBW10D-FBH7LS1',3,3,'',NULL,1,NULL,NULL,1,1,'2020-07-01'),(103,'MML Public PC #5','FBK5LS1','01793','','LIBW10D-FBK5LS1',3,3,'',NULL,1,NULL,NULL,1,1,'2020-07-02'),(104,'MML Express #1','FBD7LS1','(missing)','','LIBW10D-FBD7LS1',3,3,'',NULL,1,NULL,NULL,1,1,'2020-07-01'),(106,'MML Public PC #7','7FYWL02','01647','','LIBW10D-7FYWL02',3,3,'',NULL,1,NULL,NULL,1,15,'2020-07-02'),(107,'MML Public PC #2','7FYZL02','1657','','LIBW10D-7FYZL02',3,3,'',NULL,1,NULL,NULL,1,15,'2020-07-02'),(108,'MML Public PC #9','7FRXL02','01646','','LIBW10D-7FRXL02',3,3,'',NULL,1,NULL,NULL,1,15,'2020-07-02'),(109,'MML Public PC #1','7G6WL02','01655','','LIBW10D-7G6WL02',3,3,'',NULL,1,NULL,NULL,1,15,'2020-07-02'),(110,'MML Public PC #8','7FZVL02','01649','','LIBW10D-7FZVL02',3,3,'',NULL,1,NULL,NULL,1,15,'2020-07-02'),(112,'Public Kindle #1','GOWO T905 9483 FA1R','','','',NULL,NULL,'',NULL,1,NULL,NULL,1,16,'2020-07-01'),(113,'Public Kindle #2','GOWO T905 9483 F9Q3','','','',NULL,NULL,'',NULL,1,NULL,NULL,1,16,'2020-07-01'),(114,'Public Kindle #3','GOWO T905 9483 F2RU','','','',NULL,NULL,'',NULL,1,NULL,NULL,1,16,'2020-07-01'),(115,'Public Kindle #4','GOWO T905 9483 FA59','','','',NULL,NULL,'',NULL,1,NULL,NULL,1,16,'2020-07-01'),(116,'Public Kindle #5','GOWO T905 9483 F9HT','','','',NULL,NULL,'',NULL,1,NULL,NULL,1,16,'2020-07-01'),(117,'Public Kindle #6','GOWO T905 9483 FA53','','','',NULL,NULL,'',NULL,1,NULL,NULL,1,16,'2020-07-01'),(118,'Public Kindle #7','GOWO T905 9483 FOAM','','','',NULL,NULL,'',NULL,1,NULL,NULL,1,16,'2020-07-01'),(119,'Public Kindle #8','GOWO T905 9483 F2RC','','','',NULL,NULL,'',NULL,1,NULL,NULL,1,16,'2020-07-01'),(120,'Public Kindle #9','GOWO T905 9483 F233','','','',NULL,NULL,'',NULL,1,NULL,NULL,1,16,'2020-07-01'),(121,'CHK Circulation #1','5K2QQD2','4136','','LIBW7DT-5K2QQD2',3,3,'',NULL,3,NULL,NULL,3,17,'2020-07-01'),(122,'CHK Circulation #2','1B3LJH2','4470','','LIBW7DT-1B3LJH2',3,3,'',NULL,3,NULL,NULL,3,18,'2020-07-01'),(123,'MML Check in Station','1B41KH2','4485','','LIBW7DT-1B41KH2',3,3,'',NULL,1,NULL,NULL,1,18,'2020-07-01'),(124,'Receipt Printer #3','22805124090602096','','','',3,NULL,'',NULL,1,NULL,NULL,1,19,'2020-07-01'),(125,'MML Public PC #3','7G8XL02','01656','','LIBW10D-7G8XL02',3,3,'',NULL,1,NULL,NULL,1,15,'2020-07-02'),(126,'MML Public PC #4','FBFGLS1','01813','','LIBW10D-FBFGLS1',3,3,'',NULL,1,NULL,NULL,1,1,'2020-07-01'),(127,'MML Reservation','1B4HJH2','04017','','LIBW7DT-1B4HJH2',3,NULL,'',NULL,1,NULL,NULL,1,18,'2020-07-01'),(128,'MML Public PC #10','7G60M02','01648','','LIBW10D-G6G0M02',3,3,'',NULL,1,NULL,NULL,1,15,'2020-07-02'),(130,'MML OPAC #1','F05DQ22','02838','','LIBW10D-F05DQ22',3,3,'',NULL,1,NULL,NULL,1,20,'2020-07-01'),(131,'MML Receipt Printer #2','2280514090602085','','','',3,3,'',NULL,1,NULL,NULL,1,19,'2020-07-01'),(132,'MML Receipt Printer #1','2280514080600229','','','',3,3,'',NULL,1,NULL,NULL,1,19,'2020-07-01'),(133,'MML OPAC #2','F05GQ22','','','LIBW10D-F05GQ22',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,20,'2020-07-01'),(134,'Dell Optiplex FBDCLS1','FBDCLS1','01765','','',NULL,9,'Bad power supply',NULL,1,NULL,NULL,1,1,'2020-07-17'),(135,'[copy]Dell Optiplex FBDCLS1','FBGBLS1','01774','','',NULL,9,'Bad power supply',NULL,1,NULL,NULL,1,1,'2020-07-17'),(136,'MML Self Checkout','68VGS13','0594','','LIBW10D-68VGS13',0,NULL,'',NULL,1,NULL,NULL,1,21,'2020-07-29');
/*!40000 ALTER TABLE `inventory_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_itemhistory`
--

DROP TABLE IF EXISTS `inventory_itemhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_itemhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime(6) NOT NULL,
  `description` longtext NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `inventory_itemhistory_item_id_5b67717a_fk_inventory_item_id` (`item_id`),
  CONSTRAINT `inventory_itemhistory_item_id_5b67717a_fk_inventory_item_id` FOREIGN KEY (`item_id`) REFERENCES `inventory_item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=526 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_itemhistory`
--

LOCK TABLES `inventory_itemhistory` WRITE;
/*!40000 ALTER TABLE `inventory_itemhistory` DISABLE KEYS */;
INSERT INTO `inventory_itemhistory` VALUES (1,'2020-06-05 21:36:47.810366','roles changed from [] to <QuerySet [<Role: Staff Location Services Laptop>]>',21),(2,'2020-06-05 21:36:47.816019','current location changed from None to North Suffolk Library',21),(3,'2020-06-06 18:59:34.566255','roles changed from [] to <QuerySet [<Role: Staff Location Services Laptop>]>',35),(4,'2020-06-07 14:54:51.283397','roles changed from [] to <QuerySet [<Role: Location Services Portable>, <Role: Staff>]>',41),(5,'2020-06-08 15:11:17.803251','current location changed from None to North Suffolk Library',67),(6,'2020-06-13 11:07:02.350077','created with familiar name =  Rov-ipad1',80),(7,'2020-06-13 11:07:02.362863','created with model =  Apple iPad A1458 64Gb',80),(8,'2020-06-13 11:07:02.369619','created with host name =  ',80),(9,'2020-06-13 11:07:02.380175','created with serial number =  DMRML4PVF182',80),(10,'2020-06-13 11:07:02.386222','created with asset number =  3290',80),(11,'2020-06-13 11:07:02.391482','created with barcode =  823091004260377',80),(12,'2020-06-13 11:07:02.396342','created with home =  North Suffolk Library',80),(13,'2020-06-13 11:07:02.403439','created with current location =  North Suffolk Library',80),(14,'2020-06-13 11:07:02.408315','created with condition =  3',80),(15,'2020-06-13 11:07:02.413390','created with inventory status =  3',80),(16,'2020-06-13 11:07:02.418296','created with keeper =  None',80),(17,'2020-06-13 11:07:02.423218','created with borrower =  None',80),(18,'2020-06-13 11:07:02.428396','created with lessor =  None',80),(19,'2020-06-13 11:07:02.433476','created with notes =  ',80),(20,'2020-06-13 11:07:02.440605','Created: ',80),(21,'2020-06-13 11:24:32.208754','created with familiar name =  Rov-ipad5',81),(22,'2020-06-13 11:24:32.229658','created with model =  Apple iPad A1458 64Gb',81),(23,'2020-06-13 11:24:32.257260','created with host name =  ',81),(24,'2020-06-13 11:24:32.281794','created with serial number =  DMPHR0J0DNQV',81),(25,'2020-06-13 11:24:32.326063','created with asset number =  ',81),(26,'2020-06-13 11:24:32.340625','created with barcode =  ',81),(27,'2020-06-13 11:24:32.371956','created with home =  None',81),(28,'2020-06-13 11:24:32.396062','created with current location =  None',81),(29,'2020-06-13 11:24:32.442672','created with condition =  None',81),(30,'2020-06-13 11:24:32.539381','created with inventory status =  None',81),(31,'2020-06-13 11:24:32.682813','created with keeper =  None',81),(32,'2020-06-13 11:24:32.730548','created with borrower =  None',81),(33,'2020-06-13 11:24:32.785806','created with lessor =  None',81),(34,'2020-06-13 11:24:32.822737','created with notes =  ',81),(35,'2020-06-13 11:24:32.856475','Created: ',81),(36,'2020-06-13 12:31:38.618583','created with familiar name =  Rov-ipad2',82),(37,'2020-06-13 12:31:38.626769','created with model =  Apple iPad A1403 - 64GB',82),(38,'2020-06-13 12:31:38.631410','created with host name =  ',82),(39,'2020-06-13 12:31:38.642294','created with serial number =  DMPHM1QTDNQV',82),(40,'2020-06-13 12:31:38.646927','created with asset number =  1827',82),(41,'2020-06-13 12:31:38.651429','created with barcode =  ',82),(42,'2020-06-13 12:31:38.664466','created with home =  None',82),(43,'2020-06-13 12:31:38.669431','created with current location =  None',82),(44,'2020-06-13 12:31:38.676154','created with condition =  None',82),(45,'2020-06-13 12:31:38.681481','created with inventory status =  None',82),(46,'2020-06-13 12:31:38.686048','created with keeper =  None',82),(47,'2020-06-13 12:31:38.691073','created with borrower =  None',82),(48,'2020-06-13 12:31:38.695490','created with lessor =  None',82),(49,'2020-06-13 12:31:38.699939','created with notes =  ',82),(50,'2020-06-13 12:31:38.709321','Created: ',82),(51,'2020-06-13 12:34:10.140424','created with familiar name =  Rov-ipad2',83),(52,'2020-06-13 12:34:10.144563','created with model =  Apple iPad A1403 - 64GB',83),(53,'2020-06-13 12:34:10.146798','created with host name =  ',83),(54,'2020-06-13 12:34:10.150613','created with serial number =  DMPHM1QTDNQV',83),(55,'2020-06-13 12:34:10.157654','created with asset number =  1827',83),(56,'2020-06-13 12:34:10.161424','created with barcode =  ',83),(57,'2020-06-13 12:34:10.165501','created with home =  None',83),(58,'2020-06-13 12:34:10.176212','created with current location =  None',83),(59,'2020-06-13 12:34:10.179950','created with condition =  None',83),(60,'2020-06-13 12:34:10.183556','created with inventory status =  None',83),(61,'2020-06-13 12:34:10.187324','created with keeper =  None',83),(62,'2020-06-13 12:34:10.191068','created with borrower =  None',83),(63,'2020-06-13 12:34:10.194884','created with lessor =  None',83),(64,'2020-06-13 12:34:10.198582','created with notes =  ',83),(65,'2020-06-13 12:34:10.203905','Created: ',83),(66,'2020-06-13 12:34:20.948766','created with familiar name =  Rov-ipad2',84),(67,'2020-06-13 12:34:20.954153','created with model =  Apple iPad A1403 - 64GB',84),(68,'2020-06-13 12:34:20.959192','created with host name =  ',84),(69,'2020-06-13 12:34:20.964067','created with serial number =  DMPHM1QTDNQV',84),(70,'2020-06-13 12:34:20.966768','created with asset number =  1827',84),(71,'2020-06-13 12:34:20.971433','created with barcode =  ',84),(72,'2020-06-13 12:34:20.981874','created with home =  None',84),(73,'2020-06-13 12:34:20.993496','created with current location =  None',84),(74,'2020-06-13 12:34:20.998330','created with condition =  None',84),(75,'2020-06-13 12:34:21.003083','created with inventory status =  None',84),(76,'2020-06-13 12:34:21.007700','created with keeper =  None',84),(77,'2020-06-13 12:34:21.010301','created with borrower =  None',84),(78,'2020-06-13 12:34:21.014823','created with lessor =  None',84),(79,'2020-06-13 12:34:21.019512','created with notes =  ',84),(80,'2020-06-13 12:34:21.028055','Created: ',84),(81,'2020-06-13 12:36:07.931774','created with familiar name =  iPad Pro #1',86),(82,'2020-06-13 12:36:07.937953','created with model =  Apple iPad Pro Wi-Fi 32GB',86),(83,'2020-06-13 12:36:07.945245','created with host name =  ',86),(84,'2020-06-13 12:36:07.950961','created with serial number =  DLXQF9B4GMLF',86),(85,'2020-06-13 12:36:07.961518','created with asset number =  3299',86),(86,'2020-06-13 12:36:07.965939','created with barcode =  823091005172386',86),(87,'2020-06-13 12:36:07.970622','created with home =  Library to Go',86),(88,'2020-06-13 12:36:07.975812','created with current location =  Library to Go',86),(89,'2020-06-13 12:36:07.981781','created with condition =  None',86),(90,'2020-06-13 12:36:07.986425','created with inventory status =  None',86),(91,'2020-06-13 12:36:07.990977','created with keeper =  None',86),(92,'2020-06-13 12:36:08.000943','created with borrower =  None',86),(93,'2020-06-13 12:36:08.005539','created with lessor =  None',86),(94,'2020-06-13 12:36:08.013362','created with notes =  ',86),(95,'2020-06-13 12:36:08.033833','Created: ',86),(96,'2020-06-13 12:49:45.981262','created with familiar name =  test',NULL),(97,'2020-06-13 12:49:45.985742','created with model =  Apple iPad A1403 - 64GB',NULL),(98,'2020-06-13 12:49:45.990693','created with host name =  ',NULL),(99,'2020-06-13 12:49:45.994985','created with serial number =  ',NULL),(100,'2020-06-13 12:49:45.999723','created with asset number =  ',NULL),(101,'2020-06-13 12:49:46.003666','created with barcode =  ',NULL),(102,'2020-06-13 12:49:46.019322','created with home =  None',NULL),(103,'2020-06-13 12:49:46.024046','created with current location =  None',NULL),(104,'2020-06-13 12:49:46.035160','created with condition =  None',NULL),(105,'2020-06-13 12:49:46.039783','created with inventory status =  None',NULL),(106,'2020-06-13 12:49:46.044020','created with keeper =  None',NULL),(107,'2020-06-13 12:49:46.049879','created with borrower =  None',NULL),(108,'2020-06-13 12:49:46.055038','created with lessor =  None',NULL),(109,'2020-06-13 12:49:46.059313','created with notes =  ',NULL),(110,'2020-06-13 12:49:46.065876','Created: ',NULL),(111,'2020-06-13 13:11:14.822607','created with familiar name =  test 0910',NULL),(112,'2020-06-13 13:11:14.827305','created with model =  Microsoft Surface Pro 4',NULL),(113,'2020-06-13 13:11:14.834392','created with host name =  ',NULL),(114,'2020-06-13 13:11:14.845638','created with serial number =  ',NULL),(115,'2020-06-13 13:11:14.850139','created with asset number =  ',NULL),(116,'2020-06-13 13:11:14.857093','created with barcode =  ',NULL),(117,'2020-06-13 13:11:14.865757','created with home =  None',NULL),(118,'2020-06-13 13:11:14.870030','created with current location =  None',NULL),(119,'2020-06-13 13:11:14.874188','created with condition =  None',NULL),(120,'2020-06-13 13:11:14.878299','created with inventory status =  None',NULL),(121,'2020-06-13 13:11:14.882949','created with keeper =  None',NULL),(122,'2020-06-13 13:11:14.887108','created with borrower =  None',NULL),(123,'2020-06-13 13:11:14.891189','created with lessor =  None',NULL),(124,'2020-06-13 13:11:14.895933','created with notes =  ',NULL),(125,'2020-06-13 13:11:14.902932','Created: ',NULL),(126,'2020-06-13 13:14:04.217510','created with familiar name =  test 0913',NULL),(127,'2020-06-13 13:14:04.222307','created with model =  Apple iPad A1403 - 64GB',NULL),(128,'2020-06-13 13:14:04.227024','created with host name =  ',NULL),(129,'2020-06-13 13:14:04.231222','created with serial number =  ',NULL),(130,'2020-06-13 13:14:04.233550','created with asset number =  ',NULL),(131,'2020-06-13 13:14:04.240533','created with barcode =  ',NULL),(132,'2020-06-13 13:14:04.255943','created with home =  None',NULL),(133,'2020-06-13 13:14:04.260631','created with current location =  None',NULL),(134,'2020-06-13 13:14:04.265408','created with condition =  None',NULL),(135,'2020-06-13 13:14:04.269651','created with inventory status =  None',NULL),(136,'2020-06-13 13:14:04.273875','created with keeper =  None',NULL),(137,'2020-06-13 13:14:04.277993','created with borrower =  None',NULL),(138,'2020-06-13 13:14:04.282217','created with lessor =  None',NULL),(139,'2020-06-13 13:14:04.292137','created with notes =  ',NULL),(140,'2020-06-13 13:14:04.298213','Created: ',NULL),(141,'2020-06-13 14:30:02.448719','created with familiar name =  test 1029',NULL),(142,'2020-06-13 14:30:02.457666','created with model =  Apple iPad A1403 - 64GB',NULL),(143,'2020-06-13 14:30:02.472098','created with host name =  ',NULL),(144,'2020-06-13 14:30:02.476766','created with serial number =  ',NULL),(145,'2020-06-13 14:30:02.481281','created with asset number =  ',NULL),(146,'2020-06-13 14:30:02.488597','created with barcode =  ',NULL),(147,'2020-06-13 14:30:02.494189','created with home =  None',NULL),(148,'2020-06-13 14:30:02.515763','created with current location =  None',NULL),(149,'2020-06-13 14:30:02.536615','created with condition =  None',NULL),(150,'2020-06-13 14:30:02.543434','created with inventory status =  None',NULL),(151,'2020-06-13 14:30:02.548990','created with keeper =  None',NULL),(152,'2020-06-13 14:30:02.556490','created with borrower =  None',NULL),(153,'2020-06-13 14:30:02.564255','created with lessor =  None',NULL),(154,'2020-06-13 14:30:02.570232','created with notes =  ',NULL),(155,'2020-06-13 14:30:02.582761','Created: ',NULL),(156,'2020-06-13 14:49:59.124762','created with familiar name =  test 1049',NULL),(157,'2020-06-13 14:49:59.130453','created with model =  Apple iPad A1403 - 64GB',NULL),(158,'2020-06-13 14:49:59.134552','created with host name =  ',NULL),(159,'2020-06-13 14:49:59.138616','created with serial number =  ',NULL),(160,'2020-06-13 14:49:59.142702','created with asset number =  ',NULL),(161,'2020-06-13 14:49:59.148906','created with barcode =  ',NULL),(162,'2020-06-13 14:49:59.155950','created with home =  None',NULL),(163,'2020-06-13 14:49:59.159984','created with current location =  None',NULL),(164,'2020-06-13 14:49:59.164144','created with condition =  None',NULL),(165,'2020-06-13 14:49:59.168201','created with inventory status =  None',NULL),(166,'2020-06-13 14:49:59.179666','created with keeper =  None',NULL),(167,'2020-06-13 14:49:59.183864','created with borrower =  None',NULL),(168,'2020-06-13 14:49:59.188937','created with lessor =  None',NULL),(169,'2020-06-13 14:49:59.193066','created with notes =  ',NULL),(170,'2020-06-13 14:49:59.199438','Created: ',NULL),(171,'2020-06-19 10:34:08.219077','created with familiar name =  MML Public PC #1',98),(172,'2020-06-19 10:34:08.223436','created with model =  Dell Optiplex 390',98),(173,'2020-06-19 10:34:08.227915','created with host name =  LIBW7DT-FBFBLS1',98),(174,'2020-06-19 10:34:08.234698','created with serial number =  FBFBLS1',98),(175,'2020-06-19 10:34:08.238749','created with asset number =  1819',98),(176,'2020-06-19 10:34:08.245106','created with barcode =  ',98),(177,'2020-06-19 10:34:08.257563','created with home =  Morgan Memorial Library',98),(178,'2020-06-19 10:34:08.261626','created with current location =  Morgan Memorial Library',98),(179,'2020-06-19 10:34:08.265731','created with condition =  3',98),(180,'2020-06-19 10:34:08.269797','created with inventory status =  3',98),(181,'2020-06-19 10:34:08.274034','created with keeper =  Suffolk Public Library',98),(182,'2020-06-19 10:34:08.278368','created with borrower =  None',98),(183,'2020-06-19 10:34:08.284423','created with lessor =  None',98),(184,'2020-06-19 10:34:08.288407','created with notes =  ',98),(185,'2020-06-19 10:34:08.292565','Created: ',98),(186,'2020-06-19 10:34:55.131662','familiar name changed from [copy]MML Public PC #1 to MML Public PC #2',99),(187,'2020-06-19 10:34:55.153211','host name changed from LIBW7DT-FBFBLS1 to LIBW10D-FBG4LS1',99),(188,'2020-06-19 10:34:55.159332','serial number changed from FBFBLS1 to FBG4LS1',99),(189,'2020-06-19 10:34:55.166514','asset number changed from 1819 to 1807',99),(190,'2020-06-19 11:01:53.611866','created with familiar name =  MML Public PC #3',100),(191,'2020-06-19 11:01:53.619749','created with model =  Dell Optiplex 390',100),(192,'2020-06-19 11:01:53.626933','created with host name =  LIBW10D-FBJ8LS1',100),(193,'2020-06-19 11:01:53.631290','created with serial number =  FBJ8LS1',100),(194,'2020-06-19 11:01:53.638207','created with asset number =  1800',100),(195,'2020-06-19 11:01:53.643877','created with barcode =  ',100),(196,'2020-06-19 11:01:53.654707','created with home =  Morgan Memorial Library',100),(197,'2020-06-19 11:01:53.660741','created with current location =  Morgan Memorial Library',100),(198,'2020-06-19 11:01:53.666935','created with condition =  3',100),(199,'2020-06-19 11:01:53.673897','created with inventory status =  3',100),(200,'2020-06-19 11:01:53.680027','created with keeper =  None',100),(201,'2020-06-19 11:01:53.688018','created with borrower =  None',100),(202,'2020-06-19 11:01:53.695364','created with lessor =  None',100),(203,'2020-06-19 11:01:53.705288','created with notes =  ',100),(204,'2020-06-19 11:01:53.709887','Created: ',100),(205,'2020-06-19 11:03:27.176559','familiar name changed from [copy]MML Public PC #3 to MML Public PC #4',101),(206,'2020-06-19 11:03:27.181519','host name changed from LIBW10D-FBJ8LS1 to LIBW10D-FBFGLS1',101),(207,'2020-06-19 11:03:27.187098','asset number changed from 1800 to 1813',101),(208,'2020-06-19 11:24:52.047739','created with familiar name =  MML Public PC #5',102),(209,'2020-06-19 11:24:52.058586','created with model =  Dell Optiplex 390',102),(210,'2020-06-19 11:24:52.068888','created with host name =  LIBW10D-FBH7LS1',102),(211,'2020-06-19 11:24:52.075737','created with serial number =  FBH7LS1',102),(212,'2020-06-19 11:24:52.083148','created with asset number =  1792',102),(213,'2020-06-19 11:24:52.087711','created with barcode =  ',102),(214,'2020-06-19 11:24:52.092106','created with home =  Morgan Memorial Library',102),(215,'2020-06-19 11:24:52.096484','created with current location =  Morgan Memorial Library',102),(216,'2020-06-19 11:24:52.103380','created with condition =  3',102),(217,'2020-06-19 11:24:52.114833','created with inventory status =  3',102),(218,'2020-06-19 11:24:52.119296','created with keeper =  None',102),(219,'2020-06-19 11:24:52.126015','created with borrower =  None',102),(220,'2020-06-19 11:24:52.132304','created with lessor =  None',102),(221,'2020-06-19 11:24:52.136913','created with notes =  ',102),(222,'2020-06-19 11:24:52.141499','Created: ',102),(223,'2020-06-19 11:43:55.578818','familiar name changed from [copy]MML Public PC #5 to MML Public PC #6',103),(224,'2020-06-19 11:45:10.024625','host name changed from LIBW10D-FBH7LS1 to LIBW10D-FBK5LS1',103),(225,'2020-06-19 11:45:10.033464','serial number changed from FBH7LS1 to FBK5LS1',103),(226,'2020-06-19 11:45:10.047948','asset number changed from 1792 to 1793',103),(227,'2020-06-19 14:46:55.108097','familiar name changed from [copy]MML Public PC #6 to MML Public PC #7',104),(228,'2020-06-19 14:46:55.114704','host name changed from LIBW10D-FBK5LS1 to LIBW10D-FBD7LS1',104),(229,'2020-06-19 14:46:55.120354','serial number changed from FBK5LS1 to FBD7LS1',104),(230,'2020-06-19 14:46:55.127350','asset number changed from 1793 to 1788',104),(231,'2020-06-19 14:50:34.224857','familiar name changed from [copy]MML Public PC #7 to MML Public PC #8',NULL),(232,'2020-06-19 14:50:34.234175','asset number changed from 1788 to 1772',NULL),(233,'2020-06-19 14:52:21.563622','familiar name changed from [copy]MML Public PC #8 to MML Public PC #9',106),(234,'2020-06-19 14:52:21.572372','model changed from 1 to Dell Optiplex 3020',106),(235,'2020-06-19 14:52:21.576559','host name changed from LIBW10D-FBD7LS1 to LIBW10D-7FYWL02',106),(236,'2020-06-19 14:52:21.580694','serial number changed from FBD7LS1 to 7FYWL02',106),(237,'2020-06-19 14:52:21.585218','asset number changed from 1772 to 1647',106),(238,'2020-06-19 14:53:59.295700','familiar name changed from [copy]MML Public PC #9 to MML Public PC #10',107),(239,'2020-06-19 14:53:59.303991','host name changed from LIBW10D-7FYWL02 to LIBW10D-7FYZL02',107),(240,'2020-06-19 14:53:59.308836','serial number changed from 7FYWL02 to 7FYZL02',107),(241,'2020-06-19 14:53:59.313753','asset number changed from 1647 to 1657',107),(242,'2020-06-19 14:54:42.569030','familiar name changed from [copy]MML Public PC #10 to MML Public PC #11',108),(243,'2020-06-19 14:54:42.576052','host name changed from LIBW10D-7FYZL02 to LIBW10D-7FRXL02',108),(244,'2020-06-19 14:54:42.593553','serial number changed from 7FYZL02 to 7FRXL02',108),(245,'2020-06-19 14:54:42.600154','asset number changed from 1657 to 1646',108),(246,'2020-06-19 15:04:15.963548','host name changed from LIBW10D-7FRXL02 to LIBW10D-7G6WL02',109),(247,'2020-06-19 15:04:15.968839','serial number changed from 7FRXL02 to 7G6WL02',109),(248,'2020-06-19 15:04:15.973997','asset number changed from 1646 to MMPC12',109),(249,'2020-06-19 15:04:55.999071','familiar name changed from [copy][copy]MML Public PC #11 to MML Public PC #12',110),(250,'2020-06-19 15:04:56.005936','host name changed from LIBW10D-7G6WL02 to LIBW10D-7FZVL02',110),(251,'2020-06-19 15:04:56.011060','serial number changed from 7G6WL02 to 7FZVL02',110),(252,'2020-06-19 15:04:56.015651','asset number changed from MMPC12 to 1649',110),(253,'2020-06-19 15:06:21.685345','familiar name changed from [copy]MML Public PC #11 to MML Public PC #12',109),(254,'2020-06-19 15:06:55.505224','asset number changed from MMPC12 to 1655',109),(255,'2020-06-19 15:07:37.809154','familiar name changed from MML Public PC #12 to MML Public PC #13',110),(256,'2020-06-20 01:18:36.494823','created with familiar name =  Public Kindle #1',112),(257,'2020-06-20 01:18:36.502151','created with model =  Amazon Kindle Fire HD 8',112),(258,'2020-06-20 01:18:36.509382','created with host name =  ',112),(259,'2020-06-20 01:18:36.514815','created with serial number =  GOWO T905 9483 FA1R',112),(260,'2020-06-20 01:18:36.522368','created with asset number =  ',112),(261,'2020-06-20 01:18:36.530037','created with barcode =  ',112),(262,'2020-06-20 01:18:36.540449','created with home =  Morgan Memorial Library',112),(263,'2020-06-20 01:18:36.547413','created with current location =  Morgan Memorial Library',112),(264,'2020-06-20 01:18:36.552802','created with condition =  None',112),(265,'2020-06-20 01:18:36.557456','created with inventory status =  None',112),(266,'2020-06-20 01:18:36.563332','created with keeper =  None',112),(267,'2020-06-20 01:18:36.567749','created with borrower =  None',112),(268,'2020-06-20 01:18:36.572855','created with lessor =  None',112),(269,'2020-06-20 01:18:36.577444','created with notes =  ',112),(270,'2020-06-20 01:18:36.584060','Created: ',112),(271,'2020-06-20 01:25:40.262543','familiar name changed from [copy]Public Kindle #1 to Public Kindle #2',113),(272,'2020-06-20 01:25:40.267118','serial number changed from GOWO T905 9483 FA1R to GOWO T905 9483 F9Q3',113),(273,'2020-06-20 16:48:08.931492','familiar name changed from [copy]Public Kindle #2 to Public Kindle #3',114),(274,'2020-06-20 16:48:08.943034','serial number changed from GOWO T905 9483 F9Q3 to GOWO T905 9483 F2RU',114),(275,'2020-06-20 16:48:30.586156','familiar name changed from [copy]Public Kindle #3 to Public Kindle #4',115),(276,'2020-06-20 16:48:30.591555','serial number changed from GOWO T905 9483 F2RU to GOWO T905 9483 FA59',115),(277,'2020-06-20 16:48:54.963671','familiar name changed from [copy]Public Kindle #4 to Public Kindle #5',116),(278,'2020-06-20 16:48:54.969682','serial number changed from GOWO T905 9483 FA59 to GOWO T905 9483 F9HT',116),(279,'2020-06-20 16:49:17.989588','familiar name changed from [copy]Public Kindle #5 to Public Kindle #6',117),(280,'2020-06-20 16:49:17.995022','serial number changed from GOWO T905 9483 F9HT to GOWO T905 9483 FA53',117),(281,'2020-06-20 16:49:49.207364','familiar name changed from [copy]Public Kindle #6 to Public Kindle #7',118),(282,'2020-06-20 16:49:49.213267','serial number changed from GOWO T905 9483 FA53 to GOWO T905 9483 FOAM',118),(283,'2020-06-20 16:50:17.891654','familiar name changed from [copy]Public Kindle #7 to Public Kindle #8',119),(284,'2020-06-20 16:50:17.899998','serial number changed from GOWO T905 9483 FOAM to GOWO T905 9483 F2RC',119),(285,'2020-06-20 16:50:35.771351','familiar name changed from [copy]Public Kindle #8 to Public Kindle #9',120),(286,'2020-06-20 16:50:35.777873','serial number changed from GOWO T905 9483 F2RC to GOWO T905 9483 F233',120),(287,'2020-06-20 19:07:49.315727','created with familiar name =  CHK Circulation #1',121),(288,'2020-06-20 19:07:49.320175','created with model =  Dell Optiplex 3040',121),(289,'2020-06-20 19:07:49.324618','created with host name =  LIBW7DT-5K2QQD2',121),(290,'2020-06-20 19:07:49.329127','created with serial number =  5K2QQD2',121),(291,'2020-06-20 19:07:49.334356','created with asset number =  4136',121),(292,'2020-06-20 19:07:49.338757','created with barcode =  ',121),(293,'2020-06-20 19:07:49.348281','created with home =  Chuckatuck Library',121),(294,'2020-06-20 19:07:49.359651','created with current location =  Chuckatuck Library',121),(295,'2020-06-20 19:07:49.364203','created with condition =  3',121),(296,'2020-06-20 19:07:49.368616','created with inventory status =  3',121),(297,'2020-06-20 19:07:49.375903','created with keeper =  None',121),(298,'2020-06-20 19:07:49.382985','created with borrower =  None',121),(299,'2020-06-20 19:07:49.391219','created with lessor =  None',121),(300,'2020-06-20 19:07:49.397853','created with notes =  ',121),(301,'2020-06-20 19:07:49.402078','Created: ',121),(302,'2020-06-20 21:34:43.218323','familiar name changed from [copy]CHK Circulation #1 to CHK Circulation #2',122),(303,'2020-06-20 21:34:43.223788','model changed from 17 to Dell Optiplex 3050',122),(304,'2020-06-20 21:34:43.228236','host name changed from LIBW7DT-5K2QQD2 to LIBW7DT-1B3LJH2',122),(305,'2020-06-20 21:34:43.233161','serial number changed from 5K2QQD2 to 1B3LJH2',122),(306,'2020-06-20 21:34:43.238001','asset number changed from 4136 to 4470',122),(307,'2020-06-20 22:58:20.394690','familiar name changed from [copy]CHK Circulation #2 to MML Check in Station',123),(308,'2020-06-20 22:58:20.399399','host name changed from LIBW7DT-1B3LJH2 to LIBW7DT-1B41KH2',123),(309,'2020-06-20 22:58:20.403240','serial number changed from 1B3LJH2 to 1B41KH2',123),(310,'2020-06-20 22:58:20.407252','asset number changed from 4470 to 4485',123),(311,'2020-06-20 22:58:20.411204','home changed from 3 to Morgan Memorial Library',123),(312,'2020-06-20 22:58:20.418335','current location changed from 3 to Morgan Memorial Library',123),(313,'2020-06-30 18:10:35.951081','created with familiar name =  Receipt Printer #3',124),(314,'2020-06-30 18:10:35.957080','created with model =  Star TSP700II',124),(315,'2020-06-30 18:10:35.961786','created with host name =  ',124),(316,'2020-06-30 18:10:35.966294','created with serial number =  22805124090602096',124),(317,'2020-06-30 18:10:35.982478','created with asset number =  ',124),(318,'2020-06-30 18:10:35.988109','created with barcode =  ',124),(319,'2020-06-30 18:10:35.990594','created with home =  Morgan Memorial Library',124),(320,'2020-06-30 18:10:35.994570','created with current location =  Morgan Memorial Library',124),(321,'2020-06-30 18:10:35.998684','created with condition =  3',124),(322,'2020-06-30 18:10:36.002787','created with inventory status =  None',124),(323,'2020-06-30 18:10:36.006965','created with keeper =  None',124),(324,'2020-06-30 18:10:36.009485','created with borrower =  None',124),(325,'2020-06-30 18:10:36.013900','created with lessor =  None',124),(326,'2020-06-30 18:10:36.018084','created with notes =  ',124),(327,'2020-06-30 18:10:36.027052','Created: ',124),(328,'2020-07-01 17:24:25.262267','familiar name changed from MML Public PC #12 to MML Public PC #1',109),(329,'2020-07-01 17:28:40.637577','familiar name changed from MML Public PC #10 to MML Public PC #2',107),(330,'2020-07-01 17:31:32.844185','created with familiar name =  MML Public PC #3',125),(331,'2020-07-01 17:31:32.848806','created with model =  Dell Optiplex 3020',125),(332,'2020-07-01 17:31:32.853254','created with host name =  LIBW10D-7G8XL02',125),(333,'2020-07-01 17:31:32.857141','created with serial number =  7G8XL02',125),(334,'2020-07-01 17:31:32.860993','created with asset number =  01656',125),(335,'2020-07-01 17:31:32.864837','created with barcode =  ',125),(336,'2020-07-01 17:31:32.868863','created with home =  Morgan Memorial Library',125),(337,'2020-07-01 17:31:32.872892','created with current location =  Morgan Memorial Library',125),(338,'2020-07-01 17:31:32.876873','created with condition =  3',125),(339,'2020-07-01 17:31:32.881327','created with inventory status =  3',125),(340,'2020-07-01 17:31:32.885394','created with keeper =  None',125),(341,'2020-07-01 17:31:32.892182','created with borrower =  None',125),(342,'2020-07-01 17:31:32.897986','created with lessor =  None',125),(343,'2020-07-01 17:31:32.902433','created with notes =  ',125),(344,'2020-07-01 17:31:32.905117','Created: ',125),(345,'2020-07-01 17:34:04.016303','created with familiar name =  MML Public PC #4',126),(346,'2020-07-01 17:34:04.022239','created with model =  Dell Optiplex 390',126),(347,'2020-07-01 17:34:04.027731','created with host name =  LIBW10D-FBFGLS1',126),(348,'2020-07-01 17:34:04.035535','created with serial number =  FBFGLS1',126),(349,'2020-07-01 17:34:04.042712','created with asset number =  01813',126),(350,'2020-07-01 17:34:04.048902','created with barcode =  ',126),(351,'2020-07-01 17:34:04.055892','created with home =  Morgan Memorial Library',126),(352,'2020-07-01 17:34:04.067894','created with current location =  Morgan Memorial Library',126),(353,'2020-07-01 17:34:04.089716','created with condition =  3',126),(354,'2020-07-01 17:34:04.095530','created with inventory status =  3',126),(355,'2020-07-01 17:34:04.101508','created with keeper =  None',126),(356,'2020-07-01 17:34:04.105799','created with borrower =  None',126),(357,'2020-07-01 17:34:04.111664','created with lessor =  None',126),(358,'2020-07-01 17:34:04.121534','created with notes =  ',126),(359,'2020-07-01 17:34:04.125965','Created: ',126),(360,'2020-07-01 17:35:09.850465','familiar name changed from MML Public PC #6 to MML Public PC #5',103),(361,'2020-07-01 17:35:09.855227','asset number changed from 1793 to 01793',103),(362,'2020-07-01 17:42:09.602359','created with familiar name =  MML Reservation',127),(363,'2020-07-01 17:42:09.612614','created with model =  Dell Optiplex 3050',127),(364,'2020-07-01 17:42:09.618852','created with host name =  LIBW7DT-1B4HJH2',127),(365,'2020-07-01 17:42:09.632766','created with serial number =  1B4HJH2',127),(366,'2020-07-01 17:42:09.652937','created with asset number =  04017',127),(367,'2020-07-01 17:42:09.657980','created with barcode =  ',127),(368,'2020-07-01 17:42:09.663065','created with home =  Morgan Memorial Library',127),(369,'2020-07-01 17:42:09.668086','created with current location =  Morgan Memorial Library',127),(370,'2020-07-01 17:42:09.675717','created with condition =  3',127),(371,'2020-07-01 17:42:09.681060','created with inventory status =  None',127),(372,'2020-07-01 17:42:09.685876','created with keeper =  None',127),(373,'2020-07-01 17:42:09.691484','created with borrower =  None',127),(374,'2020-07-01 17:42:09.699934','created with lessor =  None',127),(375,'2020-07-01 17:42:09.705343','created with notes =  ',127),(376,'2020-07-01 17:42:09.711556','Created: ',127),(377,'2020-07-01 17:43:47.499018','familiar name changed from MML Public PC #2 to MML Public PC #6',99),(378,'2020-07-01 17:43:47.504744','asset number changed from 1807 to 01807',99),(379,'2020-07-01 17:44:53.063722','familiar name changed from MML Public PC #9 to MML Public PC #7',106),(380,'2020-07-01 17:47:30.593322','familiar name changed from MML Public PC #13 to MML Public PC #8',110),(381,'2020-07-01 17:47:30.602096','asset number changed from 1649 to 01649',110),(382,'2020-07-01 17:48:59.546862','familiar name changed from MML Public PC #11 to MML Public PC #9',108),(383,'2020-07-01 17:48:59.552184','asset number changed from 1646 to 01646',108),(384,'2020-07-01 17:50:46.420677','created with familiar name =  MML Public PC #10',128),(385,'2020-07-01 17:50:46.428691','created with model =  Dell Optiplex 3020',128),(386,'2020-07-01 17:50:46.433951','created with host name =  LIBW10D-G6G0M02',128),(387,'2020-07-01 17:50:46.438478','created with serial number =  7G60M02',128),(388,'2020-07-01 17:50:46.442966','created with asset number =  01648',128),(389,'2020-07-01 17:50:46.450227','created with barcode =  ',128),(390,'2020-07-01 17:50:46.454661','created with home =  Morgan Memorial Library',128),(391,'2020-07-01 17:50:46.459174','created with current location =  Morgan Memorial Library',128),(392,'2020-07-01 17:50:46.463523','created with condition =  3',128),(393,'2020-07-01 17:50:46.468075','created with inventory status =  3',128),(394,'2020-07-01 17:50:46.472574','created with keeper =  None',128),(395,'2020-07-01 17:50:46.477910','created with borrower =  None',128),(396,'2020-07-01 17:50:46.482644','created with lessor =  None',128),(397,'2020-07-01 17:50:46.487244','created with notes =  ',128),(398,'2020-07-01 17:50:46.492579','Created: ',128),(399,'2020-07-01 17:53:56.990274','created with familiar name =  MML Express 2',NULL),(400,'2020-07-01 17:53:57.002909','created with model =  Dell Optiplex 390',NULL),(401,'2020-07-01 17:53:57.012666','created with host name =  ',NULL),(402,'2020-07-01 17:53:57.017926','created with serial number =  FCH9LS1',NULL),(403,'2020-07-01 17:53:57.022981','created with asset number =  01810',NULL),(404,'2020-07-01 17:53:57.031955','created with barcode =  ',NULL),(405,'2020-07-01 17:53:57.037184','created with home =  Morgan Memorial Library',NULL),(406,'2020-07-01 17:53:57.045927','created with current location =  Morgan Memorial Library',NULL),(407,'2020-07-01 17:53:57.056241','created with condition =  3',NULL),(408,'2020-07-01 17:53:57.061722','created with inventory status =  3',NULL),(409,'2020-07-01 17:53:57.067003','created with keeper =  None',NULL),(410,'2020-07-01 17:53:57.072047','created with borrower =  None',NULL),(411,'2020-07-01 17:53:57.077153','created with lessor =  None',NULL),(412,'2020-07-01 17:53:57.082225','created with notes =  ',NULL),(413,'2020-07-01 17:53:57.089444','Created: ',NULL),(414,'2020-07-01 17:57:47.860068','host name changed from LIBW7DT-FBFBLS1 to LIBW10DT-FBFBLS1',98),(415,'2020-07-01 17:58:31.397710','familiar name changed from MML Public PC #1 to MML Express #2',98),(416,'2020-07-01 18:01:50.170956','familiar name changed from MML Public PC #7 to MML Express #1',104),(417,'2020-07-01 18:01:50.176092','asset number changed from 1788 to (missing)',104),(418,'2020-07-01 18:09:36.241866','created with familiar name =  MML OPAC #1',130),(419,'2020-07-01 18:09:36.248914','created with model =  Dell Optiplex 3030',130),(420,'2020-07-01 18:09:36.265100','created with host name =  LIBW10D-F05DQ22',130),(421,'2020-07-01 18:09:36.276898','created with serial number =  F05DQ22',130),(422,'2020-07-01 18:09:36.287527','created with asset number =  02838',130),(423,'2020-07-01 18:09:36.295578','created with barcode =  ',130),(424,'2020-07-01 18:09:36.300880','created with home =  Morgan Memorial Library',130),(425,'2020-07-01 18:09:36.305525','created with current location =  Morgan Memorial Library',130),(426,'2020-07-01 18:09:36.310167','created with condition =  3',130),(427,'2020-07-01 18:09:36.314552','created with inventory status =  3',130),(428,'2020-07-01 18:09:36.319124','created with keeper =  None',130),(429,'2020-07-01 18:09:36.331270','created with borrower =  None',130),(430,'2020-07-01 18:09:36.337235','created with lessor =  None',130),(431,'2020-07-01 18:09:36.345110','created with notes =  ',130),(432,'2020-07-01 18:09:36.353470','Created: ',130),(433,'2020-07-01 19:55:42.388752','asset number changed from 4521 to 04521',44),(434,'2020-07-01 20:13:38.327469','created with familiar name =  MML Receipt Printer #2',131),(435,'2020-07-01 20:13:38.331767','created with model =  Star TSP700II',131),(436,'2020-07-01 20:13:38.336850','created with host name =  ',131),(437,'2020-07-01 20:13:38.343052','created with serial number =  2280514090602085',131),(438,'2020-07-01 20:13:38.347621','created with asset number =  ',131),(439,'2020-07-01 20:13:38.352170','created with barcode =  ',131),(440,'2020-07-01 20:13:38.356752','created with home =  Morgan Memorial Library',131),(441,'2020-07-01 20:13:38.361352','created with current location =  Morgan Memorial Library',131),(442,'2020-07-01 20:13:38.365863','created with condition =  3',131),(443,'2020-07-01 20:13:38.370818','created with inventory status =  3',131),(444,'2020-07-01 20:13:38.379024','created with keeper =  None',131),(445,'2020-07-01 20:13:38.387226','created with borrower =  None',131),(446,'2020-07-01 20:13:38.393568','created with lessor =  None',131),(447,'2020-07-01 20:13:38.407808','created with notes =  ',131),(448,'2020-07-01 20:13:38.414004','created with date confirmed =  2020-07-01',131),(449,'2020-07-01 20:13:38.418779','Created: ',131),(450,'2020-07-01 20:14:42.618908','familiar name changed from [copy]MML Receipt Printer #2 to MML Receipt Printer #1',132),(451,'2020-07-01 20:14:42.624504','serial number changed from 2280514090602085 to 2280514080600229',132),(452,'2020-07-01 20:58:44.067552','created with familiar name =  MML OPAC #2',133),(453,'2020-07-01 20:58:44.073017','created with model =  Dell Optiplex 3030',133),(454,'2020-07-01 20:58:44.079010','created with host name =  LIBW10D-F05GQ22',133),(455,'2020-07-01 20:58:44.084393','created with serial number =  F05GQ22',133),(456,'2020-07-01 20:58:44.097161','created with asset number =  ',133),(457,'2020-07-01 20:58:44.104647','created with barcode =  ',133),(458,'2020-07-01 20:58:44.110179','created with home =  None',133),(459,'2020-07-01 20:58:44.115795','created with current location =  None',133),(460,'2020-07-01 20:58:44.120922','created with condition =  None',133),(461,'2020-07-01 20:58:44.125691','created with inventory status =  None',133),(462,'2020-07-01 20:58:44.130504','created with keeper =  None',133),(463,'2020-07-01 20:58:44.135772','created with borrower =  None',133),(464,'2020-07-01 20:58:44.141269','created with lessor =  None',133),(465,'2020-07-01 20:58:44.146479','created with notes =  ',133),(466,'2020-07-01 20:58:44.151261','created with date confirmed =  2020-07-01',133),(467,'2020-07-01 20:58:44.155750','Created: ',133),(468,'2020-07-02 15:53:15.042434','asset number changed from 1655 to 01655',109),(469,'2020-07-02 15:53:15.047923','date confirmed changed from 2020-07-01 to 2020-07-02',109),(470,'2020-07-02 15:53:47.400318','date confirmed changed from 2020-07-01 to 2020-07-02',107),(471,'2020-07-02 15:54:18.182994','date confirmed changed from 2020-07-01 to 2020-07-02',125),(472,'2020-07-02 15:54:45.176497','asset number changed from 1813 to 01813',101),(473,'2020-07-02 15:54:45.182199','date confirmed changed from 2020-07-01 to 2020-07-02',101),(474,'2020-07-02 15:55:12.417077','date confirmed changed from 2020-07-01 to 2020-07-02',103),(475,'2020-07-02 15:55:55.437350','date confirmed changed from 2020-07-01 to 2020-07-02',99),(476,'2020-07-02 15:56:27.613457','asset number changed from 1647 to 01647',106),(477,'2020-07-02 15:56:27.618202','date confirmed changed from 2020-07-01 to 2020-07-02',106),(478,'2020-07-02 15:57:01.073143','date confirmed changed from 2020-07-01 to 2020-07-02',110),(479,'2020-07-02 16:00:31.630388','date confirmed changed from 2020-07-01 to 2020-07-02',108),(480,'2020-07-02 16:01:00.740401','date confirmed changed from 2020-07-01 to 2020-07-02',128),(481,'2020-07-02 19:40:42.780305','date confirmed changed from 2020-07-01 to 2020-07-02',34),(482,'2020-07-10 16:16:11.016260','host name changed from LIBW7DT-F7G5DD2 to LIBW10D-F7G5DD2',36),(483,'2020-07-17 18:44:59.152168','created with familiar name =  Dell Optiplex FBDCLS1',134),(484,'2020-07-17 18:44:59.161221','created with model =  Dell Optiplex 390',134),(485,'2020-07-17 18:44:59.167135','created with host name =  FBDCLS1',134),(486,'2020-07-17 18:44:59.173190','created with serial number =  ',134),(487,'2020-07-17 18:44:59.181114','created with asset number =  01765',134),(488,'2020-07-17 18:44:59.185698','created with barcode =  ',134),(489,'2020-07-17 18:44:59.190405','created with home =  Morgan Memorial Library',134),(490,'2020-07-17 18:44:59.195731','created with current location =  Morgan Memorial Library',134),(491,'2020-07-17 18:44:59.200584','created with condition =  None',134),(492,'2020-07-17 18:44:59.205636','created with inventory status =  9',134),(493,'2020-07-17 18:44:59.211737','created with keeper =  None',134),(494,'2020-07-17 18:44:59.217530','created with borrower =  None',134),(495,'2020-07-17 18:44:59.225976','created with lessor =  None',134),(496,'2020-07-17 18:44:59.231607','created with notes =  Bad power supply',134),(497,'2020-07-17 18:44:59.236828','created with date confirmed =  2020-07-17',134),(498,'2020-07-17 18:44:59.242325','Created: ',134),(499,'2020-07-17 18:46:57.391665','host name changed from FBDCLS1 to ',134),(500,'2020-07-17 18:46:57.399021','serial number changed from  to FBDCLS1',134),(501,'2020-07-17 18:47:44.736595','serial number changed from FBDCLS1 to FBGBLS1',135),(502,'2020-07-17 18:47:44.746016','asset number changed from 01765 to 01774',135),(503,'2020-07-17 18:50:22.764452','asset number changed from 1767 to 01767',45),(504,'2020-07-17 18:50:22.769945','home changed from 2 to Morgan Memorial Library',45),(505,'2020-07-17 18:50:22.777392','current location changed from None to Morgan Memorial Library',45),(506,'2020-07-17 18:50:22.783639','condition changed from None to 3',45),(507,'2020-07-17 18:50:22.789099','inventory status changed from None to 6',45),(508,'2020-07-17 19:55:39.293253','familiar name changed from TCS Office to Workroom computer (right)',45),(509,'2020-07-17 19:55:39.298402','host name changed from LIBW7DT-FBH8LS1 to LIBW10D-FBH8LS1',45),(510,'2020-07-29 16:56:49.545189','created with familiar name =  MML Self Checkout',136),(511,'2020-07-29 16:56:49.552930','created with model =  Dell Optiplex 7770 AIO',136),(512,'2020-07-29 16:56:49.559242','created with host name =  LIBW10D-68VGS13',136),(513,'2020-07-29 16:56:49.568129','created with serial number =  68VGS13',136),(514,'2020-07-29 16:56:49.584203','created with asset number =  0594',136),(515,'2020-07-29 16:56:49.591608','created with barcode =  ',136),(516,'2020-07-29 16:56:49.598654','created with home =  Morgan Memorial Library',136),(517,'2020-07-29 16:56:49.603228','created with current location =  Morgan Memorial Library',136),(518,'2020-07-29 16:56:49.611921','created with condition =  0',136),(519,'2020-07-29 16:56:49.618682','created with inventory status =  None',136),(520,'2020-07-29 16:56:49.624195','created with keeper =  None',136),(521,'2020-07-29 16:56:49.628669','created with borrower =  None',136),(522,'2020-07-29 16:56:49.633017','created with lessor =  None',136),(523,'2020-07-29 16:56:49.637681','created with notes =  ',136),(524,'2020-07-29 16:56:49.642224','created with date confirmed =  2020-07-29',136),(525,'2020-07-29 16:56:49.661882','Created: ',136);
/*!40000 ALTER TABLE `inventory_itemhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_itemquery`
--

DROP TABLE IF EXISTS `inventory_itemquery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_itemquery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `query_name` varchar(50) NOT NULL,
  `latest_use` datetime(6) NOT NULL,
  `familiar_name_value` varchar(30) NOT NULL,
  `familiar_name_use` tinyint(1) NOT NULL,
  `familiar_name_operator` varchar(100) NOT NULL,
  `serial_number_value` varchar(30) NOT NULL,
  `serial_number_use` tinyint(1) NOT NULL,
  `serial_number_operator` varchar(100) NOT NULL,
  `asset_number_value` varchar(30) NOT NULL,
  `asset_number_use` tinyint(1) NOT NULL,
  `asset_number_operator` varchar(100) NOT NULL,
  `barcode_value` varchar(50) NOT NULL,
  `barcode_use` tinyint(1) NOT NULL,
  `barcode_operator` varchar(100) NOT NULL,
  `hostname_value` varchar(50) NOT NULL,
  `hostname_use` tinyint(1) NOT NULL,
  `hostname_operator` varchar(100) NOT NULL,
  `home_use` tinyint(1) NOT NULL,
  `home_operator` varchar(100) NOT NULL,
  `location_use` tinyint(1) NOT NULL,
  `location_operator` varchar(100) NOT NULL,
  `condition_value` int(11) DEFAULT NULL,
  `condition_use` tinyint(1) NOT NULL,
  `condition_operator` varchar(100) NOT NULL,
  `inventory_value` int(11) DEFAULT NULL,
  `inventory_use` tinyint(1) NOT NULL,
  `inventory_operator` varchar(100) NOT NULL,
  `keeper_use` tinyint(1) NOT NULL,
  `keeper_operator` varchar(100) NOT NULL,
  `borrower_use` tinyint(1) NOT NULL,
  `borrower_operator` varchar(100) NOT NULL,
  `lessor_use` tinyint(1) NOT NULL,
  `lessor_operator` varchar(100) NOT NULL,
  `notes_value` varchar(100) NOT NULL,
  `notes_use` tinyint(1) NOT NULL,
  `notes_operator` varchar(100) NOT NULL,
  `orderby1` varchar(20) NOT NULL,
  `orderby2` varchar(20) NOT NULL,
  `orderby3` varchar(20) NOT NULL,
  `borrower_value_id` int(11) DEFAULT NULL,
  `home_value_id` int(11) DEFAULT NULL,
  `keeper_value_id` int(11) DEFAULT NULL,
  `lessor_value_id` int(11) DEFAULT NULL,
  `location_value_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `paginate_by` int(11) NOT NULL,
  `roles_operator` varchar(100) NOT NULL,
  `roles_use` tinyint(1) NOT NULL,
  `inventoried_1_operator` varchar(100) NOT NULL,
  `inventoried_1_use` tinyint(1) NOT NULL,
  `inventoried_1_value` date DEFAULT NULL,
  `inventoried_2_operator` varchar(100) NOT NULL,
  `inventoried_2_use` tinyint(1) NOT NULL,
  `inventoried_2_value` date DEFAULT NULL,
  `makemodel_brand_operator` varchar(100) NOT NULL,
  `makemodel_brand_use` tinyint(1) NOT NULL,
  `makemodel_brand_value` varchar(50) DEFAULT NULL,
  `makemodel_category_operator` varchar(100) NOT NULL,
  `makemodel_category_use` tinyint(1) NOT NULL,
  `makemodel_operator` varchar(100) NOT NULL,
  `makemodel_use` tinyint(1) NOT NULL,
  `makemodel_value_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inventory_itemquery_query_name_user_id_3c478912_uniq` (`query_name`,`user_id`),
  KEY `inventory_itemquery_borrower_value_id_a732db0f_fk_entities_` (`borrower_value_id`),
  KEY `inventory_itemquery_home_value_id_e6eecc59_fk_inventory` (`home_value_id`),
  KEY `inventory_itemquery_keeper_value_id_4f8ec8b6_fk_entities_` (`keeper_value_id`),
  KEY `inventory_itemquery_lessor_value_id_67fd44a6_fk_entities_` (`lessor_value_id`),
  KEY `inventory_itemquery_location_value_id_f569a328_fk_inventory` (`location_value_id`),
  KEY `inventory_itemquery_user_id_313acc06_fk_spltcs_us` (`user_id`),
  KEY `inventory_itemquery_makemodel_value_id_aef02a61_fk_inventory` (`makemodel_value_id`),
  CONSTRAINT `inventory_itemquery_borrower_value_id_a732db0f_fk_entities_` FOREIGN KEY (`borrower_value_id`) REFERENCES `entities_entity` (`id`),
  CONSTRAINT `inventory_itemquery_home_value_id_e6eecc59_fk_inventory` FOREIGN KEY (`home_value_id`) REFERENCES `inventory_location` (`id`),
  CONSTRAINT `inventory_itemquery_keeper_value_id_4f8ec8b6_fk_entities_` FOREIGN KEY (`keeper_value_id`) REFERENCES `entities_entity` (`id`),
  CONSTRAINT `inventory_itemquery_lessor_value_id_67fd44a6_fk_entities_` FOREIGN KEY (`lessor_value_id`) REFERENCES `entities_entity` (`id`),
  CONSTRAINT `inventory_itemquery_location_value_id_f569a328_fk_inventory` FOREIGN KEY (`location_value_id`) REFERENCES `inventory_location` (`id`),
  CONSTRAINT `inventory_itemquery_makemodel_value_id_aef02a61_fk_inventory` FOREIGN KEY (`makemodel_value_id`) REFERENCES `inventory_makemodel` (`id`),
  CONSTRAINT `inventory_itemquery_user_id_313acc06_fk_spltcs_us` FOREIGN KEY (`user_id`) REFERENCES `spltcs_users_spltcsuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_itemquery`
--

LOCK TABLES `inventory_itemquery` WRITE;
/*!40000 ALTER TABLE `inventory_itemquery` DISABLE KEYS */;
INSERT INTO `inventory_itemquery` VALUES (1,'','2020-07-31 19:56:40.858185','bill',1,'familiar_name__icontains','dy8b682',0,'serial_number__icontains','1765',0,'asset_number__iexact','',0,'barcode__iexact','',0,'hostname__iexact',0,'home__exact',0,'location__iexact',NULL,0,'condition__iexact',9,0,'inventory__iexact',0,'keeper__iexact',0,'borrower__iexact',0,'lessor__iexact','',0,'notes__iexact','makemodel','makemodel','inventory',NULL,NULL,NULL,NULL,NULL,1,100,'itemxrole__role__in',0,'inventoried__gte',0,NULL,'inventoried__lte',0,'2020-07-01','makemodel__brand__iexact',0,'Dell','exclude__makemodel__makemodelxcategory__category__in',0,'makemodel__exact',0,1),(3,'Staff','2020-06-20 16:40:33.860678','Ben',0,'familiar_name__icontains','',0,'serial_number__icontains','',0,'asset_number__icontains','',0,'barcode__icontains','',0,'hostname__icontains',0,'home__exact',0,'location__iexact',NULL,0,'condition__iexact',NULL,0,'inventory__iexact',0,'keeper__iexact',0,'borrower__iexact',0,'lessor__iexact','',0,'notes__iexact','makemodel','makemodel','inventory',NULL,NULL,NULL,NULL,NULL,1,100,'itemxrole__role__in',1,'inventoried__gte',0,NULL,'inventoried__lte',0,NULL,'makemodel__brand__icontains',0,NULL,'makemodel__category__in',0,'makemodel__iexact',0,NULL),(4,'','2020-07-13 19:41:17.378497','clint',0,'familiar_name__icontains','FCH6LS1',0,'serial_number__icontains','2838',0,'asset_number__iexact','',0,'barcode__iexact','',0,'hostname__iexact',0,'home__exact',0,'location__iexact',NULL,0,'condition__iexact',NULL,0,'inventory__iexact',0,'keeper__iexact',0,'borrower__iexact',0,'lessor__iexact','',0,'notes__iexact','makemodel','makemodel','inventory',NULL,NULL,NULL,NULL,NULL,3,100,'itemxrole__role__in',0,'inventoried__gte',0,NULL,'inventoried__lte',0,'2020-07-01','makemodel__brand__iexact',0,'Dell','makemodel__makemodelxcategory__category__exact',1,'makemodel__exact',0,19);
/*!40000 ALTER TABLE `inventory_itemquery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_itemquery_makemodel_category_value`
--

DROP TABLE IF EXISTS `inventory_itemquery_makemodel_category_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_itemquery_makemodel_category_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemquery_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inventory_itemquery_make_itemquery_id_category_id_2f3bfe74_uniq` (`itemquery_id`,`category_id`),
  KEY `inventory_itemquery__category_id_ea708004_fk_inventory` (`category_id`),
  CONSTRAINT `inventory_itemquery__category_id_ea708004_fk_inventory` FOREIGN KEY (`category_id`) REFERENCES `inventory_category` (`id`),
  CONSTRAINT `inventory_itemquery__itemquery_id_dd2cb270_fk_inventory` FOREIGN KEY (`itemquery_id`) REFERENCES `inventory_itemquery` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_itemquery_makemodel_category_value`
--

LOCK TABLES `inventory_itemquery_makemodel_category_value` WRITE;
/*!40000 ALTER TABLE `inventory_itemquery_makemodel_category_value` DISABLE KEYS */;
INSERT INTO `inventory_itemquery_makemodel_category_value` VALUES (2,1,5);
/*!40000 ALTER TABLE `inventory_itemquery_makemodel_category_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_itemquery_roles_value`
--

DROP TABLE IF EXISTS `inventory_itemquery_roles_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_itemquery_roles_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemquery_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inventory_itemquery_role_itemquery_id_role_id_55587b12_uniq` (`itemquery_id`,`role_id`),
  KEY `inventory_itemquery__role_id_9ee0ab01_fk_inventory` (`role_id`),
  CONSTRAINT `inventory_itemquery__itemquery_id_f8733556_fk_inventory` FOREIGN KEY (`itemquery_id`) REFERENCES `inventory_itemquery` (`id`),
  CONSTRAINT `inventory_itemquery__role_id_9ee0ab01_fk_inventory` FOREIGN KEY (`role_id`) REFERENCES `inventory_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_itemquery_roles_value`
--

LOCK TABLES `inventory_itemquery_roles_value` WRITE;
/*!40000 ALTER TABLE `inventory_itemquery_roles_value` DISABLE KEYS */;
INSERT INTO `inventory_itemquery_roles_value` VALUES (19,1,1),(20,1,3),(21,1,6),(22,1,8),(23,1,9),(24,1,10),(25,1,11),(18,1,12),(6,3,6),(17,4,1);
/*!40000 ALTER TABLE `inventory_itemquery_roles_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_itemxrole`
--

DROP TABLE IF EXISTS `inventory_itemxrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_itemxrole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `inventory_itemxrole_item_id_732cc981_fk_inventory_item_id` (`item_id`),
  KEY `inventory_itemxrole_role_id_a53859a5_fk_inventory_role_id` (`role_id`),
  CONSTRAINT `inventory_itemxrole_item_id_732cc981_fk_inventory_item_id` FOREIGN KEY (`item_id`) REFERENCES `inventory_item` (`id`),
  CONSTRAINT `inventory_itemxrole_role_id_a53859a5_fk_inventory_role_id` FOREIGN KEY (`role_id`) REFERENCES `inventory_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_itemxrole`
--

LOCK TABLES `inventory_itemxrole` WRITE;
/*!40000 ALTER TABLE `inventory_itemxrole` DISABLE KEYS */;
INSERT INTO `inventory_itemxrole` VALUES (1,21,6),(2,35,6),(3,41,6),(4,42,6),(5,43,6),(7,62,6),(8,63,6),(9,64,6),(10,65,6),(11,66,6),(12,67,6),(13,68,6),(14,69,6),(15,49,6),(16,50,6),(17,51,6),(18,61,6),(19,70,6),(20,72,6),(21,79,6),(22,39,6),(23,6,6),(24,37,12),(25,13,6),(26,19,6),(27,9,6),(28,44,6),(29,52,6),(30,34,12),(31,73,6),(32,18,6),(33,38,6),(34,53,6),(35,38,6),(36,1,6),(37,2,6),(38,14,6),(39,12,6),(40,47,6),(41,3,6),(42,4,6),(43,5,6),(44,7,6),(45,8,6),(46,10,6),(47,11,6),(48,15,6),(49,16,6),(50,17,6),(51,20,6),(52,22,6),(53,23,6),(54,24,6),(55,25,6),(56,26,6),(57,27,6),(58,28,6),(59,31,6),(60,32,6),(61,33,6),(62,45,9),(63,46,6),(64,48,6),(65,48,6),(66,54,6),(67,55,6),(68,74,6),(69,75,6),(70,76,6),(71,77,6),(72,29,6),(73,30,6),(74,36,6),(75,56,6),(76,57,6),(77,58,6),(78,40,6),(79,59,6),(80,60,6),(81,78,6),(82,NULL,NULL),(83,99,1),(84,101,1),(85,98,1),(86,100,1),(87,103,1),(88,102,1),(89,104,1),(90,NULL,1),(91,106,1),(92,107,1),(93,108,1),(94,109,1),(95,110,1),(96,NULL,1),(97,112,8),(98,112,6),(99,113,8),(100,113,6),(101,114,8),(102,114,6),(103,115,8),(104,115,6),(105,116,8),(106,116,6),(107,117,8),(108,117,6),(109,118,8),(110,118,6),(111,119,8),(112,119,6),(113,120,8),(114,120,6),(115,121,9),(116,122,9),(117,123,9),(118,124,10),(119,125,1),(120,126,1),(121,127,11),(122,128,1),(123,NULL,1),(124,130,11),(125,131,10),(126,132,10),(127,133,11),(128,136,11);
/*!40000 ALTER TABLE `inventory_itemxrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_location`
--

DROP TABLE IF EXISTS `inventory_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `abbreviation` varchar(30) NOT NULL,
  `priority` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_location`
--

LOCK TABLES `inventory_location` WRITE;
/*!40000 ALTER TABLE `inventory_location` DISABLE KEYS */;
INSERT INTO `inventory_location` VALUES (1,'Morgan Memorial Library','MML',1),(2,'North Suffolk Library','NSL',2),(3,'Chuckatuck Library','CHK',3),(4,'Library to Go','L2G',4);
/*!40000 ALTER TABLE `inventory_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_makemodel`
--

DROP TABLE IF EXISTS `inventory_makemodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_makemodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `part_number` varchar(30) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inventory_makemodel_brand_name_addb0500_uniq` (`brand`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_makemodel`
--

LOCK TABLES `inventory_makemodel` WRITE;
/*!40000 ALTER TABLE `inventory_makemodel` DISABLE KEYS */;
INSERT INTO `inventory_makemodel` VALUES (1,'Dell','Optiplex 390','',''),(2,'Dell','Latitude E5470','',''),(3,'Dell','Latitude E6440','',''),(4,'Dell','Latitude 3340','',''),(5,'Dell','Optiplex 5040','',''),(6,'Dell','Latitude 5290','',''),(7,'Dell','Latitude E6430','',''),(8,'Dell','Latitude 5500','',''),(9,'Dell','Vostro 1710','',''),(10,'Microsoft','Surface Pro 4','',''),(12,'Apple','iPad A1458 64Gb','',''),(13,'Apple','iPad A1403 - 64GB','',''),(14,'Apple','iPad Pro Wi-Fi 32GB','',''),(15,'Dell','Optiplex 3020','',''),(16,'Amazon','Kindle Fire HD 8','',''),(17,'Dell','Optiplex 3040','',''),(18,'Dell','Optiplex 3050','',''),(19,'Star','TSP700II','TSP743IIU',''),(20,'Dell','Optiplex 3030','',''),(21,'Dell','Optiplex 7770 AIO','','');
/*!40000 ALTER TABLE `inventory_makemodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_makemodelxcategory`
--

DROP TABLE IF EXISTS `inventory_makemodelxcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_makemodelxcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `makemodel_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `inventory_makemodelx_category_id_c283cb2c_fk_inventory` (`category_id`),
  KEY `inventory_makemodelx_makemodel_id_13d8d69b_fk_inventory` (`makemodel_id`),
  CONSTRAINT `inventory_makemodelx_category_id_c283cb2c_fk_inventory` FOREIGN KEY (`category_id`) REFERENCES `inventory_category` (`id`),
  CONSTRAINT `inventory_makemodelx_makemodel_id_13d8d69b_fk_inventory` FOREIGN KEY (`makemodel_id`) REFERENCES `inventory_makemodel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_makemodelxcategory`
--

LOCK TABLES `inventory_makemodelxcategory` WRITE;
/*!40000 ALTER TABLE `inventory_makemodelxcategory` DISABLE KEYS */;
INSERT INTO `inventory_makemodelxcategory` VALUES (1,1,16),(2,1,13),(3,1,12);
/*!40000 ALTER TABLE `inventory_makemodelxcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_role`
--

DROP TABLE IF EXISTS `inventory_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_role`
--

LOCK TABLES `inventory_role` WRITE;
/*!40000 ALTER TABLE `inventory_role` DISABLE KEYS */;
INSERT INTO `inventory_role` VALUES (1,'Non-Lendable Public Device',''),(3,'Location Services Portable',''),(6,'Staff','Any equipment for staff use'),(8,'Public Lendable Device',''),(9,'Staff - Station',''),(10,'Staff Peripheral',''),(11,'Public Station',''),(12,'Programs','');
/*!40000 ALTER TABLE `inventory_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_userparameters`
--

DROP TABLE IF EXISTS `inventory_userparameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_userparameters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(130) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `inventory_userparame_user_id_153795e0_fk_spltcs_us` (`user_id`),
  CONSTRAINT `inventory_userparame_user_id_153795e0_fk_spltcs_us` FOREIGN KEY (`user_id`) REFERENCES `spltcs_users_spltcsuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_userparameters`
--

LOCK TABLES `inventory_userparameters` WRITE;
/*!40000 ALTER TABLE `inventory_userparameters` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_userparameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance_action`
--

DROP TABLE IF EXISTS `maintenance_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenance_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `when` date NOT NULL,
  `job_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `maintenance_action_job_id_4736738a_fk_maintenance_job_id` (`job_id`),
  CONSTRAINT `maintenance_action_job_id_4736738a_fk_maintenance_job_id` FOREIGN KEY (`job_id`) REFERENCES `maintenance_job` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_action`
--

LOCK TABLES `maintenance_action` WRITE;
/*!40000 ALTER TABLE `maintenance_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenance_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance_applicabilityitem`
--

DROP TABLE IF EXISTS `maintenance_applicabilityitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenance_applicabilityitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_applicabilityitem`
--

LOCK TABLES `maintenance_applicabilityitem` WRITE;
/*!40000 ALTER TABLE `maintenance_applicabilityitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenance_applicabilityitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance_applicabilityitem_categories`
--

DROP TABLE IF EXISTS `maintenance_applicabilityitem_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenance_applicabilityitem_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicabilityitem_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `maintenance_applicabilit_applicabilityitem_id_cat_7ceb5da2_uniq` (`applicabilityitem_id`,`category_id`),
  KEY `maintenance_applicab_category_id_18602b5c_fk_inventory` (`category_id`),
  CONSTRAINT `maintenance_applicab_applicabilityitem_id_f5641332_fk_maintenan` FOREIGN KEY (`applicabilityitem_id`) REFERENCES `maintenance_applicabilityitem` (`id`),
  CONSTRAINT `maintenance_applicab_category_id_18602b5c_fk_inventory` FOREIGN KEY (`category_id`) REFERENCES `inventory_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_applicabilityitem_categories`
--

LOCK TABLES `maintenance_applicabilityitem_categories` WRITE;
/*!40000 ALTER TABLE `maintenance_applicabilityitem_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenance_applicabilityitem_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance_applicabilityitem_roles`
--

DROP TABLE IF EXISTS `maintenance_applicabilityitem_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenance_applicabilityitem_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicabilityitem_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `maintenance_applicabilit_applicabilityitem_id_rol_89ddc628_uniq` (`applicabilityitem_id`,`role_id`),
  KEY `maintenance_applicab_role_id_09da5ae5_fk_inventory` (`role_id`),
  CONSTRAINT `maintenance_applicab_applicabilityitem_id_9457cb53_fk_maintenan` FOREIGN KEY (`applicabilityitem_id`) REFERENCES `maintenance_applicabilityitem` (`id`),
  CONSTRAINT `maintenance_applicab_role_id_09da5ae5_fk_inventory` FOREIGN KEY (`role_id`) REFERENCES `inventory_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_applicabilityitem_roles`
--

LOCK TABLES `maintenance_applicabilityitem_roles` WRITE;
/*!40000 ALTER TABLE `maintenance_applicabilityitem_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenance_applicabilityitem_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance_job`
--

DROP TABLE IF EXISTS `maintenance_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenance_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(80) NOT NULL,
  `description` longtext NOT NULL,
  `repeat_qty` int(11) NOT NULL,
  `repeat_unit` varchar(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_job`
--

LOCK TABLES `maintenance_job` WRITE;
/*!40000 ALTER TABLE `maintenance_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenance_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance_job_applicability_items`
--

DROP TABLE IF EXISTS `maintenance_job_applicability_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenance_job_applicability_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `applicabilityitem_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `maintenance_job_applicab_job_id_applicabilityitem_ee6a1330_uniq` (`job_id`,`applicabilityitem_id`),
  KEY `maintenance_job_appl_applicabilityitem_id_71fd3a69_fk_maintenan` (`applicabilityitem_id`),
  CONSTRAINT `maintenance_job_appl_applicabilityitem_id_71fd3a69_fk_maintenan` FOREIGN KEY (`applicabilityitem_id`) REFERENCES `maintenance_applicabilityitem` (`id`),
  CONSTRAINT `maintenance_job_appl_job_id_d0b34e7c_fk_maintenan` FOREIGN KEY (`job_id`) REFERENCES `maintenance_job` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_job_applicability_items`
--

LOCK TABLES `maintenance_job_applicability_items` WRITE;
/*!40000 ALTER TABLE `maintenance_job_applicability_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenance_job_applicability_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spltcs_users_spltcsgroup`
--

DROP TABLE IF EXISTS `spltcs_users_spltcsgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spltcs_users_spltcsgroup` (
  `group_ptr_id` int(11) NOT NULL,
  `grp_order` int(11) NOT NULL,
  PRIMARY KEY (`group_ptr_id`),
  CONSTRAINT `spltcs_users_spltcsgroup_group_ptr_id_e66a094a_fk_auth_group_id` FOREIGN KEY (`group_ptr_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spltcs_users_spltcsgroup`
--

LOCK TABLES `spltcs_users_spltcsgroup` WRITE;
/*!40000 ALTER TABLE `spltcs_users_spltcsgroup` DISABLE KEYS */;
INSERT INTO `spltcs_users_spltcsgroup` VALUES (1,1),(2,1);
/*!40000 ALTER TABLE `spltcs_users_spltcsgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spltcs_users_spltcsuser`
--

DROP TABLE IF EXISTS `spltcs_users_spltcsuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spltcs_users_spltcsuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spltcs_users_spltcsuser`
--

LOCK TABLES `spltcs_users_spltcsuser` WRITE;
/*!40000 ALTER TABLE `spltcs_users_spltcsuser` DISABLE KEYS */;
INSERT INTO `spltcs_users_spltcsuser` VALUES (1,'pbkdf2_sha256$180000$YHv1eFmTIlAN$vsj11p3vR+VjjxscakoifhlxUSVim/r9+zo49RybgDw=','2020-07-29 16:47:29.460103',1,'bnmng-admin','','','benjamin@bnmng.com',1,1,'2020-05-08 19:47:28.525414'),(3,'pbkdf2_sha256$180000$iUpVbd2cHstH$z5My2ml4LNEfv8nsuoO7hJALejunzMi/Aa2LkEGrxUo=','2020-06-30 11:08:26.444504',1,'Ted','Ted','Chaney','tchaney@suffolkva.us',1,1,'2020-06-22 18:11:25.000000');
/*!40000 ALTER TABLE `spltcs_users_spltcsuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spltcs_users_spltcsuser_groups`
--

DROP TABLE IF EXISTS `spltcs_users_spltcsuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spltcs_users_spltcsuser_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spltcsuser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `spltcs_users_spltcsuser__spltcsuser_id_group_id_bd51fba1_uniq` (`spltcsuser_id`,`group_id`),
  KEY `spltcs_users_spltcsu_group_id_8b68c7d2_fk_auth_grou` (`group_id`),
  CONSTRAINT `spltcs_users_spltcsu_group_id_8b68c7d2_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `spltcs_users_spltcsu_spltcsuser_id_4be18c2e_fk_spltcs_us` FOREIGN KEY (`spltcsuser_id`) REFERENCES `spltcs_users_spltcsuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spltcs_users_spltcsuser_groups`
--

LOCK TABLES `spltcs_users_spltcsuser_groups` WRITE;
/*!40000 ALTER TABLE `spltcs_users_spltcsuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `spltcs_users_spltcsuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spltcs_users_spltcsuser_user_permissions`
--

DROP TABLE IF EXISTS `spltcs_users_spltcsuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spltcs_users_spltcsuser_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spltcsuser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `spltcs_users_spltcsuser__spltcsuser_id_permission_e9888637_uniq` (`spltcsuser_id`,`permission_id`),
  KEY `spltcs_users_spltcsu_permission_id_6fa00a89_fk_auth_perm` (`permission_id`),
  CONSTRAINT `spltcs_users_spltcsu_permission_id_6fa00a89_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `spltcs_users_spltcsu_spltcsuser_id_d9ab2245_fk_spltcs_us` FOREIGN KEY (`spltcsuser_id`) REFERENCES `spltcs_users_spltcsuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spltcs_users_spltcsuser_user_permissions`
--

LOCK TABLES `spltcs_users_spltcsuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `spltcs_users_spltcsuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `spltcs_users_spltcsuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trouble_ticket`
--

DROP TABLE IF EXISTS `trouble_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trouble_ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext NOT NULL,
  `impact` int(11) NOT NULL,
  `date_reported` date NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `submitter_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trouble_ticket_item_id_02ec2dba_fk_inventory_item_id` (`item_id`),
  KEY `trouble_ticket_submitter_id_5a329eea_fk_spltcs_us` (`submitter_id`),
  CONSTRAINT `trouble_ticket_item_id_02ec2dba_fk_inventory_item_id` FOREIGN KEY (`item_id`) REFERENCES `inventory_item` (`id`),
  CONSTRAINT `trouble_ticket_submitter_id_5a329eea_fk_spltcs_us` FOREIGN KEY (`submitter_id`) REFERENCES `spltcs_users_spltcsuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trouble_ticket`
--

LOCK TABLES `trouble_ticket` WRITE;
/*!40000 ALTER TABLE `trouble_ticket` DISABLE KEYS */;
INSERT INTO `trouble_ticket` VALUES (1,'It broke',1,'2020-07-13',14,NULL),(2,'It broke',1,'2020-07-14',14,NULL),(3,'It broke',1,'2020-07-14',14,NULL),(4,'It broke',1,'2020-07-14',14,NULL);
/*!40000 ALTER TABLE `trouble_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trouble_ticketquery`
--

DROP TABLE IF EXISTS `trouble_ticketquery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trouble_ticketquery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `query_name` varchar(50) NOT NULL,
  `latest_use` datetime(6) NOT NULL,
  `item_use` tinyint(1) NOT NULL,
  `item_operator` varchar(50) NOT NULL,
  `submitter_use` tinyint(1) NOT NULL,
  `submitter_operator` varchar(50) NOT NULL,
  `description_value` varchar(30) NOT NULL,
  `description_use` tinyint(1) NOT NULL,
  `description_operator` varchar(50) NOT NULL,
  `impact_value` varchar(30) NOT NULL,
  `impact_use` tinyint(1) NOT NULL,
  `impact_operator` varchar(50) NOT NULL,
  `orderby1` varchar(20) NOT NULL,
  `orderby2` varchar(20) NOT NULL,
  `orderby3` varchar(20) NOT NULL,
  `paginate_by` int(11) NOT NULL,
  `item_value_id` int(11) DEFAULT NULL,
  `submitter_value_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trouble_ticketquery_query_name_user_id_3ccc3b99_uniq` (`query_name`,`user_id`),
  KEY `trouble_ticketquery_item_value_id_6bdd98ac_fk_inventory_item_id` (`item_value_id`),
  KEY `trouble_ticketquery_submitter_value_id_1838caf1_fk_spltcs_us` (`submitter_value_id`),
  KEY `trouble_ticketquery_user_id_4a076cf0_fk_spltcs_us` (`user_id`),
  CONSTRAINT `trouble_ticketquery_item_value_id_6bdd98ac_fk_inventory_item_id` FOREIGN KEY (`item_value_id`) REFERENCES `inventory_item` (`id`),
  CONSTRAINT `trouble_ticketquery_submitter_value_id_1838caf1_fk_spltcs_us` FOREIGN KEY (`submitter_value_id`) REFERENCES `spltcs_users_spltcsuser` (`id`),
  CONSTRAINT `trouble_ticketquery_user_id_4a076cf0_fk_spltcs_us` FOREIGN KEY (`user_id`) REFERENCES `spltcs_users_spltcsuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trouble_ticketquery`
--

LOCK TABLES `trouble_ticketquery` WRITE;
/*!40000 ALTER TABLE `trouble_ticketquery` DISABLE KEYS */;
INSERT INTO `trouble_ticketquery` VALUES (1,'','2020-06-30 18:24:07.967577',0,'item__icontains',0,'submitter__icontains','',0,'description__icontains','',0,'impact__iexact','-date_reported','impact','item',10,NULL,NULL,1);
/*!40000 ALTER TABLE `trouble_ticketquery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trouble_ticketresponse`
--

DROP TABLE IF EXISTS `trouble_ticketresponse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trouble_ticketresponse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL,
  `notes` longtext NOT NULL,
  `date_updated` date NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `updater_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trouble_ticketresponse_ticket_id_9d2848ba_fk_trouble_ticket_id` (`ticket_id`),
  KEY `trouble_ticketrespon_updater_id_281880fd_fk_spltcs_us` (`updater_id`),
  CONSTRAINT `trouble_ticketrespon_updater_id_281880fd_fk_spltcs_us` FOREIGN KEY (`updater_id`) REFERENCES `spltcs_users_spltcsuser` (`id`),
  CONSTRAINT `trouble_ticketresponse_ticket_id_9d2848ba_fk_trouble_ticket_id` FOREIGN KEY (`ticket_id`) REFERENCES `trouble_ticket` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trouble_ticketresponse`
--

LOCK TABLES `trouble_ticketresponse` WRITE;
/*!40000 ALTER TABLE `trouble_ticketresponse` DISABLE KEYS */;
/*!40000 ALTER TABLE `trouble_ticketresponse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trouble_userparameters`
--

DROP TABLE IF EXISTS `trouble_userparameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trouble_userparameters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(130) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trouble_userparamete_user_id_407561a6_fk_spltcs_us` (`user_id`),
  CONSTRAINT `trouble_userparamete_user_id_407561a6_fk_spltcs_us` FOREIGN KEY (`user_id`) REFERENCES `spltcs_users_spltcsuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trouble_userparameters`
--

LOCK TABLES `trouble_userparameters` WRITE;
/*!40000 ALTER TABLE `trouble_userparameters` DISABLE KEYS */;
/*!40000 ALTER TABLE `trouble_userparameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `varifields_varifieldobject`
--

DROP TABLE IF EXISTS `varifields_varifieldobject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `varifields_varifieldobject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `varifields_varifieldobject`
--

LOCK TABLES `varifields_varifieldobject` WRITE;
/*!40000 ALTER TABLE `varifields_varifieldobject` DISABLE KEYS */;
INSERT INTO `varifields_varifieldobject` VALUES (1,3);
/*!40000 ALTER TABLE `varifields_varifieldobject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `varifields_varifieldspec`
--

DROP TABLE IF EXISTS `varifields_varifieldspec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `varifields_varifieldspec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `choices` varchar(30) NOT NULL,
  `on_list` tinyint(1) NOT NULL,
  `on_filter` tinyint(1) NOT NULL,
  `spec_help_text` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `varifields_varifield_content_type_id_74934959_fk_django_co` (`content_type_id`),
  CONSTRAINT `varifields_varifield_content_type_id_74934959_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `varifields_varifieldspec`
--

LOCK TABLES `varifields_varifieldspec` WRITE;
/*!40000 ALTER TABLE `varifields_varifieldspec` DISABLE KEYS */;
INSERT INTO `varifields_varifieldspec` VALUES (2,'Polaris Login','',0,0,'Enter the Polaris Login Information',14);
/*!40000 ALTER TABLE `varifields_varifieldspec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `varifields_varifieldspec_vari_field_objects`
--

DROP TABLE IF EXISTS `varifields_varifieldspec_vari_field_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `varifields_varifieldspec_vari_field_objects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `varifieldspec_id` int(11) NOT NULL,
  `varifieldobject_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `varifields_varifieldspec_varifieldspec_id_varifie_5babec98_uniq` (`varifieldspec_id`,`varifieldobject_id`),
  KEY `varifields_varifield_varifieldobject_id_5f02ded2_fk_varifield` (`varifieldobject_id`),
  CONSTRAINT `varifields_varifield_varifieldobject_id_5f02ded2_fk_varifield` FOREIGN KEY (`varifieldobject_id`) REFERENCES `varifields_varifieldobject` (`id`),
  CONSTRAINT `varifields_varifield_varifieldspec_id_4ff209ff_fk_varifield` FOREIGN KEY (`varifieldspec_id`) REFERENCES `varifields_varifieldspec` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `varifields_varifieldspec_vari_field_objects`
--

LOCK TABLES `varifields_varifieldspec_vari_field_objects` WRITE;
/*!40000 ALTER TABLE `varifields_varifieldspec_vari_field_objects` DISABLE KEYS */;
INSERT INTO `varifields_varifieldspec_vari_field_objects` VALUES (1,2,1);
/*!40000 ALTER TABLE `varifields_varifieldspec_vari_field_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `varifields_varifieldspecchoice`
--

DROP TABLE IF EXISTS `varifields_varifieldspecchoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `varifields_varifieldspecchoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `varifields_varifield_content_type_id_1e00620e_fk_django_co` (`content_type_id`),
  CONSTRAINT `varifields_varifield_content_type_id_1e00620e_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `varifields_varifieldspecchoice`
--

LOCK TABLES `varifields_varifieldspecchoice` WRITE;
/*!40000 ALTER TABLE `varifields_varifieldspecchoice` DISABLE KEYS */;
INSERT INTO `varifields_varifieldspecchoice` VALUES (1,14);
/*!40000 ALTER TABLE `varifields_varifieldspecchoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `varifields_varifieldvalue`
--

DROP TABLE IF EXISTS `varifields_varifieldvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `varifields_varifieldvalue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(10) unsigned NOT NULL,
  `content` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `spec_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `varifields_varifield_content_type_id_a7fdc65d_fk_django_co` (`content_type_id`),
  KEY `varifields_varifield_spec_id_212f5a40_fk_varifield` (`spec_id`),
  CONSTRAINT `varifields_varifield_content_type_id_a7fdc65d_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `varifields_varifield_spec_id_212f5a40_fk_varifield` FOREIGN KEY (`spec_id`) REFERENCES `varifields_varifieldspec` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `varifields_varifieldvalue`
--

LOCK TABLES `varifields_varifieldvalue` WRITE;
/*!40000 ALTER TABLE `varifields_varifieldvalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `varifields_varifieldvalue` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-01 23:22:46
