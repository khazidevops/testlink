-- MariaDB dump 10.19-11.2.3-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: tl_testlink
-- ------------------------------------------------------
-- Server version	11.2.3-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assignment_status`
--

DROP TABLE IF EXISTS `assignment_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignment_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL DEFAULT 'unknown',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment_status`
--

LOCK TABLES `assignment_status` WRITE;
/*!40000 ALTER TABLE `assignment_status` DISABLE KEYS */;
INSERT INTO `assignment_status` VALUES
(1,'open'),
(2,'closed'),
(3,'completed'),
(4,'todo_urgent'),
(5,'todo');
/*!40000 ALTER TABLE `assignment_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignment_types`
--

DROP TABLE IF EXISTS `assignment_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignment_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_table` varchar(30) DEFAULT '',
  `description` varchar(100) NOT NULL DEFAULT 'unknown',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment_types`
--

LOCK TABLES `assignment_types` WRITE;
/*!40000 ALTER TABLE `assignment_types` DISABLE KEYS */;
INSERT INTO `assignment_types` VALUES
(1,'testplan_tcversions','testcase_execution'),
(2,'tcversions','testcase_review');
/*!40000 ALTER TABLE `assignment_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_id` int(10) unsigned NOT NULL DEFAULT 0,
  `fk_table` varchar(250) DEFAULT '',
  `title` varchar(250) DEFAULT '',
  `description` varchar(250) DEFAULT '',
  `file_name` varchar(250) NOT NULL DEFAULT '',
  `file_path` varchar(250) DEFAULT '',
  `file_size` int(11) NOT NULL DEFAULT 0,
  `file_type` varchar(250) NOT NULL DEFAULT '',
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `content` longblob DEFAULT NULL,
  `compression_type` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `attachments_idx1` (`fk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
INSERT INTO `attachments` VALUES
(6,30,'executions','','','TestReportProto1.xlsx','executions/30/a9fc2ea9d045a77bdc6e345a62430caa.xlsx',8445453,'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','2024-04-02 11:05:34',NULL,1);
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baseline_l1l2_context`
--

DROP TABLE IF EXISTS `baseline_l1l2_context`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseline_l1l2_context` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `testplan_id` int(10) unsigned NOT NULL DEFAULT 0,
  `platform_id` int(10) unsigned NOT NULL DEFAULT 0,
  `being_exec_ts` timestamp NOT NULL,
  `end_exec_ts` timestamp NOT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `udx1` (`testplan_id`,`platform_id`,`creation_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baseline_l1l2_context`
--

LOCK TABLES `baseline_l1l2_context` WRITE;
/*!40000 ALTER TABLE `baseline_l1l2_context` DISABLE KEYS */;
/*!40000 ALTER TABLE `baseline_l1l2_context` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baseline_l1l2_details`
--

DROP TABLE IF EXISTS `baseline_l1l2_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseline_l1l2_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `context_id` int(10) unsigned NOT NULL,
  `top_tsuite_id` int(10) unsigned NOT NULL DEFAULT 0,
  `child_tsuite_id` int(10) unsigned NOT NULL DEFAULT 0,
  `status` char(1) DEFAULT NULL,
  `qty` int(10) unsigned NOT NULL DEFAULT 0,
  `total_tc` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `udx1` (`context_id`,`top_tsuite_id`,`child_tsuite_id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baseline_l1l2_details`
--

LOCK TABLES `baseline_l1l2_details` WRITE;
/*!40000 ALTER TABLE `baseline_l1l2_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `baseline_l1l2_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `builds`
--

DROP TABLE IF EXISTS `builds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `builds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `testplan_id` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(100) NOT NULL DEFAULT 'undefined',
  `notes` text DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `is_open` tinyint(1) NOT NULL DEFAULT 1,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `release_date` date DEFAULT NULL,
  `closed_on_date` date DEFAULT NULL,
  `commit_id` varchar(64) DEFAULT NULL,
  `tag` varchar(64) DEFAULT NULL,
  `branch` varchar(64) DEFAULT NULL,
  `release_candidate` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`testplan_id`,`name`),
  KEY `testplan_id` (`testplan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Available builds';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `builds`
--

LOCK TABLES `builds` WRITE;
/*!40000 ALTER TABLE `builds` DISABLE KEYS */;
INSERT INTO `builds` VALUES
(2,137,'Spigen and Chinense GaN Fast Charger Testing','<p>Spigen Charger -60Watts</p>\r\n\r\n<p>Chinense GaN Fast Charger- 65Watts</p>\r\n\r\n<p>&nbsp;</p>\r\n',1,1,NULL,'2024-01-04 04:44:29','2024-01-26',NULL,'','','',''),
(3,153,'Proto 1','<p>We have recieved 1st proto of 3 differen brand of GaN charger which are 65W with 2 USB C ports.</p>\r\n\r\n<p>we received three chargers which are</p>\r\n\r\n<ol>\r\n	<li>Infineon with Hardware version :&nbsp;HW_INF_001</li>\r\n	<li>Navitas + Silanna with&nbsp;Hardware version:&nbsp;HW_NS_001</li>\r\n	<li>Silanna + silanna&nbsp;with&nbsp;Hardware version:&nbsp;HW_SS_001</li>\r\n</ol>\r\n\r\n<p>The internal BOM&nbsp;rev version is Rev 0&nbsp; for all three.</p>\r\n',1,1,NULL,'2024-04-02 05:29:41','2024-02-26',NULL,'','GaN Charger Proto 1','','Sachin');
/*!40000 ALTER TABLE `builds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfield_build_design_values`
--

DROP TABLE IF EXISTS `cfield_build_design_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfield_build_design_values` (
  `field_id` int(10) NOT NULL DEFAULT 0,
  `node_id` int(10) NOT NULL DEFAULT 0,
  `value` varchar(4000) NOT NULL DEFAULT '',
  PRIMARY KEY (`field_id`,`node_id`),
  KEY `idx_cfield_build_design_values` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfield_build_design_values`
--

LOCK TABLES `cfield_build_design_values` WRITE;
/*!40000 ALTER TABLE `cfield_build_design_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `cfield_build_design_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfield_design_values`
--

DROP TABLE IF EXISTS `cfield_design_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfield_design_values` (
  `field_id` int(10) NOT NULL DEFAULT 0,
  `node_id` int(10) NOT NULL DEFAULT 0,
  `value` varchar(4000) NOT NULL DEFAULT '',
  PRIMARY KEY (`field_id`,`node_id`),
  KEY `idx_cfield_design_values` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfield_design_values`
--

LOCK TABLES `cfield_design_values` WRITE;
/*!40000 ALTER TABLE `cfield_design_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `cfield_design_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfield_execution_values`
--

DROP TABLE IF EXISTS `cfield_execution_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfield_execution_values` (
  `field_id` int(10) NOT NULL DEFAULT 0,
  `execution_id` int(10) NOT NULL DEFAULT 0,
  `testplan_id` int(10) NOT NULL DEFAULT 0,
  `tcversion_id` int(10) NOT NULL DEFAULT 0,
  `value` varchar(4000) NOT NULL DEFAULT '',
  PRIMARY KEY (`field_id`,`execution_id`,`testplan_id`,`tcversion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfield_execution_values`
--

LOCK TABLES `cfield_execution_values` WRITE;
/*!40000 ALTER TABLE `cfield_execution_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `cfield_execution_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfield_node_types`
--

DROP TABLE IF EXISTS `cfield_node_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfield_node_types` (
  `field_id` int(10) NOT NULL DEFAULT 0,
  `node_type_id` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`field_id`,`node_type_id`),
  KEY `idx_custom_fields_assign` (`node_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfield_node_types`
--

LOCK TABLES `cfield_node_types` WRITE;
/*!40000 ALTER TABLE `cfield_node_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `cfield_node_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfield_testplan_design_values`
--

DROP TABLE IF EXISTS `cfield_testplan_design_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfield_testplan_design_values` (
  `field_id` int(10) NOT NULL DEFAULT 0,
  `link_id` int(10) NOT NULL DEFAULT 0 COMMENT 'point to testplan_tcversion id',
  `value` varchar(4000) NOT NULL DEFAULT '',
  PRIMARY KEY (`field_id`,`link_id`),
  KEY `idx_cfield_tplan_design_val` (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfield_testplan_design_values`
--

LOCK TABLES `cfield_testplan_design_values` WRITE;
/*!40000 ALTER TABLE `cfield_testplan_design_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `cfield_testplan_design_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfield_testprojects`
--

DROP TABLE IF EXISTS `cfield_testprojects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfield_testprojects` (
  `field_id` int(10) unsigned NOT NULL DEFAULT 0,
  `testproject_id` int(10) unsigned NOT NULL DEFAULT 0,
  `display_order` smallint(5) unsigned NOT NULL DEFAULT 1,
  `location` smallint(5) unsigned NOT NULL DEFAULT 1,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `required_on_design` tinyint(1) NOT NULL DEFAULT 0,
  `required_on_execution` tinyint(1) NOT NULL DEFAULT 0,
  `monitorable` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`field_id`,`testproject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfield_testprojects`
--

LOCK TABLES `cfield_testprojects` WRITE;
/*!40000 ALTER TABLE `cfield_testprojects` DISABLE KEYS */;
/*!40000 ALTER TABLE `cfield_testprojects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `codetrackers`
--

DROP TABLE IF EXISTS `codetrackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `codetrackers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` int(10) DEFAULT 0,
  `cfg` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codetrackers_uidx1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codetrackers`
--

LOCK TABLES `codetrackers` WRITE;
/*!40000 ALTER TABLE `codetrackers` DISABLE KEYS */;
/*!40000 ALTER TABLE `codetrackers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `label` varchar(64) NOT NULL DEFAULT '' COMMENT 'label to display on user interface',
  `type` smallint(6) NOT NULL DEFAULT 0,
  `possible_values` varchar(4000) NOT NULL DEFAULT '',
  `default_value` varchar(4000) NOT NULL DEFAULT '',
  `valid_regexp` varchar(255) NOT NULL DEFAULT '',
  `length_min` int(10) NOT NULL DEFAULT 0,
  `length_max` int(10) NOT NULL DEFAULT 0,
  `show_on_design` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '1=> show it during specification design',
  `enable_on_design` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '1=> user can write/manage it during specification design',
  `show_on_execution` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '1=> show it during test case execution',
  `enable_on_execution` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '1=> user can write/manage it during test case execution',
  `show_on_testplan_design` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `enable_on_testplan_design` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_custom_fields_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields`
--

LOCK TABLES `custom_fields` WRITE;
/*!40000 ALTER TABLE `custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_version`
--

DROP TABLE IF EXISTS `db_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_version` (
  `version` varchar(50) NOT NULL DEFAULT 'unknown',
  `upgrade_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_version`
--

LOCK TABLES `db_version` WRITE;
/*!40000 ALTER TABLE `db_version` DISABLE KEYS */;
INSERT INTO `db_version` VALUES
('DB 1.9.20','2023-12-20 10:54:37','TestLink 1.9.20 Raijin');
/*!40000 ALTER TABLE `db_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` int(10) unsigned NOT NULL DEFAULT 0,
  `log_level` smallint(5) unsigned NOT NULL DEFAULT 0,
  `source` varchar(45) DEFAULT NULL,
  `description` text NOT NULL,
  `fired_at` int(10) unsigned NOT NULL DEFAULT 0,
  `activity` varchar(45) DEFAULT NULL,
  `object_id` int(10) unsigned DEFAULT NULL,
  `object_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_id` (`transaction_id`),
  KEY `fired_at` (`fired_at`)
) ENGINE=InnoDB AUTO_INCREMENT=4407 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES
(3345,640,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:14:\"106.51.174.176\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1711444907,'LOGIN',1,'users'),
(3346,641,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_config\' is not localized for locale \'en_US\' ',1711444908,'LOCALIZATION',0,NULL),
(3347,641,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_left_bottom_link\' is not localized for locale \'en_US\' ',1711444908,'LOCALIZATION',0,NULL),
(3348,641,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_right_top_link\' is not localized for locale \'en_US\' ',1711444908,'LOCALIZATION',0,NULL),
(3349,641,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_right_bottom_link\' is not localized for locale \'en_US\' ',1711444908,'LOCALIZATION',0,NULL),
(3350,641,32,'GUI - Test Project ID : 134','string \'poweredBy\' is not localized for locale \'en_US\'  - using en_GB',1711444908,'LOCALIZATION',0,NULL),
(3351,641,32,'GUI - Test Project ID : 134','string \'system_descr\' is not localized for locale \'en_US\'  - using en_GB',1711444908,'LOCALIZATION',0,NULL),
(3352,641,32,'GUI - Test Project ID : 134','string \'href_codetracker_management\' is not localized for locale \'en_US\'  - using en_GB',1711444908,'LOCALIZATION',0,NULL),
(3353,642,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:14:\"106.51.174.176\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1711447628,'LOGIN',1,'users'),
(3354,643,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_config\' is not localized for locale \'en_US\' ',1711447628,'LOCALIZATION',0,NULL),
(3355,643,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_left_bottom_link\' is not localized for locale \'en_US\' ',1711447628,'LOCALIZATION',0,NULL),
(3356,643,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_right_top_link\' is not localized for locale \'en_US\' ',1711447628,'LOCALIZATION',0,NULL),
(3357,643,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_right_bottom_link\' is not localized for locale \'en_US\' ',1711447628,'LOCALIZATION',0,NULL),
(3358,643,32,'GUI - Test Project ID : 134','string \'poweredBy\' is not localized for locale \'en_US\'  - using en_GB',1711447628,'LOCALIZATION',0,NULL),
(3359,643,32,'GUI - Test Project ID : 134','string \'system_descr\' is not localized for locale \'en_US\'  - using en_GB',1711447628,'LOCALIZATION',0,NULL),
(3360,643,32,'GUI - Test Project ID : 134','string \'href_codetracker_management\' is not localized for locale \'en_US\'  - using en_GB',1711447628,'LOCALIZATION',0,NULL),
(3361,644,16,'GUI','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_login_failed\";s:6:\"params\";a:2:{i:0;s:30:\"v.bhavana@kaynestechnology.net\";i:1;s:14:\"106.51.174.176\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712033890,'LOGIN_FAILED',3,'users'),
(3362,645,16,'GUI','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_login_failed\";s:6:\"params\";a:2:{i:0;s:30:\"v.bhavana@kaynestechnology.net\";i:1;s:14:\"106.51.174.176\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712033900,'LOGIN_FAILED',3,'users'),
(3363,646,16,'GUI','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_login_failed\";s:6:\"params\";a:2:{i:0;s:30:\"v.bhavana@kaynestechnology.net\";i:1;s:14:\"106.51.174.176\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712033936,'LOGIN_FAILED',3,'users'),
(3364,647,2,'GUI','E_NOTICE\nUndefined property: stdClass::$reqURI - in /opt/bitnami/testlink/gui/templates_c/3756f4388a709046c45aa5755945d29556df40da_0.file.lostPassword-model-marcobiedermann.tpl.php - Line 63',1712033969,'PHP',0,NULL),
(3365,647,2,'GUI','E_NOTICE\nUndefined property: stdClass::$destination - in /opt/bitnami/testlink/gui/templates_c/3756f4388a709046c45aa5755945d29556df40da_0.file.lostPassword-model-marcobiedermann.tpl.php - Line 65',1712033969,'PHP',0,NULL),
(3366,648,2,'GUI','E_NOTICE\nUndefined property: stdClass::$reqURI - in /opt/bitnami/testlink/gui/templates_c/3756f4388a709046c45aa5755945d29556df40da_0.file.lostPassword-model-marcobiedermann.tpl.php - Line 63',1712033986,'PHP',0,NULL),
(3367,648,2,'GUI','E_NOTICE\nUndefined property: stdClass::$destination - in /opt/bitnami/testlink/gui/templates_c/3756f4388a709046c45aa5755945d29556df40da_0.file.lostPassword-model-marcobiedermann.tpl.php - Line 65',1712033986,'PHP',0,NULL),
(3368,649,2,'GUI','E_NOTICE\nUndefined property: stdClass::$reqURI - in /opt/bitnami/testlink/gui/templates_c/3756f4388a709046c45aa5755945d29556df40da_0.file.lostPassword-model-marcobiedermann.tpl.php - Line 63',1712034002,'PHP',0,NULL),
(3369,649,2,'GUI','E_NOTICE\nUndefined property: stdClass::$destination - in /opt/bitnami/testlink/gui/templates_c/3756f4388a709046c45aa5755945d29556df40da_0.file.lostPassword-model-marcobiedermann.tpl.php - Line 65',1712034002,'PHP',0,NULL),
(3370,650,16,'GUI','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_login_failed\";s:6:\"params\";a:2:{i:0;s:30:\"v.bhavana@kaynestechnology.net\";i:1;s:14:\"106.51.174.176\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712034019,'LOGIN_FAILED',3,'users'),
(3371,651,16,'GUI','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_login_failed\";s:6:\"params\";a:2:{i:0;s:30:\"v.bhavana@kaynestechnology.net\";i:1;s:14:\"106.51.174.176\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712034045,'LOGIN_FAILED',3,'users'),
(3372,652,16,'GUI','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_login_failed\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:14:\"106.51.174.176\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712034092,'LOGIN_FAILED',1,'users'),
(3373,653,16,'GUI','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_login_failed\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:14:\"106.51.174.176\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712034105,'LOGIN_FAILED',1,'users'),
(3374,654,16,'GUI','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_login_failed\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:14:\"106.51.174.176\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712034591,'LOGIN_FAILED',1,'users'),
(3375,655,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:14:\"106.51.174.176\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712034603,'LOGIN',1,'users'),
(3376,656,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_config\' is not localized for locale \'en_US\' ',1712034603,'LOCALIZATION',0,NULL),
(3377,656,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_left_bottom_link\' is not localized for locale \'en_US\' ',1712034603,'LOCALIZATION',0,NULL),
(3378,656,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_right_top_link\' is not localized for locale \'en_US\' ',1712034603,'LOCALIZATION',0,NULL),
(3379,656,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_right_bottom_link\' is not localized for locale \'en_US\' ',1712034603,'LOCALIZATION',0,NULL),
(3380,656,32,'GUI - Test Project ID : 134','string \'poweredBy\' is not localized for locale \'en_US\'  - using en_GB',1712034603,'LOCALIZATION',0,NULL),
(3381,656,32,'GUI - Test Project ID : 134','string \'system_descr\' is not localized for locale \'en_US\'  - using en_GB',1712034603,'LOCALIZATION',0,NULL),
(3382,656,32,'GUI - Test Project ID : 134','string \'href_codetracker_management\' is not localized for locale \'en_US\'  - using en_GB',1712034603,'LOCALIZATION',0,NULL),
(3383,657,32,'GUI - Test Project ID : 134','string \'expiration\' is not localized for locale \'en_US\'  - using en_GB',1712034611,'LOCALIZATION',0,NULL),
(3384,657,32,'GUI - Test Project ID : 134','string \'expiration_date\' is not localized for locale \'en_US\'  - using en_GB',1712034611,'LOCALIZATION',0,NULL),
(3385,658,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_pwd_reset_requested\";s:6:\"params\";a:1:{i:0;s:30:\"v.bhavana@Kaynestechnology.net\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712034629,'PWD_RESET',3,'users'),
(3386,659,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_user_apikey_set\";s:6:\"params\";a:1:{i:0;s:30:\"v.bhavana@Kaynestechnology.net\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712034636,'CREATE',0,'users'),
(3387,660,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_user_apikey_set\";s:6:\"params\";a:1:{i:0;s:30:\"v.bhavana@Kaynestechnology.net\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712034660,'CREATE',0,'users'),
(3388,661,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_user_apikey_set\";s:6:\"params\";a:1:{i:0;s:30:\"v.bhavana@Kaynestechnology.net\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712034664,'CREATE',0,'users'),
(3389,662,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_pwd_reset_requested\";s:6:\"params\";a:1:{i:0;s:30:\"v.bhavana@Kaynestechnology.net\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712034680,'PWD_RESET',3,'users'),
(3390,663,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:30:\"v.bhavana@kaynestechnology.net\";i:1;s:14:\"106.51.174.176\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712034720,'LOGIN',3,'users'),
(3391,664,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_config\' is not localized for locale \'en_US\' ',1712034720,'LOCALIZATION',0,NULL),
(3392,664,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_left_bottom_link\' is not localized for locale \'en_US\' ',1712034720,'LOCALIZATION',0,NULL),
(3393,664,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_right_top_link\' is not localized for locale \'en_US\' ',1712034720,'LOCALIZATION',0,NULL),
(3394,664,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_right_bottom_link\' is not localized for locale \'en_US\' ',1712034720,'LOCALIZATION',0,NULL),
(3395,664,32,'GUI - Test Project ID : 134','string \'poweredBy\' is not localized for locale \'en_US\'  - using en_GB',1712034720,'LOCALIZATION',0,NULL),
(3396,664,32,'GUI - Test Project ID : 134','string \'system_descr\' is not localized for locale \'en_US\'  - using en_GB',1712034720,'LOCALIZATION',0,NULL),
(3397,664,32,'GUI - Test Project ID : 134','string \'href_codetracker_management\' is not localized for locale \'en_US\'  - using en_GB',1712034720,'LOCALIZATION',0,NULL),
(3398,665,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: user - in /opt/bitnami/testlink/lib/functions/common.php - Line 1925',1712034739,'PHP',0,NULL),
(3399,666,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: user - in /opt/bitnami/testlink/lib/functions/common.php - Line 1925',1712034745,'PHP',0,NULL),
(3400,667,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:17:\"audit_user_logout\";s:6:\"params\";a:1:{i:0;s:30:\"v.bhavana@Kaynestechnology.net\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712034746,'LOGOUT',3,'users'),
(3401,668,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:30:\"v.bhavana@kaynestechnology.net\";i:1;s:14:\"106.51.174.176\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712034753,'LOGIN',3,'users'),
(3402,669,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_config\' is not localized for locale \'en_US\' ',1712034754,'LOCALIZATION',0,NULL),
(3403,669,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_left_bottom_link\' is not localized for locale \'en_US\' ',1712034754,'LOCALIZATION',0,NULL),
(3404,669,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_right_top_link\' is not localized for locale \'en_US\' ',1712034754,'LOCALIZATION',0,NULL),
(3405,669,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_right_bottom_link\' is not localized for locale \'en_US\' ',1712034754,'LOCALIZATION',0,NULL),
(3406,669,32,'GUI - Test Project ID : 134','string \'poweredBy\' is not localized for locale \'en_US\'  - using en_GB',1712034754,'LOCALIZATION',0,NULL),
(3407,669,32,'GUI - Test Project ID : 134','string \'system_descr\' is not localized for locale \'en_US\'  - using en_GB',1712034754,'LOCALIZATION',0,NULL),
(3408,669,32,'GUI - Test Project ID : 134','string \'href_codetracker_management\' is not localized for locale \'en_US\'  - using en_GB',1712034754,'LOCALIZATION',0,NULL),
(3409,670,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: user - in /opt/bitnami/testlink/lib/functions/common.php - Line 1925',1712034758,'PHP',0,NULL),
(3410,671,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: user - in /opt/bitnami/testlink/lib/functions/common.php - Line 1925',1712034781,'PHP',0,NULL),
(3411,672,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: user - in /opt/bitnami/testlink/lib/functions/common.php - Line 1925',1712034939,'PHP',0,NULL),
(3412,673,32,'GUI - Test Project ID : 134','string \'file_upload_ko\' is not localized for locale \'en_US\'  - using en_GB',1712035153,'LOCALIZATION',0,NULL),
(3413,673,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uploadOp - in /opt/bitnami/testlink/gui/templates_c/5760ab2fbcb6be6f977f78c58e2ad16e85ecd1e3_0.file.planEdit.tpl.php - Line 130',1712035153,'PHP',0,NULL),
(3414,673,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$itemID - in /opt/bitnami/testlink/gui/templates_c/5760ab2fbcb6be6f977f78c58e2ad16e85ecd1e3_0.file.planEdit.tpl.php - Line 152',1712035153,'PHP',0,NULL),
(3415,674,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:22:\"audit_testplan_created\";s:6:\"params\";a:2:{i:0;s:11:\"GaN Charger\";i:1;s:19:\"GaN Charger Proto 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712035300,'CREATED',153,'testplans'),
(3416,675,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uploadOp - in /opt/bitnami/testlink/gui/templates_c/5760ab2fbcb6be6f977f78c58e2ad16e85ecd1e3_0.file.planEdit.tpl.php - Line 130',1712035304,'PHP',0,NULL),
(3417,675,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$itemID - in /opt/bitnami/testlink/gui/templates_c/5760ab2fbcb6be6f977f78c58e2ad16e85ecd1e3_0.file.planEdit.tpl.php - Line 152',1712035304,'PHP',0,NULL),
(3418,675,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index:  - in /opt/bitnami/testlink/gui/templates_c/5760ab2fbcb6be6f977f78c58e2ad16e85ecd1e3_0.file.planEdit.tpl.php - Line 302',1712035304,'PHP',0,NULL),
(3419,675,32,'GUI - Test Project ID : 134','string \'allowed_files\' is not localized for locale \'en_US\'  - using en_GB',1712035304,'LOCALIZATION',0,NULL),
(3420,675,32,'GUI - Test Project ID : 134','string \'allowed_filenames_regexp\' is not localized for locale \'en_US\'  - using en_GB',1712035304,'LOCALIZATION',0,NULL),
(3421,676,32,'GUI - Test Project ID : 134','string \'commit_id\' is not localized for locale \'en_US\'  - using en_GB',1712035340,'LOCALIZATION',0,NULL),
(3422,676,32,'GUI - Test Project ID : 134','string \'branch\' is not localized for locale \'en_US\'  - using en_GB',1712035340,'LOCALIZATION',0,NULL),
(3423,676,32,'GUI - Test Project ID : 134','string \'tag\' is not localized for locale \'en_US\'  - using en_GB',1712035340,'LOCALIZATION',0,NULL),
(3424,676,32,'GUI - Test Project ID : 134','string \'release_candidate\' is not localized for locale \'en_US\'  - using en_GB',1712035340,'LOCALIZATION',0,NULL),
(3425,677,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$creation_ts - in /opt/bitnami/testlink/lib/plan/buildEdit.php - Line 390',1712035781,'PHP',0,NULL),
(3426,677,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:19:\"audit_build_created\";s:6:\"params\";a:3:{i:0;s:11:\"GaN Charger\";i:1;s:19:\"GaN Charger Proto 1\";i:2;s:7:\"Proto 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712035781,'CREATE',3,'builds'),
(3427,678,32,'GUI - Test Project ID : 134','string \'without_platforms\' is not localized for locale \'en_US\'  - using en_GB',1712041239,'LOCALIZATION',0,NULL),
(3428,678,32,'GUI - Test Project ID : 134','string \'exec_tree_counters_logic\' is not localized for locale \'en_US\'  - using en_GB',1712041239,'LOCALIZATION',0,NULL),
(3429,678,32,'GUI - Test Project ID : 134','string \'platforms\' is not localized for locale \'en_US\'  - using en_GB',1712041239,'LOCALIZATION',0,NULL),
(3430,678,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: size - in /opt/bitnami/testlink/gui/templates_c/12a82239248d9e8bd2a95f9018e8967b73321817_0.file.inc_filter_panel.tpl.php - Line 351',1712041239,'PHP',0,NULL),
(3431,679,32,'GUI - Test Project ID : 134','string \'title_issuetracker_mgmt\' is not localized for locale \'en_US\'  - using en_GB',1712041611,'LOCALIZATION',0,NULL),
(3432,680,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: size - in /opt/bitnami/testlink/gui/templates_c/12a82239248d9e8bd2a95f9018e8967b73321817_0.file.inc_filter_panel.tpl.php - Line 351',1712041764,'PHP',0,NULL),
(3433,681,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/specview.php - Line 705',1712041777,'PHP',0,NULL),
(3434,681,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/specview.php - Line 710',1712041777,'PHP',0,NULL),
(3435,681,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/specview.php - Line 747',1712041777,'PHP',0,NULL),
(3436,681,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/specview.php - Line 1164',1712041777,'PHP',0,NULL),
(3437,681,32,'GUI - Test Project ID : 134','string \'note_platform_filter\' is not localized for locale \'en_US\'  - using en_GB',1712041777,'LOCALIZATION',0,NULL),
(3438,682,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/specview.php - Line 705',1712041778,'PHP',0,NULL),
(3439,682,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/specview.php - Line 710',1712041778,'PHP',0,NULL),
(3440,682,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/specview.php - Line 747',1712041778,'PHP',0,NULL),
(3441,682,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/specview.php - Line 1164',1712041778,'PHP',0,NULL),
(3442,683,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/specview.php - Line 705',1712041822,'PHP',0,NULL),
(3443,683,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/specview.php - Line 710',1712041822,'PHP',0,NULL),
(3444,683,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/specview.php - Line 747',1712041822,'PHP',0,NULL),
(3445,683,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/specview.php - Line 1164',1712041822,'PHP',0,NULL),
(3446,684,32,'GUI - Test Project ID : 134','string \'show_calendar\' is not localized for locale \'en_US\' ',1712041863,'LOCALIZATION',0,NULL),
(3447,685,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/search/searchCommands.class.php - Line 998',1712041863,'PHP',0,NULL),
(3448,686,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/search/searchCommands.class.php - Line 998',1712041865,'PHP',0,NULL),
(3449,687,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uploadOp - in /opt/bitnami/testlink/gui/templates_c/a826a56ec1cd6f3a879499ad99bfecc2df857da3_0.file.containerView.tpl.php - Line 123',1712042188,'PHP',0,NULL),
(3450,688,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: size - in /opt/bitnami/testlink/gui/templates_c/12a82239248d9e8bd2a95f9018e8967b73321817_0.file.inc_filter_panel.tpl.php - Line 351',1712042188,'PHP',0,NULL),
(3451,689,32,'GUI - Test Project ID : 134','string \'use_latest_exec_on_contex_for_counters\' is not localized for locale \'en_US\'  - using en_GB',1712042193,'LOCALIZATION',0,NULL),
(3452,689,32,'GUI - Test Project ID : 134','string \'use_latest_exec_on_testplan_for_counters\' is not localized for locale \'en_US\'  - using en_GB',1712042193,'LOCALIZATION',0,NULL),
(3453,690,32,'GUI - Test Project ID : 134','string \'restAPIExecParameters\' is not localized for locale \'en_US\'  - using en_GB',1712042193,'LOCALIZATION',0,NULL),
(3454,691,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: size - in /opt/bitnami/testlink/gui/templates_c/12a82239248d9e8bd2a95f9018e8967b73321817_0.file.inc_filter_panel.tpl.php - Line 351',1712043344,'PHP',0,NULL),
(3455,692,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uploadOp - in /opt/bitnami/testlink/gui/templates_c/a826a56ec1cd6f3a879499ad99bfecc2df857da3_0.file.containerView.tpl.php - Line 123',1712043344,'PHP',0,NULL),
(3456,693,32,'GUI - Test Project ID : 134','string \'btn_add_to_testsuites_deep\' is not localized for locale \'en_US\'  - using en_GB',1712043358,'LOCALIZATION',0,NULL),
(3457,693,32,'GUI - Test Project ID : 134','string \'select_keywords\' is not localized for locale \'en_US\'  - using en_GB',1712043358,'LOCALIZATION',0,NULL),
(3458,694,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: size - in /opt/bitnami/testlink/gui/templates_c/12a82239248d9e8bd2a95f9018e8967b73321817_0.file.inc_filter_panel.tpl.php - Line 351',1712043375,'PHP',0,NULL),
(3459,695,32,'GUI - Test Project ID : 134','string \'updateLinkToThisTCVersion\' is not localized for locale \'en_US\'  - using en_GB',1712043394,'LOCALIZATION',0,NULL),
(3460,695,32,'GUI - Test Project ID : 134','string \'btn_new_version_from_latest\' is not localized for locale \'en_US\'  - using en_GB',1712043394,'LOCALIZATION',0,NULL),
(3461,695,32,'GUI - Test Project ID : 134','string \'code_mgmt\' is not localized for locale \'en_US\'  - using en_GB',1712043394,'LOCALIZATION',0,NULL),
(3462,695,32,'GUI - Test Project ID : 134','string \'code_link_tl_to_cts\' is not localized for locale \'en_US\'  - using en_GB',1712043394,'LOCALIZATION',0,NULL),
(3463,695,32,'GUI - Test Project ID : 134','string \'can_not_edit_frozen_tc\' is not localized for locale \'en_US\'  - using en_GB',1712043394,'LOCALIZATION',0,NULL),
(3464,695,32,'GUI - Test Project ID : 134','string \'testcase_version_operations\' is not localized for locale \'en_US\'  - using en_GB',1712043394,'LOCALIZATION',0,NULL),
(3465,695,32,'GUI - Test Project ID : 134','string \'createKW\' is not localized for locale \'en_US\'  - using en_GB',1712043394,'LOCALIZATION',0,NULL),
(3466,695,32,'GUI - Test Project ID : 134','string \'btn_create_and_link\' is not localized for locale \'en_US\'  - using en_GB',1712043394,'LOCALIZATION',0,NULL),
(3467,695,32,'GUI - Test Project ID : 134','string \'img_title_remove_platform\' is not localized for locale \'en_US\' ',1712043394,'LOCALIZATION',0,NULL),
(3468,695,32,'GUI - Test Project ID : 134','string \'select_platforms\' is not localized for locale \'en_US\'  - using en_GB',1712043394,'LOCALIZATION',0,NULL),
(3469,695,32,'GUI - Test Project ID : 134','string \'remove_plat_msgbox_msg\' is not localized for locale \'en_US\' ',1712043394,'LOCALIZATION',0,NULL),
(3470,695,32,'GUI - Test Project ID : 134','string \'remove_plat_msgbox_title\' is not localized for locale \'en_US\' ',1712043394,'LOCALIZATION',0,NULL),
(3471,695,32,'GUI - Test Project ID : 134','string \'can_not_delete_a_frozen_relation\' is not localized for locale \'en_US\'  - using en_GB',1712043394,'LOCALIZATION',0,NULL),
(3472,695,32,'GUI - Test Project ID : 134','string \'can_not_delete_relation_frozen_tc\' is not localized for locale \'en_US\'  - using en_GB',1712043394,'LOCALIZATION',0,NULL),
(3473,695,32,'GUI - Test Project ID : 134','string \'can_not_delete_relation_because_this_is_not_the_latest\' is not localized for locale \'en_US\'  - using en_GB',1712043394,'LOCALIZATION',0,NULL),
(3474,695,32,'GUI - Test Project ID : 134','string \'this_tcversion\' is not localized for locale \'en_US\'  - using en_GB',1712043394,'LOCALIZATION',0,NULL),
(3475,695,32,'GUI - Test Project ID : 134','string \'can_not_delete_relation_tcversion_frozen\' is not localized for locale \'en_US\'  - using en_GB',1712043394,'LOCALIZATION',0,NULL),
(3476,695,32,'GUI - Test Project ID : 134','string \'can_not_delete_relation_related_tcversion_frozen\' is not localized for locale \'en_US\'  - using en_GB',1712043394,'LOCALIZATION',0,NULL),
(3477,696,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uploadOp - in /opt/bitnami/testlink/gui/templates_c/a826a56ec1cd6f3a879499ad99bfecc2df857da3_0.file.containerView.tpl.php - Line 123',1712043412,'PHP',0,NULL),
(3478,697,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_testsuite_display_message\' is not localized for locale \'en_US\' ',1712043812,'LOCALIZATION',0,NULL),
(3479,697,2,'GUI - Test Project ID : 134','Im in testsuite create',1712043812,NULL,0,NULL),
(3480,698,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: size - in /opt/bitnami/testlink/gui/templates_c/12a82239248d9e8bd2a95f9018e8967b73321817_0.file.inc_filter_panel.tpl.php - Line 351',1712043812,'PHP',0,NULL),
(3481,699,32,'GUI - Test Project ID : 134','string \'skip_testcase_import\' is not localized for locale \'en_US\'  - using en_GB',1712043825,'LOCALIZATION',0,NULL),
(3482,700,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_login_failed\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:14:\"106.51.174.176\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712049177,'LOGIN_FAILED',1,'users'),
(3483,701,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:17:\"audit_user_logout\";s:6:\"params\";a:1:{i:0;s:5:\"admin\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712049189,'LOGOUT',1,'users'),
(3484,702,16,'GUI','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_login_failed\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:14:\"106.51.174.176\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712049201,'LOGIN_FAILED',1,'users'),
(3485,703,16,'GUI','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_login_failed\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:14:\"106.51.174.176\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712049220,'LOGIN_FAILED',1,'users'),
(3486,704,16,'GUI','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_login_failed\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:14:\"106.51.174.176\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712049243,'LOGIN_FAILED',1,'users'),
(3487,705,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:14:\"106.51.174.176\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712049315,'LOGIN',1,'users'),
(3488,706,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_config\' is not localized for locale \'en_US\' ',1712049316,'LOCALIZATION',0,NULL),
(3489,706,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_left_bottom_link\' is not localized for locale \'en_US\' ',1712049316,'LOCALIZATION',0,NULL),
(3490,706,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_right_top_link\' is not localized for locale \'en_US\' ',1712049316,'LOCALIZATION',0,NULL),
(3491,706,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_right_bottom_link\' is not localized for locale \'en_US\' ',1712049316,'LOCALIZATION',0,NULL),
(3492,706,32,'GUI - Test Project ID : 134','string \'poweredBy\' is not localized for locale \'en_US\'  - using en_GB',1712049316,'LOCALIZATION',0,NULL),
(3493,706,32,'GUI - Test Project ID : 134','string \'system_descr\' is not localized for locale \'en_US\'  - using en_GB',1712049316,'LOCALIZATION',0,NULL),
(3494,706,32,'GUI - Test Project ID : 134','string \'href_codetracker_management\' is not localized for locale \'en_US\'  - using en_GB',1712049316,'LOCALIZATION',0,NULL),
(3495,707,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: user - in /opt/bitnami/testlink/lib/functions/common.php - Line 1925',1712049332,'PHP',0,NULL),
(3496,708,32,'GUI - Test Project ID : 134','string \'expiration\' is not localized for locale \'en_US\'  - using en_GB',1712049336,'LOCALIZATION',0,NULL),
(3497,708,32,'GUI - Test Project ID : 134','string \'expiration_date\' is not localized for locale \'en_US\'  - using en_GB',1712049336,'LOCALIZATION',0,NULL),
(3498,709,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_user_created\";s:6:\"params\";a:1:{i:0;s:21:\"ashwani@cuzorlabs.com\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712049453,'CREATE',5,'users'),
(3499,710,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:21:\"ashwani@cuzorlabs.com\";i:1;s:14:\"106.51.174.176\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712049507,'LOGIN',5,'users'),
(3500,711,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_config\' is not localized for locale \'en_US\' ',1712049507,'LOCALIZATION',0,NULL),
(3501,711,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_left_bottom_link\' is not localized for locale \'en_US\' ',1712049507,'LOCALIZATION',0,NULL),
(3502,711,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_right_top_link\' is not localized for locale \'en_US\' ',1712049507,'LOCALIZATION',0,NULL),
(3503,711,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_right_bottom_link\' is not localized for locale \'en_US\' ',1712049507,'LOCALIZATION',0,NULL),
(3504,711,32,'GUI - Test Project ID : 134','string \'poweredBy\' is not localized for locale \'en_US\'  - using en_GB',1712049507,'LOCALIZATION',0,NULL),
(3505,711,32,'GUI - Test Project ID : 134','string \'system_descr\' is not localized for locale \'en_US\'  - using en_GB',1712049507,'LOCALIZATION',0,NULL),
(3506,711,32,'GUI - Test Project ID : 134','string \'href_codetracker_management\' is not localized for locale \'en_US\'  - using en_GB',1712049507,'LOCALIZATION',0,NULL),
(3507,711,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712049507,'PHP',0,NULL),
(3508,712,32,'GUI - Test Project ID : 134','string \'tcvqty_with_kw\' is not localized for locale \'en_US\'  - using en_GB',1712049525,'LOCALIZATION',0,NULL),
(3509,713,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712049529,'PHP',0,NULL),
(3510,714,32,'GUI - Test Project ID : 134','string \'without_platforms\' is not localized for locale \'en_US\'  - using en_GB',1712049535,'LOCALIZATION',0,NULL),
(3511,714,32,'GUI - Test Project ID : 134','string \'use_latest_exec_on_contex_for_counters\' is not localized for locale \'en_US\'  - using en_GB',1712049535,'LOCALIZATION',0,NULL),
(3512,714,32,'GUI - Test Project ID : 134','string \'use_latest_exec_on_testplan_for_counters\' is not localized for locale \'en_US\'  - using en_GB',1712049535,'LOCALIZATION',0,NULL),
(3513,714,32,'GUI - Test Project ID : 134','string \'exec_tree_counters_logic\' is not localized for locale \'en_US\'  - using en_GB',1712049535,'LOCALIZATION',0,NULL),
(3514,714,32,'GUI - Test Project ID : 134','string \'platforms\' is not localized for locale \'en_US\'  - using en_GB',1712049535,'LOCALIZATION',0,NULL),
(3515,715,32,'GUI - Test Project ID : 134','string \'restAPIExecParameters\' is not localized for locale \'en_US\'  - using en_GB',1712049535,'LOCALIZATION',0,NULL),
(3516,716,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712049540,'PHP',0,NULL),
(3517,717,2,'GUI - Test Project ID : 134','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /opt/bitnami/testlink/lib/functions/tlTestPlanMetrics.class.php - Line 1026',1712049543,'PHP',0,NULL),
(3518,717,2,'GUI - Test Project ID : 134','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /opt/bitnami/testlink/lib/functions/tlTestPlanMetrics.class.php - Line 1026',1712049543,'PHP',0,NULL),
(3519,718,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712049548,'PHP',0,NULL),
(3520,719,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712049550,'PHP',0,NULL),
(3521,720,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712049557,'PHP',0,NULL),
(3522,721,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_user_saved\";s:6:\"params\";a:1:{i:0;s:21:\"ashwani@cuzorlabs.com\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712049796,'SAVE',5,'users'),
(3523,722,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/testcase.class.php - Line 5361',1712049796,'PHP',0,NULL),
(3524,723,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712049802,'PHP',0,NULL),
(3525,724,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712049804,'PHP',0,NULL),
(3526,725,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712049806,'PHP',0,NULL),
(3527,726,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712049808,'PHP',0,NULL),
(3528,727,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712049811,'PHP',0,NULL),
(3529,728,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712049812,'PHP',0,NULL),
(3530,729,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712049837,'PHP',0,NULL),
(3531,730,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712049842,'PHP',0,NULL),
(3532,731,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712049846,'PHP',0,NULL),
(3533,732,32,'GUI - Test Project ID : 134','string \'desc_cfield_assignment\' is not localized for locale \'en_US\'  - using en_GB',1712049864,'LOCALIZATION',0,NULL),
(3534,732,32,'GUI - Test Project ID : 134','string \'desc_exec_assign_testcases\' is not localized for locale \'en_US\'  - using en_GB',1712049864,'LOCALIZATION',0,NULL),
(3535,732,32,'GUI - Test Project ID : 134','string \'desc_codetrackers_view\' is not localized for locale \'en_US\'  - using en_GB',1712049864,'LOCALIZATION',0,NULL),
(3536,732,32,'GUI - Test Project ID : 134','string \'desc_codetrackers_management\' is not localized for locale \'en_US\'  - using en_GB',1712049864,'LOCALIZATION',0,NULL),
(3537,732,32,'GUI - Test Project ID : 134','string \'right_testproject_add_remove_keywords_executed_tcversions\' is not localized for locale \'en_US\'  - using en_GB',1712049864,'LOCALIZATION',0,NULL),
(3538,732,32,'GUI - Test Project ID : 134','string \'right_delete_frozen_tcversion\' is not localized for locale \'en_US\'  - using en_GB',1712049864,'LOCALIZATION',0,NULL),
(3539,733,32,'GUI - Test Project ID : 134','string \'th_codetracker_rights\' is not localized for locale \'en_US\'  - using en_GB',1712049867,'LOCALIZATION',0,NULL),
(3540,734,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_role_created\";s:6:\"params\";a:1:{i:0;s:9:\"Developer\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712050157,'CREATE',10,'roles'),
(3541,735,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_user_saved\";s:6:\"params\";a:1:{i:0;s:21:\"ashwani@cuzorlabs.com\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712050171,'SAVE',5,'users'),
(3542,736,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: user - in /opt/bitnami/testlink/lib/functions/common.php - Line 1925',1712050192,'PHP',0,NULL),
(3543,737,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:21:\"ashwani@cuzorlabs.com\";i:1;s:10:\"27.7.30.41\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712050298,'LOGIN',5,'users'),
(3544,738,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_config\' is not localized for locale \'en_US\' ',1712050299,'LOCALIZATION',0,NULL),
(3545,738,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_left_bottom_link\' is not localized for locale \'en_US\' ',1712050299,'LOCALIZATION',0,NULL),
(3546,738,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_right_top_link\' is not localized for locale \'en_US\' ',1712050299,'LOCALIZATION',0,NULL),
(3547,738,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_right_bottom_link\' is not localized for locale \'en_US\' ',1712050299,'LOCALIZATION',0,NULL),
(3548,738,32,'GUI - Test Project ID : 134','string \'poweredBy\' is not localized for locale \'en_US\'  - using en_GB',1712050299,'LOCALIZATION',0,NULL),
(3549,738,32,'GUI - Test Project ID : 134','string \'system_descr\' is not localized for locale \'en_US\'  - using en_GB',1712050299,'LOCALIZATION',0,NULL),
(3550,738,32,'GUI - Test Project ID : 134','string \'href_codetracker_management\' is not localized for locale \'en_US\'  - using en_GB',1712050299,'LOCALIZATION',0,NULL),
(3551,739,32,'GUI - Test Project ID : 134','string \'without_platforms\' is not localized for locale \'en_US\'  - using en_GB',1712050315,'LOCALIZATION',0,NULL),
(3552,739,32,'GUI - Test Project ID : 134','string \'exec_tree_counters_logic\' is not localized for locale \'en_US\'  - using en_GB',1712050315,'LOCALIZATION',0,NULL),
(3553,739,32,'GUI - Test Project ID : 134','string \'platforms\' is not localized for locale \'en_US\'  - using en_GB',1712050315,'LOCALIZATION',0,NULL),
(3554,739,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: size - in /opt/bitnami/testlink/gui/templates_c/12a82239248d9e8bd2a95f9018e8967b73321817_0.file.inc_filter_panel.tpl.php - Line 351',1712050315,'PHP',0,NULL),
(3555,740,32,'GUI - Test Project ID : 134','string \'file_upload_ko\' is not localized for locale \'en_US\'  - using en_GB',1712050315,'LOCALIZATION',0,NULL),
(3556,740,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uploadOp - in /opt/bitnami/testlink/gui/templates_c/a826a56ec1cd6f3a879499ad99bfecc2df857da3_0.file.containerView.tpl.php - Line 123',1712050315,'PHP',0,NULL),
(3557,740,32,'GUI - Test Project ID : 134','string \'allowed_files\' is not localized for locale \'en_US\'  - using en_GB',1712050315,'LOCALIZATION',0,NULL),
(3558,740,32,'GUI - Test Project ID : 134','string \'allowed_filenames_regexp\' is not localized for locale \'en_US\'  - using en_GB',1712050315,'LOCALIZATION',0,NULL),
(3559,741,32,'GUI - Test Project ID : 134','string \'btn_add_to_testsuites_deep\' is not localized for locale \'en_US\'  - using en_GB',1712050324,'LOCALIZATION',0,NULL),
(3560,741,32,'GUI - Test Project ID : 134','string \'select_keywords\' is not localized for locale \'en_US\'  - using en_GB',1712050324,'LOCALIZATION',0,NULL),
(3561,742,32,'GUI - Test Project ID : 134','string \'updateLinkToThisTCVersion\' is not localized for locale \'en_US\'  - using en_GB',1712050324,'LOCALIZATION',0,NULL),
(3562,742,32,'GUI - Test Project ID : 134','string \'btn_new_version_from_latest\' is not localized for locale \'en_US\'  - using en_GB',1712050324,'LOCALIZATION',0,NULL),
(3563,742,32,'GUI - Test Project ID : 134','string \'code_mgmt\' is not localized for locale \'en_US\'  - using en_GB',1712050324,'LOCALIZATION',0,NULL),
(3564,742,32,'GUI - Test Project ID : 134','string \'code_link_tl_to_cts\' is not localized for locale \'en_US\'  - using en_GB',1712050324,'LOCALIZATION',0,NULL),
(3565,742,32,'GUI - Test Project ID : 134','string \'can_not_edit_frozen_tc\' is not localized for locale \'en_US\'  - using en_GB',1712050324,'LOCALIZATION',0,NULL),
(3566,742,32,'GUI - Test Project ID : 134','string \'testcase_version_operations\' is not localized for locale \'en_US\'  - using en_GB',1712050324,'LOCALIZATION',0,NULL),
(3567,742,32,'GUI - Test Project ID : 134','string \'createKW\' is not localized for locale \'en_US\'  - using en_GB',1712050324,'LOCALIZATION',0,NULL),
(3568,742,32,'GUI - Test Project ID : 134','string \'btn_create_and_link\' is not localized for locale \'en_US\'  - using en_GB',1712050324,'LOCALIZATION',0,NULL),
(3569,742,32,'GUI - Test Project ID : 134','string \'img_title_remove_platform\' is not localized for locale \'en_US\' ',1712050324,'LOCALIZATION',0,NULL),
(3570,742,32,'GUI - Test Project ID : 134','string \'select_platforms\' is not localized for locale \'en_US\'  - using en_GB',1712050324,'LOCALIZATION',0,NULL),
(3571,742,32,'GUI - Test Project ID : 134','string \'remove_plat_msgbox_msg\' is not localized for locale \'en_US\' ',1712050324,'LOCALIZATION',0,NULL),
(3572,742,32,'GUI - Test Project ID : 134','string \'remove_plat_msgbox_title\' is not localized for locale \'en_US\' ',1712050324,'LOCALIZATION',0,NULL),
(3573,742,32,'GUI - Test Project ID : 134','string \'can_not_delete_a_frozen_relation\' is not localized for locale \'en_US\'  - using en_GB',1712050324,'LOCALIZATION',0,NULL),
(3574,742,32,'GUI - Test Project ID : 134','string \'can_not_delete_relation_frozen_tc\' is not localized for locale \'en_US\'  - using en_GB',1712050324,'LOCALIZATION',0,NULL),
(3575,742,32,'GUI - Test Project ID : 134','string \'can_not_delete_relation_because_this_is_not_the_latest\' is not localized for locale \'en_US\'  - using en_GB',1712050324,'LOCALIZATION',0,NULL),
(3576,742,32,'GUI - Test Project ID : 134','string \'this_tcversion\' is not localized for locale \'en_US\'  - using en_GB',1712050324,'LOCALIZATION',0,NULL),
(3577,742,32,'GUI - Test Project ID : 134','string \'can_not_delete_relation_tcversion_frozen\' is not localized for locale \'en_US\'  - using en_GB',1712050324,'LOCALIZATION',0,NULL),
(3578,742,32,'GUI - Test Project ID : 134','string \'can_not_delete_relation_related_tcversion_frozen\' is not localized for locale \'en_US\'  - using en_GB',1712050324,'LOCALIZATION',0,NULL),
(3579,743,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: size - in /opt/bitnami/testlink/gui/templates_c/12a82239248d9e8bd2a95f9018e8967b73321817_0.file.inc_filter_panel.tpl.php - Line 351',1712051434,'PHP',0,NULL),
(3580,744,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uploadOp - in /opt/bitnami/testlink/gui/templates_c/a826a56ec1cd6f3a879499ad99bfecc2df857da3_0.file.containerView.tpl.php - Line 123',1712051434,'PHP',0,NULL),
(3581,745,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uploadOp - in /opt/bitnami/testlink/gui/templates_c/a826a56ec1cd6f3a879499ad99bfecc2df857da3_0.file.containerView.tpl.php - Line 123',1712051441,'PHP',0,NULL),
(3582,746,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uploadOp - in /opt/bitnami/testlink/gui/templates_c/a826a56ec1cd6f3a879499ad99bfecc2df857da3_0.file.containerView.tpl.php - Line 123',1712051450,'PHP',0,NULL),
(3583,747,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uploadOp - in /opt/bitnami/testlink/gui/templates_c/a826a56ec1cd6f3a879499ad99bfecc2df857da3_0.file.containerView.tpl.php - Line 123',1712051456,'PHP',0,NULL),
(3584,748,2,'GUI - Test Project ID : 134','Im in testsuite create',1712051481,NULL,0,NULL),
(3585,749,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: size - in /opt/bitnami/testlink/gui/templates_c/12a82239248d9e8bd2a95f9018e8967b73321817_0.file.inc_filter_panel.tpl.php - Line 351',1712051481,'PHP',0,NULL),
(3586,750,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uploadOp - in /opt/bitnami/testlink/gui/templates_c/a826a56ec1cd6f3a879499ad99bfecc2df857da3_0.file.containerView.tpl.php - Line 123',1712051490,'PHP',0,NULL),
(3587,751,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uploadOp - in /opt/bitnami/testlink/gui/templates_c/a826a56ec1cd6f3a879499ad99bfecc2df857da3_0.file.containerView.tpl.php - Line 123',1712051496,'PHP',0,NULL),
(3588,752,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: size - in /opt/bitnami/testlink/gui/templates_c/12a82239248d9e8bd2a95f9018e8967b73321817_0.file.inc_filter_panel.tpl.php - Line 351',1712051496,'PHP',0,NULL),
(3589,753,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: size - in /opt/bitnami/testlink/gui/templates_c/12a82239248d9e8bd2a95f9018e8967b73321817_0.file.inc_filter_panel.tpl.php - Line 351',1712051531,'PHP',0,NULL),
(3590,754,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/testcase.class.php - Line 5361',1712051557,'PHP',0,NULL),
(3591,755,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/testcase.class.php - Line 5361',1712051634,'PHP',0,NULL),
(3592,756,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/testcase.class.php - Line 5361',1712051671,'PHP',0,NULL),
(3593,756,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/tree.class.php - Line 725',1712051671,'PHP',0,NULL),
(3594,756,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/tree.class.php - Line 725',1712051671,'PHP',0,NULL),
(3595,756,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uploadOp - in /opt/bitnami/testlink/lib/testcases/testcaseCommands.class.php - Line 1129',1712051671,'PHP',0,NULL),
(3596,757,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: size - in /opt/bitnami/testlink/gui/templates_c/12a82239248d9e8bd2a95f9018e8967b73321817_0.file.inc_filter_panel.tpl.php - Line 351',1712051672,'PHP',0,NULL),
(3597,758,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:31:\"rj.ravindra@kenestechnology.net\";i:1;s:14:\"106.51.174.176\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712051679,'LOGIN',2,'users'),
(3598,759,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/testcase.class.php - Line 5361',1712051679,'PHP',0,NULL),
(3599,760,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_config\' is not localized for locale \'en_US\' ',1712051679,'LOCALIZATION',0,NULL),
(3600,760,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_left_bottom_link\' is not localized for locale \'en_US\' ',1712051679,'LOCALIZATION',0,NULL),
(3601,760,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_right_top_link\' is not localized for locale \'en_US\' ',1712051679,'LOCALIZATION',0,NULL),
(3602,760,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_right_bottom_link\' is not localized for locale \'en_US\' ',1712051679,'LOCALIZATION',0,NULL),
(3603,760,32,'GUI - Test Project ID : 134','string \'poweredBy\' is not localized for locale \'en_US\'  - using en_GB',1712051679,'LOCALIZATION',0,NULL),
(3604,760,32,'GUI - Test Project ID : 134','string \'system_descr\' is not localized for locale \'en_US\'  - using en_GB',1712051679,'LOCALIZATION',0,NULL),
(3605,760,32,'GUI - Test Project ID : 134','string \'href_codetracker_management\' is not localized for locale \'en_US\'  - using en_GB',1712051679,'LOCALIZATION',0,NULL),
(3606,760,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712051679,'PHP',0,NULL),
(3607,761,32,'GUI - Test Project ID : 134','string \'without_platforms\' is not localized for locale \'en_US\'  - using en_GB',1712051697,'LOCALIZATION',0,NULL),
(3608,761,32,'GUI - Test Project ID : 134','string \'exec_tree_counters_logic\' is not localized for locale \'en_US\'  - using en_GB',1712051697,'LOCALIZATION',0,NULL),
(3609,761,32,'GUI - Test Project ID : 134','string \'platforms\' is not localized for locale \'en_US\'  - using en_GB',1712051697,'LOCALIZATION',0,NULL),
(3610,761,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: size - in /opt/bitnami/testlink/gui/templates_c/12a82239248d9e8bd2a95f9018e8967b73321817_0.file.inc_filter_panel.tpl.php - Line 351',1712051697,'PHP',0,NULL),
(3611,762,32,'GUI - Test Project ID : 134','string \'file_upload_ko\' is not localized for locale \'en_US\'  - using en_GB',1712051697,'LOCALIZATION',0,NULL),
(3612,762,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uploadOp - in /opt/bitnami/testlink/gui/templates_c/a826a56ec1cd6f3a879499ad99bfecc2df857da3_0.file.containerView.tpl.php - Line 123',1712051697,'PHP',0,NULL),
(3613,762,32,'GUI - Test Project ID : 134','string \'allowed_files\' is not localized for locale \'en_US\'  - using en_GB',1712051697,'LOCALIZATION',0,NULL),
(3614,762,32,'GUI - Test Project ID : 134','string \'allowed_filenames_regexp\' is not localized for locale \'en_US\'  - using en_GB',1712051697,'LOCALIZATION',0,NULL),
(3615,763,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/testcase.class.php - Line 5361',1712051701,'PHP',0,NULL),
(3616,763,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uploadOp - in /opt/bitnami/testlink/lib/testcases/testcaseCommands.class.php - Line 1129',1712051701,'PHP',0,NULL),
(3617,764,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: size - in /opt/bitnami/testlink/gui/templates_c/12a82239248d9e8bd2a95f9018e8967b73321817_0.file.inc_filter_panel.tpl.php - Line 351',1712051701,'PHP',0,NULL),
(3618,765,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uploadOp - in /opt/bitnami/testlink/gui/templates_c/a826a56ec1cd6f3a879499ad99bfecc2df857da3_0.file.containerView.tpl.php - Line 123',1712051703,'PHP',0,NULL),
(3619,766,32,'GUI - Test Project ID : 134','string \'btn_add_to_testsuites_deep\' is not localized for locale \'en_US\'  - using en_GB',1712051705,'LOCALIZATION',0,NULL),
(3620,766,32,'GUI - Test Project ID : 134','string \'select_keywords\' is not localized for locale \'en_US\'  - using en_GB',1712051705,'LOCALIZATION',0,NULL),
(3621,767,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/testcase.class.php - Line 5361',1712051712,'PHP',0,NULL),
(3622,768,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uploadOp - in /opt/bitnami/testlink/gui/templates_c/a826a56ec1cd6f3a879499ad99bfecc2df857da3_0.file.containerView.tpl.php - Line 123',1712051739,'PHP',0,NULL),
(3623,769,32,'GUI - Test Project ID : 134','string \'updateLinkToThisTCVersion\' is not localized for locale \'en_US\'  - using en_GB',1712051756,'LOCALIZATION',0,NULL),
(3624,769,32,'GUI - Test Project ID : 134','string \'btn_new_version_from_latest\' is not localized for locale \'en_US\'  - using en_GB',1712051756,'LOCALIZATION',0,NULL),
(3625,769,32,'GUI - Test Project ID : 134','string \'code_mgmt\' is not localized for locale \'en_US\'  - using en_GB',1712051756,'LOCALIZATION',0,NULL),
(3626,769,32,'GUI - Test Project ID : 134','string \'code_link_tl_to_cts\' is not localized for locale \'en_US\'  - using en_GB',1712051756,'LOCALIZATION',0,NULL),
(3627,769,32,'GUI - Test Project ID : 134','string \'can_not_edit_frozen_tc\' is not localized for locale \'en_US\'  - using en_GB',1712051756,'LOCALIZATION',0,NULL),
(3628,769,32,'GUI - Test Project ID : 134','string \'testcase_version_operations\' is not localized for locale \'en_US\'  - using en_GB',1712051756,'LOCALIZATION',0,NULL),
(3629,769,32,'GUI - Test Project ID : 134','string \'createKW\' is not localized for locale \'en_US\'  - using en_GB',1712051756,'LOCALIZATION',0,NULL),
(3630,769,32,'GUI - Test Project ID : 134','string \'btn_create_and_link\' is not localized for locale \'en_US\'  - using en_GB',1712051756,'LOCALIZATION',0,NULL),
(3631,769,32,'GUI - Test Project ID : 134','string \'img_title_remove_platform\' is not localized for locale \'en_US\' ',1712051756,'LOCALIZATION',0,NULL),
(3632,769,32,'GUI - Test Project ID : 134','string \'select_platforms\' is not localized for locale \'en_US\'  - using en_GB',1712051756,'LOCALIZATION',0,NULL),
(3633,769,32,'GUI - Test Project ID : 134','string \'remove_plat_msgbox_msg\' is not localized for locale \'en_US\' ',1712051756,'LOCALIZATION',0,NULL),
(3634,769,32,'GUI - Test Project ID : 134','string \'remove_plat_msgbox_title\' is not localized for locale \'en_US\' ',1712051756,'LOCALIZATION',0,NULL),
(3635,769,32,'GUI - Test Project ID : 134','string \'can_not_delete_a_frozen_relation\' is not localized for locale \'en_US\'  - using en_GB',1712051756,'LOCALIZATION',0,NULL),
(3636,769,32,'GUI - Test Project ID : 134','string \'can_not_delete_relation_frozen_tc\' is not localized for locale \'en_US\'  - using en_GB',1712051756,'LOCALIZATION',0,NULL),
(3637,769,32,'GUI - Test Project ID : 134','string \'can_not_delete_relation_because_this_is_not_the_latest\' is not localized for locale \'en_US\'  - using en_GB',1712051756,'LOCALIZATION',0,NULL),
(3638,769,32,'GUI - Test Project ID : 134','string \'this_tcversion\' is not localized for locale \'en_US\'  - using en_GB',1712051756,'LOCALIZATION',0,NULL),
(3639,769,32,'GUI - Test Project ID : 134','string \'can_not_delete_relation_tcversion_frozen\' is not localized for locale \'en_US\'  - using en_GB',1712051756,'LOCALIZATION',0,NULL),
(3640,769,32,'GUI - Test Project ID : 134','string \'can_not_delete_relation_related_tcversion_frozen\' is not localized for locale \'en_US\'  - using en_GB',1712051756,'LOCALIZATION',0,NULL),
(3641,770,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uploadOp - in /opt/bitnami/testlink/gui/templates_c/a826a56ec1cd6f3a879499ad99bfecc2df857da3_0.file.containerView.tpl.php - Line 123',1712051780,'PHP',0,NULL),
(3642,771,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: size - in /opt/bitnami/testlink/gui/templates_c/12a82239248d9e8bd2a95f9018e8967b73321817_0.file.inc_filter_panel.tpl.php - Line 351',1712051784,'PHP',0,NULL),
(3643,772,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uploadOp - in /opt/bitnami/testlink/gui/templates_c/a826a56ec1cd6f3a879499ad99bfecc2df857da3_0.file.containerView.tpl.php - Line 123',1712051784,'PHP',0,NULL),
(3644,773,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712051788,'PHP',0,NULL),
(3645,774,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: size - in /opt/bitnami/testlink/gui/templates_c/12a82239248d9e8bd2a95f9018e8967b73321817_0.file.inc_filter_panel.tpl.php - Line 351',1712051795,'PHP',0,NULL),
(3646,775,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uploadOp - in /opt/bitnami/testlink/gui/templates_c/a826a56ec1cd6f3a879499ad99bfecc2df857da3_0.file.containerView.tpl.php - Line 123',1712051795,'PHP',0,NULL),
(3647,776,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712051800,'PHP',0,NULL),
(3648,777,2,'GUI - Test Project ID : 134','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /opt/bitnami/testlink/lib/functions/tlTestPlanMetrics.class.php - Line 1026',1712051812,'PHP',0,NULL),
(3649,777,2,'GUI - Test Project ID : 134','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /opt/bitnami/testlink/lib/functions/tlTestPlanMetrics.class.php - Line 1026',1712051812,'PHP',0,NULL),
(3650,778,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712051838,'PHP',0,NULL),
(3651,779,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712051900,'PHP',0,NULL),
(3652,780,32,'GUI - Test Project ID : 134','string \'use_latest_exec_on_contex_for_counters\' is not localized for locale \'en_US\'  - using en_GB',1712051918,'LOCALIZATION',0,NULL),
(3653,780,32,'GUI - Test Project ID : 134','string \'use_latest_exec_on_testplan_for_counters\' is not localized for locale \'en_US\'  - using en_GB',1712051918,'LOCALIZATION',0,NULL),
(3654,781,32,'GUI - Test Project ID : 134','string \'restAPIExecParameters\' is not localized for locale \'en_US\'  - using en_GB',1712051918,'LOCALIZATION',0,NULL),
(3655,782,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712051927,'PHP',0,NULL),
(3656,783,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712051938,'PHP',0,NULL),
(3657,784,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712051969,'PHP',0,NULL),
(3658,785,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712051985,'PHP',0,NULL),
(3659,786,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712051995,'PHP',0,NULL),
(3660,787,2,'GUI - Test Project ID : 134','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /opt/bitnami/testlink/lib/functions/tlTestPlanMetrics.class.php - Line 1026',1712051999,'PHP',0,NULL),
(3661,787,2,'GUI - Test Project ID : 134','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /opt/bitnami/testlink/lib/functions/tlTestPlanMetrics.class.php - Line 1026',1712051999,'PHP',0,NULL),
(3662,788,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052001,'PHP',0,NULL),
(3663,789,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052007,'PHP',0,NULL),
(3664,790,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052010,'PHP',0,NULL),
(3665,791,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: size - in /opt/bitnami/testlink/gui/templates_c/12a82239248d9e8bd2a95f9018e8967b73321817_0.file.inc_filter_panel.tpl.php - Line 351',1712052015,'PHP',0,NULL),
(3666,792,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052019,'PHP',0,NULL),
(3667,793,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052020,'PHP',0,NULL),
(3668,794,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052020,'PHP',0,NULL),
(3669,795,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052022,'PHP',0,NULL),
(3670,796,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/specview.php - Line 705',1712052022,'PHP',0,NULL),
(3671,796,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/specview.php - Line 710',1712052022,'PHP',0,NULL),
(3672,796,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/specview.php - Line 747',1712052022,'PHP',0,NULL),
(3673,796,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/specview.php - Line 1164',1712052022,'PHP',0,NULL),
(3674,797,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:25:\"TCGaN-4 : Line Regulation\";i:1;s:1:\"1\";i:2;s:40:\"Sample Charger Testing @Mysore Shyam Lab\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712052038,'ASSIGN',137,'testplans'),
(3675,797,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:25:\"TCGaN-5 : Load regulation\";i:1;s:1:\"1\";i:2;s:40:\"Sample Charger Testing @Mysore Shyam Lab\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712052038,'ASSIGN',137,'testplans'),
(3676,797,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/specview.php - Line 705',1712052038,'PHP',0,NULL),
(3677,797,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/specview.php - Line 710',1712052038,'PHP',0,NULL),
(3678,797,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/specview.php - Line 747',1712052038,'PHP',0,NULL),
(3679,797,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/specview.php - Line 1164',1712052038,'PHP',0,NULL),
(3680,797,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/gui/templates_c/56889df98de7ae8b0bc28961d8c4d1c24b8ef6c7_0.file.planAddTC_m1.tpl.php - Line 462',1712052038,'PHP',0,NULL),
(3681,797,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/gui/templates_c/56889df98de7ae8b0bc28961d8c4d1c24b8ef6c7_0.file.planAddTC_m1.tpl.php - Line 467',1712052038,'PHP',0,NULL),
(3682,797,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/gui/templates_c/56889df98de7ae8b0bc28961d8c4d1c24b8ef6c7_0.file.planAddTC_m1.tpl.php - Line 479',1712052038,'PHP',0,NULL),
(3683,797,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/gui/templates_c/56889df98de7ae8b0bc28961d8c4d1c24b8ef6c7_0.file.planAddTC_m1.tpl.php - Line 462',1712052038,'PHP',0,NULL),
(3684,797,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/gui/templates_c/56889df98de7ae8b0bc28961d8c4d1c24b8ef6c7_0.file.planAddTC_m1.tpl.php - Line 467',1712052038,'PHP',0,NULL),
(3685,797,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/gui/templates_c/56889df98de7ae8b0bc28961d8c4d1c24b8ef6c7_0.file.planAddTC_m1.tpl.php - Line 479',1712052038,'PHP',0,NULL),
(3686,798,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: size - in /opt/bitnami/testlink/gui/templates_c/12a82239248d9e8bd2a95f9018e8967b73321817_0.file.inc_filter_panel.tpl.php - Line 351',1712052038,'PHP',0,NULL),
(3687,799,32,'GUI - Test Project ID : 134','string \'tcvqty_with_kw\' is not localized for locale \'en_US\'  - using en_GB',1712052042,'LOCALIZATION',0,NULL),
(3688,800,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052044,'PHP',0,NULL),
(3689,801,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052048,'PHP',0,NULL),
(3690,802,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/specview.php - Line 705',1712052054,'PHP',0,NULL),
(3691,802,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/specview.php - Line 710',1712052054,'PHP',0,NULL),
(3692,802,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/specview.php - Line 747',1712052054,'PHP',0,NULL),
(3693,803,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052060,'PHP',0,NULL),
(3694,804,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uribase - in /opt/bitnami/testlink/lib/issuetrackerintegration/bugzillaxmlrpcInterface.class.php - Line 65',1712052086,'PHP',0,NULL),
(3695,804,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuetype - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712052086,'PHP',0,NULL),
(3696,804,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuepriority - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712052086,'PHP',0,NULL),
(3697,804,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$component - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1649',1712052086,'PHP',0,NULL),
(3698,804,32,'GUI - Test Project ID : 134','string \'issue_subject_tcname\' is not localized for locale \'en_US\'  - using en_GB',1712052086,'LOCALIZATION',0,NULL),
(3699,804,32,'GUI - Test Project ID : 134','string \'issue_subject_tcpathname\' is not localized for locale \'en_US\'  - using en_GB',1712052086,'LOCALIZATION',0,NULL),
(3700,804,32,'GUI - Test Project ID : 134','string \'issue_subject_projectname\' is not localized for locale \'en_US\'  - using en_GB',1712052086,'LOCALIZATION',0,NULL),
(3701,804,32,'GUI - Test Project ID : 134','string \'issue_subject_planname\' is not localized for locale \'en_US\'  - using en_GB',1712052086,'LOCALIZATION',0,NULL),
(3702,804,32,'GUI - Test Project ID : 134','string \'issue_subject_buildname\' is not localized for locale \'en_US\'  - using en_GB',1712052086,'LOCALIZATION',0,NULL),
(3703,804,32,'GUI - Test Project ID : 134','string \'issue_subject_platfname\' is not localized for locale \'en_US\'  - using en_GB',1712052086,'LOCALIZATION',0,NULL),
(3704,804,32,'GUI - Test Project ID : 134','string \'issue_subject_execon\' is not localized for locale \'en_US\'  - using en_GB',1712052086,'LOCALIZATION',0,NULL),
(3705,804,32,'GUI - Test Project ID : 134','string \'add_link_to_tlexec_print_view\' is not localized for locale \'en_US\'  - using en_GB',1712052086,'LOCALIZATION',0,NULL),
(3706,804,32,'GUI - Test Project ID : 134','string \'copy_attachments_from_latest_exec\' is not localized for locale \'en_US\'  - using en_GB',1712052086,'LOCALIZATION',0,NULL),
(3707,804,32,'GUI - Test Project ID : 134','string \'hasNewestVersionMsg\' is not localized for locale \'en_US\'  - using en_GB',1712052086,'LOCALIZATION',0,NULL),
(3708,804,32,'GUI - Test Project ID : 134','string \'partialExecNoAttachmentsWarning\' is not localized for locale \'en_US\'  - using en_GB',1712052086,'LOCALIZATION',0,NULL),
(3709,804,32,'GUI - Test Project ID : 134','string \'partialExecNothingToSave\' is not localized for locale \'en_US\'  - using en_GB',1712052086,'LOCALIZATION',0,NULL),
(3710,804,32,'GUI - Test Project ID : 134','string \'saveStepsForPartialExec\' is not localized for locale \'en_US\'  - using en_GB',1712052086,'LOCALIZATION',0,NULL),
(3711,804,32,'GUI - Test Project ID : 134','string \'updateLinkToLatestTCVersion\' is not localized for locale \'en_US\'  - using en_GB',1712052086,'LOCALIZATION',0,NULL),
(3712,804,32,'GUI - Test Project ID : 134','string \'pleaseOpenTSuite\' is not localized for locale \'en_US\'  - using en_GB',1712052086,'LOCALIZATION',0,NULL),
(3713,804,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/gui/templates_c/8f7d50b23a3ad2636127523615ed9c295157f12b_0.file.inc_exec_show_tc_exec.tpl.php - Line 244',1712052086,'PHP',0,NULL),
(3714,805,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuetype - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712052123,'PHP',0,NULL),
(3715,805,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuepriority - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712052123,'PHP',0,NULL),
(3716,805,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$component - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1649',1712052123,'PHP',0,NULL),
(3717,805,2,'GUI - Test Project ID : 134','In TestRun with testrunid: 19, planid: 137, buildid: 2, testcaseid: 156, Notes: p, Status: http://13.235.24.109:83/ltx.php?item=exec&feature_id=11&build_id=2',1712052123,NULL,0,NULL),
(3718,805,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_exec_saved\";s:6:\"params\";a:3:{i:0;s:7:\"TCGaN-4\";i:1;s:44:\"Spigen and Chinense GaN Fast Charger Testing\";i:2;s:40:\"Sample Charger Testing @Mysore Shyam Lab\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712052123,'CREATE',19,'execution'),
(3719,806,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052130,'PHP',0,NULL),
(3720,807,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuetype - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712052132,'PHP',0,NULL),
(3721,807,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuepriority - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712052132,'PHP',0,NULL),
(3722,807,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$component - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1649',1712052132,'PHP',0,NULL),
(3723,807,2,'GUI - Test Project ID : 134','In TestRun with testrunid: 20, planid: 137, buildid: 2, testcaseid: 156, Notes: p, Status: http://13.235.24.109:83/ltx.php?item=exec&feature_id=11&build_id=2',1712052132,NULL,0,NULL),
(3724,807,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_exec_saved\";s:6:\"params\";a:3:{i:0;s:7:\"TCGaN-4\";i:1;s:44:\"Spigen and Chinense GaN Fast Charger Testing\";i:2;s:40:\"Sample Charger Testing @Mysore Shyam Lab\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712052132,'CREATE',20,'execution'),
(3725,808,2,'GUI - Test Project ID : 134','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /opt/bitnami/testlink/lib/functions/tlTestPlanMetrics.class.php - Line 1026',1712052137,'PHP',0,NULL),
(3726,808,2,'GUI - Test Project ID : 134','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /opt/bitnami/testlink/lib/functions/tlTestPlanMetrics.class.php - Line 1026',1712052137,'PHP',0,NULL),
(3727,809,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuetype - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712052138,'PHP',0,NULL),
(3728,809,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuepriority - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712052138,'PHP',0,NULL),
(3729,809,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$component - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1649',1712052138,'PHP',0,NULL),
(3730,809,2,'GUI - Test Project ID : 134','In TestRun with testrunid: 21, planid: 137, buildid: 2, testcaseid: 156, Notes: p, Status: http://13.235.24.109:83/ltx.php?item=exec&feature_id=11&build_id=2',1712052138,NULL,0,NULL),
(3731,809,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_exec_saved\";s:6:\"params\";a:3:{i:0;s:7:\"TCGaN-4\";i:1;s:44:\"Spigen and Chinense GaN Fast Charger Testing\";i:2;s:40:\"Sample Charger Testing @Mysore Shyam Lab\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712052138,'CREATE',21,'execution'),
(3732,810,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052144,'PHP',0,NULL),
(3733,811,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuetype - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712052147,'PHP',0,NULL),
(3734,811,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuepriority - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712052147,'PHP',0,NULL),
(3735,811,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$component - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1649',1712052147,'PHP',0,NULL),
(3736,811,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_exec_deleted\";s:6:\"params\";a:3:{i:0;s:7:\"TCGaN-4\";i:1;s:44:\"Spigen and Chinense GaN Fast Charger Testing\";i:2;s:40:\"Sample Charger Testing @Mysore Shyam Lab\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712052147,'DELETE',19,'execution'),
(3737,812,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: size - in /opt/bitnami/testlink/gui/templates_c/12a82239248d9e8bd2a95f9018e8967b73321817_0.file.inc_filter_panel.tpl.php - Line 351',1712052161,'PHP',0,NULL),
(3738,813,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uploadOp - in /opt/bitnami/testlink/gui/templates_c/a826a56ec1cd6f3a879499ad99bfecc2df857da3_0.file.containerView.tpl.php - Line 123',1712052161,'PHP',0,NULL),
(3739,814,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052169,'PHP',0,NULL),
(3740,815,32,'GUI - Test Project ID : 134','string \'th_codetracker\' is not localized for locale \'en_US\'  - using en_GB',1712052174,'LOCALIZATION',0,NULL),
(3741,816,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052192,'PHP',0,NULL),
(3742,817,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052200,'PHP',0,NULL),
(3743,818,32,'GUI - Test Project ID : 134','string \'download_csv\' is not localized for locale \'en_US\'  - using en_GB',1712052213,'LOCALIZATION',0,NULL),
(3744,819,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052220,'PHP',0,NULL),
(3745,820,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:33:\"audit_security_user_right_missing\";s:6:\"params\";a:3:{i:0;s:31:\"rj.ravindra@kenestechnology.net\";i:1;s:13:\"reqImport.php\";i:2;s:3:\"any\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712052231,'any',2,'users'),
(3746,821,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052232,'PHP',0,NULL),
(3747,822,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052241,'PHP',0,NULL),
(3748,823,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052245,'PHP',0,NULL),
(3749,824,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: size - in /opt/bitnami/testlink/gui/templates_c/12a82239248d9e8bd2a95f9018e8967b73321817_0.file.inc_filter_panel.tpl.php - Line 351',1712052247,'PHP',0,NULL),
(3750,825,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uploadOp - in /opt/bitnami/testlink/gui/templates_c/a826a56ec1cd6f3a879499ad99bfecc2df857da3_0.file.containerView.tpl.php - Line 123',1712052247,'PHP',0,NULL),
(3751,826,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052250,'PHP',0,NULL),
(3752,827,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/gui/templates_c/ef1685d2aa892938987008051a1410b5b54f388a_0.file.reqSpecEdit.tpl.php - Line 221',1712052250,'PHP',0,NULL),
(3753,827,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/gui/templates_c/ef1685d2aa892938987008051a1410b5b54f388a_0.file.reqSpecEdit.tpl.php - Line 245',1712052250,'PHP',0,NULL),
(3754,827,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/gui/templates_c/ef1685d2aa892938987008051a1410b5b54f388a_0.file.reqSpecEdit.tpl.php - Line 277',1712052250,'PHP',0,NULL),
(3755,828,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:33:\"audit_security_user_right_missing\";s:6:\"params\";a:3:{i:0;s:31:\"rj.ravindra@kenestechnology.net\";i:1;s:13:\"reqImport.php\";i:2;s:3:\"any\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712052256,'any',2,'users'),
(3756,829,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052256,'PHP',0,NULL),
(3757,830,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052261,'PHP',0,NULL),
(3758,831,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:33:\"audit_security_user_right_missing\";s:6:\"params\";a:3:{i:0;s:31:\"rj.ravindra@kenestechnology.net\";i:1;s:13:\"reqImport.php\";i:2;s:3:\"any\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712052269,'any',2,'users'),
(3759,832,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052269,'PHP',0,NULL),
(3760,833,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: size - in /opt/bitnami/testlink/gui/templates_c/12a82239248d9e8bd2a95f9018e8967b73321817_0.file.inc_filter_panel.tpl.php - Line 351',1712052296,'PHP',0,NULL),
(3761,834,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uploadOp - in /opt/bitnami/testlink/gui/templates_c/a826a56ec1cd6f3a879499ad99bfecc2df857da3_0.file.containerView.tpl.php - Line 123',1712052296,'PHP',0,NULL),
(3762,835,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:22:\"audit_req_spec_created\";s:6:\"params\";a:2:{i:0;s:11:\"GaN Charger\";i:1;s:19:\"GaN charger Proto 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712052299,'CREATE',160,'req_specs'),
(3763,835,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/gui/templates_c/ef1685d2aa892938987008051a1410b5b54f388a_0.file.reqSpecEdit.tpl.php - Line 221',1712052299,'PHP',0,NULL),
(3764,835,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/gui/templates_c/ef1685d2aa892938987008051a1410b5b54f388a_0.file.reqSpecEdit.tpl.php - Line 245',1712052299,'PHP',0,NULL),
(3765,835,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/gui/templates_c/ef1685d2aa892938987008051a1410b5b54f388a_0.file.reqSpecEdit.tpl.php - Line 277',1712052299,'PHP',0,NULL),
(3766,836,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052316,'PHP',0,NULL),
(3767,837,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052320,'PHP',0,NULL),
(3768,838,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: size - in /opt/bitnami/testlink/gui/templates_c/12a82239248d9e8bd2a95f9018e8967b73321817_0.file.inc_filter_panel.tpl.php - Line 351',1712052329,'PHP',0,NULL),
(3769,839,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uploadOp - in /opt/bitnami/testlink/gui/templates_c/a826a56ec1cd6f3a879499ad99bfecc2df857da3_0.file.containerView.tpl.php - Line 123',1712052329,'PHP',0,NULL),
(3770,840,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uploadOp - in /opt/bitnami/testlink/gui/templates_c/a826a56ec1cd6f3a879499ad99bfecc2df857da3_0.file.containerView.tpl.php - Line 123',1712052465,'PHP',0,NULL),
(3771,841,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052467,'PHP',0,NULL),
(3772,842,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: size - in /opt/bitnami/testlink/gui/templates_c/12a82239248d9e8bd2a95f9018e8967b73321817_0.file.inc_filter_panel.tpl.php - Line 351',1712052488,'PHP',0,NULL),
(3773,843,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uploadOp - in /opt/bitnami/testlink/gui/templates_c/a826a56ec1cd6f3a879499ad99bfecc2df857da3_0.file.containerView.tpl.php - Line 123',1712052488,'PHP',0,NULL),
(3774,844,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: size - in /opt/bitnami/testlink/gui/templates_c/12a82239248d9e8bd2a95f9018e8967b73321817_0.file.inc_filter_panel.tpl.php - Line 351',1712052491,'PHP',0,NULL),
(3775,845,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uploadOp - in /opt/bitnami/testlink/gui/templates_c/a826a56ec1cd6f3a879499ad99bfecc2df857da3_0.file.containerView.tpl.php - Line 123',1712052491,'PHP',0,NULL),
(3776,846,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: user - in /opt/bitnami/testlink/lib/functions/common.php - Line 1925',1712052501,'PHP',0,NULL),
(3777,847,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: user - in /opt/bitnami/testlink/lib/functions/common.php - Line 1925',1712052503,'PHP',0,NULL),
(3778,848,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: size - in /opt/bitnami/testlink/gui/templates_c/12a82239248d9e8bd2a95f9018e8967b73321817_0.file.inc_filter_panel.tpl.php - Line 351',1712052505,'PHP',0,NULL),
(3779,849,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uploadOp - in /opt/bitnami/testlink/gui/templates_c/a826a56ec1cd6f3a879499ad99bfecc2df857da3_0.file.containerView.tpl.php - Line 123',1712052505,'PHP',0,NULL),
(3780,850,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: user - in /opt/bitnami/testlink/lib/functions/common.php - Line 1925',1712052512,'PHP',0,NULL),
(3781,851,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052523,'PHP',0,NULL),
(3782,852,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:32:\"suneel.duth@kaynestechnology.net\";i:1;s:14:\"106.51.174.176\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712052630,'LOGIN',4,'users'),
(3783,853,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_config\' is not localized for locale \'en_US\' ',1712052630,'LOCALIZATION',0,NULL),
(3784,853,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_left_bottom_link\' is not localized for locale \'en_US\' ',1712052630,'LOCALIZATION',0,NULL),
(3785,853,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_right_top_link\' is not localized for locale \'en_US\' ',1712052630,'LOCALIZATION',0,NULL),
(3786,853,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_right_bottom_link\' is not localized for locale \'en_US\' ',1712052630,'LOCALIZATION',0,NULL),
(3787,853,32,'GUI - Test Project ID : 134','string \'poweredBy\' is not localized for locale \'en_US\'  - using en_GB',1712052630,'LOCALIZATION',0,NULL),
(3788,853,32,'GUI - Test Project ID : 134','string \'system_descr\' is not localized for locale \'en_US\'  - using en_GB',1712052630,'LOCALIZATION',0,NULL),
(3789,853,32,'GUI - Test Project ID : 134','string \'href_codetracker_management\' is not localized for locale \'en_US\'  - using en_GB',1712052630,'LOCALIZATION',0,NULL),
(3790,853,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052630,'PHP',0,NULL),
(3791,854,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052652,'PHP',0,NULL),
(3792,855,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052670,'PHP',0,NULL),
(3793,856,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052673,'PHP',0,NULL),
(3794,857,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052674,'PHP',0,NULL),
(3795,858,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/testcase.class.php - Line 5361',1712052681,'PHP',0,NULL),
(3796,859,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/testcase.class.php - Line 5361',1712052700,'PHP',0,NULL),
(3797,859,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/tree.class.php - Line 725',1712052700,'PHP',0,NULL),
(3798,859,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/tree.class.php - Line 725',1712052700,'PHP',0,NULL),
(3799,859,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uploadOp - in /opt/bitnami/testlink/lib/testcases/testcaseCommands.class.php - Line 1129',1712052700,'PHP',0,NULL),
(3800,860,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: size - in /opt/bitnami/testlink/gui/templates_c/12a82239248d9e8bd2a95f9018e8967b73321817_0.file.inc_filter_panel.tpl.php - Line 351',1712052700,'PHP',0,NULL),
(3801,861,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: testcases_to_show - in /opt/bitnami/testlink/lib/plan/planExport.php - Line 150',1712052724,'PHP',0,NULL),
(3802,862,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052737,'PHP',0,NULL),
(3803,863,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052741,'PHP',0,NULL),
(3804,864,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052743,'PHP',0,NULL),
(3805,865,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052773,'PHP',0,NULL),
(3806,866,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052774,'PHP',0,NULL),
(3807,867,16,'GUI','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_login_failed\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:14:\"106.51.174.176\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712052840,'LOGIN_FAILED',1,'users'),
(3808,868,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052855,'PHP',0,NULL),
(3809,869,32,'GUI - Test Project ID : 134','string \'link_report_by_tsuite\' is not localized for locale \'en_US\'  - using en_GB',1712052864,'LOCALIZATION',0,NULL),
(3810,869,32,'GUI - Test Project ID : 134','string \'baseline_l1l2\' is not localized for locale \'en_US\'  - using en_GB',1712052864,'LOCALIZATION',0,NULL),
(3811,869,32,'GUI - Test Project ID : 134','string \'link_report_test_absolute_latest_exec\' is not localized for locale \'en_US\'  - using en_GB',1712052864,'LOCALIZATION',0,NULL),
(3812,869,32,'GUI - Test Project ID : 134','string \'link_report_never_run\' is not localized for locale \'en_US\'  - using en_GB',1712052864,'LOCALIZATION',0,NULL),
(3813,869,32,'GUI - Test Project ID : 134','string \'link_report_exec_timeline\' is not localized for locale \'en_US\'  - using en_GB',1712052864,'LOCALIZATION',0,NULL),
(3814,870,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:17:\"audit_user_logout\";s:6:\"params\";a:1:{i:0;s:32:\"suneel.duth@kaynestechnology.net\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712052867,'LOGOUT',4,'users'),
(3815,871,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:32:\"suneel.duth@kaynestechnology.net\";i:1;s:14:\"106.51.174.176\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712052874,'LOGIN',4,'users'),
(3816,872,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_config\' is not localized for locale \'en_US\' ',1712052874,'LOCALIZATION',0,NULL),
(3817,872,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_left_bottom_link\' is not localized for locale \'en_US\' ',1712052874,'LOCALIZATION',0,NULL),
(3818,872,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_right_top_link\' is not localized for locale \'en_US\' ',1712052874,'LOCALIZATION',0,NULL),
(3819,872,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_right_bottom_link\' is not localized for locale \'en_US\' ',1712052874,'LOCALIZATION',0,NULL),
(3820,872,32,'GUI - Test Project ID : 134','string \'poweredBy\' is not localized for locale \'en_US\'  - using en_GB',1712052874,'LOCALIZATION',0,NULL),
(3821,872,32,'GUI - Test Project ID : 134','string \'system_descr\' is not localized for locale \'en_US\'  - using en_GB',1712052874,'LOCALIZATION',0,NULL),
(3822,872,32,'GUI - Test Project ID : 134','string \'href_codetracker_management\' is not localized for locale \'en_US\'  - using en_GB',1712052874,'LOCALIZATION',0,NULL),
(3823,872,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052874,'PHP',0,NULL),
(3824,873,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:14:\"106.51.174.176\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712052882,'LOGIN',1,'users'),
(3825,874,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_config\' is not localized for locale \'en_US\' ',1712052882,'LOCALIZATION',0,NULL),
(3826,874,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_left_bottom_link\' is not localized for locale \'en_US\' ',1712052882,'LOCALIZATION',0,NULL),
(3827,874,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_right_top_link\' is not localized for locale \'en_US\' ',1712052883,'LOCALIZATION',0,NULL),
(3828,874,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_right_bottom_link\' is not localized for locale \'en_US\' ',1712052883,'LOCALIZATION',0,NULL),
(3829,874,32,'GUI - Test Project ID : 134','string \'poweredBy\' is not localized for locale \'en_US\'  - using en_GB',1712052883,'LOCALIZATION',0,NULL),
(3830,874,32,'GUI - Test Project ID : 134','string \'system_descr\' is not localized for locale \'en_US\'  - using en_GB',1712052883,'LOCALIZATION',0,NULL),
(3831,874,32,'GUI - Test Project ID : 134','string \'href_codetracker_management\' is not localized for locale \'en_US\'  - using en_GB',1712052883,'LOCALIZATION',0,NULL),
(3832,875,32,'GUI - Test Project ID : 134','string \'expiration\' is not localized for locale \'en_US\'  - using en_GB',1712052886,'LOCALIZATION',0,NULL),
(3833,875,32,'GUI - Test Project ID : 134','string \'expiration_date\' is not localized for locale \'en_US\'  - using en_GB',1712052886,'LOCALIZATION',0,NULL),
(3834,876,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_user_saved\";s:6:\"params\";a:1:{i:0;s:32:\"suneel.duth@kaynestechnology.net\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712052895,'SAVE',4,'users'),
(3835,877,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052900,'PHP',0,NULL),
(3836,878,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052902,'PHP',0,NULL),
(3837,879,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052925,'PHP',0,NULL),
(3838,880,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052927,'PHP',0,NULL),
(3839,881,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052929,'PHP',0,NULL),
(3840,882,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052930,'PHP',0,NULL),
(3841,883,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712052930,'PHP',0,NULL),
(3842,884,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: user - in /opt/bitnami/testlink/lib/functions/common.php - Line 1925',1712053040,'PHP',0,NULL),
(3843,885,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: user - in /opt/bitnami/testlink/lib/functions/common.php - Line 1925',1712053060,'PHP',0,NULL),
(3844,886,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: user - in /opt/bitnami/testlink/lib/functions/common.php - Line 1925',1712053062,'PHP',0,NULL),
(3845,887,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: user - in /opt/bitnami/testlink/lib/functions/common.php - Line 1925',1712053072,'PHP',0,NULL),
(3846,888,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: user - in /opt/bitnami/testlink/lib/functions/common.php - Line 1925',1712053077,'PHP',0,NULL),
(3847,889,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: user - in /opt/bitnami/testlink/lib/functions/common.php - Line 1925',1712053098,'PHP',0,NULL),
(3848,890,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: user - in /opt/bitnami/testlink/lib/functions/common.php - Line 1925',1712053099,'PHP',0,NULL),
(3849,891,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: user - in /opt/bitnami/testlink/lib/functions/common.php - Line 1925',1712053100,'PHP',0,NULL),
(3850,892,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: user - in /opt/bitnami/testlink/lib/functions/common.php - Line 1925',1712053100,'PHP',0,NULL),
(3851,893,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: user - in /opt/bitnami/testlink/lib/functions/common.php - Line 1925',1712053101,'PHP',0,NULL),
(3852,894,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: user - in /opt/bitnami/testlink/lib/functions/common.php - Line 1925',1712053101,'PHP',0,NULL),
(3853,895,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:17:\"audit_user_logout\";s:6:\"params\";a:1:{i:0;s:31:\"rj.ravindra@kenestechnology.net\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712053111,'LOGOUT',2,'users'),
(3854,896,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:31:\"rj.ravindra@kenestechnology.net\";i:1;s:14:\"106.51.174.176\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712053117,'LOGIN',2,'users'),
(3855,897,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_config\' is not localized for locale \'en_US\' ',1712053118,'LOCALIZATION',0,NULL),
(3856,897,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_left_bottom_link\' is not localized for locale \'en_US\' ',1712053118,'LOCALIZATION',0,NULL),
(3857,897,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_right_top_link\' is not localized for locale \'en_US\' ',1712053118,'LOCALIZATION',0,NULL),
(3858,897,32,'GUI - Test Project ID : 134','string \'plugin_TLTest_right_bottom_link\' is not localized for locale \'en_US\' ',1712053118,'LOCALIZATION',0,NULL),
(3859,897,32,'GUI - Test Project ID : 134','string \'poweredBy\' is not localized for locale \'en_US\'  - using en_GB',1712053118,'LOCALIZATION',0,NULL),
(3860,897,32,'GUI - Test Project ID : 134','string \'system_descr\' is not localized for locale \'en_US\'  - using en_GB',1712053118,'LOCALIZATION',0,NULL),
(3861,897,32,'GUI - Test Project ID : 134','string \'href_codetracker_management\' is not localized for locale \'en_US\'  - using en_GB',1712053118,'LOCALIZATION',0,NULL),
(3862,897,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712053118,'PHP',0,NULL),
(3863,898,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: user - in /opt/bitnami/testlink/lib/functions/common.php - Line 1925',1712053140,'PHP',0,NULL),
(3864,899,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: user - in /opt/bitnami/testlink/lib/functions/common.php - Line 1925',1712053154,'PHP',0,NULL),
(3865,900,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: size - in /opt/bitnami/testlink/gui/templates_c/12a82239248d9e8bd2a95f9018e8967b73321817_0.file.inc_filter_panel.tpl.php - Line 351',1712053156,'PHP',0,NULL),
(3866,901,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uploadOp - in /opt/bitnami/testlink/gui/templates_c/a826a56ec1cd6f3a879499ad99bfecc2df857da3_0.file.containerView.tpl.php - Line 123',1712053156,'PHP',0,NULL),
(3867,902,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: user - in /opt/bitnami/testlink/lib/functions/common.php - Line 1925',1712053183,'PHP',0,NULL),
(3868,903,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: user - in /opt/bitnami/testlink/lib/functions/common.php - Line 1925',1712053186,'PHP',0,NULL),
(3869,904,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: user - in /opt/bitnami/testlink/lib/functions/common.php - Line 1925',1712053191,'PHP',0,NULL),
(3870,905,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712053192,'PHP',0,NULL),
(3871,906,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: user - in /opt/bitnami/testlink/lib/functions/common.php - Line 1925',1712053274,'PHP',0,NULL),
(3872,907,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712053281,'PHP',0,NULL),
(3873,908,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_user_saved\";s:6:\"params\";a:1:{i:0;s:31:\"rj.ravindra@kenestechnology.net\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712053286,'SAVE',2,'users'),
(3874,909,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: user - in /opt/bitnami/testlink/lib/functions/common.php - Line 1925',1712053388,'PHP',0,NULL),
(3875,910,32,'GUI - Test Project ID : 134','string \'expiration\' is not localized for locale \'en_US\'  - using en_GB',1712053390,'LOCALIZATION',0,NULL),
(3876,910,32,'GUI - Test Project ID : 134','string \'expiration_date\' is not localized for locale \'en_US\'  - using en_GB',1712053390,'LOCALIZATION',0,NULL),
(3877,911,32,'GUI - Test Project ID : 134','string \'without_platforms\' is not localized for locale \'en_US\'  - using en_GB',1712053402,'LOCALIZATION',0,NULL),
(3878,911,32,'GUI - Test Project ID : 134','string \'use_latest_exec_on_contex_for_counters\' is not localized for locale \'en_US\'  - using en_GB',1712053402,'LOCALIZATION',0,NULL),
(3879,911,32,'GUI - Test Project ID : 134','string \'use_latest_exec_on_testplan_for_counters\' is not localized for locale \'en_US\'  - using en_GB',1712053402,'LOCALIZATION',0,NULL),
(3880,911,32,'GUI - Test Project ID : 134','string \'exec_tree_counters_logic\' is not localized for locale \'en_US\'  - using en_GB',1712053402,'LOCALIZATION',0,NULL),
(3881,911,32,'GUI - Test Project ID : 134','string \'platforms\' is not localized for locale \'en_US\'  - using en_GB',1712053402,'LOCALIZATION',0,NULL),
(3882,912,32,'GUI - Test Project ID : 134','string \'restAPIExecParameters\' is not localized for locale \'en_US\'  - using en_GB',1712053402,'LOCALIZATION',0,NULL),
(3883,913,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: size - in /opt/bitnami/testlink/gui/templates_c/12a82239248d9e8bd2a95f9018e8967b73321817_0.file.inc_filter_panel.tpl.php - Line 351',1712053418,'PHP',0,NULL),
(3884,914,32,'GUI - Test Project ID : 134','string \'file_upload_ko\' is not localized for locale \'en_US\'  - using en_GB',1712053418,'LOCALIZATION',0,NULL),
(3885,914,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uploadOp - in /opt/bitnami/testlink/gui/templates_c/a826a56ec1cd6f3a879499ad99bfecc2df857da3_0.file.containerView.tpl.php - Line 123',1712053418,'PHP',0,NULL),
(3886,914,32,'GUI - Test Project ID : 134','string \'allowed_files\' is not localized for locale \'en_US\'  - using en_GB',1712053418,'LOCALIZATION',0,NULL),
(3887,914,32,'GUI - Test Project ID : 134','string \'allowed_filenames_regexp\' is not localized for locale \'en_US\'  - using en_GB',1712053418,'LOCALIZATION',0,NULL),
(3888,915,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712053419,'PHP',0,NULL),
(3889,916,32,'GUI - Test Project ID : 134','string \'link_report_by_tsuite\' is not localized for locale \'en_US\'  - using en_GB',1712053425,'LOCALIZATION',0,NULL),
(3890,916,32,'GUI - Test Project ID : 134','string \'baseline_l1l2\' is not localized for locale \'en_US\'  - using en_GB',1712053425,'LOCALIZATION',0,NULL),
(3891,916,32,'GUI - Test Project ID : 134','string \'link_report_test_absolute_latest_exec\' is not localized for locale \'en_US\'  - using en_GB',1712053425,'LOCALIZATION',0,NULL),
(3892,916,32,'GUI - Test Project ID : 134','string \'link_report_never_run\' is not localized for locale \'en_US\'  - using en_GB',1712053425,'LOCALIZATION',0,NULL),
(3893,916,32,'GUI - Test Project ID : 134','string \'link_report_exec_timeline\' is not localized for locale \'en_US\'  - using en_GB',1712053425,'LOCALIZATION',0,NULL),
(3894,917,32,'GUI - Test Project ID : 134','string \'FILE_UPLOAD_allowed_filenames_regexp\' is not localized for locale \'en_US\'  - using en_GB',1712053443,'LOCALIZATION',0,NULL),
(3895,918,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uploadOp - in /opt/bitnami/testlink/gui/templates_c/a826a56ec1cd6f3a879499ad99bfecc2df857da3_0.file.containerView.tpl.php - Line 123',1712053504,'PHP',0,NULL),
(3896,919,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: size - in /opt/bitnami/testlink/gui/templates_c/12a82239248d9e8bd2a95f9018e8967b73321817_0.file.inc_filter_panel.tpl.php - Line 351',1712053505,'PHP',0,NULL),
(3897,920,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uploadOp - in /opt/bitnami/testlink/gui/templates_c/a826a56ec1cd6f3a879499ad99bfecc2df857da3_0.file.containerView.tpl.php - Line 123',1712053505,'PHP',0,NULL),
(3898,921,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: items2loop - in /opt/bitnami/testlink/lib/results/resultsGeneral.php - Line 65',1712053559,'PHP',0,NULL),
(3899,921,2,'GUI - Test Project ID : 134','E_WARNING\nInvalid argument supplied for foreach() - in /opt/bitnami/testlink/lib/results/resultsGeneral.php - Line 65',1712053559,'PHP',0,NULL),
(3900,921,32,'GUI - Test Project ID : 134','string \'title_res_by_kw_on_plat\' is not localized for locale \'en_US\'  - using en_GB',1712053559,'LOCALIZATION',0,NULL),
(3901,921,32,'GUI - Test Project ID : 134','string \'title_res_by_prio_on_plat\' is not localized for locale \'en_US\'  - using en_GB',1712053559,'LOCALIZATION',0,NULL),
(3902,921,32,'GUI - Test Project ID : 134','string \'title_res_by_tl_testsuite_on_plat\' is not localized for locale \'en_US\'  - using en_GB',1712053559,'LOCALIZATION',0,NULL),
(3903,921,32,'GUI - Test Project ID : 134','string \'title_res_by_tl_testsuite\' is not localized for locale \'en_US\'  - using en_GB',1712053559,'LOCALIZATION',0,NULL),
(3904,921,32,'GUI - Test Project ID : 134','string \'title_res_build\' is not localized for locale \'en_US\'  - using en_GB',1712053559,'LOCALIZATION',0,NULL),
(3905,921,32,'GUI - Test Project ID : 134','string \'title_res_by_build_on_plat\' is not localized for locale \'en_US\'  - using en_GB',1712053559,'LOCALIZATION',0,NULL),
(3906,922,32,'GUI - Test Project ID : 134','string \'FILE_UPLOAD_allowed_filenames_regexp\' is not localized for locale \'en_US\'  - using en_GB',1712053651,'LOCALIZATION',0,NULL),
(3907,923,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: size - in /opt/bitnami/testlink/gui/templates_c/12a82239248d9e8bd2a95f9018e8967b73321817_0.file.inc_filter_panel.tpl.php - Line 351',1712053651,'PHP',0,NULL),
(3908,924,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: size - in /opt/bitnami/testlink/gui/templates_c/12a82239248d9e8bd2a95f9018e8967b73321817_0.file.inc_filter_panel.tpl.php - Line 351',1712053754,'PHP',0,NULL),
(3909,925,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/specview.php - Line 705',1712053758,'PHP',0,NULL),
(3910,925,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/specview.php - Line 710',1712053758,'PHP',0,NULL),
(3911,925,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/specview.php - Line 747',1712053758,'PHP',0,NULL),
(3912,925,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/specview.php - Line 1164',1712053758,'PHP',0,NULL),
(3913,926,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/specview.php - Line 705',1712053758,'PHP',0,NULL),
(3914,926,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/specview.php - Line 710',1712053758,'PHP',0,NULL),
(3915,926,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/specview.php - Line 747',1712053758,'PHP',0,NULL),
(3916,926,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/specview.php - Line 1164',1712053758,'PHP',0,NULL),
(3917,927,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:32:\"TCGaN-6 : Test Report of Proto 1\";i:1;s:1:\"1\";i:2;s:19:\"GaN Charger Proto 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712053761,'ASSIGN',153,'testplans'),
(3918,927,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/specview.php - Line 705',1712053761,'PHP',0,NULL),
(3919,927,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/specview.php - Line 710',1712053761,'PHP',0,NULL),
(3920,927,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/specview.php - Line 747',1712053761,'PHP',0,NULL),
(3921,927,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/specview.php - Line 1164',1712053761,'PHP',0,NULL),
(3922,927,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/gui/templates_c/56889df98de7ae8b0bc28961d8c4d1c24b8ef6c7_0.file.planAddTC_m1.tpl.php - Line 462',1712053761,'PHP',0,NULL),
(3923,927,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/gui/templates_c/56889df98de7ae8b0bc28961d8c4d1c24b8ef6c7_0.file.planAddTC_m1.tpl.php - Line 467',1712053761,'PHP',0,NULL),
(3924,927,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/gui/templates_c/56889df98de7ae8b0bc28961d8c4d1c24b8ef6c7_0.file.planAddTC_m1.tpl.php - Line 479',1712053761,'PHP',0,NULL),
(3925,928,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: size - in /opt/bitnami/testlink/gui/templates_c/12a82239248d9e8bd2a95f9018e8967b73321817_0.file.inc_filter_panel.tpl.php - Line 351',1712053761,'PHP',0,NULL),
(3926,929,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/specview.php - Line 705',1712053766,'PHP',0,NULL),
(3927,929,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/specview.php - Line 710',1712053766,'PHP',0,NULL),
(3928,929,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/specview.php - Line 747',1712053766,'PHP',0,NULL),
(3929,929,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/specview.php - Line 1164',1712053766,'PHP',0,NULL),
(3930,929,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/gui/templates_c/56889df98de7ae8b0bc28961d8c4d1c24b8ef6c7_0.file.planAddTC_m1.tpl.php - Line 462',1712053766,'PHP',0,NULL),
(3931,929,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/gui/templates_c/56889df98de7ae8b0bc28961d8c4d1c24b8ef6c7_0.file.planAddTC_m1.tpl.php - Line 467',1712053766,'PHP',0,NULL),
(3932,929,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/gui/templates_c/56889df98de7ae8b0bc28961d8c4d1c24b8ef6c7_0.file.planAddTC_m1.tpl.php - Line 479',1712053766,'PHP',0,NULL),
(3933,930,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: size - in /opt/bitnami/testlink/gui/templates_c/12a82239248d9e8bd2a95f9018e8967b73321817_0.file.inc_filter_panel.tpl.php - Line 351',1712053766,'PHP',0,NULL),
(3934,931,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/specview.php - Line 705',1712053774,'PHP',0,NULL),
(3935,931,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/specview.php - Line 710',1712053774,'PHP',0,NULL),
(3936,931,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/specview.php - Line 747',1712053774,'PHP',0,NULL),
(3937,931,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/specview.php - Line 1164',1712053774,'PHP',0,NULL),
(3938,931,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/gui/templates_c/56889df98de7ae8b0bc28961d8c4d1c24b8ef6c7_0.file.planAddTC_m1.tpl.php - Line 462',1712053774,'PHP',0,NULL),
(3939,931,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/gui/templates_c/56889df98de7ae8b0bc28961d8c4d1c24b8ef6c7_0.file.planAddTC_m1.tpl.php - Line 467',1712053774,'PHP',0,NULL),
(3940,931,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/gui/templates_c/56889df98de7ae8b0bc28961d8c4d1c24b8ef6c7_0.file.planAddTC_m1.tpl.php - Line 479',1712053774,'PHP',0,NULL),
(3941,932,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uploadOp - in /opt/bitnami/testlink/gui/templates_c/5760ab2fbcb6be6f977f78c58e2ad16e85ecd1e3_0.file.planEdit.tpl.php - Line 130',1712053782,'PHP',0,NULL),
(3942,932,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$itemID - in /opt/bitnami/testlink/gui/templates_c/5760ab2fbcb6be6f977f78c58e2ad16e85ecd1e3_0.file.planEdit.tpl.php - Line 152',1712053782,'PHP',0,NULL),
(3943,932,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index:  - in /opt/bitnami/testlink/gui/templates_c/5760ab2fbcb6be6f977f78c58e2ad16e85ecd1e3_0.file.planEdit.tpl.php - Line 302',1712053782,'PHP',0,NULL),
(3944,933,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:20:\"audit_testplan_saved\";s:6:\"params\";a:2:{i:0;s:11:\"GaN Charger\";i:1;s:19:\"GaN Charger Proto 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712053791,'SAVE',153,'testplans'),
(3945,934,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uribase - in /opt/bitnami/testlink/lib/issuetrackerintegration/bugzillaxmlrpcInterface.class.php - Line 65',1712053807,'PHP',0,NULL),
(3946,934,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuetype - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712053807,'PHP',0,NULL),
(3947,934,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuepriority - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712053807,'PHP',0,NULL),
(3948,934,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$component - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1649',1712053807,'PHP',0,NULL),
(3949,934,32,'GUI - Test Project ID : 134','string \'issue_subject_tcname\' is not localized for locale \'en_US\'  - using en_GB',1712053807,'LOCALIZATION',0,NULL),
(3950,934,32,'GUI - Test Project ID : 134','string \'issue_subject_tcpathname\' is not localized for locale \'en_US\'  - using en_GB',1712053807,'LOCALIZATION',0,NULL),
(3951,934,32,'GUI - Test Project ID : 134','string \'issue_subject_projectname\' is not localized for locale \'en_US\'  - using en_GB',1712053807,'LOCALIZATION',0,NULL),
(3952,934,32,'GUI - Test Project ID : 134','string \'issue_subject_planname\' is not localized for locale \'en_US\'  - using en_GB',1712053807,'LOCALIZATION',0,NULL),
(3953,934,32,'GUI - Test Project ID : 134','string \'issue_subject_buildname\' is not localized for locale \'en_US\'  - using en_GB',1712053807,'LOCALIZATION',0,NULL),
(3954,934,32,'GUI - Test Project ID : 134','string \'issue_subject_platfname\' is not localized for locale \'en_US\'  - using en_GB',1712053807,'LOCALIZATION',0,NULL),
(3955,934,32,'GUI - Test Project ID : 134','string \'issue_subject_execon\' is not localized for locale \'en_US\'  - using en_GB',1712053807,'LOCALIZATION',0,NULL),
(3956,934,32,'GUI - Test Project ID : 134','string \'add_link_to_tlexec_print_view\' is not localized for locale \'en_US\'  - using en_GB',1712053807,'LOCALIZATION',0,NULL),
(3957,934,32,'GUI - Test Project ID : 134','string \'copy_attachments_from_latest_exec\' is not localized for locale \'en_US\'  - using en_GB',1712053807,'LOCALIZATION',0,NULL),
(3958,934,32,'GUI - Test Project ID : 134','string \'hasNewestVersionMsg\' is not localized for locale \'en_US\'  - using en_GB',1712053807,'LOCALIZATION',0,NULL),
(3959,934,32,'GUI - Test Project ID : 134','string \'partialExecNoAttachmentsWarning\' is not localized for locale \'en_US\'  - using en_GB',1712053807,'LOCALIZATION',0,NULL),
(3960,934,32,'GUI - Test Project ID : 134','string \'partialExecNothingToSave\' is not localized for locale \'en_US\'  - using en_GB',1712053807,'LOCALIZATION',0,NULL),
(3961,934,32,'GUI - Test Project ID : 134','string \'saveStepsForPartialExec\' is not localized for locale \'en_US\'  - using en_GB',1712053807,'LOCALIZATION',0,NULL),
(3962,934,32,'GUI - Test Project ID : 134','string \'updateLinkToLatestTCVersion\' is not localized for locale \'en_US\'  - using en_GB',1712053807,'LOCALIZATION',0,NULL),
(3963,934,32,'GUI - Test Project ID : 134','string \'pleaseOpenTSuite\' is not localized for locale \'en_US\'  - using en_GB',1712053807,'LOCALIZATION',0,NULL),
(3964,934,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/gui/templates_c/8f7d50b23a3ad2636127523615ed9c295157f12b_0.file.inc_exec_show_tc_exec.tpl.php - Line 244',1712053807,'PHP',0,NULL),
(3965,935,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuetype - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712053882,'PHP',0,NULL),
(3966,935,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuepriority - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712053882,'PHP',0,NULL),
(3967,935,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$component - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1649',1712053882,'PHP',0,NULL),
(3968,935,2,'GUI - Test Project ID : 134','In TestRun with testrunid: 22, planid: 153, buildid: 3, testcaseid: 162, Notes: p, Status: http://13.235.24.109:83/ltx.php?item=exec&feature_id=13&build_id=3',1712053882,NULL,0,NULL),
(3969,935,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_exec_saved\";s:6:\"params\";a:3:{i:0;s:7:\"TCGaN-6\";i:1;s:7:\"Proto 1\";i:2;s:19:\"GaN Charger Proto 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712053882,'CREATE',22,'execution'),
(3970,936,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuetype - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712053931,'PHP',0,NULL),
(3971,936,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuepriority - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712053931,'PHP',0,NULL),
(3972,936,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$component - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1649',1712053931,'PHP',0,NULL),
(3973,936,2,'GUI - Test Project ID : 134','In TestRun with testrunid: 23, planid: 153, buildid: 3, testcaseid: 162, Notes: p, Status: http://13.235.24.109:83/ltx.php?item=exec&feature_id=13&build_id=3',1712053931,NULL,0,NULL),
(3974,936,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_exec_saved\";s:6:\"params\";a:3:{i:0;s:7:\"TCGaN-6\";i:1;s:7:\"Proto 1\";i:2;s:19:\"GaN Charger Proto 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712053931,'CREATE',23,'execution'),
(3975,937,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 1 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 45',1712053983,'PHP',0,NULL),
(3976,937,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 1 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 46',1712053983,'PHP',0,NULL),
(3977,937,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 1 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 47',1712053983,'PHP',0,NULL),
(3978,937,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 2 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 45',1712053983,'PHP',0,NULL),
(3979,937,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 2 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 46',1712053983,'PHP',0,NULL),
(3980,937,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 2 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 47',1712053983,'PHP',0,NULL),
(3981,937,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 3 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 45',1712053983,'PHP',0,NULL),
(3982,937,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 3 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 46',1712053983,'PHP',0,NULL),
(3983,937,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 3 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 47',1712053983,'PHP',0,NULL),
(3984,937,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 4 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 45',1712053983,'PHP',0,NULL),
(3985,937,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 4 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 46',1712053983,'PHP',0,NULL),
(3986,937,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 4 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 47',1712053983,'PHP',0,NULL),
(3987,937,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 5 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 45',1712053983,'PHP',0,NULL),
(3988,937,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 5 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 46',1712053983,'PHP',0,NULL),
(3989,937,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 5 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 47',1712053983,'PHP',0,NULL),
(3990,938,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:24:\"audit_attachment_created\";s:6:\"params\";a:2:{i:0;N;i:1;s:8:\"MPD.xlsx\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712054018,'CREATE',23,'attachments'),
(3991,938,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 1 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 45',1712054018,'PHP',0,NULL),
(3992,938,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 1 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 46',1712054018,'PHP',0,NULL),
(3993,938,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 1 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 47',1712054018,'PHP',0,NULL),
(3994,938,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 2 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 45',1712054018,'PHP',0,NULL),
(3995,938,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 2 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 46',1712054018,'PHP',0,NULL),
(3996,938,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 2 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 47',1712054018,'PHP',0,NULL),
(3997,938,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 3 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 45',1712054018,'PHP',0,NULL),
(3998,938,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 3 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 46',1712054018,'PHP',0,NULL),
(3999,938,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 3 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 47',1712054018,'PHP',0,NULL),
(4000,938,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 4 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 45',1712054018,'PHP',0,NULL),
(4001,938,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 4 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 46',1712054018,'PHP',0,NULL),
(4002,938,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 4 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 47',1712054018,'PHP',0,NULL),
(4003,938,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 5 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 45',1712054018,'PHP',0,NULL),
(4004,938,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 5 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 46',1712054018,'PHP',0,NULL),
(4005,938,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 5 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 47',1712054018,'PHP',0,NULL),
(4006,939,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuetype - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712054021,'PHP',0,NULL),
(4007,939,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuepriority - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712054021,'PHP',0,NULL),
(4008,939,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$component - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1649',1712054021,'PHP',0,NULL),
(4009,940,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:24:\"audit_attachment_deleted\";s:6:\"params\";a:1:{i:0;s:0:\"\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712054032,'DELETE',1,'attachments'),
(4010,941,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuetype - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712054035,'PHP',0,NULL),
(4011,941,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuepriority - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712054035,'PHP',0,NULL),
(4012,941,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$component - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1649',1712054035,'PHP',0,NULL),
(4013,942,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:24:\"audit_attachment_created\";s:6:\"params\";a:2:{i:0;N;i:1;s:10:\"M_P_D.xlsx\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712054083,'CREATE',23,'attachments'),
(4014,942,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 1 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 45',1712054083,'PHP',0,NULL),
(4015,942,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 1 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 46',1712054083,'PHP',0,NULL),
(4016,942,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 1 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 47',1712054083,'PHP',0,NULL),
(4017,942,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 2 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 45',1712054083,'PHP',0,NULL),
(4018,942,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 2 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 46',1712054083,'PHP',0,NULL),
(4019,942,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 2 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 47',1712054083,'PHP',0,NULL),
(4020,942,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 3 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 45',1712054083,'PHP',0,NULL),
(4021,942,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 3 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 46',1712054083,'PHP',0,NULL),
(4022,942,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 3 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 47',1712054083,'PHP',0,NULL),
(4023,942,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 4 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 45',1712054083,'PHP',0,NULL),
(4024,942,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 4 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 46',1712054083,'PHP',0,NULL),
(4025,942,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 4 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 47',1712054083,'PHP',0,NULL),
(4026,942,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 5 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 45',1712054083,'PHP',0,NULL),
(4027,942,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 5 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 46',1712054083,'PHP',0,NULL),
(4028,942,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 5 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 47',1712054083,'PHP',0,NULL),
(4029,943,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuetype - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712054092,'PHP',0,NULL),
(4030,943,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuepriority - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712054092,'PHP',0,NULL),
(4031,943,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$component - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1649',1712054092,'PHP',0,NULL),
(4032,944,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:24:\"audit_attachment_deleted\";s:6:\"params\";a:1:{i:0;s:0:\"\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712054102,'DELETE',2,'attachments'),
(4033,945,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuetype - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712054104,'PHP',0,NULL),
(4034,945,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuepriority - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712054104,'PHP',0,NULL),
(4035,945,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$component - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1649',1712054104,'PHP',0,NULL),
(4036,946,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: user - in /opt/bitnami/testlink/lib/functions/common.php - Line 1925',1712054110,'PHP',0,NULL),
(4037,947,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuetype - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712054121,'PHP',0,NULL),
(4038,947,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuepriority - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712054121,'PHP',0,NULL),
(4039,947,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$component - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1649',1712054121,'PHP',0,NULL),
(4040,948,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuetype - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712054298,'PHP',0,NULL),
(4041,948,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuepriority - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712054298,'PHP',0,NULL),
(4042,948,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$component - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1649',1712054298,'PHP',0,NULL),
(4043,948,2,'GUI - Test Project ID : 134','In TestRun with testrunid: 24, planid: 153, buildid: 3, testcaseid: 162, Notes: p, Status: http://13.235.24.109:83/ltx.php?item=exec&feature_id=13&build_id=3',1712054298,NULL,0,NULL),
(4044,948,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_exec_saved\";s:6:\"params\";a:3:{i:0;s:7:\"TCGaN-6\";i:1;s:7:\"Proto 1\";i:2;s:19:\"GaN Charger Proto 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712054298,'CREATE',24,'execution'),
(4045,949,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuetype - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712054359,'PHP',0,NULL),
(4046,949,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuepriority - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712054359,'PHP',0,NULL),
(4047,949,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$component - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1649',1712054359,'PHP',0,NULL),
(4048,949,2,'GUI - Test Project ID : 134','In TestRun with testrunid: 25, planid: 153, buildid: 3, testcaseid: 162, Notes: p, Status: http://13.235.24.109:83/ltx.php?item=exec&feature_id=13&build_id=3',1712054359,NULL,0,NULL),
(4049,949,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_exec_saved\";s:6:\"params\";a:3:{i:0;s:7:\"TCGaN-6\";i:1;s:7:\"Proto 1\";i:2;s:19:\"GaN Charger Proto 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712054359,'CREATE',25,'execution'),
(4050,950,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuetype - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712054403,'PHP',0,NULL),
(4051,950,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuepriority - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712054403,'PHP',0,NULL),
(4052,950,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$component - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1649',1712054403,'PHP',0,NULL),
(4053,950,2,'GUI - Test Project ID : 134','In TestRun with testrunid: 26, planid: 153, buildid: 3, testcaseid: 162, Notes: p, Status: http://13.235.24.109:83/ltx.php?item=exec&feature_id=13&build_id=3',1712054403,NULL,0,NULL),
(4054,950,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_exec_saved\";s:6:\"params\";a:3:{i:0;s:7:\"TCGaN-6\";i:1;s:7:\"Proto 1\";i:2;s:19:\"GaN Charger Proto 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712054403,'CREATE',26,'execution'),
(4055,951,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuetype - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712054413,'PHP',0,NULL),
(4056,951,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuepriority - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712054413,'PHP',0,NULL),
(4057,951,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$component - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1649',1712054413,'PHP',0,NULL),
(4058,951,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:24:\"audit_attachment_deleted\";s:6:\"params\";a:1:{i:0;s:0:\"\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712054413,'DELETE',3,'attachments'),
(4059,951,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_exec_deleted\";s:6:\"params\";a:3:{i:0;s:7:\"TCGaN-6\";i:1;s:7:\"Proto 1\";i:2;s:19:\"GaN Charger Proto 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712054413,'DELETE',26,'execution'),
(4060,952,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuetype - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712054417,'PHP',0,NULL),
(4061,952,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuepriority - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712054417,'PHP',0,NULL),
(4062,952,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$component - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1649',1712054417,'PHP',0,NULL),
(4063,952,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_exec_deleted\";s:6:\"params\";a:3:{i:0;s:7:\"TCGaN-6\";i:1;s:7:\"Proto 1\";i:2;s:19:\"GaN Charger Proto 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712054417,'DELETE',25,'execution'),
(4064,953,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuetype - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712054423,'PHP',0,NULL),
(4065,953,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuepriority - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712054423,'PHP',0,NULL),
(4066,953,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$component - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1649',1712054423,'PHP',0,NULL),
(4067,953,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_exec_deleted\";s:6:\"params\";a:3:{i:0;s:7:\"TCGaN-6\";i:1;s:7:\"Proto 1\";i:2;s:19:\"GaN Charger Proto 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712054423,'DELETE',24,'execution'),
(4068,954,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuetype - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712054427,'PHP',0,NULL),
(4069,954,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuepriority - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712054427,'PHP',0,NULL),
(4070,954,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$component - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1649',1712054427,'PHP',0,NULL),
(4071,954,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_exec_deleted\";s:6:\"params\";a:3:{i:0;s:7:\"TCGaN-6\";i:1;s:7:\"Proto 1\";i:2;s:19:\"GaN Charger Proto 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712054427,'DELETE',23,'execution'),
(4072,955,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712054527,'PHP',0,NULL),
(4073,956,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712054553,'PHP',0,NULL),
(4074,957,32,'GUI - Test Project ID : 134','string \'without_platforms\' is not localized for locale \'en_US\'  - using en_GB',1712054558,'LOCALIZATION',0,NULL),
(4075,957,32,'GUI - Test Project ID : 134','string \'use_latest_exec_on_contex_for_counters\' is not localized for locale \'en_US\'  - using en_GB',1712054558,'LOCALIZATION',0,NULL),
(4076,957,32,'GUI - Test Project ID : 134','string \'use_latest_exec_on_testplan_for_counters\' is not localized for locale \'en_US\'  - using en_GB',1712054558,'LOCALIZATION',0,NULL),
(4077,957,32,'GUI - Test Project ID : 134','string \'exec_tree_counters_logic\' is not localized for locale \'en_US\'  - using en_GB',1712054558,'LOCALIZATION',0,NULL),
(4078,957,32,'GUI - Test Project ID : 134','string \'platforms\' is not localized for locale \'en_US\'  - using en_GB',1712054558,'LOCALIZATION',0,NULL),
(4079,958,32,'GUI - Test Project ID : 134','string \'restAPIExecParameters\' is not localized for locale \'en_US\'  - using en_GB',1712054558,'LOCALIZATION',0,NULL),
(4080,959,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: testcases_to_show - in /opt/bitnami/testlink/lib/plan/planExport.php - Line 150',1712054614,'PHP',0,NULL),
(4081,960,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: testcases_to_show - in /opt/bitnami/testlink/lib/plan/planExport.php - Line 150',1712054625,'PHP',0,NULL),
(4082,961,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuetype - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712054722,'PHP',0,NULL),
(4083,961,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuepriority - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712054722,'PHP',0,NULL),
(4084,961,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$component - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1649',1712054722,'PHP',0,NULL),
(4085,961,2,'GUI - Test Project ID : 134','In TestRun with testrunid: 27, planid: 153, buildid: 3, testcaseid: 162, Notes: p, Status: http://13.235.24.109:83/ltx.php?item=exec&feature_id=13&build_id=3',1712054722,NULL,0,NULL),
(4086,961,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_exec_saved\";s:6:\"params\";a:3:{i:0;s:7:\"TCGaN-6\";i:1;s:7:\"Proto 1\";i:2;s:19:\"GaN Charger Proto 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712054722,'CREATE',27,'execution'),
(4087,962,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuetype - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712054757,'PHP',0,NULL),
(4088,962,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuepriority - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712054757,'PHP',0,NULL),
(4089,962,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$component - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1649',1712054757,'PHP',0,NULL),
(4090,962,2,'GUI - Test Project ID : 134','In TestRun with testrunid: 28, planid: 153, buildid: 3, testcaseid: 162, Notes: p, Status: http://13.235.24.109:83/ltx.php?item=exec&feature_id=13&build_id=3',1712054757,NULL,0,NULL),
(4091,962,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_exec_saved\";s:6:\"params\";a:3:{i:0;s:7:\"TCGaN-6\";i:1;s:7:\"Proto 1\";i:2;s:19:\"GaN Charger Proto 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712054757,'CREATE',28,'execution'),
(4092,963,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuetype - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712054780,'PHP',0,NULL),
(4093,963,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuepriority - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712054780,'PHP',0,NULL),
(4094,963,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$component - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1649',1712054780,'PHP',0,NULL),
(4095,963,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_exec_deleted\";s:6:\"params\";a:3:{i:0;s:7:\"TCGaN-6\";i:1;s:7:\"Proto 1\";i:2;s:19:\"GaN Charger Proto 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712054780,'DELETE',27,'execution'),
(4096,964,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:24:\"audit_attachment_deleted\";s:6:\"params\";a:1:{i:0;s:0:\"\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712054789,'DELETE',4,'attachments'),
(4097,965,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuetype - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712054791,'PHP',0,NULL),
(4098,965,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuepriority - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712054791,'PHP',0,NULL),
(4099,965,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$component - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1649',1712054791,'PHP',0,NULL),
(4100,966,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuetype - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712054796,'PHP',0,NULL),
(4101,966,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuepriority - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712054796,'PHP',0,NULL),
(4102,966,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$component - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1649',1712054796,'PHP',0,NULL),
(4103,966,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_exec_deleted\";s:6:\"params\";a:3:{i:0;s:7:\"TCGaN-6\";i:1;s:7:\"Proto 1\";i:2;s:19:\"GaN Charger Proto 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712054796,'DELETE',28,'execution'),
(4104,967,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuetype - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712054799,'PHP',0,NULL),
(4105,967,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuepriority - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712054799,'PHP',0,NULL),
(4106,967,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$component - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1649',1712054799,'PHP',0,NULL),
(4107,968,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuetype - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712054826,'PHP',0,NULL),
(4108,968,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuepriority - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712054826,'PHP',0,NULL),
(4109,968,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$component - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1649',1712054826,'PHP',0,NULL),
(4110,969,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuetype - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712054826,'PHP',0,NULL),
(4111,969,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuepriority - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712054826,'PHP',0,NULL),
(4112,969,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$component - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1649',1712054826,'PHP',0,NULL),
(4113,970,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuetype - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712054924,'PHP',0,NULL),
(4114,970,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuepriority - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712054924,'PHP',0,NULL),
(4115,970,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$component - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1649',1712054924,'PHP',0,NULL),
(4116,971,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712054934,'PHP',0,NULL),
(4117,972,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuetype - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712054936,'PHP',0,NULL),
(4118,972,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuepriority - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712054936,'PHP',0,NULL),
(4119,972,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$component - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1649',1712054936,'PHP',0,NULL),
(4120,972,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_exec_deleted\";s:6:\"params\";a:3:{i:0;s:7:\"TCGaN-6\";i:1;s:7:\"Proto 1\";i:2;s:19:\"GaN Charger Proto 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712054936,'DELETE',22,'execution'),
(4121,972,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/gui/templates_c/8f7d50b23a3ad2636127523615ed9c295157f12b_0.file.inc_exec_show_tc_exec.tpl.php - Line 244',1712054936,'PHP',0,NULL),
(4122,973,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712054946,'PHP',0,NULL),
(4123,974,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: size - in /opt/bitnami/testlink/gui/templates_c/12a82239248d9e8bd2a95f9018e8967b73321817_0.file.inc_filter_panel.tpl.php - Line 351',1712054955,'PHP',0,NULL),
(4124,975,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uploadOp - in /opt/bitnami/testlink/gui/templates_c/a826a56ec1cd6f3a879499ad99bfecc2df857da3_0.file.containerView.tpl.php - Line 123',1712054955,'PHP',0,NULL),
(4125,976,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712054966,'PHP',0,NULL),
(4126,977,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uploadOp - in /opt/bitnami/testlink/gui/templates_c/a826a56ec1cd6f3a879499ad99bfecc2df857da3_0.file.containerView.tpl.php - Line 123',1712055001,'PHP',0,NULL),
(4127,978,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712055006,'PHP',0,NULL),
(4128,979,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uploadOp - in /opt/bitnami/testlink/gui/templates_c/a826a56ec1cd6f3a879499ad99bfecc2df857da3_0.file.containerView.tpl.php - Line 123',1712055007,'PHP',0,NULL),
(4129,980,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: size - in /opt/bitnami/testlink/gui/templates_c/12a82239248d9e8bd2a95f9018e8967b73321817_0.file.inc_filter_panel.tpl.php - Line 351',1712055007,'PHP',0,NULL),
(4130,981,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712055008,'PHP',0,NULL),
(4131,982,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712055012,'PHP',0,NULL),
(4132,983,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712055020,'PHP',0,NULL),
(4133,984,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712055030,'PHP',0,NULL),
(4134,985,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712055035,'PHP',0,NULL),
(4135,986,2,'GUI - Test Project ID : 134','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /opt/bitnami/testlink/lib/functions/tlTestPlanMetrics.class.php - Line 1026',1712055041,'PHP',0,NULL),
(4136,986,2,'GUI - Test Project ID : 134','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /opt/bitnami/testlink/lib/functions/tlTestPlanMetrics.class.php - Line 1026',1712055041,'PHP',0,NULL),
(4137,987,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: size - in /opt/bitnami/testlink/gui/templates_c/12a82239248d9e8bd2a95f9018e8967b73321817_0.file.inc_filter_panel.tpl.php - Line 351',1712055049,'PHP',0,NULL),
(4138,988,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uploadOp - in /opt/bitnami/testlink/gui/templates_c/a826a56ec1cd6f3a879499ad99bfecc2df857da3_0.file.containerView.tpl.php - Line 123',1712055049,'PHP',0,NULL),
(4139,989,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uploadOp - in /opt/bitnami/testlink/gui/templates_c/5760ab2fbcb6be6f977f78c58e2ad16e85ecd1e3_0.file.planEdit.tpl.php - Line 130',1712055079,'PHP',0,NULL),
(4140,989,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$itemID - in /opt/bitnami/testlink/gui/templates_c/5760ab2fbcb6be6f977f78c58e2ad16e85ecd1e3_0.file.planEdit.tpl.php - Line 152',1712055079,'PHP',0,NULL),
(4141,989,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index:  - in /opt/bitnami/testlink/gui/templates_c/5760ab2fbcb6be6f977f78c58e2ad16e85ecd1e3_0.file.planEdit.tpl.php - Line 302',1712055079,'PHP',0,NULL),
(4142,990,32,'GUI - Test Project ID : 134','string \'testproject_code_tracker_integration\' is not localized for locale \'en_US\'  - using en_GB',1712055113,'LOCALIZATION',0,NULL),
(4143,990,32,'GUI - Test Project ID : 134','string \'code_tracker\' is not localized for locale \'en_US\'  - using en_GB',1712055113,'LOCALIZATION',0,NULL),
(4144,990,32,'GUI - Test Project ID : 134','string \'no_codetracker_defined\' is not localized for locale \'en_US\'  - using en_GB',1712055113,'LOCALIZATION',0,NULL),
(4145,991,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712055129,'PHP',0,NULL),
(4146,992,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712055173,'PHP',0,NULL),
(4147,993,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuetype - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712055176,'PHP',0,NULL),
(4148,993,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuepriority - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712055176,'PHP',0,NULL),
(4149,993,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$component - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1649',1712055176,'PHP',0,NULL),
(4150,993,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/gui/templates_c/8f7d50b23a3ad2636127523615ed9c295157f12b_0.file.inc_exec_show_tc_exec.tpl.php - Line 244',1712055176,'PHP',0,NULL),
(4151,994,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: user - in /opt/bitnami/testlink/lib/functions/common.php - Line 1925',1712055184,'PHP',0,NULL),
(4152,995,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: user - in /opt/bitnami/testlink/lib/functions/common.php - Line 1925',1712055186,'PHP',0,NULL),
(4153,996,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712055191,'PHP',0,NULL),
(4154,997,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuetype - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712055197,'PHP',0,NULL),
(4155,997,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuepriority - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712055197,'PHP',0,NULL),
(4156,997,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$component - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1649',1712055197,'PHP',0,NULL),
(4157,997,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/gui/templates_c/8f7d50b23a3ad2636127523615ed9c295157f12b_0.file.inc_exec_show_tc_exec.tpl.php - Line 244',1712055197,'PHP',0,NULL),
(4158,998,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuetype - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712055197,'PHP',0,NULL),
(4159,998,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuepriority - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712055197,'PHP',0,NULL),
(4160,998,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$component - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1649',1712055197,'PHP',0,NULL),
(4161,998,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/gui/templates_c/8f7d50b23a3ad2636127523615ed9c295157f12b_0.file.inc_exec_show_tc_exec.tpl.php - Line 244',1712055197,'PHP',0,NULL),
(4162,999,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712055203,'PHP',0,NULL),
(4163,1000,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: size - in /opt/bitnami/testlink/gui/templates_c/12a82239248d9e8bd2a95f9018e8967b73321817_0.file.inc_filter_panel.tpl.php - Line 351',1712055250,'PHP',0,NULL),
(4164,1001,32,'GUI - Test Project ID : 134','string \'file_upload_ko\' is not localized for locale \'en_US\'  - using en_GB',1712055250,'LOCALIZATION',0,NULL),
(4165,1001,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uploadOp - in /opt/bitnami/testlink/gui/templates_c/a826a56ec1cd6f3a879499ad99bfecc2df857da3_0.file.containerView.tpl.php - Line 123',1712055250,'PHP',0,NULL),
(4166,1001,32,'GUI - Test Project ID : 134','string \'allowed_files\' is not localized for locale \'en_US\'  - using en_GB',1712055250,'LOCALIZATION',0,NULL),
(4167,1001,32,'GUI - Test Project ID : 134','string \'allowed_filenames_regexp\' is not localized for locale \'en_US\'  - using en_GB',1712055250,'LOCALIZATION',0,NULL),
(4168,1002,32,'GUI - Test Project ID : 134','string \'btn_add_to_testsuites_deep\' is not localized for locale \'en_US\'  - using en_GB',1712055253,'LOCALIZATION',0,NULL),
(4169,1002,32,'GUI - Test Project ID : 134','string \'select_keywords\' is not localized for locale \'en_US\'  - using en_GB',1712055253,'LOCALIZATION',0,NULL),
(4170,1003,32,'GUI - Test Project ID : 134','string \'updateLinkToThisTCVersion\' is not localized for locale \'en_US\'  - using en_GB',1712055257,'LOCALIZATION',0,NULL),
(4171,1003,32,'GUI - Test Project ID : 134','string \'btn_new_version_from_latest\' is not localized for locale \'en_US\'  - using en_GB',1712055257,'LOCALIZATION',0,NULL),
(4172,1003,32,'GUI - Test Project ID : 134','string \'code_mgmt\' is not localized for locale \'en_US\'  - using en_GB',1712055257,'LOCALIZATION',0,NULL),
(4173,1003,32,'GUI - Test Project ID : 134','string \'code_link_tl_to_cts\' is not localized for locale \'en_US\'  - using en_GB',1712055257,'LOCALIZATION',0,NULL),
(4174,1003,32,'GUI - Test Project ID : 134','string \'can_not_edit_frozen_tc\' is not localized for locale \'en_US\'  - using en_GB',1712055257,'LOCALIZATION',0,NULL),
(4175,1003,32,'GUI - Test Project ID : 134','string \'testcase_version_operations\' is not localized for locale \'en_US\'  - using en_GB',1712055257,'LOCALIZATION',0,NULL),
(4176,1003,32,'GUI - Test Project ID : 134','string \'createKW\' is not localized for locale \'en_US\'  - using en_GB',1712055257,'LOCALIZATION',0,NULL),
(4177,1003,32,'GUI - Test Project ID : 134','string \'btn_create_and_link\' is not localized for locale \'en_US\'  - using en_GB',1712055257,'LOCALIZATION',0,NULL),
(4178,1003,32,'GUI - Test Project ID : 134','string \'img_title_remove_platform\' is not localized for locale \'en_US\' ',1712055257,'LOCALIZATION',0,NULL),
(4179,1003,32,'GUI - Test Project ID : 134','string \'select_platforms\' is not localized for locale \'en_US\'  - using en_GB',1712055257,'LOCALIZATION',0,NULL),
(4180,1003,32,'GUI - Test Project ID : 134','string \'remove_plat_msgbox_msg\' is not localized for locale \'en_US\' ',1712055257,'LOCALIZATION',0,NULL),
(4181,1003,32,'GUI - Test Project ID : 134','string \'remove_plat_msgbox_title\' is not localized for locale \'en_US\' ',1712055257,'LOCALIZATION',0,NULL),
(4182,1003,32,'GUI - Test Project ID : 134','string \'can_not_delete_a_frozen_relation\' is not localized for locale \'en_US\'  - using en_GB',1712055257,'LOCALIZATION',0,NULL),
(4183,1003,32,'GUI - Test Project ID : 134','string \'can_not_delete_relation_frozen_tc\' is not localized for locale \'en_US\'  - using en_GB',1712055257,'LOCALIZATION',0,NULL),
(4184,1003,32,'GUI - Test Project ID : 134','string \'can_not_delete_relation_because_this_is_not_the_latest\' is not localized for locale \'en_US\'  - using en_GB',1712055257,'LOCALIZATION',0,NULL),
(4185,1003,32,'GUI - Test Project ID : 134','string \'this_tcversion\' is not localized for locale \'en_US\'  - using en_GB',1712055257,'LOCALIZATION',0,NULL),
(4186,1003,32,'GUI - Test Project ID : 134','string \'can_not_delete_relation_tcversion_frozen\' is not localized for locale \'en_US\'  - using en_GB',1712055257,'LOCALIZATION',0,NULL),
(4187,1003,32,'GUI - Test Project ID : 134','string \'can_not_delete_relation_related_tcversion_frozen\' is not localized for locale \'en_US\'  - using en_GB',1712055257,'LOCALIZATION',0,NULL),
(4188,1004,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$dialogName - in /opt/bitnami/testlink/lib/keywords/keywordsEdit.php - Line 68',1712055262,'PHP',0,NULL),
(4189,1005,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/gui/templates_c/67b7c3539c41dafa6cbe92bcc071ac342a645830_0.file.inc_tcbody.tpl.php - Line 119',1712055388,'PHP',0,NULL),
(4190,1006,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uploadOp - in /opt/bitnami/testlink/lib/testcases/testcaseCommands.class.php - Line 1129',1712055392,'PHP',0,NULL),
(4191,1007,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuetype - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712055455,'PHP',0,NULL),
(4192,1007,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuepriority - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712055455,'PHP',0,NULL),
(4193,1007,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$component - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1649',1712055455,'PHP',0,NULL),
(4194,1007,2,'GUI - Test Project ID : 134','In TestRun with testrunid: 29, planid: 153, buildid: 3, testcaseid: 162, Notes: p, Status: http://13.235.24.109:83/ltx.php?item=exec&feature_id=13&build_id=3',1712055455,NULL,0,NULL),
(4195,1007,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_exec_saved\";s:6:\"params\";a:3:{i:0;s:7:\"TCGaN-6\";i:1;s:7:\"Proto 1\";i:2;s:19:\"GaN Charger Proto 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712055455,'CREATE',29,'execution'),
(4196,1008,32,'GUI - Test Project ID : 134','string \'opt_cfexec_comb\' is not localized for locale \'en_US\'  - using en_GB',1712055506,'LOCALIZATION',0,NULL),
(4197,1009,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712055549,'PHP',0,NULL),
(4198,1010,32,'GUI - Test Project ID : 134','string \'link_report_by_tsuite\' is not localized for locale \'en_US\'  - using en_GB',1712055556,'LOCALIZATION',0,NULL),
(4199,1010,32,'GUI - Test Project ID : 134','string \'baseline_l1l2\' is not localized for locale \'en_US\'  - using en_GB',1712055556,'LOCALIZATION',0,NULL),
(4200,1010,32,'GUI - Test Project ID : 134','string \'link_report_test_absolute_latest_exec\' is not localized for locale \'en_US\'  - using en_GB',1712055556,'LOCALIZATION',0,NULL),
(4201,1010,32,'GUI - Test Project ID : 134','string \'link_report_never_run\' is not localized for locale \'en_US\'  - using en_GB',1712055556,'LOCALIZATION',0,NULL),
(4202,1010,32,'GUI - Test Project ID : 134','string \'link_report_exec_timeline\' is not localized for locale \'en_US\'  - using en_GB',1712055556,'LOCALIZATION',0,NULL),
(4203,1011,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/print.inc.php - Line 1365',1712055564,'PHP',0,NULL),
(4204,1011,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform - in /opt/bitnami/testlink/lib/functions/print.inc.php - Line 1443',1712055564,'PHP',0,NULL),
(4205,1012,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712055570,'PHP',0,NULL),
(4206,1013,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform_view - in /opt/bitnami/testlink/gui/templates_c/1a970f0fd23865718fe165dfcf14693f3e80cffc_0.file.mainPageLeft.tpl.php - Line 181',1712055581,'PHP',0,NULL),
(4207,1014,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/print.inc.php - Line 1365',1712055594,'PHP',0,NULL),
(4208,1014,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform - in /opt/bitnami/testlink/lib/functions/print.inc.php - Line 1443',1712055594,'PHP',0,NULL),
(4209,1015,32,'GUI - Test Project ID : 134','string \'opt_cfexec_comb\' is not localized for locale \'en_US\'  - using en_GB',1712055598,'LOCALIZATION',0,NULL),
(4210,1016,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: decoding_info - in /opt/bitnami/testlink/lib/functions/treeMenu.inc.php - Line 619',1712055607,'PHP',0,NULL),
(4211,1016,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/treeMenu.inc.php - Line 619',1712055607,'PHP',0,NULL),
(4212,1016,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/treeMenu.inc.php - Line 619',1712055607,'PHP',0,NULL),
(4213,1016,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index:  - in /opt/bitnami/testlink/lib/functions/treeMenu.inc.php - Line 657',1712055607,'PHP',0,NULL),
(4214,1016,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/print.inc.php - Line 1365',1712055607,'PHP',0,NULL),
(4215,1016,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform - in /opt/bitnami/testlink/lib/functions/print.inc.php - Line 1443',1712055607,'PHP',0,NULL),
(4216,1017,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: items2loop - in /opt/bitnami/testlink/lib/results/resultsGeneral.php - Line 65',1712055611,'PHP',0,NULL),
(4217,1017,2,'GUI - Test Project ID : 134','E_WARNING\nInvalid argument supplied for foreach() - in /opt/bitnami/testlink/lib/results/resultsGeneral.php - Line 65',1712055611,'PHP',0,NULL),
(4218,1018,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uribase - in /opt/bitnami/testlink/lib/issuetrackerintegration/bugzillaxmlrpcInterface.class.php - Line 65',1712055627,'PHP',0,NULL),
(4219,1018,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/print.inc.php - Line 1365',1712055627,'PHP',0,NULL),
(4220,1018,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform - in /opt/bitnami/testlink/lib/functions/print.inc.php - Line 1443',1712055627,'PHP',0,NULL),
(4221,1019,32,'GUI - Test Project ID : 134','string \'opt_cfexec_comb\' is not localized for locale \'en_US\'  - using en_GB',1712055659,'LOCALIZATION',0,NULL),
(4222,1020,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: decoding_info - in /opt/bitnami/testlink/lib/functions/treeMenu.inc.php - Line 619',1712055660,'PHP',0,NULL),
(4223,1020,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/treeMenu.inc.php - Line 619',1712055660,'PHP',0,NULL),
(4224,1020,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/treeMenu.inc.php - Line 619',1712055660,'PHP',0,NULL),
(4225,1020,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index:  - in /opt/bitnami/testlink/lib/functions/treeMenu.inc.php - Line 657',1712055660,'PHP',0,NULL),
(4226,1020,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/print.inc.php - Line 1365',1712055660,'PHP',0,NULL),
(4227,1020,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform - in /opt/bitnami/testlink/lib/functions/print.inc.php - Line 1443',1712055660,'PHP',0,NULL),
(4228,1021,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: decoding_info - in /opt/bitnami/testlink/lib/functions/treeMenu.inc.php - Line 619',1712055661,'PHP',0,NULL),
(4229,1021,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/treeMenu.inc.php - Line 619',1712055661,'PHP',0,NULL),
(4230,1021,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/treeMenu.inc.php - Line 619',1712055661,'PHP',0,NULL),
(4231,1021,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index:  - in /opt/bitnami/testlink/lib/functions/treeMenu.inc.php - Line 657',1712055661,'PHP',0,NULL),
(4232,1021,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/print.inc.php - Line 1365',1712055661,'PHP',0,NULL),
(4233,1021,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform - in /opt/bitnami/testlink/lib/functions/print.inc.php - Line 1443',1712055661,'PHP',0,NULL),
(4234,1022,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_user_saved\";s:6:\"params\";a:1:{i:0;s:32:\"suneel.duth@kaynestechnology.net\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712055726,'SAVE',4,'users'),
(4235,1023,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_user_saved\";s:6:\"params\";a:1:{i:0;s:32:\"suneel.duth@kaynestechnology.net\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712055738,'SAVE',4,'users'),
(4236,1024,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuetype - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712055753,'PHP',0,NULL),
(4237,1024,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuepriority - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712055753,'PHP',0,NULL),
(4238,1024,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$component - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1649',1712055753,'PHP',0,NULL),
(4239,1025,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuetype - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712055753,'PHP',0,NULL),
(4240,1025,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuepriority - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712055753,'PHP',0,NULL),
(4241,1025,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$component - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1649',1712055753,'PHP',0,NULL),
(4242,1026,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:24:\"audit_attachment_deleted\";s:6:\"params\";a:1:{i:0;s:0:\"\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712055759,'DELETE',5,'attachments'),
(4243,1027,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuetype - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712055764,'PHP',0,NULL),
(4244,1027,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuepriority - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712055764,'PHP',0,NULL),
(4245,1027,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$component - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1649',1712055764,'PHP',0,NULL),
(4246,1028,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: uploadOP - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 60',1712055772,'PHP',0,NULL),
(4247,1028,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 1 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 45',1712055772,'PHP',0,NULL),
(4248,1028,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 1 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 46',1712055772,'PHP',0,NULL),
(4249,1028,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 1 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 47',1712055772,'PHP',0,NULL),
(4250,1028,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: uploadOP - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 60',1712055772,'PHP',0,NULL),
(4251,1028,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 2 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 45',1712055772,'PHP',0,NULL),
(4252,1028,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 2 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 46',1712055772,'PHP',0,NULL),
(4253,1028,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 2 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 47',1712055772,'PHP',0,NULL),
(4254,1028,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: uploadOP - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 60',1712055772,'PHP',0,NULL),
(4255,1028,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 3 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 45',1712055772,'PHP',0,NULL),
(4256,1028,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 3 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 46',1712055772,'PHP',0,NULL),
(4257,1028,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 3 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 47',1712055772,'PHP',0,NULL),
(4258,1028,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: uploadOP - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 60',1712055772,'PHP',0,NULL),
(4259,1028,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 4 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 45',1712055772,'PHP',0,NULL),
(4260,1028,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 4 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 46',1712055772,'PHP',0,NULL),
(4261,1028,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 4 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 47',1712055772,'PHP',0,NULL),
(4262,1028,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: uploadOP - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 60',1712055772,'PHP',0,NULL),
(4263,1028,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 5 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 45',1712055772,'PHP',0,NULL),
(4264,1028,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 5 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 46',1712055772,'PHP',0,NULL),
(4265,1028,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 5 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 47',1712055772,'PHP',0,NULL),
(4266,1028,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: uploadOP - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 60',1712055772,'PHP',0,NULL),
(4267,1029,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: uploadOP - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 60',1712055779,'PHP',0,NULL),
(4268,1029,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 1 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 45',1712055779,'PHP',0,NULL),
(4269,1029,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 1 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 46',1712055779,'PHP',0,NULL),
(4270,1029,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 1 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 47',1712055779,'PHP',0,NULL),
(4271,1029,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: uploadOP - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 60',1712055779,'PHP',0,NULL),
(4272,1029,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 2 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 45',1712055779,'PHP',0,NULL),
(4273,1029,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 2 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 46',1712055779,'PHP',0,NULL),
(4274,1029,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 2 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 47',1712055779,'PHP',0,NULL),
(4275,1029,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: uploadOP - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 60',1712055779,'PHP',0,NULL),
(4276,1029,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 3 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 45',1712055779,'PHP',0,NULL),
(4277,1029,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 3 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 46',1712055779,'PHP',0,NULL),
(4278,1029,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 3 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 47',1712055779,'PHP',0,NULL),
(4279,1029,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: uploadOP - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 60',1712055779,'PHP',0,NULL),
(4280,1029,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 4 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 45',1712055779,'PHP',0,NULL),
(4281,1029,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 4 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 46',1712055779,'PHP',0,NULL),
(4282,1029,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 4 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 47',1712055779,'PHP',0,NULL),
(4283,1029,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: uploadOP - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 60',1712055779,'PHP',0,NULL),
(4284,1029,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 5 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 45',1712055779,'PHP',0,NULL),
(4285,1029,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 5 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 46',1712055779,'PHP',0,NULL),
(4286,1029,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 5 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 47',1712055779,'PHP',0,NULL),
(4287,1029,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: uploadOP - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 60',1712055779,'PHP',0,NULL),
(4288,1030,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: uploadOP - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 60',1712055790,'PHP',0,NULL),
(4289,1030,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 1 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 45',1712055790,'PHP',0,NULL),
(4290,1030,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 1 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 46',1712055790,'PHP',0,NULL),
(4291,1030,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 1 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 47',1712055790,'PHP',0,NULL),
(4292,1030,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: uploadOP - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 60',1712055790,'PHP',0,NULL),
(4293,1030,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 2 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 45',1712055790,'PHP',0,NULL),
(4294,1030,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 2 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 46',1712055790,'PHP',0,NULL),
(4295,1030,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 2 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 47',1712055790,'PHP',0,NULL),
(4296,1030,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: uploadOP - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 60',1712055790,'PHP',0,NULL),
(4297,1030,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 3 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 45',1712055790,'PHP',0,NULL),
(4298,1030,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 3 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 46',1712055790,'PHP',0,NULL),
(4299,1030,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 3 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 47',1712055790,'PHP',0,NULL),
(4300,1030,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: uploadOP - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 60',1712055790,'PHP',0,NULL),
(4301,1030,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 4 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 45',1712055790,'PHP',0,NULL),
(4302,1030,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 4 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 46',1712055790,'PHP',0,NULL),
(4303,1030,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 4 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 47',1712055790,'PHP',0,NULL),
(4304,1030,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: uploadOP - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 60',1712055790,'PHP',0,NULL),
(4305,1030,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 5 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 45',1712055791,'PHP',0,NULL),
(4306,1030,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 5 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 46',1712055791,'PHP',0,NULL),
(4307,1030,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 5 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 47',1712055791,'PHP',0,NULL),
(4308,1030,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: uploadOP - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 60',1712055791,'PHP',0,NULL),
(4309,1031,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuetype - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712055793,'PHP',0,NULL),
(4310,1031,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuepriority - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712055793,'PHP',0,NULL),
(4311,1031,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$component - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1649',1712055793,'PHP',0,NULL),
(4312,1032,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: uploadOP - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 60',1712055835,'PHP',0,NULL),
(4313,1032,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 1 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 45',1712055835,'PHP',0,NULL),
(4314,1032,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 1 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 46',1712055835,'PHP',0,NULL),
(4315,1032,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 1 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 47',1712055835,'PHP',0,NULL),
(4316,1032,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: uploadOP - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 60',1712055835,'PHP',0,NULL),
(4317,1032,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 2 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 45',1712055835,'PHP',0,NULL),
(4318,1032,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 2 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 46',1712055835,'PHP',0,NULL),
(4319,1032,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 2 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 47',1712055835,'PHP',0,NULL),
(4320,1032,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: uploadOP - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 60',1712055835,'PHP',0,NULL),
(4321,1032,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 3 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 45',1712055835,'PHP',0,NULL),
(4322,1032,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 3 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 46',1712055835,'PHP',0,NULL),
(4323,1032,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 3 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 47',1712055835,'PHP',0,NULL),
(4324,1032,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: uploadOP - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 60',1712055835,'PHP',0,NULL),
(4325,1032,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 4 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 45',1712055835,'PHP',0,NULL),
(4326,1032,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 4 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 46',1712055835,'PHP',0,NULL),
(4327,1032,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 4 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 47',1712055835,'PHP',0,NULL),
(4328,1032,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: uploadOP - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 60',1712055835,'PHP',0,NULL),
(4329,1032,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 5 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 45',1712055835,'PHP',0,NULL),
(4330,1032,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 5 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 46',1712055835,'PHP',0,NULL),
(4331,1032,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 5 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 47',1712055835,'PHP',0,NULL),
(4332,1032,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: uploadOP - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 60',1712055835,'PHP',0,NULL),
(4333,1033,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuetype - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712055839,'PHP',0,NULL),
(4334,1033,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuepriority - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712055839,'PHP',0,NULL),
(4335,1033,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$component - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1649',1712055839,'PHP',0,NULL),
(4336,1034,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: uploadOP - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 60',1712055877,'PHP',0,NULL),
(4337,1034,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 1 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 45',1712055877,'PHP',0,NULL),
(4338,1034,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 1 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 46',1712055877,'PHP',0,NULL),
(4339,1034,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 1 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 47',1712055877,'PHP',0,NULL),
(4340,1034,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: uploadOP - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 60',1712055877,'PHP',0,NULL),
(4341,1034,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 2 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 45',1712055877,'PHP',0,NULL),
(4342,1034,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 2 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 46',1712055877,'PHP',0,NULL),
(4343,1034,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 2 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 47',1712055877,'PHP',0,NULL),
(4344,1034,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: uploadOP - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 60',1712055877,'PHP',0,NULL),
(4345,1034,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 3 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 45',1712055877,'PHP',0,NULL),
(4346,1034,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 3 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 46',1712055877,'PHP',0,NULL),
(4347,1034,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 3 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 47',1712055877,'PHP',0,NULL),
(4348,1034,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: uploadOP - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 60',1712055877,'PHP',0,NULL),
(4349,1034,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 4 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 45',1712055877,'PHP',0,NULL),
(4350,1034,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 4 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 46',1712055877,'PHP',0,NULL),
(4351,1034,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 4 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 47',1712055877,'PHP',0,NULL),
(4352,1034,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: uploadOP - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 60',1712055877,'PHP',0,NULL),
(4353,1034,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 5 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 45',1712055877,'PHP',0,NULL),
(4354,1034,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 5 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 46',1712055877,'PHP',0,NULL),
(4355,1034,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined offset: 5 - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 47',1712055877,'PHP',0,NULL),
(4356,1034,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: uploadOP - in /opt/bitnami/testlink/lib/attachments/attachmentupload.php - Line 60',1712055877,'PHP',0,NULL),
(4357,1035,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuetype - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712055879,'PHP',0,NULL),
(4358,1035,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuepriority - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712055879,'PHP',0,NULL),
(4359,1035,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$component - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1649',1712055879,'PHP',0,NULL),
(4360,1036,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuetype - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712055892,'PHP',0,NULL),
(4361,1036,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuepriority - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712055892,'PHP',0,NULL),
(4362,1036,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$component - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1649',1712055892,'PHP',0,NULL),
(4363,1037,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuetype - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712055893,'PHP',0,NULL),
(4364,1037,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuepriority - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712055893,'PHP',0,NULL),
(4365,1037,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$component - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1649',1712055893,'PHP',0,NULL),
(4366,1038,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuetype - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712055897,'PHP',0,NULL),
(4367,1038,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuepriority - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712055897,'PHP',0,NULL),
(4368,1038,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$component - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1649',1712055897,'PHP',0,NULL),
(4369,1038,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_exec_deleted\";s:6:\"params\";a:3:{i:0;s:7:\"TCGaN-6\";i:1;s:7:\"Proto 1\";i:2;s:19:\"GaN Charger Proto 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712055897,'DELETE',29,'execution'),
(4370,1038,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/gui/templates_c/8f7d50b23a3ad2636127523615ed9c295157f12b_0.file.inc_exec_show_tc_exec.tpl.php - Line 244',1712055897,'PHP',0,NULL),
(4371,1039,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/print.inc.php - Line 1365',1712055929,'PHP',0,NULL),
(4372,1039,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform - in /opt/bitnami/testlink/lib/functions/print.inc.php - Line 1443',1712055929,'PHP',0,NULL),
(4373,1040,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuetype - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712055934,'PHP',0,NULL),
(4374,1040,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$issuepriority - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1641',1712055934,'PHP',0,NULL),
(4375,1040,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$component - in /opt/bitnami/testlink/lib/execute/execSetResults.php - Line 1649',1712055934,'PHP',0,NULL),
(4376,1040,2,'GUI - Test Project ID : 134','In TestRun with testrunid: 30, planid: 153, buildid: 3, testcaseid: 162, Notes: p, Status: http://13.235.24.109:83/ltx.php?item=exec&feature_id=13&build_id=3',1712055934,NULL,0,NULL),
(4377,1040,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_exec_saved\";s:6:\"params\";a:3:{i:0;s:7:\"TCGaN-6\";i:1;s:7:\"Proto 1\";i:2;s:19:\"GaN Charger Proto 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712055934,'CREATE',30,'execution'),
(4378,1041,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uploadOp - in /opt/bitnami/testlink/gui/templates_c/5760ab2fbcb6be6f977f78c58e2ad16e85ecd1e3_0.file.planEdit.tpl.php - Line 130',1712055957,'PHP',0,NULL),
(4379,1041,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$itemID - in /opt/bitnami/testlink/gui/templates_c/5760ab2fbcb6be6f977f78c58e2ad16e85ecd1e3_0.file.planEdit.tpl.php - Line 152',1712055957,'PHP',0,NULL),
(4380,1041,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index:  - in /opt/bitnami/testlink/gui/templates_c/5760ab2fbcb6be6f977f78c58e2ad16e85ecd1e3_0.file.planEdit.tpl.php - Line 302',1712055957,'PHP',0,NULL),
(4381,1042,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/print.inc.php - Line 1365',1712055983,'PHP',0,NULL),
(4382,1042,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform - in /opt/bitnami/testlink/lib/functions/print.inc.php - Line 1443',1712055983,'PHP',0,NULL),
(4383,1043,16,'GUI - Test Project ID : 134','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:20:\"audit_testplan_saved\";s:6:\"params\";a:2:{i:0;s:11:\"GaN Charger\";i:1;s:19:\"GaN Charger Proto 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1712055988,'SAVE',153,'testplans'),
(4384,1044,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: size - in /opt/bitnami/testlink/gui/templates_c/12a82239248d9e8bd2a95f9018e8967b73321817_0.file.inc_filter_panel.tpl.php - Line 351',1712056001,'PHP',0,NULL),
(4385,1045,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined property: stdClass::$uploadOp - in /opt/bitnami/testlink/gui/templates_c/a826a56ec1cd6f3a879499ad99bfecc2df857da3_0.file.containerView.tpl.php - Line 123',1712056002,'PHP',0,NULL),
(4386,1046,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/print.inc.php - Line 1365',1712056070,'PHP',0,NULL),
(4387,1046,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform - in /opt/bitnami/testlink/lib/functions/print.inc.php - Line 1443',1712056070,'PHP',0,NULL),
(4388,1047,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: size - in /opt/bitnami/testlink/gui/templates_c/12a82239248d9e8bd2a95f9018e8967b73321817_0.file.inc_filter_panel.tpl.php - Line 351',1712056307,'PHP',0,NULL),
(4389,1048,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: decoding_info - in /opt/bitnami/testlink/lib/functions/treeMenu.inc.php - Line 619',1712056347,'PHP',0,NULL),
(4390,1048,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/treeMenu.inc.php - Line 619',1712056347,'PHP',0,NULL),
(4391,1048,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/treeMenu.inc.php - Line 619',1712056347,'PHP',0,NULL),
(4392,1048,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index:  - in /opt/bitnami/testlink/lib/functions/treeMenu.inc.php - Line 657',1712056347,'PHP',0,NULL),
(4393,1048,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/print.inc.php - Line 1365',1712056347,'PHP',0,NULL),
(4394,1048,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform - in /opt/bitnami/testlink/lib/functions/print.inc.php - Line 1443',1712056347,'PHP',0,NULL),
(4395,1049,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: decoding_info - in /opt/bitnami/testlink/lib/functions/treeMenu.inc.php - Line 619',1712056642,'PHP',0,NULL),
(4396,1049,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/treeMenu.inc.php - Line 619',1712056642,'PHP',0,NULL),
(4397,1049,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/treeMenu.inc.php - Line 619',1712056642,'PHP',0,NULL),
(4398,1049,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index:  - in /opt/bitnami/testlink/lib/functions/treeMenu.inc.php - Line 657',1712056642,'PHP',0,NULL),
(4399,1049,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/print.inc.php - Line 1365',1712056642,'PHP',0,NULL),
(4400,1049,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform - in /opt/bitnami/testlink/lib/functions/print.inc.php - Line 1443',1712056642,'PHP',0,NULL),
(4401,1050,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined variable: decoding_info - in /opt/bitnami/testlink/lib/functions/treeMenu.inc.php - Line 619',1712056860,'PHP',0,NULL),
(4402,1050,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/treeMenu.inc.php - Line 619',1712056860,'PHP',0,NULL),
(4403,1050,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/treeMenu.inc.php - Line 619',1712056860,'PHP',0,NULL),
(4404,1050,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index:  - in /opt/bitnami/testlink/lib/functions/treeMenu.inc.php - Line 657',1712056860,'PHP',0,NULL),
(4405,1050,2,'GUI - Test Project ID : 134','E_NOTICE\nTrying to access array offset on value of type null - in /opt/bitnami/testlink/lib/functions/print.inc.php - Line 1365',1712056860,'PHP',0,NULL),
(4406,1050,2,'GUI - Test Project ID : 134','E_NOTICE\nUndefined index: platform - in /opt/bitnami/testlink/lib/functions/print.inc.php - Line 1443',1712056860,'PHP',0,NULL);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `exec_by_date_time`
--

DROP TABLE IF EXISTS `exec_by_date_time`;
/*!50001 DROP VIEW IF EXISTS `exec_by_date_time`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `exec_by_date_time` AS SELECT
 1 AS `testplan_name`,
  1 AS `yyyy_mm_dd`,
  1 AS `yyyy_mm`,
  1 AS `hh`,
  1 AS `hour`,
  1 AS `id`,
  1 AS `build_id`,
  1 AS `tester_id`,
  1 AS `execution_ts`,
  1 AS `status`,
  1 AS `testplan_id`,
  1 AS `tcversion_id`,
  1 AS `tcversion_number`,
  1 AS `platform_id`,
  1 AS `execution_type`,
  1 AS `execution_duration`,
  1 AS `notes` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `execution_bugs`
--

DROP TABLE IF EXISTS `execution_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `execution_bugs` (
  `execution_id` int(10) unsigned NOT NULL DEFAULT 0,
  `bug_id` varchar(64) NOT NULL DEFAULT '0',
  `tcstep_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`execution_id`,`bug_id`,`tcstep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `execution_bugs`
--

LOCK TABLES `execution_bugs` WRITE;
/*!40000 ALTER TABLE `execution_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `execution_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `execution_tcsteps`
--

DROP TABLE IF EXISTS `execution_tcsteps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `execution_tcsteps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `execution_id` int(10) unsigned NOT NULL DEFAULT 0,
  `tcstep_id` int(10) unsigned NOT NULL DEFAULT 0,
  `notes` text DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `execution_tcsteps_idx1` (`execution_id`,`tcstep_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `execution_tcsteps`
--

LOCK TABLES `execution_tcsteps` WRITE;
/*!40000 ALTER TABLE `execution_tcsteps` DISABLE KEYS */;
/*!40000 ALTER TABLE `execution_tcsteps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `execution_tcsteps_wip`
--

DROP TABLE IF EXISTS `execution_tcsteps_wip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `execution_tcsteps_wip` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tcstep_id` int(10) unsigned NOT NULL DEFAULT 0,
  `testplan_id` int(10) unsigned NOT NULL DEFAULT 0,
  `platform_id` int(10) unsigned NOT NULL DEFAULT 0,
  `build_id` int(10) unsigned NOT NULL DEFAULT 0,
  `tester_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `notes` text DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `execution_tcsteps_wip_idx1` (`tcstep_id`,`testplan_id`,`platform_id`,`build_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `execution_tcsteps_wip`
--

LOCK TABLES `execution_tcsteps_wip` WRITE;
/*!40000 ALTER TABLE `execution_tcsteps_wip` DISABLE KEYS */;
INSERT INTO `execution_tcsteps_wip` VALUES
(13,128,132,0,1,1,'2023-12-22 06:58:03','not able to charges','f'),
(14,129,132,0,1,1,'2023-12-22 06:58:03','chager','p'),
(15,130,132,0,1,1,'2023-12-22 06:58:03','pass','p'),
(16,131,132,0,1,1,'2023-12-22 06:58:03','working','p');
/*!40000 ALTER TABLE `execution_tcsteps_wip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `executions`
--

DROP TABLE IF EXISTS `executions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `executions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `build_id` int(10) NOT NULL DEFAULT 0,
  `tester_id` int(10) unsigned DEFAULT NULL,
  `execution_ts` datetime DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `testplan_id` int(10) unsigned NOT NULL DEFAULT 0,
  `tcversion_id` int(10) unsigned NOT NULL DEFAULT 0,
  `tcversion_number` smallint(5) unsigned NOT NULL DEFAULT 1,
  `platform_id` int(10) unsigned NOT NULL DEFAULT 0,
  `execution_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 -> manual, 2 -> automated',
  `execution_duration` decimal(6,2) DEFAULT NULL COMMENT 'NULL will be considered as NO DATA Provided by user',
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `executions_idx1` (`testplan_id`,`tcversion_id`,`platform_id`,`build_id`),
  KEY `executions_idx2` (`execution_type`),
  KEY `executions_idx3` (`tcversion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `executions`
--

LOCK TABLES `executions` WRITE;
/*!40000 ALTER TABLE `executions` DISABLE KEYS */;
INSERT INTO `executions` VALUES
(20,2,3,'2024-04-02 10:02:12','p',137,157,1,0,1,NULL,'https://workdrive.zoho.com/folder/bx83g8e0968fbc8004bbf978eb21a6c67de3b'),
(21,2,3,'2024-04-02 10:02:18','p',137,157,1,0,1,NULL,''),
(30,3,3,'2024-04-02 11:05:34','p',153,163,1,0,1,NULL,'Test Report of Infineon, Navitas+Silanna & Silanna+Silanna');
/*!40000 ALTER TABLE `executions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `testproject_id` int(10) unsigned NOT NULL,
  `owner_id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `ipaddress` varchar(255) NOT NULL,
  `content` text DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `modification_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `inventory_idx1` (`testproject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issuetrackers`
--

DROP TABLE IF EXISTS `issuetrackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issuetrackers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` int(10) DEFAULT 0,
  `cfg` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `issuetrackers_uidx1` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issuetrackers`
--

LOCK TABLES `issuetrackers` WRITE;
/*!40000 ALTER TABLE `issuetrackers` DISABLE KEYS */;
INSERT INTO `issuetrackers` VALUES
(1,'Bugzilla',1,'<issuetracker>\r\n    <dbhost>localhost:5432</dbhost>\r\n    <dbname>bugs</dbname>\r\n    <dbschema>bugs</dbschema>\r\n    <dbtype>postgres</dbtype>\r\n    <dbuser>bugs</dbuser>\r\n    <dbpassword>bugs</dbpassword>\r\n    <uricreate>localhost/bugzilla/</uricreate>\r\n    <uriview>localhost/bugzilla/show_bug.cgi?id=</uriview>\r\n</issuetracker>');
/*!40000 ALTER TABLE `issuetrackers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keywords`
--

DROP TABLE IF EXISTS `keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keywords` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keyword` varchar(100) NOT NULL DEFAULT '',
  `testproject_id` int(10) unsigned NOT NULL DEFAULT 0,
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `keyword_testproject_id` (`keyword`,`testproject_id`),
  KEY `testproject_id` (`testproject_id`),
  KEY `keyword` (`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keywords`
--

LOCK TABLES `keywords` WRITE;
/*!40000 ALTER TABLE `keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `latest_exec_by_context`
--

DROP TABLE IF EXISTS `latest_exec_by_context`;
/*!50001 DROP VIEW IF EXISTS `latest_exec_by_context`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `latest_exec_by_context` AS SELECT
 1 AS `tcversion_id`,
  1 AS `testplan_id`,
  1 AS `build_id`,
  1 AS `platform_id`,
  1 AS `id` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `latest_exec_by_testplan`
--

DROP TABLE IF EXISTS `latest_exec_by_testplan`;
/*!50001 DROP VIEW IF EXISTS `latest_exec_by_testplan`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `latest_exec_by_testplan` AS SELECT
 1 AS `tcversion_id`,
  1 AS `testplan_id`,
  1 AS `id` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `latest_exec_by_testplan_plat`
--

DROP TABLE IF EXISTS `latest_exec_by_testplan_plat`;
/*!50001 DROP VIEW IF EXISTS `latest_exec_by_testplan_plat`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `latest_exec_by_testplan_plat` AS SELECT
 1 AS `tcversion_id`,
  1 AS `testplan_id`,
  1 AS `platform_id`,
  1 AS `id` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `latest_req_version`
--

DROP TABLE IF EXISTS `latest_req_version`;
/*!50001 DROP VIEW IF EXISTS `latest_req_version`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `latest_req_version` AS SELECT
 1 AS `req_id`,
  1 AS `version` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `latest_req_version_id`
--

DROP TABLE IF EXISTS `latest_req_version_id`;
/*!50001 DROP VIEW IF EXISTS `latest_req_version_id`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `latest_req_version_id` AS SELECT
 1 AS `req_id`,
  1 AS `version`,
  1 AS `req_version_id` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `latest_rspec_revision`
--

DROP TABLE IF EXISTS `latest_rspec_revision`;
/*!50001 DROP VIEW IF EXISTS `latest_rspec_revision`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `latest_rspec_revision` AS SELECT
 1 AS `req_spec_id`,
  1 AS `testproject_id`,
  1 AS `revision` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `latest_tcase_version_id`
--

DROP TABLE IF EXISTS `latest_tcase_version_id`;
/*!50001 DROP VIEW IF EXISTS `latest_tcase_version_id`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `latest_tcase_version_id` AS SELECT
 1 AS `testcase_id`,
  1 AS `version`,
  1 AS `tcversion_id` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `latest_tcase_version_number`
--

DROP TABLE IF EXISTS `latest_tcase_version_number`;
/*!50001 DROP VIEW IF EXISTS `latest_tcase_version_number`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `latest_tcase_version_number` AS SELECT
 1 AS `testcase_id`,
  1 AS `version` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `milestones`
--

DROP TABLE IF EXISTS `milestones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `milestones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `testplan_id` int(10) unsigned NOT NULL DEFAULT 0,
  `target_date` date NOT NULL,
  `start_date` date DEFAULT NULL,
  `a` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `b` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `c` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `name` varchar(100) NOT NULL DEFAULT 'undefined',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_testplan_id` (`name`,`testplan_id`),
  KEY `testplan_id` (`testplan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milestones`
--

LOCK TABLES `milestones` WRITE;
/*!40000 ALTER TABLE `milestones` DISABLE KEYS */;
/*!40000 ALTER TABLE `milestones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_types`
--

DROP TABLE IF EXISTS `node_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL DEFAULT 'testproject',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_types`
--

LOCK TABLES `node_types` WRITE;
/*!40000 ALTER TABLE `node_types` DISABLE KEYS */;
INSERT INTO `node_types` VALUES
(1,'testproject'),
(2,'testsuite'),
(3,'testcase'),
(4,'testcase_version'),
(5,'testplan'),
(6,'requirement_spec'),
(7,'requirement'),
(8,'requirement_version'),
(9,'testcase_step'),
(10,'requirement_revision'),
(11,'requirement_spec_revision'),
(12,'build'),
(13,'platform'),
(14,'user');
/*!40000 ALTER TABLE `node_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nodes_hierarchy`
--

DROP TABLE IF EXISTS `nodes_hierarchy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nodes_hierarchy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `node_type_id` int(10) unsigned NOT NULL DEFAULT 1,
  `node_order` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid_m_nodeorder` (`parent_id`,`node_order`),
  KEY `nodes_hierarchy_node_type_id` (`node_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nodes_hierarchy`
--

LOCK TABLES `nodes_hierarchy` WRITE;
/*!40000 ALTER TABLE `nodes_hierarchy` DISABLE KEYS */;
INSERT INTO `nodes_hierarchy` VALUES
(134,'GaN Charger',NULL,1,1),
(137,'Sample Charger Testing @Mysore Shyam Lab',134,5,0),
(138,'Sample charger Testing',134,6,1),
(139,'Charger Testing',138,11,0),
(140,'Sample charger Testing',138,11,0),
(141,'Test Spigen and Chinese GaN charger',138,7,1),
(142,'',141,8,0),
(148,'Charger Test Scenarios',134,2,0),
(149,'Output Power',148,3,1000),
(150,'',149,4,0),
(151,'',150,9,0),
(153,'GaN Charger Proto 1',134,5,0),
(154,'Infineon, Navitas+Silanna & Silanna+Silanna',134,2,1),
(155,'Mysore Test Report-Sample Devices',134,2,2),
(156,'Line Regulation',155,3,1000),
(157,'',156,4,0),
(158,'Load regulation',155,3,1001),
(159,'',158,4,0),
(160,'GaN charger Proto 1',134,6,2),
(161,'GaN charger Proto 1',160,11,0),
(162,'Test Report of Proto 1',154,3,1000),
(163,'',162,4,0);
/*!40000 ALTER TABLE `nodes_hierarchy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_keywords`
--

DROP TABLE IF EXISTS `object_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `object_keywords` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_id` int(10) unsigned NOT NULL DEFAULT 0,
  `fk_table` varchar(30) DEFAULT '',
  `keyword_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `udx01_object_keywords` (`fk_id`,`fk_table`,`keyword_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_keywords`
--

LOCK TABLES `object_keywords` WRITE;
/*!40000 ALTER TABLE `object_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platforms`
--

DROP TABLE IF EXISTS `platforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `platforms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `testproject_id` int(10) unsigned NOT NULL,
  `notes` text NOT NULL,
  `enable_on_design` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `enable_on_execution` tinyint(1) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_platforms` (`testproject_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platforms`
--

LOCK TABLES `platforms` WRITE;
/*!40000 ALTER TABLE `platforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `platforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `basename` varchar(100) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
INSERT INTO `plugins` VALUES
(1,'TLTest',1,NULL,'2023-12-21 04:31:52');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugins_configuration`
--

DROP TABLE IF EXISTS `plugins_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins_configuration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `testproject_id` int(11) NOT NULL,
  `config_key` varchar(255) NOT NULL,
  `config_type` int(11) NOT NULL,
  `config_value` varchar(255) NOT NULL,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins_configuration`
--

LOCK TABLES `plugins_configuration` WRITE;
/*!40000 ALTER TABLE `plugins_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugins_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_coverage`
--

DROP TABLE IF EXISTS `req_coverage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `req_coverage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `req_id` int(10) NOT NULL,
  `req_version_id` int(10) NOT NULL,
  `testcase_id` int(10) NOT NULL,
  `tcversion_id` int(10) NOT NULL,
  `link_status` int(11) NOT NULL DEFAULT 1,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `review_requester_id` int(10) unsigned DEFAULT NULL,
  `review_request_ts` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `req_coverage_full_link` (`req_id`,`req_version_id`,`testcase_id`,`tcversion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='relation test case version ** requirement version';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_coverage`
--

LOCK TABLES `req_coverage` WRITE;
/*!40000 ALTER TABLE `req_coverage` DISABLE KEYS */;
/*!40000 ALTER TABLE `req_coverage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_monitor`
--

DROP TABLE IF EXISTS `req_monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `req_monitor` (
  `req_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `testproject_id` int(11) NOT NULL,
  PRIMARY KEY (`req_id`,`user_id`,`testproject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_monitor`
--

LOCK TABLES `req_monitor` WRITE;
/*!40000 ALTER TABLE `req_monitor` DISABLE KEYS */;
/*!40000 ALTER TABLE `req_monitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_relations`
--

DROP TABLE IF EXISTS `req_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `req_relations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source_id` int(10) unsigned NOT NULL,
  `destination_id` int(10) unsigned NOT NULL,
  `relation_type` smallint(5) unsigned NOT NULL DEFAULT 1,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_relations`
--

LOCK TABLES `req_relations` WRITE;
/*!40000 ALTER TABLE `req_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `req_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_revisions`
--

DROP TABLE IF EXISTS `req_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `req_revisions` (
  `parent_id` int(10) unsigned NOT NULL,
  `id` int(10) unsigned NOT NULL,
  `revision` smallint(5) unsigned NOT NULL DEFAULT 1,
  `req_doc_id` varchar(64) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `scope` text DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'V',
  `type` char(1) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `is_open` tinyint(1) NOT NULL DEFAULT 1,
  `expected_coverage` int(10) NOT NULL DEFAULT 1,
  `log_message` text DEFAULT NULL,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_id` int(10) unsigned DEFAULT NULL,
  `modification_ts` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `req_revisions_uidx1` (`parent_id`,`revision`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_revisions`
--

LOCK TABLES `req_revisions` WRITE;
/*!40000 ALTER TABLE `req_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `req_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_specs`
--

DROP TABLE IF EXISTS `req_specs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `req_specs` (
  `id` int(10) unsigned NOT NULL,
  `testproject_id` int(10) unsigned NOT NULL,
  `doc_id` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `req_spec_uk1` (`doc_id`,`testproject_id`),
  KEY `testproject_id` (`testproject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Dev. Documents (e.g. System Requirements Specification)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_specs`
--

LOCK TABLES `req_specs` WRITE;
/*!40000 ALTER TABLE `req_specs` DISABLE KEYS */;
INSERT INTO `req_specs` VALUES
(160,134,'Proto 1'),
(138,134,'Requirment 001');
/*!40000 ALTER TABLE `req_specs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_specs_revisions`
--

DROP TABLE IF EXISTS `req_specs_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `req_specs_revisions` (
  `parent_id` int(10) unsigned NOT NULL,
  `id` int(10) unsigned NOT NULL,
  `revision` smallint(5) unsigned NOT NULL DEFAULT 1,
  `doc_id` varchar(64) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `scope` text DEFAULT NULL,
  `total_req` int(10) NOT NULL DEFAULT 0,
  `status` int(10) unsigned DEFAULT 1,
  `type` char(1) DEFAULT NULL,
  `log_message` text DEFAULT NULL,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_id` int(10) unsigned DEFAULT NULL,
  `modification_ts` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `req_specs_revisions_uidx1` (`parent_id`,`revision`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_specs_revisions`
--

LOCK TABLES `req_specs_revisions` WRITE;
/*!40000 ALTER TABLE `req_specs_revisions` DISABLE KEYS */;
INSERT INTO `req_specs_revisions` VALUES
(138,139,1,'GaN001','Charger Testing','',0,1,'1','Requirement Specification Created',3,'2024-01-02 06:50:23',NULL,'2024-01-02 06:50:23'),
(138,140,2,'Requirment 001','Sample charger Testing','',0,1,'1','',3,'2024-01-02 06:52:02',NULL,'2024-01-02 06:52:02'),
(160,161,1,'Proto 1','GaN charger Proto 1','',0,1,'1','Requirement Specification Created',3,'2024-04-02 10:04:59',NULL,'2024-04-02 10:04:59');
/*!40000 ALTER TABLE `req_specs_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_versions`
--

DROP TABLE IF EXISTS `req_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `req_versions` (
  `id` int(10) unsigned NOT NULL,
  `version` smallint(5) unsigned NOT NULL DEFAULT 1,
  `revision` smallint(5) unsigned NOT NULL DEFAULT 1,
  `scope` text DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'V',
  `type` char(1) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `is_open` tinyint(1) NOT NULL DEFAULT 1,
  `expected_coverage` int(10) NOT NULL DEFAULT 1,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_id` int(10) unsigned DEFAULT NULL,
  `modification_ts` datetime NOT NULL DEFAULT current_timestamp(),
  `log_message` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_versions`
--

LOCK TABLES `req_versions` WRITE;
/*!40000 ALTER TABLE `req_versions` DISABLE KEYS */;
INSERT INTO `req_versions` VALUES
(142,1,1,'<p>Test Spigen and Chinese GaN Fast charger @Mysore Shyam Lab</p>','D','3',1,1,20,3,'2024-01-02 07:03:02',NULL,'2024-01-02 07:03:02','Requirement Created');
/*!40000 ALTER TABLE `req_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reqmgrsystems`
--

DROP TABLE IF EXISTS `reqmgrsystems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reqmgrsystems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` int(10) DEFAULT 0,
  `cfg` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reqmgrsystems_uidx1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reqmgrsystems`
--

LOCK TABLES `reqmgrsystems` WRITE;
/*!40000 ALTER TABLE `reqmgrsystems` DISABLE KEYS */;
/*!40000 ALTER TABLE `reqmgrsystems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requirements`
--

DROP TABLE IF EXISTS `requirements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requirements` (
  `id` int(10) unsigned NOT NULL,
  `srs_id` int(10) unsigned NOT NULL,
  `req_doc_id` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `requirements_req_doc_id` (`srs_id`,`req_doc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requirements`
--

LOCK TABLES `requirements` WRITE;
/*!40000 ALTER TABLE `requirements` DISABLE KEYS */;
INSERT INTO `requirements` VALUES
(141,138,'req 001');
/*!40000 ALTER TABLE `requirements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rights`
--

DROP TABLE IF EXISTS `rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rights` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rights_descr` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rights`
--

LOCK TABLES `rights` WRITE;
/*!40000 ALTER TABLE `rights` DISABLE KEYS */;
INSERT INTO `rights` VALUES
(53,'cfield_assignment'),
(18,'cfield_management'),
(17,'cfield_view'),
(51,'codetracker_management'),
(52,'codetracker_view'),
(56,'delete_frozen_tcversion'),
(22,'events_mgt'),
(54,'exec_assign_testcases'),
(36,'exec_delete'),
(35,'exec_edit_notes'),
(49,'exec_ro_access'),
(41,'exec_testcases_assigned_to_me'),
(31,'issuetracker_management'),
(32,'issuetracker_view'),
(29,'keyword_assignment'),
(9,'mgt_modify_key'),
(12,'mgt_modify_product'),
(11,'mgt_modify_req'),
(7,'mgt_modify_tc'),
(48,'mgt_plugins'),
(16,'mgt_testplan_create'),
(30,'mgt_unfreeze_req'),
(13,'mgt_users'),
(20,'mgt_view_events'),
(8,'mgt_view_key'),
(10,'mgt_view_req'),
(6,'mgt_view_tc'),
(21,'mgt_view_usergroups'),
(50,'monitor_requirement'),
(24,'platform_management'),
(25,'platform_view'),
(26,'project_inventory_management'),
(27,'project_inventory_view'),
(33,'reqmgrsystem_management'),
(34,'reqmgrsystem_view'),
(28,'req_tcase_link_management'),
(14,'role_management'),
(19,'system_configuration'),
(47,'testcase_freeze'),
(43,'testplan_add_remove_platforms'),
(2,'testplan_create_build'),
(1,'testplan_execute'),
(3,'testplan_metrics'),
(40,'testplan_milestone_overview'),
(4,'testplan_planning'),
(45,'testplan_set_urgent_testcases'),
(46,'testplan_show_testcases_newest_versions'),
(37,'testplan_unlink_executed_testcases'),
(44,'testplan_update_linked_testcase_versions'),
(5,'testplan_user_role_assignment'),
(55,'testproject_add_remove_keywords_executed_tcversions'),
(38,'testproject_delete_executed_testcases'),
(39,'testproject_edit_executed_testcases'),
(42,'testproject_metrics_dashboard'),
(23,'testproject_user_role_assignment'),
(15,'user_role_assignment');
/*!40000 ALTER TABLE `rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risk_assignments`
--

DROP TABLE IF EXISTS `risk_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `risk_assignments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `testplan_id` int(10) unsigned NOT NULL DEFAULT 0,
  `node_id` int(10) unsigned NOT NULL DEFAULT 0,
  `risk` char(1) NOT NULL DEFAULT '2',
  `importance` char(1) NOT NULL DEFAULT 'M',
  PRIMARY KEY (`id`),
  UNIQUE KEY `risk_assignments_tplan_node_id` (`testplan_id`,`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risk_assignments`
--

LOCK TABLES `risk_assignments` WRITE;
/*!40000 ALTER TABLE `risk_assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `risk_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_rights`
--

DROP TABLE IF EXISTS `role_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_rights` (
  `role_id` int(10) NOT NULL DEFAULT 0,
  `right_id` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`role_id`,`right_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_rights`
--

LOCK TABLES `role_rights` WRITE;
/*!40000 ALTER TABLE `role_rights` DISABLE KEYS */;
INSERT INTO `role_rights` VALUES
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(1,6),
(1,7),
(1,8),
(1,9),
(1,10),
(1,11),
(1,12),
(1,16),
(1,17),
(1,18),
(1,20),
(1,22),
(1,24),
(1,25),
(1,26),
(1,27),
(1,28),
(1,29),
(1,30),
(1,31),
(1,32),
(1,35),
(1,36),
(1,37),
(1,38),
(1,39),
(1,40),
(1,41),
(1,43),
(1,44),
(1,45),
(1,46),
(1,47),
(1,49),
(1,50),
(1,51),
(1,52),
(1,53),
(1,54),
(1,55),
(1,56),
(4,3),
(4,6),
(4,7),
(4,8),
(4,9),
(4,10),
(4,11),
(4,28),
(4,29),
(4,30),
(4,50),
(5,3),
(5,6),
(5,8),
(6,1),
(6,2),
(6,3),
(6,6),
(6,7),
(6,8),
(6,9),
(6,11),
(6,25),
(6,27),
(6,28),
(6,29),
(6,30),
(6,50),
(7,1),
(7,3),
(7,6),
(7,8),
(8,1),
(8,2),
(8,3),
(8,4),
(8,5),
(8,6),
(8,7),
(8,8),
(8,9),
(8,10),
(8,11),
(8,12),
(8,13),
(8,14),
(8,15),
(8,16),
(8,17),
(8,18),
(8,19),
(8,20),
(8,21),
(8,22),
(8,23),
(8,24),
(8,25),
(8,26),
(8,27),
(8,28),
(8,29),
(8,30),
(8,31),
(8,32),
(8,33),
(8,34),
(8,35),
(8,36),
(8,37),
(8,38),
(8,39),
(8,40),
(8,41),
(8,42),
(8,43),
(8,44),
(8,45),
(8,46),
(8,47),
(8,48),
(8,50),
(8,51),
(8,52),
(8,53),
(8,54),
(9,1),
(9,2),
(9,3),
(9,4),
(9,5),
(9,6),
(9,7),
(9,8),
(9,9),
(9,10),
(9,11),
(9,16),
(9,24),
(9,25),
(9,26),
(9,27),
(9,28),
(9,29),
(9,30),
(9,31),
(9,32),
(9,35),
(9,36),
(9,37),
(9,38),
(9,39),
(9,40),
(9,41),
(9,43),
(9,44),
(9,45),
(9,46),
(9,47),
(9,49),
(9,50),
(9,53),
(9,54),
(9,55),
(10,6),
(10,7),
(10,8),
(10,10),
(10,11),
(10,24),
(10,25),
(10,28),
(10,30),
(10,31),
(10,32),
(10,35),
(10,49),
(10,50),
(10,55);
/*!40000 ALTER TABLE `role_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL DEFAULT '',
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_rights_roles_descr` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES
(1,'Team admin',''),
(2,'<reserved system role 2>',NULL),
(3,'<no rights>',NULL),
(4,'test designer',NULL),
(5,'guest',NULL),
(6,'senior tester',NULL),
(7,'tester',NULL),
(8,'admin',NULL),
(9,'leader',''),
(10,'Developer','');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcsteps`
--

DROP TABLE IF EXISTS `tcsteps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcsteps` (
  `id` int(10) unsigned NOT NULL,
  `step_number` int(11) NOT NULL DEFAULT 1,
  `actions` text DEFAULT NULL,
  `expected_results` text DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `execution_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 -> manual, 2 -> automated',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcsteps`
--

LOCK TABLES `tcsteps` WRITE;
/*!40000 ALTER TABLE `tcsteps` DISABLE KEYS */;
INSERT INTO `tcsteps` VALUES
(151,1,'<p>Click on the Link and follow the Test procedure of the Output Power.</p>\r\n\r\n<p><a href=\"https://writer.zoho.com/writer/open/bwngy397e26220ca7474e834fe358d51faeec\">https://writer.zoho.com/writer/open/bwngy397e26220ca7474e834fe358d51faeec</a></p>\r\n','',1,1);
/*!40000 ALTER TABLE `tcsteps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcversions`
--

DROP TABLE IF EXISTS `tcversions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcversions` (
  `id` int(10) unsigned NOT NULL,
  `tc_external_id` int(10) unsigned DEFAULT NULL,
  `version` smallint(5) unsigned NOT NULL DEFAULT 1,
  `layout` smallint(5) unsigned NOT NULL DEFAULT 1,
  `status` smallint(5) unsigned NOT NULL DEFAULT 1,
  `summary` text DEFAULT NULL,
  `preconditions` text DEFAULT NULL,
  `importance` smallint(5) unsigned NOT NULL DEFAULT 2,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `updater_id` int(10) unsigned DEFAULT NULL,
  `modification_ts` datetime NOT NULL DEFAULT current_timestamp(),
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `is_open` tinyint(1) NOT NULL DEFAULT 1,
  `execution_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 -> manual, 2 -> automated',
  `estimated_exec_duration` decimal(6,2) DEFAULT NULL COMMENT 'NULL will be considered as NO DATA Provided by user',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcversions`
--

LOCK TABLES `tcversions` WRITE;
/*!40000 ALTER TABLE `tcversions` DISABLE KEYS */;
INSERT INTO `tcversions` VALUES
(150,3,1,1,1,'<p>Verify and measure the ouput power of the charger.&nbsp;</p>\r\n','',2,3,'2024-01-16 06:42:10',3,'2024-01-16 06:43:52',1,1,1,NULL),
(157,4,1,1,1,'<p>Verify line regulation of the&nbsp; sample charger</p>\r\n\r\n<p>&nbsp;</p>\r\n','',2,3,'2024-04-02 09:54:31',NULL,'2024-04-02 09:54:31',1,1,1,NULL),
(159,5,1,1,1,'<p>Verify Load Regulation of the charger</p>\r\n','',2,3,'2024-04-02 09:55:01',NULL,'2024-04-02 09:55:01',1,1,1,NULL),
(163,6,1,1,1,'','',2,3,'2024-04-02 10:11:40',NULL,'2024-04-02 10:11:40',1,1,1,NULL);
/*!40000 ALTER TABLE `tcversions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `tcversions_without_keywords`
--

DROP TABLE IF EXISTS `tcversions_without_keywords`;
/*!50001 DROP VIEW IF EXISTS `tcversions_without_keywords`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `tcversions_without_keywords` AS SELECT
 1 AS `testcase_id`,
  1 AS `id` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `tcversions_without_platforms`
--

DROP TABLE IF EXISTS `tcversions_without_platforms`;
/*!50001 DROP VIEW IF EXISTS `tcversions_without_platforms`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `tcversions_without_platforms` AS SELECT
 1 AS `testcase_id`,
  1 AS `id` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `testcase_keywords`
--

DROP TABLE IF EXISTS `testcase_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testcase_keywords` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `testcase_id` int(10) unsigned NOT NULL DEFAULT 0,
  `tcversion_id` int(10) unsigned NOT NULL DEFAULT 0,
  `keyword_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx01_testcase_keywords` (`testcase_id`,`tcversion_id`,`keyword_id`),
  KEY `idx02_testcase_keywords` (`tcversion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testcase_keywords`
--

LOCK TABLES `testcase_keywords` WRITE;
/*!40000 ALTER TABLE `testcase_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `testcase_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testcase_platforms`
--

DROP TABLE IF EXISTS `testcase_platforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testcase_platforms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `testcase_id` int(10) unsigned NOT NULL DEFAULT 0,
  `tcversion_id` int(10) unsigned NOT NULL DEFAULT 0,
  `platform_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx01_testcase_platform` (`testcase_id`,`tcversion_id`,`platform_id`),
  KEY `idx02_testcase_platform` (`tcversion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testcase_platforms`
--

LOCK TABLES `testcase_platforms` WRITE;
/*!40000 ALTER TABLE `testcase_platforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `testcase_platforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testcase_relations`
--

DROP TABLE IF EXISTS `testcase_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testcase_relations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source_id` int(10) unsigned NOT NULL,
  `destination_id` int(10) unsigned NOT NULL,
  `link_status` tinyint(1) NOT NULL DEFAULT 1,
  `relation_type` smallint(5) unsigned NOT NULL DEFAULT 1,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testcase_relations`
--

LOCK TABLES `testcase_relations` WRITE;
/*!40000 ALTER TABLE `testcase_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `testcase_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testcase_script_links`
--

DROP TABLE IF EXISTS `testcase_script_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testcase_script_links` (
  `tcversion_id` int(10) unsigned NOT NULL DEFAULT 0,
  `project_key` varchar(64) NOT NULL,
  `repository_name` varchar(64) NOT NULL,
  `code_path` varchar(255) NOT NULL,
  `branch_name` varchar(64) DEFAULT NULL,
  `commit_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`tcversion_id`,`project_key`,`repository_name`,`code_path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testcase_script_links`
--

LOCK TABLES `testcase_script_links` WRITE;
/*!40000 ALTER TABLE `testcase_script_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `testcase_script_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testplan_platforms`
--

DROP TABLE IF EXISTS `testplan_platforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testplan_platforms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `testplan_id` int(10) unsigned NOT NULL,
  `platform_id` int(10) unsigned NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_testplan_platforms` (`testplan_id`,`platform_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Connects a testplan with platforms';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testplan_platforms`
--

LOCK TABLES `testplan_platforms` WRITE;
/*!40000 ALTER TABLE `testplan_platforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `testplan_platforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testplan_tcversions`
--

DROP TABLE IF EXISTS `testplan_tcversions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testplan_tcversions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `testplan_id` int(10) unsigned NOT NULL DEFAULT 0,
  `tcversion_id` int(10) unsigned NOT NULL DEFAULT 0,
  `node_order` int(10) unsigned NOT NULL DEFAULT 1,
  `urgency` smallint(5) NOT NULL DEFAULT 2,
  `platform_id` int(10) unsigned NOT NULL DEFAULT 0,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `testplan_tcversions_tplan_tcversion` (`testplan_id`,`tcversion_id`,`platform_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testplan_tcversions`
--

LOCK TABLES `testplan_tcversions` WRITE;
/*!40000 ALTER TABLE `testplan_tcversions` DISABLE KEYS */;
INSERT INTO `testplan_tcversions` VALUES
(11,137,157,10000,2,0,3,'2024-04-02 10:00:38'),
(12,137,159,10010,2,0,3,'2024-04-02 10:00:38'),
(13,153,163,10000,2,0,3,'2024-04-02 10:29:21');
/*!40000 ALTER TABLE `testplan_tcversions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testplans`
--

DROP TABLE IF EXISTS `testplans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testplans` (
  `id` int(10) unsigned NOT NULL,
  `testproject_id` int(10) unsigned NOT NULL DEFAULT 0,
  `notes` text DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `is_open` tinyint(1) NOT NULL DEFAULT 1,
  `is_public` tinyint(1) NOT NULL DEFAULT 1,
  `api_key` varchar(64) NOT NULL DEFAULT '829a2ded3ed0829a2dedd8ab81dfa2c77e8235bc3ed0d8ab81dfa2c77e8235bc',
  PRIMARY KEY (`id`),
  UNIQUE KEY `testplans_api_key` (`api_key`),
  KEY `testplans_testproject_id_active` (`testproject_id`,`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testplans`
--

LOCK TABLES `testplans` WRITE;
/*!40000 ALTER TABLE `testplans` DISABLE KEYS */;
INSERT INTO `testplans` VALUES
(137,134,'<p>Object : Test Spigen and Chinese GaN Fast sample chargers.</p>',1,1,1,'108241064f70d41dfd41a4f986056faa4fcff89c5d25469e10deea9b917deca1'),
(153,134,'<p>GaN charger Proto 1</p>\r\n\r\n<ol>\r\n	<li>Infineon</li>\r\n	<li>Navitas + Silanna</li>\r\n	<li>Silanna + Silanna</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>',1,1,1,'e508db0c07df9d5e0603af3dcb1c4f65a6c252e271e6836a58363d87e08c15f1');
/*!40000 ALTER TABLE `testplans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testproject_codetracker`
--

DROP TABLE IF EXISTS `testproject_codetracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testproject_codetracker` (
  `testproject_id` int(10) unsigned NOT NULL,
  `codetracker_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`testproject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testproject_codetracker`
--

LOCK TABLES `testproject_codetracker` WRITE;
/*!40000 ALTER TABLE `testproject_codetracker` DISABLE KEYS */;
/*!40000 ALTER TABLE `testproject_codetracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testproject_issuetracker`
--

DROP TABLE IF EXISTS `testproject_issuetracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testproject_issuetracker` (
  `testproject_id` int(10) unsigned NOT NULL,
  `issuetracker_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`testproject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testproject_issuetracker`
--

LOCK TABLES `testproject_issuetracker` WRITE;
/*!40000 ALTER TABLE `testproject_issuetracker` DISABLE KEYS */;
INSERT INTO `testproject_issuetracker` VALUES
(134,1);
/*!40000 ALTER TABLE `testproject_issuetracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testproject_reqmgrsystem`
--

DROP TABLE IF EXISTS `testproject_reqmgrsystem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testproject_reqmgrsystem` (
  `testproject_id` int(10) unsigned NOT NULL,
  `reqmgrsystem_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`testproject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testproject_reqmgrsystem`
--

LOCK TABLES `testproject_reqmgrsystem` WRITE;
/*!40000 ALTER TABLE `testproject_reqmgrsystem` DISABLE KEYS */;
/*!40000 ALTER TABLE `testproject_reqmgrsystem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testprojects`
--

DROP TABLE IF EXISTS `testprojects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testprojects` (
  `id` int(10) unsigned NOT NULL,
  `notes` text DEFAULT NULL,
  `color` varchar(12) NOT NULL DEFAULT '#9BD',
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `option_reqs` tinyint(1) NOT NULL DEFAULT 0,
  `option_priority` tinyint(1) NOT NULL DEFAULT 0,
  `option_automation` tinyint(1) NOT NULL DEFAULT 0,
  `options` text DEFAULT NULL,
  `prefix` varchar(16) NOT NULL,
  `tc_counter` int(10) unsigned NOT NULL DEFAULT 0,
  `is_public` tinyint(1) NOT NULL DEFAULT 1,
  `issue_tracker_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `code_tracker_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `reqmgr_integration_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `api_key` varchar(64) NOT NULL DEFAULT '0d8ab81dfa2c77e8235bc829a2ded3edfa2c78235bc829a27eded3ed0d8ab81d',
  PRIMARY KEY (`id`),
  UNIQUE KEY `testprojects_prefix` (`prefix`),
  UNIQUE KEY `testprojects_api_key` (`api_key`),
  KEY `testprojects_id_active` (`id`,`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testprojects`
--

LOCK TABLES `testprojects` WRITE;
/*!40000 ALTER TABLE `testprojects` DISABLE KEYS */;
INSERT INTO `testprojects` VALUES
(134,'','',1,0,0,0,'O:8:\"stdClass\":4:{s:19:\"requirementsEnabled\";i:1;s:19:\"testPriorityEnabled\";i:1;s:17:\"automationEnabled\";i:1;s:16:\"inventoryEnabled\";i:1;}','TCGaN',6,1,1,0,0,'23a08c0f7d2227525aaf90c1c7cf1b48ed36072c48cc5436eece2c04539fc30e');
/*!40000 ALTER TABLE `testprojects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testsuites`
--

DROP TABLE IF EXISTS `testsuites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testsuites` (
  `id` int(10) unsigned NOT NULL,
  `details` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testsuites`
--

LOCK TABLES `testsuites` WRITE;
/*!40000 ALTER TABLE `testsuites` DISABLE KEYS */;
INSERT INTO `testsuites` VALUES
(148,'<p>This Suite has test scenarios of the charger.</p>\r\n'),
(154,'<p>Functional Testcase-</p>\r\n\r\n<ol>\r\n	<li>Ports &amp; Profiles</li>\r\n	<li>Efficiency</li>\r\n	<li>Output voltage verification</li>\r\n	<li>Voltage Range Testing</li>\r\n	<li>Rated Output</li>\r\n	<li>Voltage Adjustment testing</li>\r\n	<li>Voltage Ripple</li>\r\n	<li>Output Current Verification</li>\r\n	<li>Dynamic Voltage and Current Adjustments</li>\r\n	<li>Current Adjustment Testing</li>\r\n</ol>\r\n'),
(155,'');
/*!40000 ALTER TABLE `testsuites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `text_templates`
--

DROP TABLE IF EXISTS `text_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `text_templates` (
  `id` int(10) unsigned NOT NULL,
  `type` smallint(5) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `template_data` text DEFAULT NULL,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_public` tinyint(1) NOT NULL DEFAULT 0,
  UNIQUE KEY `idx_text_templates` (`type`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Global Project Templates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `text_templates`
--

LOCK TABLES `text_templates` WRITE;
/*!40000 ALTER TABLE `text_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `text_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_point` varchar(45) NOT NULL DEFAULT '',
  `start_time` int(10) unsigned NOT NULL DEFAULT 0,
  `end_time` int(10) unsigned NOT NULL DEFAULT 0,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `session_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1051 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES
(1,'/login.php',1703071931,1703071931,1,'lbtrfg6a63qs1nccosg5fm9u2k'),
(2,'/lib/project/projectEdit.php',1703071931,1703071931,1,'lbtrfg6a63qs1nccosg5fm9u2k'),
(3,'/logout.php',1703072025,1703072025,1,'lbtrfg6a63qs1nccosg5fm9u2k'),
(4,'/login.php',1703072857,1703072857,1,'lbtrfg6a63qs1nccosg5fm9u2k'),
(5,'/lib/project/projectEdit.php',1703072857,1703072857,1,'lbtrfg6a63qs1nccosg5fm9u2k'),
(6,'/lib/usermanagement/userInfo.php',1703072862,1703072862,1,'lbtrfg6a63qs1nccosg5fm9u2k'),
(7,'/lib/usermanagement/userInfo.php',1703072875,1703072875,1,'lbtrfg6a63qs1nccosg5fm9u2k'),
(8,'/lib/project/projectEdit.php',1703073027,1703073027,1,'lbtrfg6a63qs1nccosg5fm9u2k'),
(9,'/lib/general/mainPage.php',1703073033,1703073033,1,'lbtrfg6a63qs1nccosg5fm9u2k'),
(10,'/lib/issuetrackers/issueTrackerView.php',1703073072,1703073072,1,'lbtrfg6a63qs1nccosg5fm9u2k'),
(11,'/lib/issuetrackers/issueTrackerEdit.php',1703073172,1703073172,1,'lbtrfg6a63qs1nccosg5fm9u2k'),
(12,'/lib/project/projectEdit.php',1703073193,1703073193,1,'lbtrfg6a63qs1nccosg5fm9u2k'),
(13,'/lib/usermanagement/usersView.php',1703073598,1703073598,1,'lbtrfg6a63qs1nccosg5fm9u2k'),
(14,'/lib/usermanagement/usersEdit.php',1703073699,1703073699,1,'lbtrfg6a63qs1nccosg5fm9u2k'),
(15,'/login.php',1703132212,1703132212,1,'02e48m960mekvgauigps0578v8'),
(16,'/lib/general/mainPage.php',1703132213,1703132213,1,'02e48m960mekvgauigps0578v8'),
(17,'/lib/project/projectView.php',1703132226,1703132226,1,'02e48m960mekvgauigps0578v8'),
(18,'/lib/project/projectEdit.php',1703132236,1703132236,1,'02e48m960mekvgauigps0578v8'),
(19,'/lib/testcases/listTestCases.php',1703132251,1703132251,1,'02e48m960mekvgauigps0578v8'),
(20,'/lib/testcases/archiveData.php',1703132251,1703132251,1,'02e48m960mekvgauigps0578v8'),
(21,'/lib/usermanagement/usersView.php',1703132266,1703132266,1,'02e48m960mekvgauigps0578v8'),
(22,'/lib/testcases/listTestCases.php',1703132327,1703132327,1,'02e48m960mekvgauigps0578v8'),
(23,'/lib/testcases/archiveData.php',1703132327,1703132327,1,'02e48m960mekvgauigps0578v8'),
(24,'/lib/issuetrackers/issueTrackerView.php',1703133089,1703133089,1,'02e48m960mekvgauigps0578v8'),
(25,'/lib/testcases/listTestCases.php',1703133099,1703133099,1,'02e48m960mekvgauigps0578v8'),
(26,'/lib/testcases/archiveData.php',1703133099,1703133099,1,'02e48m960mekvgauigps0578v8'),
(27,'/lib/general/mainPage.php',1703133115,1703133115,1,'02e48m960mekvgauigps0578v8'),
(28,'/lib/testcases/listTestCases.php',1703133160,1703133160,1,'02e48m960mekvgauigps0578v8'),
(29,'/lib/usermanagement/rolesView.php',1703133650,1703133650,1,'02e48m960mekvgauigps0578v8'),
(30,'/lib/usermanagement/rolesEdit.php',1703133655,1703133655,1,'02e48m960mekvgauigps0578v8'),
(31,'/lib/usermanagement/rolesEdit.php',1703133735,1703133735,1,'02e48m960mekvgauigps0578v8'),
(32,'/logout.php',1703134456,1703134456,1,'02e48m960mekvgauigps0578v8'),
(33,'/login.php',1703139264,1703139264,1,'lbtrfg6a63qs1nccosg5fm9u2k'),
(34,'/lib/general/mainPage.php',1703139264,1703139264,1,'lbtrfg6a63qs1nccosg5fm9u2k'),
(35,'/lib/requirements/reqSpecListTree.php',1703139267,1703139267,1,'lbtrfg6a63qs1nccosg5fm9u2k'),
(36,'/lib/usermanagement/usersView.php',1703139274,1703139274,1,'lbtrfg6a63qs1nccosg5fm9u2k'),
(37,'/login.php',1703149039,1703149039,1,'02e48m960mekvgauigps0578v8'),
(38,'/lib/general/mainPage.php',1703149039,1703149039,1,'02e48m960mekvgauigps0578v8'),
(39,'/lib/project/projectView.php',1703156260,1703156260,1,'02e48m960mekvgauigps0578v8'),
(40,'/lib/project/projectEdit.php',1703156263,1703156263,1,'02e48m960mekvgauigps0578v8'),
(41,'/lib/platforms/platformsView.php',1703156278,1703156278,1,'02e48m960mekvgauigps0578v8'),
(42,'/lib/platforms/platformsEdit.php',1703156279,1703156279,1,'02e48m960mekvgauigps0578v8'),
(43,'/lib/plan/planEdit.php',1703156301,1703156301,1,'02e48m960mekvgauigps0578v8'),
(44,'/lib/requirements/reqSpecListTree.php',1703156317,1703156317,1,'02e48m960mekvgauigps0578v8'),
(45,'/lib/requirements/reqSpecEdit.php',1703156320,1703156320,1,'02e48m960mekvgauigps0578v8'),
(46,'/login.php',1703217617,1703217617,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(47,'/lib/general/mainPage.php',1703217618,1703217618,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(48,'/lib/project/projectView.php',1703217622,1703217622,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(49,'/login.php',1703218837,1703218837,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(50,'/lib/project/projectEdit.php',1703218968,1703218968,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(51,'/lib/requirements/reqSpecListTree.php',1703219523,1703219523,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(52,'/login.php',1703220099,1703220099,1,'qi4neba6fua8j17kt1ea7lgagl'),
(53,'/lib/general/mainPage.php',1703220099,1703220099,1,'qi4neba6fua8j17kt1ea7lgagl'),
(54,'/lib/requirements/reqSpecListTree.php',1703220102,1703220102,1,'qi4neba6fua8j17kt1ea7lgagl'),
(55,'/lib/requirements/reqSpecEdit.php',1703220106,1703220106,1,'qi4neba6fua8j17kt1ea7lgagl'),
(56,'/lib/requirements/reqSpecEdit.php',1703220215,1703220216,1,'qi4neba6fua8j17kt1ea7lgagl'),
(57,'/lib/requirements/reqSpecView.php',1703220224,1703220224,1,'qi4neba6fua8j17kt1ea7lgagl'),
(58,'/lib/requirements/reqEdit.php',1703220234,1703220234,1,'qi4neba6fua8j17kt1ea7lgagl'),
(59,'/lib/requirements/reqEdit.php',1703220268,1703220268,1,'qi4neba6fua8j17kt1ea7lgagl'),
(60,'/lib/requirements/reqView.php',1703220268,1703220268,1,'qi4neba6fua8j17kt1ea7lgagl'),
(61,'/lib/requirements/reqEdit.php',1703220387,1703220387,1,'qi4neba6fua8j17kt1ea7lgagl'),
(62,'/lib/requirements/reqEdit.php',1703220431,1703220431,1,'qi4neba6fua8j17kt1ea7lgagl'),
(63,'/lib/requirements/reqEdit.php',1703220455,1703220455,1,'qi4neba6fua8j17kt1ea7lgagl'),
(64,'/lib/requirements/reqEdit.php',1703220469,1703220469,1,'qi4neba6fua8j17kt1ea7lgagl'),
(65,'/lib/requirements/reqEdit.php',1703220489,1703220489,1,'qi4neba6fua8j17kt1ea7lgagl'),
(66,'/lib/requirements/reqEdit.php',1703220614,1703220614,1,'qi4neba6fua8j17kt1ea7lgagl'),
(67,'/lib/requirements/reqEdit.php',1703220640,1703220640,1,'qi4neba6fua8j17kt1ea7lgagl'),
(68,'/lib/requirements/reqEdit.php',1703220658,1703220659,1,'qi4neba6fua8j17kt1ea7lgagl'),
(69,'/lib/requirements/reqEdit.php',1703220671,1703220671,1,'qi4neba6fua8j17kt1ea7lgagl'),
(70,'/lib/requirements/reqEdit.php',1703220689,1703220689,1,'qi4neba6fua8j17kt1ea7lgagl'),
(71,'/lib/requirements/reqEdit.php',1703220704,1703220704,1,'qi4neba6fua8j17kt1ea7lgagl'),
(72,'/lib/requirements/reqEdit.php',1703220717,1703220717,1,'qi4neba6fua8j17kt1ea7lgagl'),
(73,'/lib/requirements/reqEdit.php',1703220766,1703220766,1,'qi4neba6fua8j17kt1ea7lgagl'),
(74,'/lib/requirements/reqEdit.php',1703220786,1703220786,1,'qi4neba6fua8j17kt1ea7lgagl'),
(75,'/lib/requirements/reqEdit.php',1703220803,1703220803,1,'qi4neba6fua8j17kt1ea7lgagl'),
(76,'/lib/requirements/reqEdit.php',1703220819,1703220819,1,'qi4neba6fua8j17kt1ea7lgagl'),
(77,'/lib/requirements/reqEdit.php',1703220844,1703220844,1,'qi4neba6fua8j17kt1ea7lgagl'),
(78,'/lib/requirements/reqEdit.php',1703220862,1703220862,1,'qi4neba6fua8j17kt1ea7lgagl'),
(79,'/lib/requirements/reqEdit.php',1703220879,1703220879,1,'qi4neba6fua8j17kt1ea7lgagl'),
(80,'/lib/requirements/reqEdit.php',1703220890,1703220890,1,'qi4neba6fua8j17kt1ea7lgagl'),
(81,'/lib/requirements/reqEdit.php',1703220915,1703220915,1,'qi4neba6fua8j17kt1ea7lgagl'),
(82,'/lib/requirements/reqEdit.php',1703220933,1703220933,1,'qi4neba6fua8j17kt1ea7lgagl'),
(83,'/lib/requirements/reqEdit.php',1703221324,1703221324,1,'qi4neba6fua8j17kt1ea7lgagl'),
(84,'/lib/requirements/reqEdit.php',1703221344,1703221344,1,'qi4neba6fua8j17kt1ea7lgagl'),
(85,'/lib/requirements/reqEdit.php',1703221370,1703221370,1,'qi4neba6fua8j17kt1ea7lgagl'),
(86,'/lib/requirements/reqEdit.php',1703221388,1703221388,1,'qi4neba6fua8j17kt1ea7lgagl'),
(87,'/lib/requirements/reqEdit.php',1703221402,1703221402,1,'qi4neba6fua8j17kt1ea7lgagl'),
(88,'/lib/testcases/listTestCases.php',1703221935,1703221935,1,'qi4neba6fua8j17kt1ea7lgagl'),
(89,'/lib/testcases/archiveData.php',1703221935,1703221935,1,'qi4neba6fua8j17kt1ea7lgagl'),
(90,'/lib/testcases/archiveData.php',1703221938,1703221938,1,'qi4neba6fua8j17kt1ea7lgagl'),
(91,'/lib/testcases/containerEdit.php',1703221952,1703221952,1,'qi4neba6fua8j17kt1ea7lgagl'),
(92,'/lib/testcases/listTestCases.php',1703221952,1703221952,1,'qi4neba6fua8j17kt1ea7lgagl'),
(93,'/lib/testcases/containerEdit.php',1703221961,1703221961,1,'qi4neba6fua8j17kt1ea7lgagl'),
(94,'/lib/testcases/listTestCases.php',1703221962,1703221962,1,'qi4neba6fua8j17kt1ea7lgagl'),
(95,'/lib/testcases/containerEdit.php',1703221967,1703221967,1,'qi4neba6fua8j17kt1ea7lgagl'),
(96,'/lib/testcases/listTestCases.php',1703221967,1703221967,1,'qi4neba6fua8j17kt1ea7lgagl'),
(97,'/lib/testcases/containerEdit.php',1703221973,1703221973,1,'qi4neba6fua8j17kt1ea7lgagl'),
(98,'/lib/testcases/listTestCases.php',1703221973,1703221973,1,'qi4neba6fua8j17kt1ea7lgagl'),
(99,'/lib/testcases/containerEdit.php',1703221979,1703221979,1,'qi4neba6fua8j17kt1ea7lgagl'),
(100,'/lib/testcases/listTestCases.php',1703221979,1703221979,1,'qi4neba6fua8j17kt1ea7lgagl'),
(101,'/lib/testcases/containerEdit.php',1703221984,1703221984,1,'qi4neba6fua8j17kt1ea7lgagl'),
(102,'/lib/testcases/listTestCases.php',1703221985,1703221985,1,'qi4neba6fua8j17kt1ea7lgagl'),
(103,'/lib/testcases/containerEdit.php',1703221990,1703221990,1,'qi4neba6fua8j17kt1ea7lgagl'),
(104,'/lib/testcases/listTestCases.php',1703221990,1703221990,1,'qi4neba6fua8j17kt1ea7lgagl'),
(105,'/lib/testcases/containerEdit.php',1703221995,1703221995,1,'qi4neba6fua8j17kt1ea7lgagl'),
(106,'/lib/testcases/listTestCases.php',1703221996,1703221996,1,'qi4neba6fua8j17kt1ea7lgagl'),
(107,'/lib/testcases/containerEdit.php',1703222001,1703222001,1,'qi4neba6fua8j17kt1ea7lgagl'),
(108,'/lib/testcases/listTestCases.php',1703222002,1703222002,1,'qi4neba6fua8j17kt1ea7lgagl'),
(109,'/lib/testcases/containerEdit.php',1703222006,1703222006,1,'qi4neba6fua8j17kt1ea7lgagl'),
(110,'/lib/testcases/listTestCases.php',1703222006,1703222006,1,'qi4neba6fua8j17kt1ea7lgagl'),
(111,'/lib/testcases/containerEdit.php',1703222012,1703222012,1,'qi4neba6fua8j17kt1ea7lgagl'),
(112,'/lib/testcases/listTestCases.php',1703222012,1703222012,1,'qi4neba6fua8j17kt1ea7lgagl'),
(113,'/lib/testcases/containerEdit.php',1703222024,1703222024,1,'qi4neba6fua8j17kt1ea7lgagl'),
(114,'/lib/testcases/listTestCases.php',1703222024,1703222024,1,'qi4neba6fua8j17kt1ea7lgagl'),
(115,'/lib/testcases/containerEdit.php',1703222029,1703222029,1,'qi4neba6fua8j17kt1ea7lgagl'),
(116,'/lib/testcases/listTestCases.php',1703222029,1703222029,1,'qi4neba6fua8j17kt1ea7lgagl'),
(117,'/lib/testcases/containerEdit.php',1703222035,1703222035,1,'qi4neba6fua8j17kt1ea7lgagl'),
(118,'/lib/testcases/listTestCases.php',1703222035,1703222035,1,'qi4neba6fua8j17kt1ea7lgagl'),
(119,'/lib/testcases/containerEdit.php',1703222041,1703222041,1,'qi4neba6fua8j17kt1ea7lgagl'),
(120,'/lib/testcases/listTestCases.php',1703222041,1703222041,1,'qi4neba6fua8j17kt1ea7lgagl'),
(121,'/lib/testcases/containerEdit.php',1703222046,1703222046,1,'qi4neba6fua8j17kt1ea7lgagl'),
(122,'/lib/testcases/listTestCases.php',1703222046,1703222046,1,'qi4neba6fua8j17kt1ea7lgagl'),
(123,'/lib/testcases/containerEdit.php',1703222052,1703222052,1,'qi4neba6fua8j17kt1ea7lgagl'),
(124,'/lib/testcases/listTestCases.php',1703222052,1703222052,1,'qi4neba6fua8j17kt1ea7lgagl'),
(125,'/lib/testcases/containerEdit.php',1703222057,1703222057,1,'qi4neba6fua8j17kt1ea7lgagl'),
(126,'/lib/testcases/listTestCases.php',1703222058,1703222058,1,'qi4neba6fua8j17kt1ea7lgagl'),
(127,'/lib/testcases/containerEdit.php',1703222063,1703222063,1,'qi4neba6fua8j17kt1ea7lgagl'),
(128,'/lib/testcases/listTestCases.php',1703222063,1703222063,1,'qi4neba6fua8j17kt1ea7lgagl'),
(129,'/lib/testcases/containerEdit.php',1703222068,1703222068,1,'qi4neba6fua8j17kt1ea7lgagl'),
(130,'/lib/testcases/listTestCases.php',1703222068,1703222068,1,'qi4neba6fua8j17kt1ea7lgagl'),
(131,'/lib/testcases/containerEdit.php',1703222074,1703222074,1,'qi4neba6fua8j17kt1ea7lgagl'),
(132,'/lib/testcases/listTestCases.php',1703222074,1703222074,1,'qi4neba6fua8j17kt1ea7lgagl'),
(133,'/lib/testcases/containerEdit.php',1703222079,1703222079,1,'qi4neba6fua8j17kt1ea7lgagl'),
(134,'/lib/testcases/listTestCases.php',1703222079,1703222079,1,'qi4neba6fua8j17kt1ea7lgagl'),
(135,'/lib/testcases/archiveData.php',1703222119,1703222119,1,'qi4neba6fua8j17kt1ea7lgagl'),
(136,'/lib/testcases/tcEdit.php',1703222125,1703222125,1,'qi4neba6fua8j17kt1ea7lgagl'),
(137,'/lib/testcases/tcEdit.php',1703222164,1703222164,1,'qi4neba6fua8j17kt1ea7lgagl'),
(138,'/lib/testcases/listTestCases.php',1703222164,1703222164,1,'qi4neba6fua8j17kt1ea7lgagl'),
(139,'/lib/testcases/tcEdit.php',1703222178,1703222178,1,'qi4neba6fua8j17kt1ea7lgagl'),
(140,'/lib/testcases/listTestCases.php',1703222178,1703222178,1,'qi4neba6fua8j17kt1ea7lgagl'),
(141,'/lib/testcases/tcEdit.php',1703222188,1703222188,1,'qi4neba6fua8j17kt1ea7lgagl'),
(142,'/lib/testcases/tcEdit.php',1703222200,1703222200,1,'qi4neba6fua8j17kt1ea7lgagl'),
(143,'/lib/testcases/listTestCases.php',1703222200,1703222200,1,'qi4neba6fua8j17kt1ea7lgagl'),
(144,'/lib/testcases/tcEdit.php',1703222213,1703222213,1,'qi4neba6fua8j17kt1ea7lgagl'),
(145,'/lib/testcases/listTestCases.php',1703222214,1703222214,1,'qi4neba6fua8j17kt1ea7lgagl'),
(146,'/lib/testcases/tcEdit.php',1703222224,1703222224,1,'qi4neba6fua8j17kt1ea7lgagl'),
(147,'/lib/testcases/tcEdit.php',1703222230,1703222230,1,'qi4neba6fua8j17kt1ea7lgagl'),
(148,'/lib/testcases/listTestCases.php',1703222230,1703222230,1,'qi4neba6fua8j17kt1ea7lgagl'),
(149,'/lib/testcases/tcEdit.php',1703222236,1703222236,1,'qi4neba6fua8j17kt1ea7lgagl'),
(150,'/lib/testcases/tcEdit.php',1703222269,1703222269,1,'qi4neba6fua8j17kt1ea7lgagl'),
(151,'/lib/testcases/listTestCases.php',1703222269,1703222269,1,'qi4neba6fua8j17kt1ea7lgagl'),
(152,'/lib/testcases/tcEdit.php',1703222284,1703222284,1,'qi4neba6fua8j17kt1ea7lgagl'),
(153,'/lib/testcases/tcEdit.php',1703222349,1703222349,1,'qi4neba6fua8j17kt1ea7lgagl'),
(154,'/lib/testcases/listTestCases.php',1703222349,1703222349,1,'qi4neba6fua8j17kt1ea7lgagl'),
(155,'/lib/testcases/tcEdit.php',1703222360,1703222360,1,'qi4neba6fua8j17kt1ea7lgagl'),
(156,'/lib/testcases/tcEdit.php',1703222383,1703222383,1,'qi4neba6fua8j17kt1ea7lgagl'),
(157,'/lib/testcases/listTestCases.php',1703222383,1703222383,1,'qi4neba6fua8j17kt1ea7lgagl'),
(158,'/lib/testcases/tcEdit.php',1703222442,1703222443,1,'qi4neba6fua8j17kt1ea7lgagl'),
(159,'/lib/testcases/listTestCases.php',1703222443,1703222443,1,'qi4neba6fua8j17kt1ea7lgagl'),
(160,'/lib/testcases/tcEdit.php',1703222449,1703222449,1,'qi4neba6fua8j17kt1ea7lgagl'),
(161,'/lib/testcases/tcEdit.php',1703222452,1703222452,1,'qi4neba6fua8j17kt1ea7lgagl'),
(162,'/lib/testcases/tcEdit.php',1703222491,1703222491,1,'qi4neba6fua8j17kt1ea7lgagl'),
(163,'/lib/testcases/tcEdit.php',1703222510,1703222510,1,'qi4neba6fua8j17kt1ea7lgagl'),
(164,'/lib/testcases/listTestCases.php',1703222510,1703222510,1,'qi4neba6fua8j17kt1ea7lgagl'),
(165,'/lib/testcases/tcEdit.php',1703222529,1703222529,1,'qi4neba6fua8j17kt1ea7lgagl'),
(166,'/lib/testcases/listTestCases.php',1703222529,1703222529,1,'qi4neba6fua8j17kt1ea7lgagl'),
(167,'/lib/testcases/tcEdit.php',1703222544,1703222544,1,'qi4neba6fua8j17kt1ea7lgagl'),
(168,'/lib/testcases/tcEdit.php',1703222552,1703222552,1,'qi4neba6fua8j17kt1ea7lgagl'),
(169,'/lib/testcases/listTestCases.php',1703222552,1703222552,1,'qi4neba6fua8j17kt1ea7lgagl'),
(170,'/lib/testcases/tcEdit.php',1703222562,1703222562,1,'qi4neba6fua8j17kt1ea7lgagl'),
(171,'/lib/testcases/tcEdit.php',1703222571,1703222571,1,'qi4neba6fua8j17kt1ea7lgagl'),
(172,'/lib/testcases/listTestCases.php',1703222571,1703222571,1,'qi4neba6fua8j17kt1ea7lgagl'),
(173,'/lib/testcases/tcEdit.php',1703222586,1703222586,1,'qi4neba6fua8j17kt1ea7lgagl'),
(174,'/lib/testcases/tcEdit.php',1703222595,1703222595,1,'qi4neba6fua8j17kt1ea7lgagl'),
(175,'/lib/testcases/listTestCases.php',1703222595,1703222595,1,'qi4neba6fua8j17kt1ea7lgagl'),
(176,'/lib/testcases/tcEdit.php',1703222607,1703222607,1,'qi4neba6fua8j17kt1ea7lgagl'),
(177,'/lib/testcases/tcEdit.php',1703222616,1703222616,1,'qi4neba6fua8j17kt1ea7lgagl'),
(178,'/lib/testcases/listTestCases.php',1703222616,1703222616,1,'qi4neba6fua8j17kt1ea7lgagl'),
(179,'/lib/testcases/tcEdit.php',1703222629,1703222629,1,'qi4neba6fua8j17kt1ea7lgagl'),
(180,'/lib/testcases/tcEdit.php',1703222638,1703222638,1,'qi4neba6fua8j17kt1ea7lgagl'),
(181,'/lib/testcases/listTestCases.php',1703222638,1703222638,1,'qi4neba6fua8j17kt1ea7lgagl'),
(182,'/lib/testcases/tcEdit.php',1703222651,1703222651,1,'qi4neba6fua8j17kt1ea7lgagl'),
(183,'/lib/testcases/tcEdit.php',1703222656,1703222657,1,'qi4neba6fua8j17kt1ea7lgagl'),
(184,'/lib/testcases/listTestCases.php',1703222657,1703222657,1,'qi4neba6fua8j17kt1ea7lgagl'),
(185,'/lib/testcases/tcEdit.php',1703222666,1703222666,1,'qi4neba6fua8j17kt1ea7lgagl'),
(186,'/lib/testcases/tcEdit.php',1703222676,1703222676,1,'qi4neba6fua8j17kt1ea7lgagl'),
(187,'/lib/testcases/listTestCases.php',1703222676,1703222676,1,'qi4neba6fua8j17kt1ea7lgagl'),
(188,'/lib/testcases/tcEdit.php',1703222683,1703222683,1,'qi4neba6fua8j17kt1ea7lgagl'),
(189,'/lib/testcases/tcEdit.php',1703222692,1703222692,1,'qi4neba6fua8j17kt1ea7lgagl'),
(190,'/lib/testcases/listTestCases.php',1703222692,1703222692,1,'qi4neba6fua8j17kt1ea7lgagl'),
(191,'/lib/testcases/tcEdit.php',1703222705,1703222705,1,'qi4neba6fua8j17kt1ea7lgagl'),
(192,'/lib/testcases/tcEdit.php',1703222716,1703222716,1,'qi4neba6fua8j17kt1ea7lgagl'),
(193,'/lib/testcases/listTestCases.php',1703222716,1703222716,1,'qi4neba6fua8j17kt1ea7lgagl'),
(194,'/lib/testcases/tcEdit.php',1703222729,1703222729,1,'qi4neba6fua8j17kt1ea7lgagl'),
(195,'/lib/testcases/tcEdit.php',1703222737,1703222737,1,'qi4neba6fua8j17kt1ea7lgagl'),
(196,'/lib/testcases/listTestCases.php',1703222737,1703222737,1,'qi4neba6fua8j17kt1ea7lgagl'),
(197,'/lib/testcases/tcEdit.php',1703223444,1703223444,1,'qi4neba6fua8j17kt1ea7lgagl'),
(198,'/lib/testcases/tcEdit.php',1703223468,1703223468,1,'qi4neba6fua8j17kt1ea7lgagl'),
(199,'/lib/testcases/listTestCases.php',1703223468,1703223468,1,'qi4neba6fua8j17kt1ea7lgagl'),
(200,'/lib/testcases/tcEdit.php',1703223491,1703223491,1,'qi4neba6fua8j17kt1ea7lgagl'),
(201,'/lib/testcases/tcEdit.php',1703223497,1703223497,1,'qi4neba6fua8j17kt1ea7lgagl'),
(202,'/lib/testcases/listTestCases.php',1703223497,1703223497,1,'qi4neba6fua8j17kt1ea7lgagl'),
(203,'/lib/testcases/tcEdit.php',1703223515,1703223515,1,'qi4neba6fua8j17kt1ea7lgagl'),
(204,'/lib/testcases/tcEdit.php',1703223525,1703223525,1,'qi4neba6fua8j17kt1ea7lgagl'),
(205,'/lib/testcases/listTestCases.php',1703223525,1703223525,1,'qi4neba6fua8j17kt1ea7lgagl'),
(206,'/lib/testcases/tcEdit.php',1703223536,1703223536,1,'qi4neba6fua8j17kt1ea7lgagl'),
(207,'/lib/testcases/tcEdit.php',1703223547,1703223547,1,'qi4neba6fua8j17kt1ea7lgagl'),
(208,'/lib/testcases/listTestCases.php',1703223547,1703223547,1,'qi4neba6fua8j17kt1ea7lgagl'),
(209,'/lib/testcases/tcEdit.php',1703223560,1703223560,1,'qi4neba6fua8j17kt1ea7lgagl'),
(210,'/lib/testcases/tcEdit.php',1703223566,1703223566,1,'qi4neba6fua8j17kt1ea7lgagl'),
(211,'/lib/testcases/listTestCases.php',1703223567,1703223567,1,'qi4neba6fua8j17kt1ea7lgagl'),
(212,'/lib/testcases/tcEdit.php',1703223595,1703223595,1,'qi4neba6fua8j17kt1ea7lgagl'),
(213,'/lib/testcases/tcEdit.php',1703223606,1703223606,1,'qi4neba6fua8j17kt1ea7lgagl'),
(214,'/lib/testcases/listTestCases.php',1703223606,1703223606,1,'qi4neba6fua8j17kt1ea7lgagl'),
(215,'/lib/testcases/tcEdit.php',1703223615,1703223615,1,'qi4neba6fua8j17kt1ea7lgagl'),
(216,'/lib/testcases/tcEdit.php',1703223623,1703223623,1,'qi4neba6fua8j17kt1ea7lgagl'),
(217,'/lib/testcases/listTestCases.php',1703223624,1703223624,1,'qi4neba6fua8j17kt1ea7lgagl'),
(218,'/lib/testcases/tcEdit.php',1703223845,1703223845,1,'qi4neba6fua8j17kt1ea7lgagl'),
(219,'/lib/testcases/listTestCases.php',1703223845,1703223845,1,'qi4neba6fua8j17kt1ea7lgagl'),
(220,'/lib/testcases/listTestCases.php',1703226356,1703226356,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(221,'/lib/testcases/archiveData.php',1703226356,1703226356,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(222,'/lib/testcases/archiveData.php',1703226486,1703226486,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(223,'/lib/requirements/reqView.php',1703226529,1703226529,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(224,'/lib/requirements/reqEdit.php',1703226545,1703226545,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(225,'/lib/requirements/reqEdit.php',1703226574,1703226574,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(226,'/lib/testcases/listTestCases.php',1703226770,1703226770,1,'qi4neba6fua8j17kt1ea7lgagl'),
(227,'/lib/testcases/archiveData.php',1703226770,1703226770,1,'qi4neba6fua8j17kt1ea7lgagl'),
(228,'/lib/testcases/tcEdit.php',1703226781,1703226781,1,'qi4neba6fua8j17kt1ea7lgagl'),
(229,'/lib/testcases/tcEdit.php',1703226836,1703226836,1,'qi4neba6fua8j17kt1ea7lgagl'),
(230,'/lib/testcases/tcEdit.php',1703226845,1703226845,1,'qi4neba6fua8j17kt1ea7lgagl'),
(231,'/lib/testcases/tcEdit.php',1703226854,1703226854,1,'qi4neba6fua8j17kt1ea7lgagl'),
(232,'/lib/testcases/tcEdit.php',1703226856,1703226856,1,'qi4neba6fua8j17kt1ea7lgagl'),
(233,'/lib/plan/planEdit.php',1703226948,1703226948,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(234,'/lib/plan/planEdit.php',1703227002,1703227002,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(235,'/lib/plan/buildEdit.php',1703227080,1703227080,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(236,'/lib/plan/buildEdit.php',1703227173,1703227173,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(237,'/lib/plan/planAddTCNavigator.php',1703227242,1703227242,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(238,'/lib/plan/planAddTC.php',1703227381,1703227381,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(239,'/lib/plan/planAddTC.php',1703227463,1703227463,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(240,'/lib/plan/planAddTCNavigator.php',1703227464,1703227464,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(241,'/lib/plan/planAddTC.php',1703227472,1703227472,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(242,'/lib/plan/planAddTC.php',1703227478,1703227478,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(243,'/lib/plan/planAddTCNavigator.php',1703227479,1703227479,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(244,'/lib/plan/planAddTC.php',1703227595,1703227595,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(245,'/lib/plan/planAddTCNavigator.php',1703227595,1703227595,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(246,'/lib/execute/execNavigator.php',1703227607,1703227607,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(247,'/lib/execute/execDashboard.php',1703227607,1703227607,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(248,'/lib/execute/execSetResults.php',1703227691,1703227691,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(249,'/lib/execute/execSetResults.php',1703227691,1703227691,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(250,'/lib/execute/execSetResults.php',1703227692,1703227692,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(251,'/lib/execute/execSetResults.php',1703227693,1703227693,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(252,'/lib/execute/execSetResults.php',1703227695,1703227695,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(253,'/lib/execute/execSetResults.php',1703227820,1703227820,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(254,'/lib/execute/execSetResults.php',1703227823,1703227823,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(255,'/lib/execute/execSetResults.php',1703227930,1703227930,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(256,'/lib/execute/execSetResults.php',1703227982,1703227982,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(257,'/lib/execute/execSetResults.php',1703228058,1703228058,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(258,'/lib/execute/execSetResults.php',1703228070,1703228070,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(259,'/lib/execute/execSetResults.php',1703228094,1703228094,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(260,'/lib/execute/execSetResults.php',1703228110,1703228110,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(261,'/lib/execute/execSetResults.php',1703228123,1703228123,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(262,'/lib/execute/execSetResults.php',1703228127,1703228127,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(263,'/lib/execute/execSetResults.php',1703228131,1703228131,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(264,'/lib/execute/execSetResults.php',1703228151,1703228151,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(265,'/lib/execute/execSetResults.php',1703228154,1703228154,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(266,'/lib/plan/planEdit.php',1703228188,1703228188,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(267,'/lib/results/resultsNavigator.php',1703228203,1703228203,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(268,'/lib/results/printDocOptions.php',1703228213,1703228213,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(269,'/lib/results/printDocument.php',1703228217,1703228217,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(270,'/lib/results/printDocument.php',1703228231,1703228231,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(271,'/lib/results/printDocument.php',1703228239,1703228239,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(272,'/lib/execute/execSetResults.php',1703228261,1703228261,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(273,'/lib/execute/execSetResults.php',1703228283,1703228283,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(274,'/lib/platforms/platformsView.php',1703228791,1703228791,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(275,'/lib/platforms/platformsEdit.php',1703228793,1703228793,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(276,'/lib/platforms/platformsEdit.php',1703228880,1703228880,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(277,'/lib/platforms/platformsEdit.php',1703228882,1703228882,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(278,'/lib/platforms/platformsEdit.php',1703228889,1703228889,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(279,'/lib/platforms/platformsEdit.php',1703228890,1703228890,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(280,'/lib/platforms/platformsEdit.php',1703228899,1703228899,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(281,'/lib/platforms/platformsEdit.php',1703228901,1703228901,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(282,'/lib/platforms/platformsEdit.php',1703228912,1703228912,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(283,'/lib/plan/planAddTCNavigator.php',1703228976,1703228976,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(284,'/lib/platforms/platformsAssign.php',1703229021,1703229021,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(285,'/lib/plan/planAddTCNavigator.php',1703229030,1703229030,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(286,'/lib/plan/planAddTC.php',1703229032,1703229032,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(287,'/lib/plan/planAddTCNavigator.php',1703229109,1703229109,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(288,'/lib/plan/planAddTC.php',1703229111,1703229112,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(289,'/lib/plan/planAddTC.php',1703229121,1703229121,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(290,'/lib/plan/planAddTC.php',1703229128,1703229128,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(291,'/lib/plan/planAddTC.php',1703229195,1703229195,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(292,'/lib/plan/planAddTC.php',1703229199,1703229199,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(293,'/lib/plan/planAddTC.php',1703229206,1703229206,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(294,'/lib/plan/planAddTC.php',1703229207,1703229207,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(295,'/lib/plan/planAddTC.php',1703229211,1703229211,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(296,'/lib/execute/execNavigator.php',1703229219,1703229219,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(297,'/lib/execute/execDashboard.php',1703229219,1703229219,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(298,'/lib/execute/execDashboard.php',1703229219,1703229219,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(299,'/lib/execute/execSetResults.php',1703229227,1703229227,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(300,'/lib/execute/execSetResults.php',1703229426,1703229426,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(301,'/lib/execute/execSetResults.php',1703229471,1703229471,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(302,'/lib/execute/execDashboard.php',1703229518,1703229518,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(303,'/lib/execute/execSetResults.php',1703229523,1703229523,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(304,'/lib/execute/execSetResults.php',1703229560,1703229560,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(305,'/lib/execute/execSetResults.php',1703229584,1703229584,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(306,'/lib/execute/execSetResults.php',1703229605,1703229605,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(307,'/lib/execute/execSetResults.php',1703229624,1703229624,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(308,'/lib/testcases/tcAssignedToUser.php',1703229784,1703229784,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(309,'/lib/execute/execSetResults.php',1703229797,1703229797,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(310,'/lib/execute/execSetResults.php',1703229802,1703229802,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(311,'/lib/testcases/tcAssignedToUser.php',1703229812,1703229812,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(312,'/lib/execute/execSetResults.php',1703229819,1703229819,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(313,'/lib/execute/execSetResults.php',1703229823,1703229823,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(314,'/lib/execute/execSetResults.php',1703229827,1703229827,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(315,'/lib/testcases/tcAssignedToUser.php',1703229834,1703229834,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(316,'/lib/execute/execSetResults.php',1703229838,1703229839,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(317,'/lib/execute/execSetResults.php',1703229843,1703229843,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(318,'/lib/execute/execSetResults.php',1703229845,1703229845,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(319,'/lib/execute/execSetResults.php',1703229859,1703229859,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(320,'/lib/execute/execSetResults.php',1703229862,1703229862,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(321,'/lib/testcases/tcAssignedToUser.php',1703229869,1703229869,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(322,'/lib/execute/execSetResults.php',1703229873,1703229873,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(323,'/lib/execute/execSetResults.php',1703229885,1703229885,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(324,'/lib/execute/execSetResults.php',1703229887,1703229887,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(325,'/lib/execute/execSetResults.php',1703229894,1703229894,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(326,'/lib/execute/execSetResults.php',1703229898,1703229898,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(327,'/lib/execute/execSetResults.php',1703229900,1703229900,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(328,'/lib/testcases/tcAssignedToUser.php',1703229905,1703229905,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(329,'/lib/testcases/archiveData.php',1703229910,1703229910,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(330,'/lib/results/printDocument.php',1703229966,1703229966,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(331,'/lib/results/resultsTCFlat.php',1703229970,1703229970,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(332,'/lib/results/execTimelineStats.php',1703229984,1703229984,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(333,'/lib/results/testPlanWithCF.php',1703229987,1703229987,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(334,'/lib/results/testCasesWithCF.php',1703229988,1703229988,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(335,'/lib/results/resultsByStatus.php',1703229993,1703229993,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(336,'/lib/results/resultsByStatus.php',1703229995,1703229995,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(337,'/lib/results/resultsTCAbsoluteLatest.php',1703229998,1703229998,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(338,'/lib/results/resultsTCFlat.php',1703229999,1703229999,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(339,'/lib/results/resultsTC.php',1703230002,1703230002,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(340,'/lib/results/metricsDashboard.php',1703230032,1703230032,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(341,'/lib/results/metricsDashboard.php',1703230212,1703230212,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(342,'/lib/results/overallPieChart.php',1703230219,1703230219,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(343,'/lib/results/keywordBarChart.php',1703230219,1703230219,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(344,'/lib/results/topLevelSuitesBarChart.php',1703230219,1703230219,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(345,'/lib/execute/execDashboard.php',1703230228,1703230228,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(346,'/lib/execute/execDashboard.php',1703230228,1703230228,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(347,'/lib/testcases/listTestCases.php',1703230324,1703230324,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(348,'/lib/testcases/archiveData.php',1703230324,1703230324,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(349,'/lib/testcases/listTestCases.php',1703230358,1703230358,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(350,'/lib/plan/planEdit.php',1703230471,1703230471,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(351,'/lib/testcases/tcAssignedToUser.php',1703230483,1703230483,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(352,'/lib/execute/execDashboard.php',1703230497,1703230497,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(353,'/lib/execute/execDashboard.php',1703230497,1703230497,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(354,'/lib/execute/execSetResults.php',1703230502,1703230502,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(355,'/lib/testcases/listTestCases.php',1703230525,1703230525,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(356,'/lib/testcases/archiveData.php',1703230525,1703230525,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(357,'/lib/platforms/platformsView.php',1703230530,1703230530,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(358,'/lib/execute/execDashboard.php',1703230549,1703230549,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(359,'/lib/execute/execDashboard.php',1703230549,1703230549,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(360,'/lib/execute/execSetResults.php',1703230552,1703230552,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(361,'/lib/execute/execSetResults.php',1703230579,1703230579,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(362,'/lib/results/metricsDashboard.php',1703230603,1703230603,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(363,'/lib/results/overallPieChart.php',1703230624,1703230624,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(364,'/lib/results/keywordBarChart.php',1703230624,1703230624,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(365,'/lib/results/topLevelSuitesBarChart.php',1703230624,1703230624,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(366,'/lib/plan/planEdit.php',1703237539,1703237539,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(367,'/lib/execute/execDashboard.php',1703237544,1703237544,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(368,'/lib/execute/execDashboard.php',1703237544,1703237544,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(369,'/lib/execute/execDashboard.php',1703237549,1703237549,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(370,'/lib/execute/execSetResults.php',1703237558,1703237558,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(371,'/lib/results/resultsByTSuite.php',1703237614,1703237614,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(372,'/lib/results/resultsGeneral.php',1703237616,1703237616,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(373,'/lib/results/testCasesWithCF.php',1703237640,1703237640,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(374,'/lib/results/neverRunByPP.php',1703237642,1703237642,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(375,'/lib/results/resultsByStatus.php',1703237643,1703237643,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(376,'/lib/results/resultsByStatus.php',1703237644,1703237644,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(377,'/lib/results/resultsTCFlat.php',1703237648,1703237648,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(378,'/lib/results/resultsTC.php',1703237649,1703237649,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(379,'/lib/results/metricsDashboard.php',1703237663,1703237663,1,'ivvm5l9r8qilnujo3hb3qfd4es'),
(380,'/login.php',1703842615,1703842615,0,NULL),
(381,'/login.php',1703842634,1703842634,0,NULL),
(382,'/login.php',1703842711,1703842711,1,'48pe8rhtkg8d24ecepjt7srl6r'),
(383,'/lib/general/mainPage.php',1703842711,1703842711,1,'48pe8rhtkg8d24ecepjt7srl6r'),
(384,'/lib/usermanagement/usersView.php',1703842718,1703842718,1,'48pe8rhtkg8d24ecepjt7srl6r'),
(385,'/lib/usermanagement/usersEdit.php',1703842822,1703842822,1,'48pe8rhtkg8d24ecepjt7srl6r'),
(386,'/lib/usermanagement/usersEdit.php',1703842891,1703842891,1,'48pe8rhtkg8d24ecepjt7srl6r'),
(387,'/lib/usermanagement/usersEdit.php',1703842934,1703842934,1,'48pe8rhtkg8d24ecepjt7srl6r'),
(388,'/lib/usermanagement/usersEdit.php',1703842947,1703842947,1,'48pe8rhtkg8d24ecepjt7srl6r'),
(389,'/lib/usermanagement/usersEdit.php',1703842977,1703842977,1,'48pe8rhtkg8d24ecepjt7srl6r'),
(390,'/lib/usermanagement/usersView.php',1703843013,1703843013,1,'48pe8rhtkg8d24ecepjt7srl6r'),
(391,'/lib/usermanagement/usersView.php',1703843021,1703843021,1,'48pe8rhtkg8d24ecepjt7srl6r'),
(392,'/lib/usermanagement/usersEdit.php',1703843032,1703843032,1,'48pe8rhtkg8d24ecepjt7srl6r'),
(393,'/lib/usermanagement/userInfo.php',1703843694,1703843694,1,'48pe8rhtkg8d24ecepjt7srl6r'),
(394,'/logout.php',1703843696,1703843696,1,'48pe8rhtkg8d24ecepjt7srl6r'),
(395,'/login.php',1703846902,1703846902,3,'m0rsh552n46tllobmoqh11etg4'),
(396,'/lib/general/mainPage.php',1703846902,1703846903,3,'m0rsh552n46tllobmoqh11etg4'),
(397,'/lib/testcases/listTestCases.php',1703848684,1703848684,3,'m0rsh552n46tllobmoqh11etg4'),
(398,'/lib/testcases/archiveData.php',1703848684,1703848684,3,'m0rsh552n46tllobmoqh11etg4'),
(399,'/lib/testcases/archiveData.php',1703848783,1703848783,3,'m0rsh552n46tllobmoqh11etg4'),
(400,'/lib/testcases/archiveData.php',1703848801,1703848801,3,'m0rsh552n46tllobmoqh11etg4'),
(401,'/lib/general/mainPage.php',1703848819,1703848819,3,'m0rsh552n46tllobmoqh11etg4'),
(402,'/lib/execute/execNavigator.php',1703848829,1703848829,3,'m0rsh552n46tllobmoqh11etg4'),
(403,'/lib/execute/execDashboard.php',1703848829,1703848829,3,'m0rsh552n46tllobmoqh11etg4'),
(404,'/lib/execute/execDashboard.php',1703848830,1703848830,3,'m0rsh552n46tllobmoqh11etg4'),
(405,'/lib/execute/execDashboard.php',1703848849,1703848849,3,'m0rsh552n46tllobmoqh11etg4'),
(406,'/lib/general/mainPage.php',1703848850,1703848850,3,'m0rsh552n46tllobmoqh11etg4'),
(407,'/lib/keywords/keywordsView.php',1703848862,1703848862,3,'m0rsh552n46tllobmoqh11etg4'),
(408,'/lib/general/mainPage.php',1703848865,1703848865,3,'m0rsh552n46tllobmoqh11etg4'),
(409,'/lib/execute/execDashboard.php',1703848874,1703848874,3,'m0rsh552n46tllobmoqh11etg4'),
(410,'/lib/execute/execDashboard.php',1703848874,1703848874,3,'m0rsh552n46tllobmoqh11etg4'),
(411,'/lib/general/mainPage.php',1703848884,1703848884,3,'m0rsh552n46tllobmoqh11etg4'),
(412,'/lib/testcases/listTestCases.php',1703848931,1703848931,3,'m0rsh552n46tllobmoqh11etg4'),
(413,'/lib/testcases/archiveData.php',1703848931,1703848931,3,'m0rsh552n46tllobmoqh11etg4'),
(414,'/lib/results/resultsNavigator.php',1703848944,1703848944,3,'m0rsh552n46tllobmoqh11etg4'),
(415,'/lib/general/mainPage.php',1703849000,1703849000,3,'m0rsh552n46tllobmoqh11etg4'),
(416,'/login.php',1703849036,1703849036,1,'48pe8rhtkg8d24ecepjt7srl6r'),
(417,'/lib/general/mainPage.php',1703849036,1703849036,1,'48pe8rhtkg8d24ecepjt7srl6r'),
(418,'/lib/usermanagement/usersView.php',1703849040,1703849040,1,'48pe8rhtkg8d24ecepjt7srl6r'),
(419,'/lib/usermanagement/usersEdit.php',1703849049,1703849049,1,'48pe8rhtkg8d24ecepjt7srl6r'),
(420,'/lib/usermanagement/rolesView.php',1703849062,1703849062,1,'48pe8rhtkg8d24ecepjt7srl6r'),
(421,'/lib/usermanagement/rolesEdit.php',1703849088,1703849088,1,'48pe8rhtkg8d24ecepjt7srl6r'),
(422,'/lib/usermanagement/rolesEdit.php',1703849174,1703849174,1,'48pe8rhtkg8d24ecepjt7srl6r'),
(423,'/lib/usermanagement/usersEdit.php',1703849183,1703849183,1,'48pe8rhtkg8d24ecepjt7srl6r'),
(424,'/lib/testcases/listTestCases.php',1703849229,1703849229,3,'m0rsh552n46tllobmoqh11etg4'),
(425,'/lib/testcases/archiveData.php',1703849229,1703849229,3,'m0rsh552n46tllobmoqh11etg4'),
(426,'/lib/project/projectView.php',1703849262,1703849262,3,'m0rsh552n46tllobmoqh11etg4'),
(427,'/lib/project/projectEdit.php',1703849298,1703849298,3,'m0rsh552n46tllobmoqh11etg4'),
(428,'/lib/plan/planAddTCNavigator.php',1703849336,1703849336,3,'m0rsh552n46tllobmoqh11etg4'),
(429,'/lib/requirements/reqSpecListTree.php',1703849401,1703849401,1,'48pe8rhtkg8d24ecepjt7srl6r'),
(430,'/lib/requirements/reqSpecView.php',1703849411,1703849411,1,'48pe8rhtkg8d24ecepjt7srl6r'),
(431,'/lib/plan/planEdit.php',1703850135,1703850135,3,'m0rsh552n46tllobmoqh11etg4'),
(432,'/lib/plan/planEdit.php',1703850234,1703850234,3,'m0rsh552n46tllobmoqh11etg4'),
(433,'/login.php',1704083366,1704083366,3,'an1k77qssj10ueqinqbcprohn0'),
(434,'/lib/general/mainPage.php',1704083367,1704083367,3,'an1k77qssj10ueqinqbcprohn0'),
(435,'/lib/plan/planEdit.php',1704088119,1704088119,3,'an1k77qssj10ueqinqbcprohn0'),
(436,'/lib/results/resultsNavigator.php',1704088137,1704088137,3,'an1k77qssj10ueqinqbcprohn0'),
(437,'/lib/plan/planAddTCNavigator.php',1704088180,1704088180,3,'an1k77qssj10ueqinqbcprohn0'),
(438,'/lib/plan/planAddTCNavigator.php',1704088221,1704088221,3,'an1k77qssj10ueqinqbcprohn0'),
(439,'/lib/plan/planAddTCNavigator.php',1704088228,1704088228,3,'an1k77qssj10ueqinqbcprohn0'),
(440,'/lib/plan/planAddTCNavigator.php',1704088232,1704088232,3,'an1k77qssj10ueqinqbcprohn0'),
(441,'/lib/plan/planAddTCNavigator.php',1704088399,1704088399,3,'an1k77qssj10ueqinqbcprohn0'),
(442,'/lib/search/searchMgmt.php',1704088608,1704088608,3,'an1k77qssj10ueqinqbcprohn0'),
(443,'/lib/search/search.php',1704088608,1704088608,3,'an1k77qssj10ueqinqbcprohn0'),
(444,'/lib/requirements/reqSpecEdit.php',1704088650,1704088650,3,'an1k77qssj10ueqinqbcprohn0'),
(445,'/lib/project/projectView.php',1704088676,1704088676,3,'an1k77qssj10ueqinqbcprohn0'),
(446,'/lib/project/projectEdit.php',1704088704,1704088704,3,'an1k77qssj10ueqinqbcprohn0'),
(447,'/lib/project/projectEdit.php',1704088903,1704088903,3,'an1k77qssj10ueqinqbcprohn0'),
(448,'/lib/project/projectEdit.php',1704089211,1704089212,3,'an1k77qssj10ueqinqbcprohn0'),
(449,'/lib/general/navBar.php',1704089212,1704089212,3,'an1k77qssj10ueqinqbcprohn0'),
(450,'/lib/requirements/reqSpecEdit.php',1704089309,1704089309,3,'an1k77qssj10ueqinqbcprohn0'),
(451,'/lib/requirements/reqSpecEdit.php',1704089696,1704089696,3,'an1k77qssj10ueqinqbcprohn0'),
(452,'/lib/plan/planEdit.php',1704174149,1704174149,3,'an1k77qssj10ueqinqbcprohn0'),
(453,'/lib/plan/planEdit.php',1704174325,1704174325,3,'an1k77qssj10ueqinqbcprohn0'),
(454,'/lib/plan/planEdit.php',1704174331,1704174331,3,'an1k77qssj10ueqinqbcprohn0'),
(455,'/lib/plan/planEdit.php',1704175321,1704175321,3,'an1k77qssj10ueqinqbcprohn0'),
(456,'/lib/plan/planAddTCNavigator.php',1704175339,1704175339,3,'an1k77qssj10ueqinqbcprohn0'),
(457,'/lib/plan/planAddTCNavigator.php',1704175362,1704175362,3,'an1k77qssj10ueqinqbcprohn0'),
(458,'/lib/plan/planAddTC.php',1704175389,1704175389,3,'an1k77qssj10ueqinqbcprohn0'),
(459,'/lib/plan/planAddTC.php',1704175390,1704175390,3,'an1k77qssj10ueqinqbcprohn0'),
(460,'/lib/plan/planAddTC.php',1704175390,1704175390,3,'an1k77qssj10ueqinqbcprohn0'),
(461,'/lib/plan/planAddTCNavigator.php',1704175395,1704175395,3,'an1k77qssj10ueqinqbcprohn0'),
(462,'/lib/testcases/listTestCases.php',1704175421,1704175421,3,'an1k77qssj10ueqinqbcprohn0'),
(463,'/lib/testcases/archiveData.php',1704175421,1704175421,3,'an1k77qssj10ueqinqbcprohn0'),
(464,'/lib/plan/planAddTCNavigator.php',1704175439,1704175439,3,'an1k77qssj10ueqinqbcprohn0'),
(465,'/lib/plan/planAddTCNavigator.php',1704175453,1704175453,3,'an1k77qssj10ueqinqbcprohn0'),
(466,'/lib/plan/planAddTCNavigator.php',1704175688,1704175688,3,'an1k77qssj10ueqinqbcprohn0'),
(467,'/lib/plan/planAddTCNavigator.php',1704175695,1704175695,3,'an1k77qssj10ueqinqbcprohn0'),
(468,'/lib/plan/planAddTCNavigator.php',1704175706,1704175706,3,'an1k77qssj10ueqinqbcprohn0'),
(469,'/lib/plan/planEdit.php',1704175861,1704175861,3,'an1k77qssj10ueqinqbcprohn0'),
(470,'/lib/plan/planAddTCNavigator.php',1704175923,1704175923,3,'an1k77qssj10ueqinqbcprohn0'),
(471,'/lib/plan/planAddTCNavigator.php',1704175924,1704175924,3,'an1k77qssj10ueqinqbcprohn0'),
(472,'/lib/plan/planAddTCNavigator.php',1704175937,1704175937,3,'an1k77qssj10ueqinqbcprohn0'),
(473,'/lib/plan/planAddTCNavigator.php',1704175941,1704175941,3,'an1k77qssj10ueqinqbcprohn0'),
(474,'/lib/plan/planAddTCNavigator.php',1704175943,1704175943,3,'an1k77qssj10ueqinqbcprohn0'),
(475,'/lib/testcases/listTestCases.php',1704176013,1704176013,3,'an1k77qssj10ueqinqbcprohn0'),
(476,'/lib/testcases/archiveData.php',1704176013,1704176013,3,'an1k77qssj10ueqinqbcprohn0'),
(477,'/lib/testcases/listTestCases.php',1704176131,1704176131,3,'an1k77qssj10ueqinqbcprohn0'),
(478,'/lib/testcases/archiveData.php',1704176131,1704176131,3,'an1k77qssj10ueqinqbcprohn0'),
(479,'/lib/testcases/archiveData.php',1704176137,1704176137,3,'an1k77qssj10ueqinqbcprohn0'),
(480,'/lib/testcases/archiveData.php',1704176138,1704176138,3,'an1k77qssj10ueqinqbcprohn0'),
(481,'/lib/testcases/listTestCases.php',1704176146,1704176146,3,'an1k77qssj10ueqinqbcprohn0'),
(482,'/lib/testcases/listTestCases.php',1704176146,1704176146,3,'an1k77qssj10ueqinqbcprohn0'),
(483,'/lib/testcases/listTestCases.php',1704177074,1704177074,3,'an1k77qssj10ueqinqbcprohn0'),
(484,'/lib/requirements/reqSpecEdit.php',1704178029,1704178029,3,'an1k77qssj10ueqinqbcprohn0'),
(485,'/lib/requirements/reqSpecEdit.php',1704178078,1704178078,3,'an1k77qssj10ueqinqbcprohn0'),
(486,'/lib/requirements/reqSpecEdit.php',1704178152,1704178152,3,'an1k77qssj10ueqinqbcprohn0'),
(487,'/lib/requirements/reqSpecEdit.php',1704178157,1704178157,3,'an1k77qssj10ueqinqbcprohn0'),
(488,'/lib/requirements/reqSpecEdit.php',1704178222,1704178223,3,'an1k77qssj10ueqinqbcprohn0'),
(489,'/lib/requirements/reqSpecEdit.php',1704178322,1704178322,3,'an1k77qssj10ueqinqbcprohn0'),
(490,'/lib/requirements/reqEdit.php',1704178456,1704178456,3,'an1k77qssj10ueqinqbcprohn0'),
(491,'/lib/requirements/reqEdit.php',1704178565,1704178565,3,'an1k77qssj10ueqinqbcprohn0'),
(492,'/lib/requirements/reqEdit.php',1704178982,1704178982,3,'an1k77qssj10ueqinqbcprohn0'),
(493,'/lib/requirements/reqView.php',1704178982,1704178982,3,'an1k77qssj10ueqinqbcprohn0'),
(494,'/lib/testcases/listTestCases.php',1704179839,1704179839,3,'an1k77qssj10ueqinqbcprohn0'),
(495,'/lib/testcases/archiveData.php',1704179839,1704179839,3,'an1k77qssj10ueqinqbcprohn0'),
(496,'/lib/testcases/containerEdit.php',1704179913,1704179913,3,'an1k77qssj10ueqinqbcprohn0'),
(497,'/lib/testcases/listTestCases.php',1704179913,1704179913,3,'an1k77qssj10ueqinqbcprohn0'),
(498,'/lib/testcases/archiveData.php',1704179918,1704179918,3,'an1k77qssj10ueqinqbcprohn0'),
(499,'/lib/testcases/tcEdit.php',1704179924,1704179924,3,'an1k77qssj10ueqinqbcprohn0'),
(500,'/lib/testcases/listTestCases.php',1704181221,1704181221,3,'an1k77qssj10ueqinqbcprohn0'),
(501,'/lib/testcases/archiveData.php',1704181221,1704181221,3,'an1k77qssj10ueqinqbcprohn0'),
(502,'/lib/testcases/tcEdit.php',1704181231,1704181231,3,'an1k77qssj10ueqinqbcprohn0'),
(503,'/lib/testcases/tcEdit.php',1704181254,1704181254,3,'an1k77qssj10ueqinqbcprohn0'),
(504,'/lib/testcases/listTestCases.php',1704181254,1704181254,3,'an1k77qssj10ueqinqbcprohn0'),
(505,'/lib/testcases/tcEdit.php',1704181258,1704181258,3,'an1k77qssj10ueqinqbcprohn0'),
(506,'/lib/testcases/tcEdit.php',1704181279,1704181279,3,'an1k77qssj10ueqinqbcprohn0'),
(507,'/lib/testcases/tcEdit.php',1704181295,1704181295,3,'an1k77qssj10ueqinqbcprohn0'),
(508,'/lib/testcases/listTestCases.php',1704181295,1704181295,3,'an1k77qssj10ueqinqbcprohn0'),
(509,'/lib/testcases/tcEdit.php',1704181342,1704181342,3,'an1k77qssj10ueqinqbcprohn0'),
(510,'/lib/testcases/listTestCases.php',1704181342,1704181342,3,'an1k77qssj10ueqinqbcprohn0'),
(511,'/lib/testcases/tcEdit.php',1704181360,1704181360,3,'an1k77qssj10ueqinqbcprohn0'),
(512,'/lib/testcases/listTestCases.php',1704181361,1704181361,3,'an1k77qssj10ueqinqbcprohn0'),
(513,'/login.php',1704341126,1704341126,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(514,'/lib/general/mainPage.php',1704341127,1704341127,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(515,'/lib/testcases/listTestCases.php',1704343172,1704343172,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(516,'/lib/testcases/archiveData.php',1704343172,1704343172,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(517,'/lib/testcases/archiveData.php',1704343175,1704343175,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(518,'/lib/testcases/tcEdit.php',1704343261,1704343261,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(519,'/lib/testcases/listTestCases.php',1704343266,1704343266,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(520,'/lib/general/frmWorkArea.php',1704343341,1704343341,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(521,'/lib/plan/buildEdit.php',1704343345,1704343345,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(522,'/lib/plan/buildEdit.php',1704343469,1704343469,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(523,'/lib/plan/tc_exec_assignment.php',1704343514,1704343514,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(524,'/lib/testcases/archiveData.php',1704343694,1704343694,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(525,'/lib/usermanagement/userInfo.php',1704346089,1704346089,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(526,'/logout.php',1704346097,1704346097,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(527,'/login.php',1704346101,1704346101,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(528,'/lib/general/mainPage.php',1704346101,1704346101,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(529,'/lib/usermanagement/userInfo.php',1704346106,1704346106,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(530,'/lib/requirements/reqSpecListTree.php',1704346119,1704346120,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(531,'/lib/execute/execNavigator.php',1704346154,1704346154,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(532,'/lib/execute/execDashboard.php',1704346154,1704346154,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(533,'/lib/usermanagement/userInfo.php',1704346190,1704346190,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(534,'/lib/plan/planAddTCNavigator.php',1704348025,1704348025,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(535,'/lib/plan/planAddTCNavigator.php',1704354223,1704354223,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(536,'/lib/plan/planAddTCNavigator.php',1704354237,1704354237,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(537,'/lib/plan/planAddTC.php',1704354243,1704354243,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(538,'/lib/plan/planAddTC.php',1704354243,1704354243,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(539,'/lib/plan/planAddTCNavigator.php',1704354282,1704354282,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(540,'/lib/plan/planAddTC.php',1704354287,1704354287,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(541,'/lib/plan/planAddTC.php',1704354287,1704354287,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(542,'/lib/plan/planAddTC.php',1704354509,1704354509,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(543,'/lib/plan/planAddTCNavigator.php',1704354510,1704354510,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(544,'/lib/project/projectView.php',1704354884,1704354884,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(545,'/lib/project/projectEdit.php',1704354893,1704354893,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(546,'/lib/project/projectEdit.php',1704354904,1704354904,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(547,'/lib/execute/execSetResults.php',1704354953,1704354953,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(548,'/lib/execute/execSetResults.php',1704354953,1704354953,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(549,'/lib/execute/execSetResults.php',1704355016,1704355016,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(550,'/lib/execute/execSetResults.php',1704355022,1704355023,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(551,'/lib/execute/execSetResults.php',1704355106,1704355106,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(552,'/lib/execute/execSetResults.php',1704355135,1704355135,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(553,'/lib/execute/execSetResults.php',1704355176,1704355176,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(554,'/lib/plan/planEdit.php',1704355215,1704355215,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(555,'/lib/execute/execSetResults.php',1704355229,1704355230,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(556,'/lib/execute/execSetResults.php',1704355230,1704355230,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(557,'/lib/execute/execSetResults.php',1704355252,1704355252,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(558,'/lib/execute/execSetResults.php',1704355257,1704355257,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(559,'/lib/execute/execSetResults.php',1704355261,1704355261,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(560,'/lib/execute/execSetResults.php',1704355266,1704355266,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(561,'/lib/execute/execSetResults.php',1704355266,1704355266,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(562,'/lib/execute/execSetResults.php',1704355274,1704355274,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(563,'/lib/search/searchMgmt.php',1704355288,1704355288,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(564,'/lib/search/search.php',1704355288,1704355288,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(565,'/lib/results/metricsDashboard.php',1704359166,1704359166,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(566,'/login.php',1704359269,1704359269,0,NULL),
(567,'/login.php',1704359279,1704359279,0,NULL),
(568,'/login.php',1704359310,1704359310,1,'p1t4gp5pt9q1g4idhfqro7uce4'),
(569,'/lib/general/mainPage.php',1704359311,1704359311,1,'p1t4gp5pt9q1g4idhfqro7uce4'),
(570,'/lib/execute/execNavigator.php',1704359315,1704359315,1,'p1t4gp5pt9q1g4idhfqro7uce4'),
(571,'/lib/execute/execDashboard.php',1704359315,1704359315,1,'p1t4gp5pt9q1g4idhfqro7uce4'),
(572,'/lib/execute/execSetResults.php',1704359401,1704359401,1,'p1t4gp5pt9q1g4idhfqro7uce4'),
(573,'/lib/execute/execSetResults.php',1704359467,1704359467,1,'p1t4gp5pt9q1g4idhfqro7uce4'),
(574,'/lib/execute/execSetResults.php',1704359572,1704359572,1,'p1t4gp5pt9q1g4idhfqro7uce4'),
(575,'/lib/attachments/attachmentupload.php',1704359601,1704359601,1,'p1t4gp5pt9q1g4idhfqro7uce4'),
(576,'/lib/attachments/attachmentupload.php',1704359604,1704359604,1,'p1t4gp5pt9q1g4idhfqro7uce4'),
(577,'/lib/attachments/attachmentupload.php',1704359611,1704359611,1,'p1t4gp5pt9q1g4idhfqro7uce4'),
(578,'/lib/attachments/attachmentupload.php',1704359634,1704359634,1,'p1t4gp5pt9q1g4idhfqro7uce4'),
(579,'/lib/attachments/attachmentupload.php',1704359638,1704359639,1,'p1t4gp5pt9q1g4idhfqro7uce4'),
(580,'/lib/attachments/attachmentupload.php',1704359648,1704359648,1,'p1t4gp5pt9q1g4idhfqro7uce4'),
(581,'/lib/attachments/attachmentupload.php',1704359666,1704359667,1,'p1t4gp5pt9q1g4idhfqro7uce4'),
(582,'/lib/attachments/attachmentupload.php',1704359671,1704359671,1,'p1t4gp5pt9q1g4idhfqro7uce4'),
(583,'/lib/attachments/attachmentupload.php',1704359677,1704359677,1,'p1t4gp5pt9q1g4idhfqro7uce4'),
(584,'/lib/attachments/attachmentupload.php',1704359678,1704359678,1,'p1t4gp5pt9q1g4idhfqro7uce4'),
(585,'/lib/attachments/attachmentupload.php',1704359701,1704359701,1,'p1t4gp5pt9q1g4idhfqro7uce4'),
(586,'/lib/attachments/attachmentupload.php',1704359703,1704359703,1,'p1t4gp5pt9q1g4idhfqro7uce4'),
(587,'/lib/attachments/attachmentupload.php',1704359705,1704359705,1,'p1t4gp5pt9q1g4idhfqro7uce4'),
(588,'/lib/attachments/attachmentupload.php',1704359706,1704359706,1,'p1t4gp5pt9q1g4idhfqro7uce4'),
(589,'/lib/attachments/attachmentupload.php',1704359706,1704359706,1,'p1t4gp5pt9q1g4idhfqro7uce4'),
(590,'/lib/execute/execSetResults.php',1704359709,1704359709,1,'p1t4gp5pt9q1g4idhfqro7uce4'),
(591,'/lib/execute/execSetResults.php',1704359725,1704359725,1,'p1t4gp5pt9q1g4idhfqro7uce4'),
(592,'/lib/execute/execSetResults.php',1704359726,1704359726,1,'p1t4gp5pt9q1g4idhfqro7uce4'),
(593,'/lib/execute/execSetResults.php',1704359742,1704359742,1,'p1t4gp5pt9q1g4idhfqro7uce4'),
(594,'/lib/testcases/listTestCases.php',1704362448,1704362448,1,'p1t4gp5pt9q1g4idhfqro7uce4'),
(595,'/lib/testcases/archiveData.php',1704362448,1704362448,1,'p1t4gp5pt9q1g4idhfqro7uce4'),
(596,'/lib/requirements/reqView.php',1704362455,1704362455,1,'p1t4gp5pt9q1g4idhfqro7uce4'),
(597,'/lib/plan/planEdit.php',1704362463,1704362463,1,'p1t4gp5pt9q1g4idhfqro7uce4'),
(598,'/lib/testcases/listTestCases.php',1704362478,1704362478,1,'p1t4gp5pt9q1g4idhfqro7uce4'),
(599,'/lib/testcases/archiveData.php',1704362478,1704362478,1,'p1t4gp5pt9q1g4idhfqro7uce4'),
(600,'/lib/platforms/platformsView.php',1704362487,1704362487,1,'p1t4gp5pt9q1g4idhfqro7uce4'),
(601,'/lib/execute/execSetResults.php',1704363928,1704363928,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(602,'/lib/execute/execSetResults.php',1704363933,1704363933,3,'dcib0mosmv32r5jndcsm0dcg3j'),
(603,'/login.php',1705037423,1705037423,3,'khtp64o0da9g4e85cnshr4qf9e'),
(604,'/lib/general/mainPage.php',1705037424,1705037424,3,'khtp64o0da9g4e85cnshr4qf9e'),
(605,'/lib/plan/planAddTCNavigator.php',1705037472,1705037472,3,'khtp64o0da9g4e85cnshr4qf9e'),
(606,'/lib/plan/planAddTC.php',1705037705,1705037705,3,'khtp64o0da9g4e85cnshr4qf9e'),
(607,'/login.php',1705386265,1705386265,3,'3itjeak5fp5qtssn4iqugnhirf'),
(608,'/lib/general/mainPage.php',1705386265,1705386265,3,'3itjeak5fp5qtssn4iqugnhirf'),
(609,'/lib/testcases/listTestCases.php',1705386360,1705386360,3,'3itjeak5fp5qtssn4iqugnhirf'),
(610,'/lib/testcases/archiveData.php',1705386360,1705386360,3,'3itjeak5fp5qtssn4iqugnhirf'),
(611,'/lib/testcases/archiveData.php',1705387107,1705387107,3,'3itjeak5fp5qtssn4iqugnhirf'),
(612,'/lib/testcases/containerEdit.php',1705387176,1705387176,3,'3itjeak5fp5qtssn4iqugnhirf'),
(613,'/lib/testcases/listTestCases.php',1705387176,1705387176,3,'3itjeak5fp5qtssn4iqugnhirf'),
(614,'/lib/testcases/archiveData.php',1705387181,1705387181,3,'3itjeak5fp5qtssn4iqugnhirf'),
(615,'/lib/testcases/tcEdit.php',1705387185,1705387185,3,'3itjeak5fp5qtssn4iqugnhirf'),
(616,'/lib/testcases/tcEdit.php',1705387330,1705387330,3,'3itjeak5fp5qtssn4iqugnhirf'),
(617,'/lib/testcases/listTestCases.php',1705387330,1705387330,3,'3itjeak5fp5qtssn4iqugnhirf'),
(618,'/lib/testcases/tcEdit.php',1705387335,1705387335,3,'3itjeak5fp5qtssn4iqugnhirf'),
(619,'/lib/testcases/tcEdit.php',1705387381,1705387381,3,'3itjeak5fp5qtssn4iqugnhirf'),
(620,'/lib/testcases/tcEdit.php',1705387384,1705387384,3,'3itjeak5fp5qtssn4iqugnhirf'),
(621,'/lib/testcases/tcEdit.php',1705387432,1705387432,3,'3itjeak5fp5qtssn4iqugnhirf'),
(622,'/lib/testcases/tcEdit.php',1705389565,1705389565,3,'3itjeak5fp5qtssn4iqugnhirf'),
(623,'/lib/testcases/tcImport.php',1705389740,1705389740,3,'3itjeak5fp5qtssn4iqugnhirf'),
(624,'/lib/testcases/archiveData.php',1705467385,1705467385,3,'3itjeak5fp5qtssn4iqugnhirf'),
(625,'/lib/testcases/listTestCases.php',1705467386,1705467386,3,'3itjeak5fp5qtssn4iqugnhirf'),
(626,'/lib/testcases/listTestCases.php',1705467442,1705467442,3,'3itjeak5fp5qtssn4iqugnhirf'),
(627,'/lib/testcases/tcBulkOp.php',1705467458,1705467458,3,'3itjeak5fp5qtssn4iqugnhirf'),
(628,'/lib/testcases/archiveData.php',1705467463,1705467463,3,'3itjeak5fp5qtssn4iqugnhirf'),
(629,'/lib/testcases/listTestCases.php',1705467501,1705467501,3,'3itjeak5fp5qtssn4iqugnhirf'),
(630,'/login.php',1705898943,1705898943,3,'ne3khg70a6qdjfbjqu3ngjlemh'),
(631,'/lib/general/mainPage.php',1705898943,1705898943,3,'ne3khg70a6qdjfbjqu3ngjlemh'),
(632,'/login.php',1705988162,1705988162,1,'4rpodv26epfk00q98b5t5g4pmu'),
(633,'/lib/general/mainPage.php',1705988162,1705988162,1,'4rpodv26epfk00q98b5t5g4pmu'),
(634,'/lib/usermanagement/userInfo.php',1705988177,1705988177,1,'4rpodv26epfk00q98b5t5g4pmu'),
(635,'/lib/usermanagement/usersView.php',1705988181,1705988181,1,'4rpodv26epfk00q98b5t5g4pmu'),
(636,'/lib/execute/execNavigator.php',1705988191,1705988191,1,'4rpodv26epfk00q98b5t5g4pmu'),
(637,'/lib/execute/execDashboard.php',1705988191,1705988191,1,'4rpodv26epfk00q98b5t5g4pmu'),
(638,'/lib/testcases/listTestCases.php',1705988194,1705988194,1,'4rpodv26epfk00q98b5t5g4pmu'),
(639,'/lib/testcases/archiveData.php',1705988194,1705988194,1,'4rpodv26epfk00q98b5t5g4pmu'),
(640,'/login.php',1711444907,1711444907,1,'buu700m111ucq87p4ieuse1mkr'),
(641,'/lib/general/mainPage.php',1711444908,1711444908,1,'buu700m111ucq87p4ieuse1mkr'),
(642,'/login.php',1711447628,1711447628,1,'l53elecv34qeshv8fofhd60vj4'),
(643,'/lib/general/mainPage.php',1711447628,1711447628,1,'l53elecv34qeshv8fofhd60vj4'),
(644,'/login.php',1712033890,1712033890,0,NULL),
(645,'/login.php',1712033900,1712033900,0,NULL),
(646,'/login.php',1712033936,1712033936,0,NULL),
(647,'/lostPassword.php',1712033969,1712033969,0,NULL),
(648,'/lostPassword.php',1712033986,1712033986,0,NULL),
(649,'/lostPassword.php',1712034002,1712034002,0,NULL),
(650,'/login.php',1712034019,1712034019,0,NULL),
(651,'/login.php',1712034045,1712034045,0,NULL),
(652,'/login.php',1712034092,1712034092,0,NULL),
(653,'/login.php',1712034105,1712034105,0,NULL),
(654,'/login.php',1712034591,1712034592,0,NULL),
(655,'/login.php',1712034603,1712034603,1,'t9k9aemaltqgumc8sr4p07ipmo'),
(656,'/lib/general/mainPage.php',1712034603,1712034603,1,'t9k9aemaltqgumc8sr4p07ipmo'),
(657,'/lib/usermanagement/usersView.php',1712034611,1712034611,1,'t9k9aemaltqgumc8sr4p07ipmo'),
(658,'/lib/usermanagement/usersEdit.php',1712034629,1712034629,1,'t9k9aemaltqgumc8sr4p07ipmo'),
(659,'/lib/usermanagement/usersEdit.php',1712034636,1712034640,1,'t9k9aemaltqgumc8sr4p07ipmo'),
(660,'/lib/usermanagement/usersEdit.php',1712034660,1712034664,1,'t9k9aemaltqgumc8sr4p07ipmo'),
(661,'/lib/usermanagement/usersEdit.php',1712034664,1712034668,1,'t9k9aemaltqgumc8sr4p07ipmo'),
(662,'/lib/usermanagement/usersEdit.php',1712034680,1712034680,1,'t9k9aemaltqgumc8sr4p07ipmo'),
(663,'/login.php',1712034720,1712034720,3,'q3aam1rq9vs31olusc2tok9l35'),
(664,'/lib/general/mainPage.php',1712034720,1712034720,3,'q3aam1rq9vs31olusc2tok9l35'),
(665,'/lib/usermanagement/userInfo.php',1712034739,1712034739,3,'q3aam1rq9vs31olusc2tok9l35'),
(666,'/lib/usermanagement/userInfo.php',1712034745,1712034745,3,'q3aam1rq9vs31olusc2tok9l35'),
(667,'/logout.php',1712034746,1712034746,3,'q3aam1rq9vs31olusc2tok9l35'),
(668,'/login.php',1712034753,1712034753,3,'q3aam1rq9vs31olusc2tok9l35'),
(669,'/lib/general/mainPage.php',1712034754,1712034754,3,'q3aam1rq9vs31olusc2tok9l35'),
(670,'/lib/usermanagement/userInfo.php',1712034758,1712034758,3,'q3aam1rq9vs31olusc2tok9l35'),
(671,'/lib/usermanagement/userInfo.php',1712034781,1712034781,3,'q3aam1rq9vs31olusc2tok9l35'),
(672,'/lib/usermanagement/userInfo.php',1712034939,1712034939,3,'q3aam1rq9vs31olusc2tok9l35'),
(673,'/lib/plan/planEdit.php',1712035153,1712035153,3,'q3aam1rq9vs31olusc2tok9l35'),
(674,'/lib/plan/planEdit.php',1712035300,1712035300,3,'q3aam1rq9vs31olusc2tok9l35'),
(675,'/lib/plan/planEdit.php',1712035304,1712035304,3,'q3aam1rq9vs31olusc2tok9l35'),
(676,'/lib/plan/buildEdit.php',1712035340,1712035340,3,'q3aam1rq9vs31olusc2tok9l35'),
(677,'/lib/plan/buildEdit.php',1712035781,1712035781,3,'q3aam1rq9vs31olusc2tok9l35'),
(678,'/lib/plan/planAddTCNavigator.php',1712041239,1712041239,3,'q3aam1rq9vs31olusc2tok9l35'),
(679,'/lib/issuetrackers/issueTrackerView.php',1712041611,1712041611,3,'q3aam1rq9vs31olusc2tok9l35'),
(680,'/lib/plan/planAddTCNavigator.php',1712041764,1712041764,3,'q3aam1rq9vs31olusc2tok9l35'),
(681,'/lib/plan/planAddTC.php',1712041777,1712041777,3,'q3aam1rq9vs31olusc2tok9l35'),
(682,'/lib/plan/planAddTC.php',1712041778,1712041778,3,'q3aam1rq9vs31olusc2tok9l35'),
(683,'/lib/plan/planAddTC.php',1712041822,1712041822,3,'q3aam1rq9vs31olusc2tok9l35'),
(684,'/lib/search/searchMgmt.php',1712041863,1712041863,3,'q3aam1rq9vs31olusc2tok9l35'),
(685,'/lib/search/search.php',1712041863,1712041863,3,'q3aam1rq9vs31olusc2tok9l35'),
(686,'/lib/search/search.php',1712041865,1712041865,3,'q3aam1rq9vs31olusc2tok9l35'),
(687,'/lib/testcases/archiveData.php',1712042188,1712042188,3,'q3aam1rq9vs31olusc2tok9l35'),
(688,'/lib/testcases/listTestCases.php',1712042188,1712042188,3,'q3aam1rq9vs31olusc2tok9l35'),
(689,'/lib/execute/execNavigator.php',1712042193,1712042193,3,'q3aam1rq9vs31olusc2tok9l35'),
(690,'/lib/execute/execDashboard.php',1712042193,1712042193,3,'q3aam1rq9vs31olusc2tok9l35'),
(691,'/lib/testcases/listTestCases.php',1712043344,1712043344,3,'q3aam1rq9vs31olusc2tok9l35'),
(692,'/lib/testcases/archiveData.php',1712043344,1712043344,3,'q3aam1rq9vs31olusc2tok9l35'),
(693,'/lib/testcases/archiveData.php',1712043358,1712043358,3,'q3aam1rq9vs31olusc2tok9l35'),
(694,'/lib/testcases/listTestCases.php',1712043375,1712043375,3,'q3aam1rq9vs31olusc2tok9l35'),
(695,'/lib/testcases/archiveData.php',1712043394,1712043394,3,'q3aam1rq9vs31olusc2tok9l35'),
(696,'/lib/testcases/archiveData.php',1712043412,1712043412,3,'q3aam1rq9vs31olusc2tok9l35'),
(697,'/lib/testcases/containerEdit.php',1712043812,1712043812,3,'q3aam1rq9vs31olusc2tok9l35'),
(698,'/lib/testcases/listTestCases.php',1712043812,1712043812,3,'q3aam1rq9vs31olusc2tok9l35'),
(699,'/lib/testcases/tcImport.php',1712043825,1712043825,3,'q3aam1rq9vs31olusc2tok9l35'),
(700,'/login.php',1712049177,1712049177,1,'t9k9aemaltqgumc8sr4p07ipmo'),
(701,'/logout.php',1712049189,1712049189,1,'t9k9aemaltqgumc8sr4p07ipmo'),
(702,'/login.php',1712049201,1712049201,0,NULL),
(703,'/login.php',1712049220,1712049220,0,NULL),
(704,'/login.php',1712049243,1712049243,0,NULL),
(705,'/login.php',1712049315,1712049315,1,'t9k9aemaltqgumc8sr4p07ipmo'),
(706,'/lib/general/mainPage.php',1712049316,1712049316,1,'t9k9aemaltqgumc8sr4p07ipmo'),
(707,'/lib/usermanagement/userInfo.php',1712049332,1712049332,1,'t9k9aemaltqgumc8sr4p07ipmo'),
(708,'/lib/usermanagement/usersView.php',1712049336,1712049336,1,'t9k9aemaltqgumc8sr4p07ipmo'),
(709,'/lib/usermanagement/usersEdit.php',1712049453,1712049453,1,'t9k9aemaltqgumc8sr4p07ipmo'),
(710,'/login.php',1712049507,1712049507,5,'g56g1rsvo6ibqln7dmd46f6ng5'),
(711,'/lib/general/mainPage.php',1712049507,1712049507,5,'g56g1rsvo6ibqln7dmd46f6ng5'),
(712,'/lib/keywords/keywordsView.php',1712049525,1712049525,5,'g56g1rsvo6ibqln7dmd46f6ng5'),
(713,'/lib/general/mainPage.php',1712049529,1712049529,5,'g56g1rsvo6ibqln7dmd46f6ng5'),
(714,'/lib/execute/execNavigator.php',1712049535,1712049535,5,'g56g1rsvo6ibqln7dmd46f6ng5'),
(715,'/lib/execute/execDashboard.php',1712049535,1712049535,5,'g56g1rsvo6ibqln7dmd46f6ng5'),
(716,'/lib/general/mainPage.php',1712049540,1712049540,5,'g56g1rsvo6ibqln7dmd46f6ng5'),
(717,'/lib/results/metricsDashboard.php',1712049543,1712049543,5,'g56g1rsvo6ibqln7dmd46f6ng5'),
(718,'/lib/general/mainPage.php',1712049548,1712049548,5,'g56g1rsvo6ibqln7dmd46f6ng5'),
(719,'/lib/general/mainPage.php',1712049550,1712049550,5,'g56g1rsvo6ibqln7dmd46f6ng5'),
(720,'/lib/general/mainPage.php',1712049557,1712049557,5,'g56g1rsvo6ibqln7dmd46f6ng5'),
(721,'/lib/usermanagement/usersEdit.php',1712049796,1712049796,1,'t9k9aemaltqgumc8sr4p07ipmo'),
(722,'/lib/testcases/tcEdit.php',1712049796,1712049796,3,'q3aam1rq9vs31olusc2tok9l35'),
(723,'/lib/general/mainPage.php',1712049802,1712049802,5,'g56g1rsvo6ibqln7dmd46f6ng5'),
(724,'/lib/general/mainPage.php',1712049804,1712049804,5,'g56g1rsvo6ibqln7dmd46f6ng5'),
(725,'/lib/general/mainPage.php',1712049806,1712049806,5,'g56g1rsvo6ibqln7dmd46f6ng5'),
(726,'/lib/general/mainPage.php',1712049808,1712049808,5,'g56g1rsvo6ibqln7dmd46f6ng5'),
(727,'/lib/general/mainPage.php',1712049811,1712049811,5,'g56g1rsvo6ibqln7dmd46f6ng5'),
(728,'/lib/general/mainPage.php',1712049812,1712049812,5,'g56g1rsvo6ibqln7dmd46f6ng5'),
(729,'/lib/general/mainPage.php',1712049837,1712049837,5,'g56g1rsvo6ibqln7dmd46f6ng5'),
(730,'/lib/general/mainPage.php',1712049842,1712049842,5,'g56g1rsvo6ibqln7dmd46f6ng5'),
(731,'/lib/general/mainPage.php',1712049846,1712049846,5,'g56g1rsvo6ibqln7dmd46f6ng5'),
(732,'/lib/usermanagement/rolesView.php',1712049864,1712049864,1,'t9k9aemaltqgumc8sr4p07ipmo'),
(733,'/lib/usermanagement/rolesEdit.php',1712049867,1712049867,1,'t9k9aemaltqgumc8sr4p07ipmo'),
(734,'/lib/usermanagement/rolesEdit.php',1712050157,1712050157,1,'t9k9aemaltqgumc8sr4p07ipmo'),
(735,'/lib/usermanagement/usersEdit.php',1712050171,1712050171,1,'t9k9aemaltqgumc8sr4p07ipmo'),
(736,'/lib/usermanagement/userInfo.php',1712050192,1712050192,1,'t9k9aemaltqgumc8sr4p07ipmo'),
(737,'/login.php',1712050298,1712050298,5,'dkq0nqat0574e9v7fs8o9mfk0o'),
(738,'/lib/general/mainPage.php',1712050299,1712050299,5,'dkq0nqat0574e9v7fs8o9mfk0o'),
(739,'/lib/testcases/listTestCases.php',1712050315,1712050315,5,'dkq0nqat0574e9v7fs8o9mfk0o'),
(740,'/lib/testcases/archiveData.php',1712050315,1712050315,5,'dkq0nqat0574e9v7fs8o9mfk0o'),
(741,'/lib/testcases/archiveData.php',1712050324,1712050324,5,'dkq0nqat0574e9v7fs8o9mfk0o'),
(742,'/lib/testcases/archiveData.php',1712050324,1712050324,5,'dkq0nqat0574e9v7fs8o9mfk0o'),
(743,'/lib/testcases/listTestCases.php',1712051434,1712051434,3,'q3aam1rq9vs31olusc2tok9l35'),
(744,'/lib/testcases/archiveData.php',1712051434,1712051434,3,'q3aam1rq9vs31olusc2tok9l35'),
(745,'/lib/testcases/archiveData.php',1712051441,1712051441,3,'q3aam1rq9vs31olusc2tok9l35'),
(746,'/lib/testcases/archiveData.php',1712051450,1712051450,3,'q3aam1rq9vs31olusc2tok9l35'),
(747,'/lib/testcases/archiveData.php',1712051456,1712051456,3,'q3aam1rq9vs31olusc2tok9l35'),
(748,'/lib/testcases/containerEdit.php',1712051481,1712051481,3,'q3aam1rq9vs31olusc2tok9l35'),
(749,'/lib/testcases/listTestCases.php',1712051481,1712051481,3,'q3aam1rq9vs31olusc2tok9l35'),
(750,'/lib/testcases/archiveData.php',1712051490,1712051490,3,'q3aam1rq9vs31olusc2tok9l35'),
(751,'/lib/testcases/archiveData.php',1712051496,1712051496,3,'q3aam1rq9vs31olusc2tok9l35'),
(752,'/lib/testcases/listTestCases.php',1712051496,1712051496,3,'q3aam1rq9vs31olusc2tok9l35'),
(753,'/lib/testcases/listTestCases.php',1712051531,1712051531,3,'q3aam1rq9vs31olusc2tok9l35'),
(754,'/lib/testcases/tcEdit.php',1712051557,1712051557,3,'q3aam1rq9vs31olusc2tok9l35'),
(755,'/lib/testcases/tcEdit.php',1712051634,1712051634,3,'q3aam1rq9vs31olusc2tok9l35'),
(756,'/lib/testcases/tcEdit.php',1712051671,1712051671,3,'q3aam1rq9vs31olusc2tok9l35'),
(757,'/lib/testcases/listTestCases.php',1712051672,1712051672,3,'q3aam1rq9vs31olusc2tok9l35'),
(758,'/login.php',1712051679,1712051679,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(759,'/lib/testcases/tcEdit.php',1712051679,1712051679,3,'q3aam1rq9vs31olusc2tok9l35'),
(760,'/lib/general/mainPage.php',1712051679,1712051679,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(761,'/lib/testcases/listTestCases.php',1712051697,1712051697,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(762,'/lib/testcases/archiveData.php',1712051697,1712051697,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(763,'/lib/testcases/tcEdit.php',1712051701,1712051701,3,'q3aam1rq9vs31olusc2tok9l35'),
(764,'/lib/testcases/listTestCases.php',1712051701,1712051701,3,'q3aam1rq9vs31olusc2tok9l35'),
(765,'/lib/testcases/archiveData.php',1712051703,1712051703,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(766,'/lib/testcases/archiveData.php',1712051705,1712051705,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(767,'/lib/testcases/tcEdit.php',1712051712,1712051712,3,'q3aam1rq9vs31olusc2tok9l35'),
(768,'/lib/testcases/archiveData.php',1712051739,1712051739,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(769,'/lib/testcases/archiveData.php',1712051756,1712051756,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(770,'/lib/testcases/archiveData.php',1712051780,1712051780,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(771,'/lib/testcases/listTestCases.php',1712051784,1712051784,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(772,'/lib/testcases/archiveData.php',1712051784,1712051784,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(773,'/lib/general/mainPage.php',1712051788,1712051788,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(774,'/lib/testcases/listTestCases.php',1712051795,1712051795,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(775,'/lib/testcases/archiveData.php',1712051795,1712051795,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(776,'/lib/general/mainPage.php',1712051800,1712051800,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(777,'/lib/results/metricsDashboard.php',1712051812,1712051812,3,'q3aam1rq9vs31olusc2tok9l35'),
(778,'/lib/general/mainPage.php',1712051838,1712051838,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(779,'/lib/general/mainPage.php',1712051900,1712051900,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(780,'/lib/execute/execNavigator.php',1712051918,1712051918,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(781,'/lib/execute/execDashboard.php',1712051918,1712051918,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(782,'/lib/general/mainPage.php',1712051927,1712051927,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(783,'/lib/general/mainPage.php',1712051938,1712051938,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(784,'/lib/general/mainPage.php',1712051969,1712051969,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(785,'/lib/general/mainPage.php',1712051985,1712051985,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(786,'/lib/general/mainPage.php',1712051995,1712051995,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(787,'/lib/results/metricsDashboard.php',1712051999,1712051999,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(788,'/lib/general/mainPage.php',1712052001,1712052001,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(789,'/lib/general/mainPage.php',1712052007,1712052007,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(790,'/lib/general/mainPage.php',1712052010,1712052010,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(791,'/lib/plan/planAddTCNavigator.php',1712052015,1712052015,3,'q3aam1rq9vs31olusc2tok9l35'),
(792,'/lib/general/mainPage.php',1712052019,1712052019,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(793,'/lib/general/mainPage.php',1712052020,1712052020,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(794,'/lib/general/mainPage.php',1712052020,1712052020,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(795,'/lib/general/mainPage.php',1712052022,1712052022,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(796,'/lib/plan/planAddTC.php',1712052022,1712052022,3,'q3aam1rq9vs31olusc2tok9l35'),
(797,'/lib/plan/planAddTC.php',1712052038,1712052038,3,'q3aam1rq9vs31olusc2tok9l35'),
(798,'/lib/plan/planAddTCNavigator.php',1712052038,1712052038,3,'q3aam1rq9vs31olusc2tok9l35'),
(799,'/lib/keywords/keywordsView.php',1712052042,1712052042,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(800,'/lib/general/mainPage.php',1712052044,1712052044,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(801,'/lib/general/mainPage.php',1712052048,1712052048,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(802,'/lib/plan/planAddTC.php',1712052054,1712052054,3,'q3aam1rq9vs31olusc2tok9l35'),
(803,'/lib/general/mainPage.php',1712052060,1712052060,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(804,'/lib/execute/execSetResults.php',1712052086,1712052086,3,'q3aam1rq9vs31olusc2tok9l35'),
(805,'/lib/execute/execSetResults.php',1712052123,1712052123,3,'q3aam1rq9vs31olusc2tok9l35'),
(806,'/lib/general/mainPage.php',1712052130,1712052130,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(807,'/lib/execute/execSetResults.php',1712052132,1712052132,3,'q3aam1rq9vs31olusc2tok9l35'),
(808,'/lib/results/metricsDashboard.php',1712052137,1712052137,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(809,'/lib/execute/execSetResults.php',1712052138,1712052138,3,'q3aam1rq9vs31olusc2tok9l35'),
(810,'/lib/general/mainPage.php',1712052144,1712052144,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(811,'/lib/execute/execSetResults.php',1712052147,1712052147,3,'q3aam1rq9vs31olusc2tok9l35'),
(812,'/lib/testcases/listTestCases.php',1712052161,1712052161,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(813,'/lib/testcases/archiveData.php',1712052161,1712052161,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(814,'/lib/general/mainPage.php',1712052169,1712052169,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(815,'/lib/project/projectView.php',1712052174,1712052174,3,'q3aam1rq9vs31olusc2tok9l35'),
(816,'/lib/general/mainPage.php',1712052192,1712052192,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(817,'/lib/general/mainPage.php',1712052200,1712052200,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(818,'/results/tcCreatedPerUserOnTestProject.php',1712052213,1712052213,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(819,'/lib/general/mainPage.php',1712052220,1712052220,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(820,'/lib/requirements/reqImport.php',1712052231,1712052231,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(821,'/lib/general/mainPage.php',1712052232,1712052232,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(822,'/lib/general/mainPage.php',1712052241,1712052241,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(823,'/lib/general/mainPage.php',1712052245,1712052245,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(824,'/lib/testcases/listTestCases.php',1712052247,1712052247,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(825,'/lib/testcases/archiveData.php',1712052247,1712052247,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(826,'/lib/general/mainPage.php',1712052250,1712052250,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(827,'/lib/requirements/reqSpecEdit.php',1712052250,1712052250,3,'q3aam1rq9vs31olusc2tok9l35'),
(828,'/lib/requirements/reqImport.php',1712052256,1712052256,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(829,'/lib/general/mainPage.php',1712052256,1712052256,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(830,'/lib/general/mainPage.php',1712052261,1712052261,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(831,'/lib/requirements/reqImport.php',1712052269,1712052269,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(832,'/lib/general/mainPage.php',1712052269,1712052269,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(833,'/lib/testcases/listTestCases.php',1712052296,1712052296,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(834,'/lib/testcases/archiveData.php',1712052296,1712052296,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(835,'/lib/requirements/reqSpecEdit.php',1712052299,1712052299,3,'q3aam1rq9vs31olusc2tok9l35'),
(836,'/lib/general/mainPage.php',1712052316,1712052316,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(837,'/lib/general/mainPage.php',1712052320,1712052320,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(838,'/lib/testcases/listTestCases.php',1712052329,1712052329,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(839,'/lib/testcases/archiveData.php',1712052329,1712052329,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(840,'/lib/testcases/archiveData.php',1712052465,1712052465,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(841,'/lib/general/mainPage.php',1712052467,1712052467,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(842,'/lib/testcases/listTestCases.php',1712052488,1712052488,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(843,'/lib/testcases/archiveData.php',1712052488,1712052488,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(844,'/lib/testcases/listTestCases.php',1712052491,1712052491,3,'q3aam1rq9vs31olusc2tok9l35'),
(845,'/lib/testcases/archiveData.php',1712052491,1712052491,3,'q3aam1rq9vs31olusc2tok9l35'),
(846,'/lib/usermanagement/userInfo.php',1712052501,1712052501,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(847,'/lib/usermanagement/userInfo.php',1712052503,1712052503,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(848,'/lib/testcases/listTestCases.php',1712052505,1712052505,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(849,'/lib/testcases/archiveData.php',1712052505,1712052505,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(850,'/lib/usermanagement/userInfo.php',1712052512,1712052512,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(851,'/lib/general/mainPage.php',1712052523,1712052523,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(852,'/login.php',1712052630,1712052630,4,'2e8a31m9d54buntgborfdlpst4'),
(853,'/lib/general/mainPage.php',1712052630,1712052630,4,'2e8a31m9d54buntgborfdlpst4'),
(854,'/lib/general/mainPage.php',1712052652,1712052652,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(855,'/lib/general/mainPage.php',1712052670,1712052670,4,'2e8a31m9d54buntgborfdlpst4'),
(856,'/lib/general/mainPage.php',1712052673,1712052673,4,'2e8a31m9d54buntgborfdlpst4'),
(857,'/lib/general/mainPage.php',1712052674,1712052674,4,'2e8a31m9d54buntgborfdlpst4'),
(858,'/lib/testcases/tcEdit.php',1712052681,1712052681,3,'q3aam1rq9vs31olusc2tok9l35'),
(859,'/lib/testcases/tcEdit.php',1712052700,1712052700,3,'q3aam1rq9vs31olusc2tok9l35'),
(860,'/lib/testcases/listTestCases.php',1712052700,1712052700,3,'q3aam1rq9vs31olusc2tok9l35'),
(861,'/lib/plan/planExport.php',1712052724,1712052724,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(862,'/lib/general/mainPage.php',1712052737,1712052737,4,'2e8a31m9d54buntgborfdlpst4'),
(863,'/lib/general/mainPage.php',1712052741,1712052741,4,'2e8a31m9d54buntgborfdlpst4'),
(864,'/lib/general/mainPage.php',1712052743,1712052743,4,'2e8a31m9d54buntgborfdlpst4'),
(865,'/lib/general/mainPage.php',1712052773,1712052773,4,'2e8a31m9d54buntgborfdlpst4'),
(866,'/lib/general/mainPage.php',1712052774,1712052774,4,'2e8a31m9d54buntgborfdlpst4'),
(867,'/login.php',1712052840,1712052840,0,NULL),
(868,'/lib/general/mainPage.php',1712052855,1712052855,4,'2e8a31m9d54buntgborfdlpst4'),
(869,'/lib/results/resultsNavigator.php',1712052864,1712052864,3,'q3aam1rq9vs31olusc2tok9l35'),
(870,'/logout.php',1712052867,1712052867,4,'2e8a31m9d54buntgborfdlpst4'),
(871,'/login.php',1712052874,1712052874,4,'2e8a31m9d54buntgborfdlpst4'),
(872,'/lib/general/mainPage.php',1712052874,1712052874,4,'2e8a31m9d54buntgborfdlpst4'),
(873,'/login.php',1712052882,1712052882,1,'t9k9aemaltqgumc8sr4p07ipmo'),
(874,'/lib/general/mainPage.php',1712052882,1712052883,1,'t9k9aemaltqgumc8sr4p07ipmo'),
(875,'/lib/usermanagement/usersView.php',1712052886,1712052886,1,'t9k9aemaltqgumc8sr4p07ipmo'),
(876,'/lib/usermanagement/usersEdit.php',1712052895,1712052895,1,'t9k9aemaltqgumc8sr4p07ipmo'),
(877,'/lib/general/mainPage.php',1712052900,1712052900,4,'2e8a31m9d54buntgborfdlpst4'),
(878,'/lib/general/mainPage.php',1712052902,1712052902,4,'2e8a31m9d54buntgborfdlpst4'),
(879,'/lib/general/mainPage.php',1712052925,1712052925,4,'2e8a31m9d54buntgborfdlpst4'),
(880,'/lib/general/mainPage.php',1712052927,1712052927,4,'2e8a31m9d54buntgborfdlpst4'),
(881,'/lib/general/mainPage.php',1712052929,1712052929,4,'2e8a31m9d54buntgborfdlpst4'),
(882,'/lib/general/mainPage.php',1712052930,1712052930,4,'2e8a31m9d54buntgborfdlpst4'),
(883,'/lib/general/mainPage.php',1712052930,1712052930,4,'2e8a31m9d54buntgborfdlpst4'),
(884,'/lib/usermanagement/userInfo.php',1712053040,1712053040,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(885,'/lib/usermanagement/userInfo.php',1712053060,1712053060,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(886,'/lib/usermanagement/userInfo.php',1712053062,1712053062,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(887,'/lib/usermanagement/userInfo.php',1712053072,1712053072,3,'q3aam1rq9vs31olusc2tok9l35'),
(888,'/lib/usermanagement/userInfo.php',1712053077,1712053077,3,'q3aam1rq9vs31olusc2tok9l35'),
(889,'/lib/usermanagement/userInfo.php',1712053098,1712053098,3,'q3aam1rq9vs31olusc2tok9l35'),
(890,'/lib/usermanagement/userInfo.php',1712053099,1712053099,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(891,'/lib/usermanagement/userInfo.php',1712053100,1712053100,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(892,'/lib/usermanagement/userInfo.php',1712053100,1712053100,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(893,'/lib/usermanagement/userInfo.php',1712053101,1712053101,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(894,'/lib/usermanagement/userInfo.php',1712053101,1712053101,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(895,'/logout.php',1712053111,1712053111,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(896,'/login.php',1712053117,1712053117,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(897,'/lib/general/mainPage.php',1712053118,1712053118,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(898,'/lib/usermanagement/userInfo.php',1712053140,1712053140,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(899,'/lib/usermanagement/userInfo.php',1712053154,1712053154,3,'q3aam1rq9vs31olusc2tok9l35'),
(900,'/lib/testcases/listTestCases.php',1712053156,1712053156,3,'q3aam1rq9vs31olusc2tok9l35'),
(901,'/lib/testcases/archiveData.php',1712053156,1712053156,3,'q3aam1rq9vs31olusc2tok9l35'),
(902,'/lib/usermanagement/userInfo.php',1712053183,1712053183,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(903,'/lib/usermanagement/userInfo.php',1712053186,1712053186,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(904,'/lib/usermanagement/userInfo.php',1712053191,1712053191,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(905,'/lib/general/mainPage.php',1712053192,1712053192,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(906,'/lib/usermanagement/userInfo.php',1712053274,1712053274,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(907,'/lib/general/mainPage.php',1712053281,1712053281,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(908,'/lib/usermanagement/usersEdit.php',1712053286,1712053286,1,'t9k9aemaltqgumc8sr4p07ipmo'),
(909,'/lib/usermanagement/userInfo.php',1712053388,1712053388,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(910,'/lib/usermanagement/usersView.php',1712053390,1712053390,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(911,'/lib/execute/execNavigator.php',1712053402,1712053402,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(912,'/lib/execute/execDashboard.php',1712053402,1712053402,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(913,'/lib/testcases/listTestCases.php',1712053418,1712053418,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(914,'/lib/testcases/archiveData.php',1712053418,1712053418,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(915,'/lib/general/mainPage.php',1712053419,1712053419,4,'2e8a31m9d54buntgborfdlpst4'),
(916,'/lib/results/resultsNavigator.php',1712053425,1712053425,4,'2e8a31m9d54buntgborfdlpst4'),
(917,'/lib/testcases/containerEdit.php',1712053443,1712053443,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(918,'/lib/testcases/archiveData.php',1712053504,1712053504,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(919,'/lib/testcases/listTestCases.php',1712053505,1712053505,3,'q3aam1rq9vs31olusc2tok9l35'),
(920,'/lib/testcases/archiveData.php',1712053505,1712053505,3,'q3aam1rq9vs31olusc2tok9l35'),
(921,'/lib/results/resultsGeneral.php',1712053559,1712053559,4,'2e8a31m9d54buntgborfdlpst4'),
(922,'/lib/testcases/tcEdit.php',1712053651,1712053651,3,'q3aam1rq9vs31olusc2tok9l35'),
(923,'/lib/testcases/listTestCases.php',1712053651,1712053651,3,'q3aam1rq9vs31olusc2tok9l35'),
(924,'/lib/plan/planAddTCNavigator.php',1712053754,1712053754,3,'q3aam1rq9vs31olusc2tok9l35'),
(925,'/lib/plan/planAddTC.php',1712053758,1712053758,3,'q3aam1rq9vs31olusc2tok9l35'),
(926,'/lib/plan/planAddTC.php',1712053758,1712053758,3,'q3aam1rq9vs31olusc2tok9l35'),
(927,'/lib/plan/planAddTC.php',1712053761,1712053761,3,'q3aam1rq9vs31olusc2tok9l35'),
(928,'/lib/plan/planAddTCNavigator.php',1712053761,1712053761,3,'q3aam1rq9vs31olusc2tok9l35'),
(929,'/lib/plan/planAddTC.php',1712053766,1712053766,3,'q3aam1rq9vs31olusc2tok9l35'),
(930,'/lib/plan/planAddTCNavigator.php',1712053766,1712053766,3,'q3aam1rq9vs31olusc2tok9l35'),
(931,'/lib/plan/planAddTC.php',1712053774,1712053774,3,'q3aam1rq9vs31olusc2tok9l35'),
(932,'/lib/plan/planEdit.php',1712053782,1712053782,3,'q3aam1rq9vs31olusc2tok9l35'),
(933,'/lib/plan/planEdit.php',1712053791,1712053791,3,'q3aam1rq9vs31olusc2tok9l35'),
(934,'/lib/execute/execSetResults.php',1712053807,1712053807,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(935,'/lib/execute/execSetResults.php',1712053882,1712053882,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(936,'/lib/execute/execSetResults.php',1712053931,1712053931,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(937,'/lib/attachments/attachmentupload.php',1712053983,1712053983,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(938,'/lib/attachments/attachmentupload.php',1712054018,1712054018,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(939,'/lib/execute/execSetResults.php',1712054021,1712054021,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(940,'/lib/attachments/attachmentdelete.php',1712054032,1712054032,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(941,'/lib/execute/execSetResults.php',1712054035,1712054035,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(942,'/lib/attachments/attachmentupload.php',1712054083,1712054083,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(943,'/lib/execute/execSetResults.php',1712054092,1712054092,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(944,'/lib/attachments/attachmentdelete.php',1712054102,1712054102,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(945,'/lib/execute/execSetResults.php',1712054104,1712054104,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(946,'/lib/usermanagement/userInfo.php',1712054110,1712054110,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(947,'/lib/execute/execSetResults.php',1712054121,1712054121,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(948,'/lib/execute/execSetResults.php',1712054298,1712054298,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(949,'/lib/execute/execSetResults.php',1712054359,1712054359,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(950,'/lib/execute/execSetResults.php',1712054403,1712054403,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(951,'/lib/execute/execSetResults.php',1712054413,1712054413,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(952,'/lib/execute/execSetResults.php',1712054417,1712054417,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(953,'/lib/execute/execSetResults.php',1712054423,1712054423,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(954,'/lib/execute/execSetResults.php',1712054427,1712054427,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(955,'/lib/general/mainPage.php',1712054527,1712054527,4,'2e8a31m9d54buntgborfdlpst4'),
(956,'/lib/general/mainPage.php',1712054553,1712054553,4,'2e8a31m9d54buntgborfdlpst4'),
(957,'/lib/execute/execNavigator.php',1712054558,1712054558,4,'2e8a31m9d54buntgborfdlpst4'),
(958,'/lib/execute/execDashboard.php',1712054558,1712054558,4,'2e8a31m9d54buntgborfdlpst4'),
(959,'/lib/plan/planExport.php',1712054614,1712054614,4,'2e8a31m9d54buntgborfdlpst4'),
(960,'/lib/plan/planExport.php',1712054625,1712054625,4,'2e8a31m9d54buntgborfdlpst4'),
(961,'/lib/execute/execSetResults.php',1712054722,1712054722,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(962,'/lib/execute/execSetResults.php',1712054757,1712054757,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(963,'/lib/execute/execSetResults.php',1712054780,1712054780,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(964,'/lib/attachments/attachmentdelete.php',1712054789,1712054789,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(965,'/lib/execute/execSetResults.php',1712054791,1712054791,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(966,'/lib/execute/execSetResults.php',1712054796,1712054796,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(967,'/lib/execute/execSetResults.php',1712054799,1712054799,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(968,'/lib/execute/execSetResults.php',1712054826,1712054826,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(969,'/lib/execute/execSetResults.php',1712054826,1712054826,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(970,'/lib/execute/execSetResults.php',1712054924,1712054924,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(971,'/lib/general/mainPage.php',1712054934,1712054934,4,'2e8a31m9d54buntgborfdlpst4'),
(972,'/lib/execute/execSetResults.php',1712054936,1712054936,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(973,'/lib/general/mainPage.php',1712054946,1712054946,4,'2e8a31m9d54buntgborfdlpst4'),
(974,'/lib/testcases/listTestCases.php',1712054955,1712054955,3,'q3aam1rq9vs31olusc2tok9l35'),
(975,'/lib/testcases/archiveData.php',1712054955,1712054955,3,'q3aam1rq9vs31olusc2tok9l35'),
(976,'/lib/general/mainPage.php',1712054966,1712054966,4,'2e8a31m9d54buntgborfdlpst4'),
(977,'/lib/testcases/archiveData.php',1712055001,1712055001,3,'q3aam1rq9vs31olusc2tok9l35'),
(978,'/lib/general/mainPage.php',1712055006,1712055006,4,'2e8a31m9d54buntgborfdlpst4'),
(979,'/lib/testcases/archiveData.php',1712055007,1712055007,3,'q3aam1rq9vs31olusc2tok9l35'),
(980,'/lib/testcases/listTestCases.php',1712055007,1712055007,3,'q3aam1rq9vs31olusc2tok9l35'),
(981,'/lib/general/mainPage.php',1712055008,1712055008,4,'2e8a31m9d54buntgborfdlpst4'),
(982,'/lib/general/mainPage.php',1712055012,1712055012,4,'2e8a31m9d54buntgborfdlpst4'),
(983,'/lib/general/mainPage.php',1712055020,1712055020,4,'2e8a31m9d54buntgborfdlpst4'),
(984,'/lib/general/mainPage.php',1712055030,1712055030,4,'2e8a31m9d54buntgborfdlpst4'),
(985,'/lib/general/mainPage.php',1712055035,1712055035,4,'2e8a31m9d54buntgborfdlpst4'),
(986,'/lib/results/metricsDashboard.php',1712055041,1712055041,4,'2e8a31m9d54buntgborfdlpst4'),
(987,'/lib/testcases/listTestCases.php',1712055049,1712055049,3,'q3aam1rq9vs31olusc2tok9l35'),
(988,'/lib/testcases/archiveData.php',1712055049,1712055049,3,'q3aam1rq9vs31olusc2tok9l35'),
(989,'/lib/plan/planEdit.php',1712055079,1712055079,3,'q3aam1rq9vs31olusc2tok9l35'),
(990,'/lib/project/projectEdit.php',1712055113,1712055113,3,'q3aam1rq9vs31olusc2tok9l35'),
(991,'/lib/general/mainPage.php',1712055129,1712055129,4,'2e8a31m9d54buntgborfdlpst4'),
(992,'/lib/general/mainPage.php',1712055173,1712055173,4,'2e8a31m9d54buntgborfdlpst4'),
(993,'/lib/execute/execSetResults.php',1712055176,1712055176,3,'q3aam1rq9vs31olusc2tok9l35'),
(994,'/lib/usermanagement/userInfo.php',1712055184,1712055184,4,'2e8a31m9d54buntgborfdlpst4'),
(995,'/lib/usermanagement/userInfo.php',1712055186,1712055186,4,'2e8a31m9d54buntgborfdlpst4'),
(996,'/lib/general/mainPage.php',1712055191,1712055191,4,'2e8a31m9d54buntgborfdlpst4'),
(997,'/lib/execute/execSetResults.php',1712055197,1712055197,3,'q3aam1rq9vs31olusc2tok9l35'),
(998,'/lib/execute/execSetResults.php',1712055197,1712055197,3,'q3aam1rq9vs31olusc2tok9l35'),
(999,'/lib/general/mainPage.php',1712055203,1712055203,4,'2e8a31m9d54buntgborfdlpst4'),
(1000,'/lib/testcases/listTestCases.php',1712055250,1712055250,4,'2e8a31m9d54buntgborfdlpst4'),
(1001,'/lib/testcases/archiveData.php',1712055250,1712055250,4,'2e8a31m9d54buntgborfdlpst4'),
(1002,'/lib/testcases/archiveData.php',1712055253,1712055253,4,'2e8a31m9d54buntgborfdlpst4'),
(1003,'/lib/testcases/archiveData.php',1712055257,1712055257,4,'2e8a31m9d54buntgborfdlpst4'),
(1004,'/lib/keywords/keywordsEdit.php',1712055262,1712055262,4,'2e8a31m9d54buntgborfdlpst4'),
(1005,'/lib/testcases/tcEdit.php',1712055388,1712055388,4,'2e8a31m9d54buntgborfdlpst4'),
(1006,'/lib/testcases/tcEdit.php',1712055392,1712055392,4,'2e8a31m9d54buntgborfdlpst4'),
(1007,'/lib/execute/execSetResults.php',1712055455,1712055455,3,'q3aam1rq9vs31olusc2tok9l35'),
(1008,'/lib/results/printDocOptions.php',1712055506,1712055506,3,'q3aam1rq9vs31olusc2tok9l35'),
(1009,'/lib/general/mainPage.php',1712055549,1712055549,4,'2e8a31m9d54buntgborfdlpst4'),
(1010,'/lib/results/resultsNavigator.php',1712055556,1712055556,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(1011,'/lib/results/printDocument.php',1712055564,1712055564,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(1012,'/lib/general/mainPage.php',1712055570,1712055570,4,'2e8a31m9d54buntgborfdlpst4'),
(1013,'/lib/general/mainPage.php',1712055581,1712055581,4,'2e8a31m9d54buntgborfdlpst4'),
(1014,'/lib/results/printDocument.php',1712055594,1712055594,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(1015,'/lib/results/printDocOptions.php',1712055598,1712055598,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(1016,'/lib/results/printDocument.php',1712055607,1712055607,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(1017,'/lib/results/resultsGeneral.php',1712055611,1712055611,4,'2e8a31m9d54buntgborfdlpst4'),
(1018,'/lib/results/printDocument.php',1712055627,1712055627,4,'2e8a31m9d54buntgborfdlpst4'),
(1019,'/lib/results/printDocOptions.php',1712055659,1712055659,4,'2e8a31m9d54buntgborfdlpst4'),
(1020,'/lib/results/printDocument.php',1712055660,1712055660,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(1021,'/lib/results/printDocument.php',1712055661,1712055661,4,'2e8a31m9d54buntgborfdlpst4'),
(1022,'/lib/usermanagement/usersEdit.php',1712055726,1712055726,1,'t9k9aemaltqgumc8sr4p07ipmo'),
(1023,'/lib/usermanagement/usersEdit.php',1712055738,1712055738,1,'t9k9aemaltqgumc8sr4p07ipmo'),
(1024,'/lib/execute/execSetResults.php',1712055753,1712055753,3,'q3aam1rq9vs31olusc2tok9l35'),
(1025,'/lib/execute/execSetResults.php',1712055753,1712055753,3,'q3aam1rq9vs31olusc2tok9l35'),
(1026,'/lib/attachments/attachmentdelete.php',1712055759,1712055759,3,'q3aam1rq9vs31olusc2tok9l35'),
(1027,'/lib/execute/execSetResults.php',1712055764,1712055764,3,'q3aam1rq9vs31olusc2tok9l35'),
(1028,'/lib/attachments/attachmentupload.php',1712055772,1712055772,3,'q3aam1rq9vs31olusc2tok9l35'),
(1029,'/lib/attachments/attachmentupload.php',1712055779,1712055779,3,'q3aam1rq9vs31olusc2tok9l35'),
(1030,'/lib/attachments/attachmentupload.php',1712055790,1712055791,3,'q3aam1rq9vs31olusc2tok9l35'),
(1031,'/lib/execute/execSetResults.php',1712055793,1712055793,3,'q3aam1rq9vs31olusc2tok9l35'),
(1032,'/lib/attachments/attachmentupload.php',1712055835,1712055835,3,'q3aam1rq9vs31olusc2tok9l35'),
(1033,'/lib/execute/execSetResults.php',1712055839,1712055839,3,'q3aam1rq9vs31olusc2tok9l35'),
(1034,'/lib/attachments/attachmentupload.php',1712055877,1712055877,3,'q3aam1rq9vs31olusc2tok9l35'),
(1035,'/lib/execute/execSetResults.php',1712055879,1712055879,3,'q3aam1rq9vs31olusc2tok9l35'),
(1036,'/lib/execute/execSetResults.php',1712055892,1712055892,3,'q3aam1rq9vs31olusc2tok9l35'),
(1037,'/lib/execute/execSetResults.php',1712055893,1712055893,3,'q3aam1rq9vs31olusc2tok9l35'),
(1038,'/lib/execute/execSetResults.php',1712055897,1712055897,3,'q3aam1rq9vs31olusc2tok9l35'),
(1039,'/lib/results/printDocument.php',1712055929,1712055929,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(1040,'/lib/execute/execSetResults.php',1712055934,1712055934,3,'q3aam1rq9vs31olusc2tok9l35'),
(1041,'/lib/plan/planEdit.php',1712055957,1712055957,3,'q3aam1rq9vs31olusc2tok9l35'),
(1042,'/lib/results/printDocument.php',1712055983,1712055983,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(1043,'/lib/plan/planEdit.php',1712055988,1712055988,3,'q3aam1rq9vs31olusc2tok9l35'),
(1044,'/lib/testcases/listTestCases.php',1712056001,1712056001,3,'q3aam1rq9vs31olusc2tok9l35'),
(1045,'/lib/testcases/archiveData.php',1712056002,1712056002,3,'q3aam1rq9vs31olusc2tok9l35'),
(1046,'/lib/results/printDocument.php',1712056070,1712056070,4,'2e8a31m9d54buntgborfdlpst4'),
(1047,'/lib/testcases/listTestCases.php',1712056307,1712056307,3,'q3aam1rq9vs31olusc2tok9l35'),
(1048,'/lib/results/printDocument.php',1712056347,1712056347,2,'9s8dm8pbi9kdeq2n9b9dfqjsga'),
(1049,'/lib/results/printDocument.php',1712056642,1712056642,3,'q3aam1rq9vs31olusc2tok9l35'),
(1050,'/lib/results/printDocument.php',1712056860,1712056860,3,'q3aam1rq9vs31olusc2tok9l35');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `tsuites_tree_depth_2`
--

DROP TABLE IF EXISTS `tsuites_tree_depth_2`;
/*!50001 DROP VIEW IF EXISTS `tsuites_tree_depth_2`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `tsuites_tree_depth_2` AS SELECT
 1 AS `prefix`,
  1 AS `testproject_name`,
  1 AS `level1_name`,
  1 AS `level2_name`,
  1 AS `testproject_id`,
  1 AS `level1_id`,
  1 AS `level2_id` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user_assignments`
--

DROP TABLE IF EXISTS `user_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_assignments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(10) unsigned NOT NULL DEFAULT 1,
  `feature_id` int(10) unsigned NOT NULL DEFAULT 0,
  `user_id` int(10) unsigned DEFAULT 0,
  `build_id` int(10) unsigned DEFAULT 0,
  `deadline_ts` datetime DEFAULT NULL,
  `assigner_id` int(10) unsigned DEFAULT 0,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(10) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `user_assignments_feature_id` (`feature_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_assignments`
--

LOCK TABLES `user_assignments` WRITE;
/*!40000 ALTER TABLE `user_assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_group` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group`
--

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_assign`
--

DROP TABLE IF EXISTS `user_group_assign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group_assign` (
  `usergroup_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `idx_user_group_assign` (`usergroup_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_assign`
--

LOCK TABLES `user_group_assign` WRITE;
/*!40000 ALTER TABLE `user_group_assign` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_group_assign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_testplan_roles`
--

DROP TABLE IF EXISTS `user_testplan_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_testplan_roles` (
  `user_id` int(10) NOT NULL DEFAULT 0,
  `testplan_id` int(10) NOT NULL DEFAULT 0,
  `role_id` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`,`testplan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_testplan_roles`
--

LOCK TABLES `user_testplan_roles` WRITE;
/*!40000 ALTER TABLE `user_testplan_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_testplan_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_testproject_roles`
--

DROP TABLE IF EXISTS `user_testproject_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_testproject_roles` (
  `user_id` int(10) NOT NULL DEFAULT 0,
  `testproject_id` int(10) NOT NULL DEFAULT 0,
  `role_id` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`,`testproject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_testproject_roles`
--

LOCK TABLES `user_testproject_roles` WRITE;
/*!40000 ALTER TABLE `user_testproject_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_testproject_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `role_id` int(10) unsigned NOT NULL DEFAULT 0,
  `email` varchar(100) NOT NULL DEFAULT '',
  `first` varchar(50) NOT NULL DEFAULT '',
  `last` varchar(50) NOT NULL DEFAULT '',
  `locale` varchar(10) NOT NULL DEFAULT 'en_GB',
  `default_testproject_id` int(10) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `script_key` varchar(32) DEFAULT NULL,
  `cookie_string` varchar(64) NOT NULL DEFAULT '',
  `auth_method` varchar(10) DEFAULT '',
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `expiration_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_login` (`login`),
  UNIQUE KEY `users_cookie_string` (`cookie_string`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='User information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'admin','$2y$10$UBLAf8p02QPQumS/PtZwY.xUmbnedE1RBzV8lqp8SpuzuzTxbpFB.',8,'khazi.devops@gmail.com','admin','Administrator','en_US',NULL,1,NULL,'c34c0da7d4a07e645341d155daed2c3278ffe563e03d3ece400b6e6db6441c87','','2023-12-20 10:54:37',NULL),
(2,'rj.ravindra@kenestechnology.net','$2y$10$tGTSfrobpgOsTi0nQyxBfe0yCQM/gyNfekdN.68OkiLYlO8YrZaYW',8,'rj.ravindra@kenestechnology.net','Ravindra','Reddy J','en_US',NULL,1,'f1c5ed8c637356366a24751515814140','4098356de49ad07989b6ab119830cf671db5fa87c73302f666cf0fdfd08b8437','','2023-12-20 12:01:39',NULL),
(3,'v.bhavana@Kaynestechnology.net','$2y$10$mZOKQhfY7iC4VfozoygE7uJ1tll57UuBd0Z/L5FQwYvFONZ2d7quC',1,'v.bhavana@Kaynestechnology.net','Vaddadi','Bhavana','en_US',NULL,1,'655d3dc742c16aab42870dff3eafd1bd','d5d1784bbc61543ae82e22f0a30ef68c01c298cd55cd17bd4991bdbea77a701e','','2023-12-29 09:40:22',NULL),
(4,'suneel.duth@kaynestechnology.net','$2y$10$sg.t490dAfFESMT17u/Z4OP9yHr230CpJATpJmfcvdgGug93/JKwO',1,'suneel.duth@kaynestechnology.net','Dusara','Suneelduth','en_US',NULL,1,NULL,'39f55cf5fae32cac57f1556c92fe88aff2d1bd8bb8a38fe55b83d4c96b571c13','','2023-12-29 09:41:31',NULL),
(5,'ashwani@cuzorlabs.com','$2y$10$zf8gCqnMApgEXyDVLpNRBuFsLTsbESIatG0WIXEWBpKaND0JhRahO',10,'ashwani@cuzorlabs.com','Ashwani','Rajan','en_US',NULL,1,NULL,'1c9694ec499111560afb8d9a96b156763f65e7d31567c02c45637c47f40d77a5','','2024-04-02 09:17:33',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `exec_by_date_time`
--

/*!50001 DROP VIEW IF EXISTS `exec_by_date_time`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tl_testlink`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `exec_by_date_time` AS (select `NHTPL`.`name` AS `testplan_name`,date_format(`E`.`execution_ts`,'%Y-%m-%d') AS `yyyy_mm_dd`,date_format(`E`.`execution_ts`,'%Y-%m') AS `yyyy_mm`,date_format(`E`.`execution_ts`,'%H') AS `hh`,date_format(`E`.`execution_ts`,'%k') AS `hour`,`E`.`id` AS `id`,`E`.`build_id` AS `build_id`,`E`.`tester_id` AS `tester_id`,`E`.`execution_ts` AS `execution_ts`,`E`.`status` AS `status`,`E`.`testplan_id` AS `testplan_id`,`E`.`tcversion_id` AS `tcversion_id`,`E`.`tcversion_number` AS `tcversion_number`,`E`.`platform_id` AS `platform_id`,`E`.`execution_type` AS `execution_type`,`E`.`execution_duration` AS `execution_duration`,`E`.`notes` AS `notes` from ((`executions` `E` join `testplans` `TPL` on(`TPL`.`id` = `E`.`testplan_id`)) join `nodes_hierarchy` `NHTPL` on(`NHTPL`.`id` = `TPL`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `latest_exec_by_context`
--

/*!50001 DROP VIEW IF EXISTS `latest_exec_by_context`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tl_testlink`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `latest_exec_by_context` AS select `executions`.`tcversion_id` AS `tcversion_id`,`executions`.`testplan_id` AS `testplan_id`,`executions`.`build_id` AS `build_id`,`executions`.`platform_id` AS `platform_id`,max(`executions`.`id`) AS `id` from `executions` group by `executions`.`tcversion_id`,`executions`.`testplan_id`,`executions`.`build_id`,`executions`.`platform_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `latest_exec_by_testplan`
--

/*!50001 DROP VIEW IF EXISTS `latest_exec_by_testplan`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tl_testlink`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `latest_exec_by_testplan` AS select `executions`.`tcversion_id` AS `tcversion_id`,`executions`.`testplan_id` AS `testplan_id`,max(`executions`.`id`) AS `id` from `executions` group by `executions`.`tcversion_id`,`executions`.`testplan_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `latest_exec_by_testplan_plat`
--

/*!50001 DROP VIEW IF EXISTS `latest_exec_by_testplan_plat`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tl_testlink`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `latest_exec_by_testplan_plat` AS select `executions`.`tcversion_id` AS `tcversion_id`,`executions`.`testplan_id` AS `testplan_id`,`executions`.`platform_id` AS `platform_id`,max(`executions`.`id`) AS `id` from `executions` group by `executions`.`tcversion_id`,`executions`.`testplan_id`,`executions`.`platform_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `latest_req_version`
--

/*!50001 DROP VIEW IF EXISTS `latest_req_version`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tl_testlink`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `latest_req_version` AS select `RQ`.`id` AS `req_id`,max(`RQV`.`version`) AS `version` from ((`nodes_hierarchy` `NHRQV` join `requirements` `RQ` on(`RQ`.`id` = `NHRQV`.`parent_id`)) join `req_versions` `RQV` on(`RQV`.`id` = `NHRQV`.`id`)) group by `RQ`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `latest_req_version_id`
--

/*!50001 DROP VIEW IF EXISTS `latest_req_version_id`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tl_testlink`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `latest_req_version_id` AS select `LRQVN`.`req_id` AS `req_id`,`LRQVN`.`version` AS `version`,`REQV`.`id` AS `req_version_id` from ((`latest_req_version` `LRQVN` join `nodes_hierarchy` `NHRQV` on(`NHRQV`.`parent_id` = `LRQVN`.`req_id`)) join `req_versions` `REQV` on(`REQV`.`id` = `NHRQV`.`id` and `REQV`.`version` = `LRQVN`.`version`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `latest_rspec_revision`
--

/*!50001 DROP VIEW IF EXISTS `latest_rspec_revision`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tl_testlink`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `latest_rspec_revision` AS select `RSR`.`parent_id` AS `req_spec_id`,`RS`.`testproject_id` AS `testproject_id`,max(`RSR`.`revision`) AS `revision` from (`req_specs_revisions` `RSR` join `req_specs` `RS` on(`RS`.`id` = `RSR`.`parent_id`)) group by `RSR`.`parent_id`,`RS`.`testproject_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `latest_tcase_version_id`
--

/*!50001 DROP VIEW IF EXISTS `latest_tcase_version_id`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tl_testlink`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `latest_tcase_version_id` AS select `LTCVN`.`testcase_id` AS `testcase_id`,`LTCVN`.`version` AS `version`,`TCV`.`id` AS `tcversion_id` from ((`latest_tcase_version_number` `LTCVN` join `nodes_hierarchy` `NHTCV` on(`NHTCV`.`parent_id` = `LTCVN`.`testcase_id`)) join `tcversions` `TCV` on(`TCV`.`id` = `NHTCV`.`id` and `TCV`.`version` = `LTCVN`.`version`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `latest_tcase_version_number`
--

/*!50001 DROP VIEW IF EXISTS `latest_tcase_version_number`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tl_testlink`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `latest_tcase_version_number` AS select `NH_TC`.`id` AS `testcase_id`,max(`TCV`.`version`) AS `version` from ((`nodes_hierarchy` `NH_TC` join `nodes_hierarchy` `NH_TCV` on(`NH_TCV`.`parent_id` = `NH_TC`.`id`)) join `tcversions` `TCV` on(`NH_TCV`.`id` = `TCV`.`id`)) group by `NH_TC`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tcversions_without_keywords`
--

/*!50001 DROP VIEW IF EXISTS `tcversions_without_keywords`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tl_testlink`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `tcversions_without_keywords` AS select `NHTCV`.`parent_id` AS `testcase_id`,`NHTCV`.`id` AS `id` from `nodes_hierarchy` `NHTCV` where `NHTCV`.`node_type_id` = 4 and !exists(select 1 from `testcase_keywords` `TCK` where `TCK`.`tcversion_id` = `NHTCV`.`id` limit 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tcversions_without_platforms`
--

/*!50001 DROP VIEW IF EXISTS `tcversions_without_platforms`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tl_testlink`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `tcversions_without_platforms` AS select `NHTCV`.`parent_id` AS `testcase_id`,`NHTCV`.`id` AS `id` from `nodes_hierarchy` `NHTCV` where `NHTCV`.`node_type_id` = 4 and !exists(select 1 from `testcase_platforms` `TCPL` where `TCPL`.`tcversion_id` = `NHTCV`.`id` limit 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tsuites_tree_depth_2`
--

/*!50001 DROP VIEW IF EXISTS `tsuites_tree_depth_2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tl_testlink`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `tsuites_tree_depth_2` AS select `TPRJ`.`prefix` AS `prefix`,`NHTPRJ`.`name` AS `testproject_name`,`NHTS_L1`.`name` AS `level1_name`,`NHTS_L2`.`name` AS `level2_name`,`NHTPRJ`.`id` AS `testproject_id`,`NHTS_L1`.`id` AS `level1_id`,`NHTS_L2`.`id` AS `level2_id` from (((`testprojects` `TPRJ` join `nodes_hierarchy` `NHTPRJ` on(`TPRJ`.`id` = `NHTPRJ`.`id`)) left join `nodes_hierarchy` `NHTS_L1` on(`NHTS_L1`.`parent_id` = `NHTPRJ`.`id`)) left join `nodes_hierarchy` `NHTS_L2` on(`NHTS_L2`.`parent_id` = `NHTS_L1`.`id`)) where `NHTPRJ`.`node_type_id` = 1 and `NHTS_L1`.`node_type_id` = 2 and `NHTS_L2`.`node_type_id` = 2 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-02 11:25:08
