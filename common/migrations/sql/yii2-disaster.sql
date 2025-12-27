-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: yii2-disaster
-- ------------------------------------------------------
-- Server version	8.0.44-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `t_access_route`
--

DROP TABLE IF EXISTS `t_access_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_access_route` (
  `id` int NOT NULL AUTO_INCREMENT,
  `disaster_id` int DEFAULT NULL,
  `route_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `route_geometry` linestring DEFAULT NULL,
  `route_length_km` decimal(6,2) DEFAULT NULL,
  `access_route_status_id` int DEFAULT NULL COMMENT 'safe | damaged | blocked',
  `geometry_updated_at` datetime DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `verlock` int DEFAULT NULL,
  `uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t_access_route_relation_status` (`access_route_status_id`),
  KEY `idx_route_disaster` (`disaster_id`),
  CONSTRAINT `t_access_route_relation_disaster` FOREIGN KEY (`disaster_id`) REFERENCES `t_disaster` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_access_route_relation_status` FOREIGN KEY (`access_route_status_id`) REFERENCES `t_access_route_status` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_access_route`
--

LOCK TABLES `t_access_route` WRITE;
/*!40000 ALTER TABLE `t_access_route` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_access_route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_access_route_shelter`
--

DROP TABLE IF EXISTS `t_access_route_shelter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_access_route_shelter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `access_route_id` int DEFAULT NULL,
  `shelter_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `verlock` int DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t_access_route_shelters_relation_route` (`access_route_id`),
  KEY `t_access_route_shelters_relation_shelter` (`shelter_id`),
  CONSTRAINT `t_access_route_shelter_relation_route` FOREIGN KEY (`access_route_id`) REFERENCES `t_access_route` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_access_route_shelter_relation_shelter` FOREIGN KEY (`shelter_id`) REFERENCES `t_shelter` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_access_route_shelter`
--

LOCK TABLES `t_access_route_shelter` WRITE;
/*!40000 ALTER TABLE `t_access_route_shelter` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_access_route_shelter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_access_route_status`
--

DROP TABLE IF EXISTS `t_access_route_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_access_route_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `description` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `verlock` int DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_access_route_status_index_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_access_route_status`
--

LOCK TABLES `t_access_route_status` WRITE;
/*!40000 ALTER TABLE `t_access_route_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_access_route_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_access_route_vehicle`
--

DROP TABLE IF EXISTS `t_access_route_vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_access_route_vehicle` (
  `id` int NOT NULL AUTO_INCREMENT,
  `access_route_id` int DEFAULT NULL,
  `vehicle_type_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` varchar(255) DEFAULT NULL,
  `verlock` int DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t_access_route_vehicles_relation_route` (`access_route_id`),
  KEY `t_access_route_vehicles_relation_type` (`vehicle_type_id`),
  CONSTRAINT `t_access_route_vehicle_relation_route` FOREIGN KEY (`access_route_id`) REFERENCES `t_access_route` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_access_route_vehicle_relation_vehicle` FOREIGN KEY (`vehicle_type_id`) REFERENCES `t_vehicle_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_access_route_vehicle`
--

LOCK TABLES `t_access_route_vehicle` WRITE;
/*!40000 ALTER TABLE `t_access_route_vehicle` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_access_route_vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_aid_distribution`
--

DROP TABLE IF EXISTS `t_aid_distribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_aid_distribution` (
  `id` int NOT NULL AUTO_INCREMENT,
  `aid_plan_id` int DEFAULT NULL,
  `shelter_id` int DEFAULT NULL,
  `distribution_date` datetime DEFAULT NULL,
  `distributed_by` int DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `verlock` int DEFAULT NULL,
  `uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t_aid_distribution_relation_plan` (`aid_plan_id`),
  KEY `t_aid_distribution_relation_shelter` (`shelter_id`),
  KEY `t_aid_distribution_relation_distribution` (`distributed_by`),
  CONSTRAINT `t_aid_distribution_relation_plan` FOREIGN KEY (`aid_plan_id`) REFERENCES `t_aid_plan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_aid_distribution_relation_shelter` FOREIGN KEY (`shelter_id`) REFERENCES `t_shelter` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_aid_distribution`
--

LOCK TABLES `t_aid_distribution` WRITE;
/*!40000 ALTER TABLE `t_aid_distribution` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_aid_distribution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_aid_distribution_details`
--

DROP TABLE IF EXISTS `t_aid_distribution_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_aid_distribution_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `aid_distribution_id` int DEFAULT NULL,
  `item_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `unit_id` int DEFAULT NULL,
  `verlock` int DEFAULT NULL,
  `uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t_aid_distribution_details_relation_master` (`aid_distribution_id`),
  KEY `t_aid_distribution_details_relation_item` (`item_id`),
  KEY `t_aid_distribution_details_relation_unit` (`unit_id`),
  CONSTRAINT `t_aid_distribution_details_relation_item` FOREIGN KEY (`item_id`) REFERENCES `t_item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_aid_distribution_details_relation_master` FOREIGN KEY (`aid_distribution_id`) REFERENCES `t_aid_distribution` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_aid_distribution_details_relation_unit` FOREIGN KEY (`unit_id`) REFERENCES `t_unit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_aid_distribution_details`
--

LOCK TABLES `t_aid_distribution_details` WRITE;
/*!40000 ALTER TABLE `t_aid_distribution_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_aid_distribution_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_aid_plan`
--

DROP TABLE IF EXISTS `t_aid_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_aid_plan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `shelter_id` int DEFAULT NULL,
  `distribution_plan_date` datetime DEFAULT NULL,
  `plan_status` int DEFAULT NULL COMMENT 'draft | approved | executed',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `is_deleted` int DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `verlock` int DEFAULT NULL,
  `uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t_aid_plan_relation_shelter` (`shelter_id`),
  CONSTRAINT `t_aid_plan_relation_shelter` FOREIGN KEY (`shelter_id`) REFERENCES `t_shelter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_aid_plan`
--

LOCK TABLES `t_aid_plan` WRITE;
/*!40000 ALTER TABLE `t_aid_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_aid_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_aid_plan_details`
--

DROP TABLE IF EXISTS `t_aid_plan_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_aid_plan_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `aid_plan_id` int DEFAULT NULL,
  `item_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `unit_id` int DEFAULT NULL,
  `verlock` int DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t_aid_plan_details_relation_plan` (`aid_plan_id`),
  KEY `t_aid_plan_details_relation_item` (`item_id`),
  KEY `t_aid_plan_details_relation_unit` (`unit_id`),
  CONSTRAINT `t_aid_plan_details_relation_item` FOREIGN KEY (`item_id`) REFERENCES `t_item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_aid_plan_details_relation_plan` FOREIGN KEY (`aid_plan_id`) REFERENCES `t_aid_plan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_aid_plan_details_relation_unit` FOREIGN KEY (`unit_id`) REFERENCES `t_unit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_aid_plan_details`
--

LOCK TABLES `t_aid_plan_details` WRITE;
/*!40000 ALTER TABLE `t_aid_plan_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_aid_plan_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_article`
--

DROP TABLE IF EXISTS `t_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_article` (
  `id` int NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `title` varchar(512) NOT NULL,
  `body` text NOT NULL,
  `view` varchar(255) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `thumbnail_base_url` varchar(1024) DEFAULT NULL,
  `thumbnail_path` varchar(1024) DEFAULT NULL,
  `status` smallint NOT NULL DEFAULT '0',
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `published_at` int DEFAULT NULL,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_article_slug` (`slug`),
  KEY `fk_article_author` (`created_by`),
  KEY `fk_article_updater` (`updated_by`),
  KEY `fk_article_category` (`category_id`),
  CONSTRAINT `fk_article_author` FOREIGN KEY (`created_by`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_article_category` FOREIGN KEY (`category_id`) REFERENCES `t_article_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_article_updater` FOREIGN KEY (`updated_by`) REFERENCES `t_user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_article`
--

LOCK TABLES `t_article` WRITE;
/*!40000 ALTER TABLE `t_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_article_attachment`
--

DROP TABLE IF EXISTS `t_article_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_article_attachment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `article_id` int NOT NULL,
  `path` varchar(255) NOT NULL,
  `base_url` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `size` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` int DEFAULT NULL,
  `order` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_article_attachment_article` (`article_id`),
  CONSTRAINT `fk_article_attachment_article` FOREIGN KEY (`article_id`) REFERENCES `t_article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_article_attachment`
--

LOCK TABLES `t_article_attachment` WRITE;
/*!40000 ALTER TABLE `t_article_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_article_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_article_category`
--

DROP TABLE IF EXISTS `t_article_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_article_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `title` varchar(512) NOT NULL,
  `body` text,
  `parent_id` int DEFAULT NULL,
  `status` smallint NOT NULL DEFAULT '0',
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_article_category_slug` (`slug`),
  KEY `fk_article_category_section` (`parent_id`),
  CONSTRAINT `fk_article_category_section` FOREIGN KEY (`parent_id`) REFERENCES `t_article_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_article_category`
--

LOCK TABLES `t_article_category` WRITE;
/*!40000 ALTER TABLE `t_article_category` DISABLE KEYS */;
INSERT INTO `t_article_category` VALUES (1,'news','News',NULL,NULL,1,1766779750,NULL);
/*!40000 ALTER TABLE `t_article_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_disaster`
--

DROP TABLE IF EXISTS `t_disaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_disaster` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `disaster_type_id` int DEFAULT NULL COMMENT '(banjir, gempa, dll)',
  `disaster_status_id` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `verlock` int DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t_disaster_relation_type` (`disaster_type_id`),
  KEY `t_disaster_relation_status` (`disaster_status_id`),
  CONSTRAINT `t_disaster_relation_status` FOREIGN KEY (`disaster_status_id`) REFERENCES `t_disaster_status` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_disaster_relation_type` FOREIGN KEY (`disaster_type_id`) REFERENCES `t_disaster_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_disaster`
--

LOCK TABLES `t_disaster` WRITE;
/*!40000 ALTER TABLE `t_disaster` DISABLE KEYS */;
INSERT INTO `t_disaster` VALUES (2,NULL,1,2,'2025-12-01','2025-12-24','hjkgkghkg hkjhlkhlkjhk hhhhhhhhhhhhhhh','2025-12-20 14:44:31','2025-12-20 14:48:40',1,1,1,'2025-12-20 07:48:40',1,2,'b89ca4c8dd7711f09ac4c858c0b7f92b'),(3,NULL,1,2,'2025-12-18','2026-01-01','asd asd fasd f asdf ','2025-12-20 14:53:23','2025-12-20 14:53:26',1,1,1,'2025-12-20 07:53:26',1,1,'f5683480dd7811f09ac4c858c0b7f92b');
/*!40000 ALTER TABLE `t_disaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_disaster_status`
--

DROP TABLE IF EXISTS `t_disaster_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_disaster_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `description` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `verlock` int DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_disaster_status_index_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_disaster_status`
--

LOCK TABLES `t_disaster_status` WRITE;
/*!40000 ALTER TABLE `t_disaster_status` DISABLE KEYS */;
INSERT INTO `t_disaster_status` VALUES (1,'FIXED_FINALo','Fixed Final Titleo','Descr','2025-12-20 13:59:15','2025-12-20 18:56:19',1,1,1,'2025-12-20 11:56:19',1,4,'65e77ac2dd7111f09ac4c858c0b7f92b'),(2,'cancel','Cancel','test','2025-12-20 14:04:41','2025-12-20 18:56:08',1,1,1,'2025-12-20 11:56:08',1,1,'27eaa978dd7211f09ac4c858c0b7f92b'),(3,'test lagi','testlagi','test','2025-12-20 14:07:58','2025-12-20 18:39:45',1,1,1,'2025-12-20 11:39:45',1,1,'9d7d8b65dd7211f09ac4c858c0b7f92b'),(4,'lagi lagi','lagi','lagiiiii','2025-12-20 14:11:46','2025-12-20 18:23:08',1,1,1,'2025-12-20 11:23:08',1,1,'250c9539dd7311f09ac4c858c0b7f92b');
/*!40000 ALTER TABLE `t_disaster_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_disaster_type`
--

DROP TABLE IF EXISTS `t_disaster_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_disaster_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `description` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `verlock` int DEFAULT NULL,
  `uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_disaster_type_index_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_disaster_type`
--

LOCK TABLES `t_disaster_type` WRITE;
/*!40000 ALTER TABLE `t_disaster_type` DISABLE KEYS */;
INSERT INTO `t_disaster_type` VALUES (1,'jjjj','jjj','jjjjjjjkhkjhhjhkj','2025-12-20 14:37:28','2025-12-20 18:56:26',1,1,1,'2025-12-20 11:56:26',1,3,'bc2316d1dd7611f09ac4c858c0b7f92b'),(2,'bnbnbn','nbnbnbnbnb','nbnmbmnmnbjbjbj klhlk ','2025-12-20 15:38:03','2025-12-20 15:54:46',1,1,1,'2025-12-20 08:54:46',1,3,'32d499c0dd7f11f09ac4c858c0b7f92b');
/*!40000 ALTER TABLE `t_disaster_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_entity_type`
--

DROP TABLE IF EXISTS `t_entity_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_entity_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `description` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `verlock` int DEFAULT NULL,
  `uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_entity_type_index_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_entity_type`
--

LOCK TABLES `t_entity_type` WRITE;
/*!40000 ALTER TABLE `t_entity_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_entity_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_file_storage_item`
--

DROP TABLE IF EXISTS `t_file_storage_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_file_storage_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `component` varchar(255) NOT NULL,
  `base_url` varchar(1024) NOT NULL,
  `path` varchar(1024) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `size` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `upload_ip` varchar(45) DEFAULT NULL,
  `created_at` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_file_storage_item`
--

LOCK TABLES `t_file_storage_item` WRITE;
/*!40000 ALTER TABLE `t_file_storage_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_file_storage_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_i18n_message`
--

DROP TABLE IF EXISTS `t_i18n_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_i18n_message` (
  `id` int NOT NULL,
  `language` varchar(16) NOT NULL,
  `translation` text,
  PRIMARY KEY (`id`,`language`),
  CONSTRAINT `fk_i18n_message_source_message` FOREIGN KEY (`id`) REFERENCES `t_i18n_source_message` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_i18n_message`
--

LOCK TABLES `t_i18n_message` WRITE;
/*!40000 ALTER TABLE `t_i18n_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_i18n_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_i18n_source_message`
--

DROP TABLE IF EXISTS `t_i18n_source_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_i18n_source_message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(32) DEFAULT NULL,
  `message` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_i18n_source_message`
--

LOCK TABLES `t_i18n_source_message` WRITE;
/*!40000 ALTER TABLE `t_i18n_source_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_i18n_source_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_item`
--

DROP TABLE IF EXISTS `t_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_category_id` int DEFAULT NULL COMMENT 'food, water, medicine, shelter, etc for disaster',
  `title` varchar(255) DEFAULT NULL,
  `unit` int DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `is_deleted` int DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `verlock` int DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t_item_relation_category` (`item_category_id`),
  CONSTRAINT `t_item_relation_category` FOREIGN KEY (`item_category_id`) REFERENCES `t_item_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_item`
--

LOCK TABLES `t_item` WRITE;
/*!40000 ALTER TABLE `t_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_item_category`
--

DROP TABLE IF EXISTS `t_item_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_item_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `description` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `verlock` int DEFAULT NULL,
  `uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_disaster_type_index_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_item_category`
--

LOCK TABLES `t_item_category` WRITE;
/*!40000 ALTER TABLE `t_item_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_item_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_key_storage_item`
--

DROP TABLE IF EXISTS `t_key_storage_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_key_storage_item` (
  `key` varchar(128) NOT NULL,
  `value` text NOT NULL,
  `comment` text,
  `updated_at` int DEFAULT NULL,
  `created_at` int DEFAULT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `idx_key_storage_item_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_key_storage_item`
--

LOCK TABLES `t_key_storage_item` WRITE;
/*!40000 ALTER TABLE `t_key_storage_item` DISABLE KEYS */;
INSERT INTO `t_key_storage_item` VALUES ('backend.layout-boxed','0',NULL,NULL,NULL),('backend.layout-collapsed-sidebar','0',NULL,NULL,NULL),('backend.layout-fixed','0',NULL,NULL,NULL),('backend.theme-skin','skin-blue','skin-blue, skin-black, skin-purple, skin-green, skin-red, skin-yellow',NULL,NULL),('frontend.maintenance','disabled','Set it to \"enabled\" to turn on maintenance mode',NULL,NULL);
/*!40000 ALTER TABLE `t_key_storage_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_media_file`
--

DROP TABLE IF EXISTS `t_media_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_media_file` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_type_id` int DEFAULT NULL COMMENT 'shelter | distribution | route',
  `entity_id` int DEFAULT NULL,
  `file_path` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `file_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mime_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `taken_at` datetime DEFAULT NULL,
  `uploaded_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `verlock` int DEFAULT NULL,
  `uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_media_entity` (`entity_type_id`,`entity_id`),
  CONSTRAINT `t_media_files_relation_entity_type` FOREIGN KEY (`entity_type_id`) REFERENCES `t_entity_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_media_file`
--

LOCK TABLES `t_media_file` WRITE;
/*!40000 ALTER TABLE `t_media_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_media_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_page`
--

DROP TABLE IF EXISTS `t_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_page` (
  `id` int NOT NULL AUTO_INCREMENT,
  `slug` varchar(2048) NOT NULL,
  `title` varchar(512) NOT NULL,
  `body` text NOT NULL,
  `view` varchar(255) DEFAULT NULL,
  `status` smallint NOT NULL,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_page`
--

LOCK TABLES `t_page` WRITE;
/*!40000 ALTER TABLE `t_page` DISABLE KEYS */;
INSERT INTO `t_page` VALUES (1,'about','About','Lorem ipsum dolor sit amet, consectetur adipiscing elit.',NULL,1,1766779750,1766779750);
/*!40000 ALTER TABLE `t_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_rbac_auth_assignment`
--

DROP TABLE IF EXISTS `t_rbac_auth_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_rbac_auth_assignment` (
  `item_name` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` int DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `t_rbac_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `t_rbac_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_rbac_auth_assignment`
--

LOCK TABLES `t_rbac_auth_assignment` WRITE;
/*!40000 ALTER TABLE `t_rbac_auth_assignment` DISABLE KEYS */;
INSERT INTO `t_rbac_auth_assignment` VALUES ('administrator','1',1766779753),('coordinator','2',1766779753),('regular','3',1766779753);
/*!40000 ALTER TABLE `t_rbac_auth_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_rbac_auth_item`
--

DROP TABLE IF EXISTS `t_rbac_auth_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_rbac_auth_item` (
  `name` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` smallint NOT NULL,
  `description` text COLLATE utf8mb3_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `t_rbac_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `t_rbac_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_rbac_auth_item`
--

LOCK TABLES `t_rbac_auth_item` WRITE;
/*!40000 ALTER TABLE `t_rbac_auth_item` DISABLE KEYS */;
INSERT INTO `t_rbac_auth_item` VALUES ('administrator',1,NULL,NULL,NULL,1766779753,1766779753),('coordinator',1,NULL,NULL,NULL,1766779753,1766779753),('editOwnModel',2,NULL,'ownModelRule',NULL,1766779753,1766779753),('loginToBackend',2,NULL,NULL,NULL,1766779753,1766779753),('regular',1,NULL,NULL,NULL,1766779753,1766779753);
/*!40000 ALTER TABLE `t_rbac_auth_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_rbac_auth_item_child`
--

DROP TABLE IF EXISTS `t_rbac_auth_item_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_rbac_auth_item_child` (
  `parent` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `t_rbac_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `t_rbac_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_rbac_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `t_rbac_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_rbac_auth_item_child`
--

LOCK TABLES `t_rbac_auth_item_child` WRITE;
/*!40000 ALTER TABLE `t_rbac_auth_item_child` DISABLE KEYS */;
INSERT INTO `t_rbac_auth_item_child` VALUES ('administrator','coordinator'),('regular','editOwnModel'),('administrator','loginToBackend'),('coordinator','loginToBackend'),('administrator','regular'),('coordinator','regular');
/*!40000 ALTER TABLE `t_rbac_auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_rbac_auth_rule`
--

DROP TABLE IF EXISTS `t_rbac_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_rbac_auth_rule` (
  `name` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_rbac_auth_rule`
--

LOCK TABLES `t_rbac_auth_rule` WRITE;
/*!40000 ALTER TABLE `t_rbac_auth_rule` DISABLE KEYS */;
INSERT INTO `t_rbac_auth_rule` VALUES ('ownModelRule',_binary 'O:29:\"common\\rbac\\rule\\OwnModelRule\":3:{s:4:\"name\";s:12:\"ownModelRule\";s:9:\"createdAt\";i:1766779753;s:9:\"updatedAt\";i:1766779753;}',1766779753,1766779753);
/*!40000 ALTER TABLE `t_rbac_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_shelter`
--

DROP TABLE IF EXISTS `t_shelter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_shelter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `disaster_id` int DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `latitude` decimal(11,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `evacuee_count` int DEFAULT NULL,
  `aid_status` tinyint DEFAULT NULL COMMENT 'derived',
  `last_aid_distribution_at` datetime DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `is_deleted` int DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `verlock` int DEFAULT NULL,
  `uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t_shelter_relation_disaster` (`disaster_id`),
  KEY `idx_shelter_latlng` (`latitude`,`longitude`),
  CONSTRAINT `t_shelter_relation_disaster` FOREIGN KEY (`disaster_id`) REFERENCES `t_disaster` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_shelter`
--

LOCK TABLES `t_shelter` WRITE;
/*!40000 ALTER TABLE `t_shelter` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_shelter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_system_db_migration`
--

DROP TABLE IF EXISTS `t_system_db_migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_system_db_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_system_db_migration`
--

LOCK TABLES `t_system_db_migration` WRITE;
/*!40000 ALTER TABLE `t_system_db_migration` DISABLE KEYS */;
INSERT INTO `t_system_db_migration` VALUES ('m000000_000000_base',1766779746),('m140703_123000_user',1766779747),('m140703_123055_log',1766779748),('m140703_123104_page',1766779748),('m140703_123803_article',1766779748),('m140703_123813_rbac',1766779748),('m140709_173306_widget_menu',1766779748),('m140709_173333_widget_text',1766779748),('m140712_123329_widget_carousel',1766779748),('m140805_084745_key_storage_item',1766779748),('m141012_101932_i18n_tables',1766779748),('m150318_213934_file_storage_item',1766779748),('m150414_195800_timeline_event',1766779748),('m150725_192740_seed_data',1766779750),('m150929_074021_article_attachment_order',1766779750),('m160203_095604_user_token',1766779750),('m190130_155645_add_article_slug_index',1766779750);
/*!40000 ALTER TABLE `t_system_db_migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_system_log`
--

DROP TABLE IF EXISTS `t_system_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_system_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `level` int DEFAULT NULL,
  `category` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `log_time` double DEFAULT NULL,
  `prefix` text COLLATE utf8mb3_unicode_ci,
  `message` text COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_log_level` (`level`),
  KEY `idx_log_category` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_system_log`
--

LOCK TABLES `t_system_log` WRITE;
/*!40000 ALTER TABLE `t_system_log` DISABLE KEYS */;
INSERT INTO `t_system_log` VALUES (1,1,'yii\\base\\ErrorException:2',1766861151.0552,'[backend][/yii2-disaster-aid/backend/web/gii/crud]','yii\\base\\ErrorException: file_put_contents(/var/www/html/yii2-disaster-aid/backend/runtime/gii-2.0.46/yii-gii-generators-crud-Generator.json): Failed to open stream: Permission denied in /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2-gii/src/Generator.php:254\nStack trace:\n#0 [internal function]: yii\\base\\ErrorHandler->handleError()\n#1 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2-gii/src/Generator.php(254): file_put_contents()\n#2 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2-gii/src/controllers/DefaultController.php(60): yii\\gii\\Generator->saveStickyAttributes()\n#3 [internal function]: yii\\gii\\controllers\\DefaultController->actionView()\n#4 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2/base/InlineAction.php(57): call_user_func_array()\n#5 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2/base/Controller.php(178): yii\\base\\InlineAction->runWithParams()\n#6 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2/base/Module.php(552): yii\\base\\Controller->runAction()\n#7 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction()\n#8 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2/base/Application.php(384): yii\\web\\Application->handleRequest()\n#9 /var/www/html/yii2-disaster-aid/backend/web/index.php(23): yii\\base\\Application->run()\n#10 {main}'),(2,2,'yii\\log\\Dispatcher::dispatch',1766861151.1047,'[backend][/yii2-disaster-aid/backend/web/gii/crud]','Unable to send log via yii\\debug\\LogTarget: Exception (Invalid Configuration) \'yii\\base\\InvalidConfigException\' with message \'Unable to open debug data index file: /var/www/html/yii2-disaster-aid/backend/runtime/debug/index.data\' \n\nin /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2-debug/src/LogTarget.php:140\n\nStack trace:\n#0 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2-debug/src/LogTarget.php(79): yii\\debug\\LogTarget->updateIndexFile()\n#1 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2-debug/src/LogTarget.php(182): yii\\debug\\LogTarget->export()\n#2 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2/log/Dispatcher.php(194): yii\\debug\\LogTarget->collect()\n#3 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2/log/Logger.php(226): yii\\log\\Dispatcher->dispatch()\n#4 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2/base/ErrorHandler.php(154): yii\\log\\Logger->flush()\n#5 [internal function]: yii\\base\\ErrorHandler->handleException()\n#6 {main}'),(3,1,'yii\\base\\ErrorException:2',1766861153.8839,'[backend][/yii2-disaster-aid/backend/web/gii/crud]','yii\\base\\ErrorException: file_put_contents(/var/www/html/yii2-disaster-aid/backend/runtime/gii-2.0.46/yii-gii-generators-crud-Generator.json): Failed to open stream: Permission denied in /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2-gii/src/Generator.php:254\nStack trace:\n#0 [internal function]: yii\\base\\ErrorHandler->handleError()\n#1 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2-gii/src/Generator.php(254): file_put_contents()\n#2 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2-gii/src/controllers/DefaultController.php(60): yii\\gii\\Generator->saveStickyAttributes()\n#3 [internal function]: yii\\gii\\controllers\\DefaultController->actionView()\n#4 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2/base/InlineAction.php(57): call_user_func_array()\n#5 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2/base/Controller.php(178): yii\\base\\InlineAction->runWithParams()\n#6 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2/base/Module.php(552): yii\\base\\Controller->runAction()\n#7 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction()\n#8 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2/base/Application.php(384): yii\\web\\Application->handleRequest()\n#9 /var/www/html/yii2-disaster-aid/backend/web/index.php(23): yii\\base\\Application->run()\n#10 {main}'),(4,2,'yii\\log\\Dispatcher::dispatch',1766861153.9026,'[backend][/yii2-disaster-aid/backend/web/gii/crud]','Unable to send log via yii\\debug\\LogTarget: Exception (Invalid Configuration) \'yii\\base\\InvalidConfigException\' with message \'Unable to open debug data index file: /var/www/html/yii2-disaster-aid/backend/runtime/debug/index.data\' \n\nin /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2-debug/src/LogTarget.php:140\n\nStack trace:\n#0 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2-debug/src/LogTarget.php(79): yii\\debug\\LogTarget->updateIndexFile()\n#1 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2-debug/src/LogTarget.php(182): yii\\debug\\LogTarget->export()\n#2 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2/log/Dispatcher.php(194): yii\\debug\\LogTarget->collect()\n#3 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2/log/Logger.php(226): yii\\log\\Dispatcher->dispatch()\n#4 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2/base/ErrorHandler.php(154): yii\\log\\Logger->flush()\n#5 [internal function]: yii\\base\\ErrorHandler->handleException()\n#6 {main}'),(5,1,'yii\\base\\ErrorException:2',1766861160.3926,'[backend][/yii2-disaster-aid/backend/web/gii/crud]','yii\\base\\ErrorException: file_put_contents(/var/www/html/yii2-disaster-aid/backend/runtime/gii-2.0.46/yii-gii-generators-crud-Generator.json): Failed to open stream: Permission denied in /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2-gii/src/Generator.php:254\nStack trace:\n#0 [internal function]: yii\\base\\ErrorHandler->handleError()\n#1 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2-gii/src/Generator.php(254): file_put_contents()\n#2 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2-gii/src/controllers/DefaultController.php(60): yii\\gii\\Generator->saveStickyAttributes()\n#3 [internal function]: yii\\gii\\controllers\\DefaultController->actionView()\n#4 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2/base/InlineAction.php(57): call_user_func_array()\n#5 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2/base/Controller.php(178): yii\\base\\InlineAction->runWithParams()\n#6 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2/base/Module.php(552): yii\\base\\Controller->runAction()\n#7 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction()\n#8 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2/base/Application.php(384): yii\\web\\Application->handleRequest()\n#9 /var/www/html/yii2-disaster-aid/backend/web/index.php(23): yii\\base\\Application->run()\n#10 {main}'),(6,2,'yii\\log\\Dispatcher::dispatch',1766861160.4107,'[backend][/yii2-disaster-aid/backend/web/gii/crud]','Unable to send log via yii\\debug\\LogTarget: Exception (Invalid Configuration) \'yii\\base\\InvalidConfigException\' with message \'Unable to open debug data index file: /var/www/html/yii2-disaster-aid/backend/runtime/debug/index.data\' \n\nin /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2-debug/src/LogTarget.php:140\n\nStack trace:\n#0 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2-debug/src/LogTarget.php(79): yii\\debug\\LogTarget->updateIndexFile()\n#1 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2-debug/src/LogTarget.php(182): yii\\debug\\LogTarget->export()\n#2 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2/log/Dispatcher.php(194): yii\\debug\\LogTarget->collect()\n#3 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2/log/Logger.php(226): yii\\log\\Dispatcher->dispatch()\n#4 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2/base/ErrorHandler.php(154): yii\\log\\Logger->flush()\n#5 [internal function]: yii\\base\\ErrorHandler->handleException()\n#6 {main}'),(7,1,'yii\\base\\UnknownClassException',1766861448.6192,'[backend][/yii2-disaster-aid/backend/web/disaster/index]','yii\\base\\UnknownClassException: Unable to find \'backend\\controllers\\DisasterController\' in file: /var/www/html/yii2-disaster-aid/backend/controllers/DisasterController.php. Namespace missing? in /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2/BaseYii.php:296\nStack trace:\n#0 [internal function]: yii\\BaseYii::autoload()\n#1 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2/base/Module.php(661): class_exists()\n#2 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2/base/Module.php(620): yii\\base\\Module->createControllerByID()\n#3 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2/base/Module.php(546): yii\\base\\Module->createController()\n#4 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction()\n#5 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2/base/Application.php(384): yii\\web\\Application->handleRequest()\n#6 /var/www/html/yii2-disaster-aid/backend/web/index.php(23): yii\\base\\Application->run()\n#7 {main}'),(8,1,'yii\\base\\UnknownClassException',1766861487.7507,'[backend][/yii2-disaster-aid/backend/web/disaster/index]','yii\\base\\UnknownClassException: Unable to find \'backend\\controllers\\DisasterController\' in file: /var/www/html/yii2-disaster-aid/backend/controllers/DisasterController.php. Namespace missing? in /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2/BaseYii.php:296\nStack trace:\n#0 [internal function]: yii\\BaseYii::autoload()\n#1 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2/base/Module.php(661): class_exists()\n#2 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2/base/Module.php(620): yii\\base\\Module->createControllerByID()\n#3 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2/base/Module.php(546): yii\\base\\Module->createController()\n#4 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction()\n#5 /var/www/html/yii2-disaster-aid/vendor/yiisoft/yii2/base/Application.php(384): yii\\web\\Application->handleRequest()\n#6 /var/www/html/yii2-disaster-aid/backend/web/index.php(23): yii\\base\\Application->run()\n#7 {main}');
/*!40000 ALTER TABLE `t_system_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_system_rbac_migration`
--

DROP TABLE IF EXISTS `t_system_rbac_migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_system_rbac_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_system_rbac_migration`
--

LOCK TABLES `t_system_rbac_migration` WRITE;
/*!40000 ALTER TABLE `t_system_rbac_migration` DISABLE KEYS */;
INSERT INTO `t_system_rbac_migration` VALUES ('m000000_000000_base',1766779750),('m150625_214101_roles',1766779753),('m150625_215624_init_permissions',1766779753),('m151223_074604_edit_own_model',1766779753);
/*!40000 ALTER TABLE `t_system_rbac_migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_timeline_event`
--

DROP TABLE IF EXISTS `t_timeline_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_timeline_event` (
  `id` int NOT NULL AUTO_INCREMENT,
  `application` varchar(64) NOT NULL,
  `category` varchar(64) NOT NULL,
  `event` varchar(64) NOT NULL,
  `data` text,
  `created_at` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_timeline_event`
--

LOCK TABLES `t_timeline_event` WRITE;
/*!40000 ALTER TABLE `t_timeline_event` DISABLE KEYS */;
INSERT INTO `t_timeline_event` VALUES (1,'frontend','user','signup','{\"public_identity\":\"webmaster\",\"user_id\":1,\"created_at\":1766779748}',1766779748),(2,'frontend','user','signup','{\"public_identity\":\"manager\",\"user_id\":2,\"created_at\":1766779748}',1766779748),(3,'frontend','user','signup','{\"public_identity\":\"user\",\"user_id\":3,\"created_at\":1766779748}',1766779748);
/*!40000 ALTER TABLE `t_timeline_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_unit`
--

DROP TABLE IF EXISTS `t_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_unit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `description` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `verlock` int DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_disaster_status_index_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_unit`
--

LOCK TABLES `t_unit` WRITE;
/*!40000 ALTER TABLE `t_unit` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL,
  `auth_key` varchar(32) NOT NULL,
  `access_token` varchar(40) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `oauth_client` varchar(255) DEFAULT NULL,
  `oauth_client_user_id` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `status` smallint NOT NULL DEFAULT '2',
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  `logged_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (1,'webmaster','yo0JbjlPc5lQe4_ASYbYYPj4PMdPhEdP','pWE8EBBmisbFPstnK5JPK6L3InBcAYlJav9zVTss','$2y$13$X1z2lkJu945A1apnypf2m.O1UqBT20irarXPURJZcd1ntRz2/E/H.',NULL,NULL,'webmaster@example.com',2,1766779749,1766779749,1766853399),(2,'manager','gs550c5HRupVMR09gkJXGFZ3aL2-EJDk','NXUIGV13Fy9uvv-4KFhWEW3j4ooWE624FdXX6LvE','$2y$13$6kFrHQhQdNnvacIgAjIJAOxdLYeXLnt.Hm7ufR/DD8Xj5TdCgC6MK',NULL,NULL,'manager@example.com',2,1766779749,1766779749,NULL),(3,'user','q8Cdf1umIeoVcHSK7Orw_Y7FEt4ubIod','X0B4BpjXvvnwnjbvrl3NkM1TOTHS3oyiuVbLBRdK','$2y$13$3zatTSgiBqywsSW7vX29Tuqi2T8LHGzw8HbczGNn0WOCexAYDSBfW',NULL,NULL,'user@example.com',2,1766779750,1766779750,NULL);
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_profile`
--

DROP TABLE IF EXISTS `t_user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_user_profile` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `middlename` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `avatar_path` varchar(255) DEFAULT NULL,
  `avatar_base_url` varchar(255) DEFAULT NULL,
  `locale` varchar(32) NOT NULL,
  `gender` smallint DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_profile`
--

LOCK TABLES `t_user_profile` WRITE;
/*!40000 ALTER TABLE `t_user_profile` DISABLE KEYS */;
INSERT INTO `t_user_profile` VALUES (1,'John',NULL,'Doe',NULL,NULL,'en-US',NULL),(2,NULL,NULL,NULL,NULL,NULL,'en-US',NULL),(3,NULL,NULL,NULL,NULL,NULL,'en-US',NULL);
/*!40000 ALTER TABLE `t_user_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_token`
--

DROP TABLE IF EXISTS `t_user_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_user_token` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `token` varchar(40) NOT NULL,
  `expire_at` int DEFAULT NULL,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_token`
--

LOCK TABLES `t_user_token` WRITE;
/*!40000 ALTER TABLE `t_user_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_user_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_vehicle_type`
--

DROP TABLE IF EXISTS `t_vehicle_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_vehicle_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `verlock` int DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_vehicle_types_index_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_vehicle_type`
--

LOCK TABLES `t_vehicle_type` WRITE;
/*!40000 ALTER TABLE `t_vehicle_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_vehicle_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_verification`
--

DROP TABLE IF EXISTS `t_verification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_verification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `entity_type_id` int DEFAULT NULL COMMENT 'shelter | distribution | route',
  `entity_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `last_activity_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `verlock` int DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_entity_verification` (`entity_type_id`,`entity_id`),
  KEY `idx_verification_entity` (`entity_type_id`,`entity_id`),
  KEY `idx_verification_activity` (`entity_type_id`,`last_activity_at`),
  CONSTRAINT `t_verification_relation_entity_type` FOREIGN KEY (`entity_type_id`) REFERENCES `t_entity_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_verification`
--

LOCK TABLES `t_verification` WRITE;
/*!40000 ALTER TABLE `t_verification` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_verification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_verification_type`
--

DROP TABLE IF EXISTS `t_verification_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_verification_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'confirm, deny, outdated, blocked',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `description` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `verlock` int DEFAULT NULL,
  `uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_verification_action_index_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_verification_type`
--

LOCK TABLES `t_verification_type` WRITE;
/*!40000 ALTER TABLE `t_verification_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_verification_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_verification_vote`
--

DROP TABLE IF EXISTS `t_verification_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_verification_vote` (
  `id` int NOT NULL AUTO_INCREMENT,
  `verification_id` int DEFAULT NULL,
  `verification_type_id` int DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `voted_by` int DEFAULT NULL,
  `voted_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `verlock` int DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_verification_user` (`verification_id`,`voted_by`),
  KEY `idx_votes_action` (`verification_type_id`),
  KEY `idx_votes_time` (`voted_at`),
  KEY `t_verification_vote_relation_vote_by` (`voted_by`),
  CONSTRAINT `t_verification_vote_relation_type` FOREIGN KEY (`verification_type_id`) REFERENCES `t_verification_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_verification_vote_relation_verification` FOREIGN KEY (`verification_id`) REFERENCES `t_verification` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_verification_vote_relation_vote_by` FOREIGN KEY (`voted_by`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_verification_vote`
--

LOCK TABLES `t_verification_vote` WRITE;
/*!40000 ALTER TABLE `t_verification_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_verification_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_widget_carousel`
--

DROP TABLE IF EXISTS `t_widget_carousel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_widget_carousel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `status` smallint DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_widget_carousel`
--

LOCK TABLES `t_widget_carousel` WRITE;
/*!40000 ALTER TABLE `t_widget_carousel` DISABLE KEYS */;
INSERT INTO `t_widget_carousel` VALUES (1,'index',1);
/*!40000 ALTER TABLE `t_widget_carousel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_widget_carousel_item`
--

DROP TABLE IF EXISTS `t_widget_carousel_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_widget_carousel_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `carousel_id` int NOT NULL,
  `base_url` varchar(1024) DEFAULT NULL,
  `path` varchar(1024) DEFAULT NULL,
  `asset_url` varchar(1024) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `url` varchar(1024) DEFAULT NULL,
  `caption` varchar(1024) DEFAULT NULL,
  `status` smallint NOT NULL DEFAULT '0',
  `order` int DEFAULT '0',
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_item_carousel` (`carousel_id`),
  CONSTRAINT `fk_item_carousel` FOREIGN KEY (`carousel_id`) REFERENCES `t_widget_carousel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_widget_carousel_item`
--

LOCK TABLES `t_widget_carousel_item` WRITE;
/*!40000 ALTER TABLE `t_widget_carousel_item` DISABLE KEYS */;
INSERT INTO `t_widget_carousel_item` VALUES (1,1,'http://disaster.localhost/yii2-disaster-kit','img/yii2-starter-kit.gif','http://disaster.localhost/yii2-disaster-kit/img/yii2-starter-kit.gif','image/gif','/',NULL,1,0,NULL,NULL);
/*!40000 ALTER TABLE `t_widget_carousel_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_widget_menu`
--

DROP TABLE IF EXISTS `t_widget_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_widget_menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `items` text NOT NULL,
  `status` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_widget_menu`
--

LOCK TABLES `t_widget_menu` WRITE;
/*!40000 ALTER TABLE `t_widget_menu` DISABLE KEYS */;
INSERT INTO `t_widget_menu` VALUES (1,'frontend-index','Frontend index menu','[\n    {\n        \"label\": \"Get started with Yii2\",\n        \"url\": \"http://www.yiiframework.com\",\n        \"options\": {\n            \"tag\": \"span\"\n        },\n        \"template\": \"<a href=\\\"{url}\\\" class=\\\"btn btn-lg btn-success\\\">{label}</a>\"\n    },\n    {\n        \"label\": \"Yii2 Starter Kit on GitHub\",\n        \"url\": \"https://github.com/yii2-starter-kit/yii2-starter-kit\",\n        \"options\": {\n            \"tag\": \"span\"\n        },\n        \"template\": \"<a href=\\\"{url}\\\" class=\\\"btn btn-lg btn-primary\\\">{label}</a>\"\n    },\n    {\n        \"label\": \"Find a bug?\",\n        \"url\": \"https://github.com/yii2-starter-kit/yii2-starter-kit/issues\",\n        \"options\": {\n            \"tag\": \"span\"\n        },\n        \"template\": \"<a href=\\\"{url}\\\" class=\\\"btn btn-lg btn-danger\\\">{label}</a>\"\n    }\n]',1);
/*!40000 ALTER TABLE `t_widget_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_widget_text`
--

DROP TABLE IF EXISTS `t_widget_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_widget_text` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `status` smallint DEFAULT NULL,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_widget_text_key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_widget_text`
--

LOCK TABLES `t_widget_text` WRITE;
/*!40000 ALTER TABLE `t_widget_text` DISABLE KEYS */;
INSERT INTO `t_widget_text` VALUES (1,'backend_welcome','Welcome to backend','<p>Welcome to Yii2 Starter Kit Dashboard</p>',1,1766779750,1766779750),(2,'ads-example','Google Ads Example Block','<div class=\"lead\">\n                <script async src=\"//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js\"></script>\n                <ins class=\"adsbygoogle\"\n                     style=\"display:block\"\n                     data-ad-client=\"ca-pub-9505937224921657\"\n                     data-ad-slot=\"2264361777\"\n                     data-ad-format=\"auto\"></ins>\n                <script>\n                (adsbygoogle = window.adsbygoogle || []).push({});\n                </script>\n            </div>',0,1766779750,1766779750);
/*!40000 ALTER TABLE `t_widget_text` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-28  1:53:35
