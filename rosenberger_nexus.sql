-- MySQL dump 10.13  Distrib 8.0.41, for macos15.2 (arm64)
--
-- Host: localhost    Database: RosenbergerNexus
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `_prisma_migrations`
--

DROP TABLE IF EXISTS `_prisma_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_prisma_migrations`
--

LOCK TABLES `_prisma_migrations` WRITE;
/*!40000 ALTER TABLE `_prisma_migrations` DISABLE KEYS */;
INSERT INTO `_prisma_migrations` VALUES ('13e42af9-374a-4995-9bfb-efc8afa2a469','f6092e1ece51024ef15ea229a7bc73c1b0c636dfbec6fc7e903f04a35a8d1a50','2025-12-30 07:23:46.372','20251230072345_add_question_options_order',NULL,NULL,'2025-12-30 07:23:45.510',1);
/*!40000 ALTER TABLE `_prisma_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ActionItems`
--

DROP TABLE IF EXISTS `ActionItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ActionItems` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idx` int DEFAULT NULL,
  `auditId` int DEFAULT NULL,
  `questionId` int DEFAULT NULL,
  `providedScore` double DEFAULT NULL,
  `reportedDate` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `reporterId` int DEFAULT NULL,
  `reportedComments` longtext COLLATE utf8mb4_unicode_ci,
  `status` enum('OPEN','IN_PROGRESS','RESOLVED','CLOSED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'OPEN',
  `ownerId` int DEFAULT NULL,
  `resolutionDate` datetime(3) DEFAULT NULL,
  `resolutionComment` longtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  UNIQUE KEY `ActionItems_idx_key` (`idx`),
  KEY `ActionItems_auditId_idx` (`auditId`),
  KEY `ActionItems_questionId_idx` (`questionId`),
  KEY `ActionItems_reporterId_idx` (`reporterId`),
  KEY `ActionItems_ownerId_fkey` (`ownerId`),
  CONSTRAINT `ActionItems_ownerId_fkey` FOREIGN KEY (`ownerId`) REFERENCES `User` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ActionItems_reporterId_fkey` FOREIGN KEY (`reporterId`) REFERENCES `User` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ActionItems`
--

LOCK TABLES `ActionItems` WRITE;
/*!40000 ALTER TABLE `ActionItems` DISABLE KEYS */;
/*!40000 ALTER TABLE `ActionItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AppAccess`
--

DROP TABLE IF EXISTS `AppAccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AppAccess` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `auditSystem` tinyint(1) NOT NULL DEFAULT '0',
  `ecm` tinyint(1) NOT NULL DEFAULT '0',
  `capitalExpenseRequestTracker` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `AppAccess_userId_key` (`userId`),
  CONSTRAINT `AppAccess_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AppAccess`
--

LOCK TABLES `AppAccess` WRITE;
/*!40000 ALTER TABLE `AppAccess` DISABLE KEYS */;
INSERT INTO `AppAccess` VALUES (1,1,1,0,0,'2026-02-24 10:17:01.818','2026-02-24 10:24:19.820'),(2,2,1,0,0,'2026-02-24 10:17:09.476','2026-02-24 10:17:09.476'),(3,3,1,0,0,'2026-02-24 10:17:10.450','2026-02-24 10:17:10.845'),(4,4,0,0,0,'2026-02-24 15:47:34.346','2026-02-24 15:47:34.346'),(5,5,0,0,0,'2026-02-24 15:48:04.557','2026-02-24 15:48:04.557');
/*!40000 ALTER TABLE `AppAccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Area`
--

DROP TABLE IF EXISTS `Area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Area` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `leaderId` int DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `status` enum('ENABLED','DISABLED') COLLATE utf8mb4_unicode_ci DEFAULT 'ENABLED',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Area_name_key` (`name`),
  KEY `Area_name_idx` (`name`),
  KEY `Area_leaderId_fkey` (`leaderId`),
  CONSTRAINT `Area_leaderId_fkey` FOREIGN KEY (`leaderId`) REFERENCES `User` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Area`
--

LOCK TABLES `Area` WRITE;
/*!40000 ALTER TABLE `Area` DISABLE KEYS */;
/*!40000 ALTER TABLE `Area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Audit`
--

DROP TABLE IF EXISTS `Audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Audit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('DRAFT','OPEN','UNDER_REVIEW','PENDING','COMPLETED','CLOSED','NOT_COMPLETED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'OPEN',
  `templateId` int DEFAULT NULL,
  `createdById` int DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `dueDate` datetime(3) DEFAULT NULL,
  `startDate` date NOT NULL,
  `repeatDate` int DEFAULT NULL,
  `repeatDay` enum('SUNDAY','MONDAY','TUESDAY','WEDNESDAY','THURSDAY','FRIDAY','SATURDAY') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `businessUnit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auditFrequency` enum('ONE_TIME','WEEKLY','MONTHLY','QUARTERLY','HALF_YEARLY','YEARLY') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ONE_TIME',
  `departmentId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Audit_status_idx` (`status`),
  KEY `Audit_createdAt_idx` (`createdAt`),
  KEY `Audit_templateId_fkey` (`templateId`),
  KEY `Audit_createdById_fkey` (`createdById`),
  KEY `Audit_departmentId_fkey` (`departmentId`),
  CONSTRAINT `Audit_createdById_fkey` FOREIGN KEY (`createdById`) REFERENCES `User` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Audit_departmentId_fkey` FOREIGN KEY (`departmentId`) REFERENCES `Department` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Audit_templateId_fkey` FOREIGN KEY (`templateId`) REFERENCES `AuditTemplate` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Audit`
--

LOCK TABLES `Audit` WRITE;
/*!40000 ALTER TABLE `Audit` DISABLE KEYS */;
INSERT INTO `Audit` VALUES (8,'Security Audit Title - Testing 1','Test description for Security Audit','OPEN',NULL,1,'2026-01-01 13:29:31.890','2026-01-10 00:00:00.000','2026-01-01',NULL,NULL,'5S Zone Audit','Interconnect','ONE_TIME',NULL),(9,'New Audit Creation Testing','New Audit Creation Testing Description','OPEN',NULL,3,'2026-01-02 11:17:59.648',NULL,'2026-01-05',NULL,'MONDAY','5S Zone Audit','Interconnect','WEEKLY',NULL);
/*!40000 ALTER TABLE `Audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuditAssignment`
--

DROP TABLE IF EXISTS `AuditAssignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AuditAssignment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `auditId` int NOT NULL,
  `userId` int DEFAULT NULL,
  `zoneId` int DEFAULT NULL,
  `userGroupId` int DEFAULT NULL,
  `rotationRunId` int DEFAULT NULL,
  `assignedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `status` enum('DRAFT','OPEN','UNDER_REVIEW','PENDING','COMPLETED','CLOSED','NOT_COMPLETED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `score` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `AuditAssignment_auditId_fkey` (`auditId`),
  KEY `AuditAssignment_rotationRunId_fkey` (`rotationRunId`),
  CONSTRAINT `AuditAssignment_auditId_fkey` FOREIGN KEY (`auditId`) REFERENCES `Audit` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `AuditAssignment_rotationRunId_fkey` FOREIGN KEY (`rotationRunId`) REFERENCES `RotationRun` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuditAssignment`
--

LOCK TABLES `AuditAssignment` WRITE;
/*!40000 ALTER TABLE `AuditAssignment` DISABLE KEYS */;
INSERT INTO `AuditAssignment` VALUES (2,8,2,51,NULL,NULL,'2026-01-02 11:13:50.761','PENDING',0),(5,9,3,56,NULL,NULL,'2026-01-02 11:18:31.165','PENDING',0),(8,8,1,52,NULL,NULL,'2026-01-19 14:56:59.989','PENDING',0),(9,8,3,53,NULL,NULL,'2026-01-19 14:56:59.994','PENDING',0),(10,9,2,54,NULL,NULL,'2026-01-30 21:33:07.823','COMPLETED',0),(11,9,1,55,NULL,NULL,'2026-01-30 21:33:07.832','PENDING',0);
/*!40000 ALTER TABLE `AuditAssignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuditAssignmentHistory`
--

DROP TABLE IF EXISTS `AuditAssignmentHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AuditAssignmentHistory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `auditId` int NOT NULL,
  `zoneId` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `userGroupId` int DEFAULT NULL,
  `rotationRunId` int DEFAULT NULL,
  `assignedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  KEY `AuditAssignmentHistory_auditId_fkey` (`auditId`),
  KEY `AuditAssignmentHistory_zoneId_fkey` (`zoneId`),
  KEY `AuditAssignmentHistory_userId_fkey` (`userId`),
  KEY `AuditAssignmentHistory_userGroupId_fkey` (`userGroupId`),
  KEY `AuditAssignmentHistory_rotationRunId_fkey` (`rotationRunId`),
  CONSTRAINT `AuditAssignmentHistory_auditId_fkey` FOREIGN KEY (`auditId`) REFERENCES `Audit` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `AuditAssignmentHistory_rotationRunId_fkey` FOREIGN KEY (`rotationRunId`) REFERENCES `RotationRun` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `AuditAssignmentHistory_userGroupId_fkey` FOREIGN KEY (`userGroupId`) REFERENCES `UserGroup` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `AuditAssignmentHistory_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `AuditAssignmentHistory_zoneId_fkey` FOREIGN KEY (`zoneId`) REFERENCES `Zone` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuditAssignmentHistory`
--

LOCK TABLES `AuditAssignmentHistory` WRITE;
/*!40000 ALTER TABLE `AuditAssignmentHistory` DISABLE KEYS */;
INSERT INTO `AuditAssignmentHistory` VALUES (1,9,NULL,3,NULL,NULL,'2026-01-19 18:35:43.727','2026-01-19 18:35:43.727'),(2,9,NULL,3,NULL,NULL,'2026-01-19 18:35:59.346','2026-01-19 18:35:59.346'),(3,9,NULL,3,NULL,NULL,'2026-01-19 18:38:06.974','2026-01-19 18:38:06.974'),(4,9,NULL,3,NULL,NULL,'2026-01-19 18:42:47.952','2026-01-19 18:42:47.952'),(5,9,NULL,3,NULL,NULL,'2026-01-19 18:44:15.068','2026-01-19 18:44:15.068'),(6,9,NULL,1,NULL,NULL,'2026-01-20 02:10:01.152','2026-01-20 02:10:01.152'),(7,9,NULL,1,NULL,NULL,'2026-01-20 02:14:03.459','2026-01-20 02:14:03.459'),(8,9,NULL,1,NULL,NULL,'2026-01-20 02:15:28.210','2026-01-20 02:15:28.210'),(9,9,NULL,1,NULL,NULL,'2026-01-20 02:17:56.588','2026-01-20 02:17:56.588'),(10,9,NULL,1,NULL,NULL,'2026-01-20 02:20:26.504','2026-01-20 02:20:26.504'),(11,9,NULL,1,NULL,NULL,'2026-01-20 02:24:38.208','2026-01-20 02:24:38.208'),(12,9,NULL,1,NULL,NULL,'2026-01-20 04:46:29.658','2026-01-20 04:46:29.658'),(13,9,NULL,1,NULL,NULL,'2026-01-20 09:51:43.177','2026-01-20 09:51:43.177'),(14,9,NULL,1,NULL,NULL,'2026-01-20 09:58:31.352','2026-01-20 09:58:31.352'),(15,9,NULL,3,NULL,NULL,'2026-01-20 10:00:03.048','2026-01-20 10:00:03.048');
/*!40000 ALTER TABLE `AuditAssignmentHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuditAttachment`
--

DROP TABLE IF EXISTS `AuditAttachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AuditAttachment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `auditId` int DEFAULT NULL,
  `responseId` int DEFAULT NULL,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  KEY `AuditAttachment_auditId_fkey` (`auditId`),
  KEY `AuditAttachment_responseId_fkey` (`responseId`),
  CONSTRAINT `AuditAttachment_auditId_fkey` FOREIGN KEY (`auditId`) REFERENCES `Audit` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `AuditAttachment_responseId_fkey` FOREIGN KEY (`responseId`) REFERENCES `AuditResponse` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuditAttachment`
--

LOCK TABLES `AuditAttachment` WRITE;
/*!40000 ALTER TABLE `AuditAttachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `AuditAttachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuditHistory`
--

DROP TABLE IF EXISTS `AuditHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AuditHistory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `auditId` int NOT NULL,
  `event` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` json DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `createdById` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `AuditHistory_auditId_fkey` (`auditId`),
  KEY `AuditHistory_createdById_fkey` (`createdById`),
  CONSTRAINT `AuditHistory_auditId_fkey` FOREIGN KEY (`auditId`) REFERENCES `Audit` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `AuditHistory_createdById_fkey` FOREIGN KEY (`createdById`) REFERENCES `User` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuditHistory`
--

LOCK TABLES `AuditHistory` WRITE;
/*!40000 ALTER TABLE `AuditHistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `AuditHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuditQuestion`
--

DROP TABLE IF EXISTS `AuditQuestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AuditQuestion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `questionType` enum('TEXT','MCQ','MULTI_ANSWER') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'TEXT',
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('ENABLED','DISABLED') COLLATE utf8mb4_unicode_ci DEFAULT 'ENABLED',
  `departmentId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `AuditQuestion_departmentId_fkey` (`departmentId`),
  CONSTRAINT `AuditQuestion_departmentId_fkey` FOREIGN KEY (`departmentId`) REFERENCES `Department` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuditQuestion`
--

LOCK TABLES `AuditQuestion` WRITE;
/*!40000 ALTER TABLE `AuditQuestion` DISABLE KEYS */;
INSERT INTO `AuditQuestion` VALUES (1,'Question 1 Text','Category 1','TEXT','2025-12-31 06:46:05.443','EN','ENABLED',NULL),(2,'Question 2 Text','Category 2','TEXT','2025-12-31 11:46:36.219','EN','ENABLED',NULL),(3,'New Question Addition Testing','Test Category','TEXT','2026-01-02 11:19:44.163','EN','ENABLED',NULL),(4,'Is the material kept as per 5S marking standards? Are there red tags for defective & name tags for used/unused material/ equipment?','1','TEXT','2026-01-15 14:13:44.584','EN','ENABLED',NULL),(5,'Are unidentified/unmarked material above tables/cupboards / racks or in storage area?','1','TEXT','2026-01-15 14:13:44.584','EN','ENABLED',NULL),(6,'Are walkways, emergency exits,fire extinguishers/ Gangways & panels free of clutter or obstruction?','1','TEXT','2026-01-15 14:13:44.584','EN','ENABLED',NULL),(7,'Are all the documents/calibration/PM in the zone up to date?','1','TEXT','2026-01-15 14:13:44.584','EN','ENABLED',NULL),(8,'Are finished or blocked parts like bins,tools, equipment, fixtures, trolleys, etc in the marked/ designated areas? (NO equipment/ tools/ fixtures to be on the floor/ unmarked area after use).','2','TEXT','2026-01-15 14:13:44.584','EN','ENABLED',NULL),(9,'Are all service lines & cables routed safely and organized to prevent hazards like leaks, damage, or tripping?','2','TEXT','2026-01-15 14:13:44.584','EN','ENABLED',NULL),(10,'Are the raw materials, semi-finished products and finished products in orderly and marked containers and on marked areas and on palletes?','2','TEXT','2026-01-15 14:13:44.584','EN','ENABLED',NULL),(11,'Do the shift supervisors/group leaders have an overview of the processing status of the daily orders?','2','TEXT','2026-01-15 14:13:44.584','EN','ENABLED',NULL),(12,'Are the materials in storage racks and cupboards systematically arranged and easy to reach out & with a list of material displayed on it? (Open the cupboards and check)','3','TEXT','2026-01-15 14:13:44.584','EN','ENABLED',NULL),(13,'i) Are all safety devices clearly visible and in proper condition? (e.g. emergency stop switch, fire alarm call point, fire extinguisher...) \r\nii)Are cleaning supplies have a designated place?','3','TEXT','2026-01-15 14:13:44.584','EN','ENABLED',NULL),(14,'Is the floor free of any contamination, dust, garbage (oil, water, chemicals, paper, etc.)? Is the floor cleaned in that particular shift?','3','TEXT','2026-01-15 14:13:44.584','EN','ENABLED',NULL),(15,'Are the tables, measuring equipment, machines and tools & fixtures clean and free of dust?','3','TEXT','2026-01-15 14:13:44.584','EN','ENABLED',NULL),(16,'Are standard format follwoed for all the labels across the work area?','4','TEXT','2026-01-15 14:13:44.584','EN','ENABLED',NULL),(17,'Have all employees been trained in the 5S method and is the method practiced by everyone?','4','TEXT','2026-01-15 14:13:44.584','EN','ENABLED',NULL),(18,'Is there a checklist or schedule for routine tasks like cleaning and organizing?','4','TEXT','2026-01-15 14:13:44.584','EN','ENABLED',NULL),(19,'Are the machine/fixtures/material)used in the zone have assigned asset ID?','4','TEXT','2026-01-15 14:13:44.584','EN','ENABLED',NULL),(20,'Are audit closures of previous audit sustained currently?','5','TEXT','2026-01-15 14:13:44.584','EN','ENABLED',NULL),(21,'Are there any deviations from last audit observed?(Check closure rate consistency)','5','TEXT','2026-01-15 14:13:44.584','EN','ENABLED',NULL),(22,'Are  SQD goals in this zone known by employees and is it discussed during daily meetings?','5','TEXT','2026-01-15 14:13:44.584','EN','ENABLED',NULL),(23,'Are small improvements visibly implemented and communicated to the team','5','TEXT','2026-01-15 14:13:44.584','EN','ENABLED',NULL),(24,'Test Question 3','Test Category','TEXT','2026-01-15 18:49:00.651','EN','ENABLED',NULL),(25,'Test Question New','New Category','TEXT','2026-01-30 19:51:01.749','EN','ENABLED',14),(26,'Want to answer the new question?','1','TEXT','2026-01-30 19:59:37.910','EN','ENABLED',1);
/*!40000 ALTER TABLE `AuditQuestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuditQuestionAssignment`
--

DROP TABLE IF EXISTS `AuditQuestionAssignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AuditQuestionAssignment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `auditId` int NOT NULL,
  `questionId` int NOT NULL,
  `zoneId` int DEFAULT NULL,
  `position` int DEFAULT NULL,
  `createdById` int DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  UNIQUE KEY `AuditQuestionAssignment_auditId_questionId_key` (`auditId`,`questionId`),
  KEY `AuditQuestionAssignment_auditId_idx` (`auditId`),
  KEY `AuditQuestionAssignment_questionId_fkey` (`questionId`),
  KEY `AuditQuestionAssignment_createdById_fkey` (`createdById`),
  CONSTRAINT `AuditQuestionAssignment_auditId_fkey` FOREIGN KEY (`auditId`) REFERENCES `Audit` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `AuditQuestionAssignment_createdById_fkey` FOREIGN KEY (`createdById`) REFERENCES `User` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `AuditQuestionAssignment_questionId_fkey` FOREIGN KEY (`questionId`) REFERENCES `AuditQuestion` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuditQuestionAssignment`
--

LOCK TABLES `AuditQuestionAssignment` WRITE;
/*!40000 ALTER TABLE `AuditQuestionAssignment` DISABLE KEYS */;
INSERT INTO `AuditQuestionAssignment` VALUES (16,8,1,NULL,0,NULL,'2026-01-01 19:43:42.301'),(18,8,2,NULL,1,1,'2026-01-02 06:58:24.901'),(32,9,19,54,0,3,'2026-01-30 19:14:53.211'),(33,9,20,54,1,3,'2026-01-30 19:14:53.236'),(34,9,21,54,2,3,'2026-01-30 19:14:53.244'),(35,9,3,55,0,3,'2026-01-30 19:14:53.249'),(36,9,23,55,1,3,'2026-01-30 19:14:53.257'),(37,9,24,56,0,3,'2026-01-30 19:14:53.267');
/*!40000 ALTER TABLE `AuditQuestionAssignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuditQuestionOptions`
--

DROP TABLE IF EXISTS `AuditQuestionOptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AuditQuestionOptions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `questionId` int NOT NULL,
  `text` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` double NOT NULL,
  `correct` tinyint(1) DEFAULT '0',
  `order` int DEFAULT '0',
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `AuditQuestionOptions_questionId_order_key` (`questionId`,`order`),
  KEY `AuditQuestionOptions_questionId_idx` (`questionId`),
  CONSTRAINT `AuditQuestionOptions_questionId_fkey` FOREIGN KEY (`questionId`) REFERENCES `AuditQuestion` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuditQuestionOptions`
--

LOCK TABLES `AuditQuestionOptions` WRITE;
/*!40000 ALTER TABLE `AuditQuestionOptions` DISABLE KEYS */;
INSERT INTO `AuditQuestionOptions` VALUES (13,2,'Option 1',0,0,0,'2026-01-01 19:42:01.096','2026-01-01 19:42:01.096'),(14,2,'Option 2',1,0,1,'2026-01-01 19:42:01.096','2026-01-01 19:42:01.096'),(15,1,'Option 1',0,0,0,'2026-01-01 19:42:16.169','2026-01-01 19:42:16.169'),(16,1,'Option 2',1,0,1,'2026-01-01 19:42:16.169','2026-01-01 19:42:16.169'),(17,3,'Option 1 ',2,0,0,'2026-01-02 11:19:44.163','2026-01-02 11:19:44.163'),(18,3,'Option 2',5,0,1,'2026-01-02 11:19:44.163','2026-01-02 11:19:44.163'),(19,4,'Followed',5,0,0,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(20,4,'Partially Followed',3,0,1,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(21,4,'Not followed',0,0,2,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(22,5,'Yes',5,0,0,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(23,5,'No',0,0,1,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(24,6,'Yes',5,0,0,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(25,6,'No',0,0,1,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(26,7,'Yes',5,0,0,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(27,7,'Maintained but w/o dates or rev',3,0,1,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(28,7,'No',0,0,2,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(29,8,'Yes',5,0,0,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(30,8,'No',0,0,1,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(31,9,'Yes',5,0,0,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(32,9,'No',0,0,1,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(33,10,'Yes',5,0,0,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(34,10,'No',0,0,1,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(35,11,'Yes',5,0,0,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(36,11,'Partly',3,0,1,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(37,11,'No',0,0,2,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(38,12,'Yes',5,0,0,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(39,12,'Systematically arranged but w/o list',3,0,1,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(40,12,'No',0,0,2,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(41,13,'Yes',5,0,0,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(42,13,'Only i) is maintained',3,0,1,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(43,13,'No',0,0,2,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(44,14,'Very Clean',5,0,0,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(45,14,'Some spots on the floor',3,0,1,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(46,14,'Dirty',0,0,2,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(47,15,'Yes',5,0,0,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(48,15,'No',0,0,1,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(49,16,'Yes',5,0,0,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(50,16,'No',0,0,1,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(51,17,'Fully practised',5,0,0,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(52,17,'Partially practised',3,0,1,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(53,17,'Not practised',0,0,2,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(54,18,'Yes',5,0,0,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(55,18,'No',0,0,1,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(56,19,'Assigned ID\'s available',5,0,0,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(57,19,'ID\'s unavailable for some items',3,0,1,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(58,19,'No assigned ID\'s',0,0,2,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(59,20,'Yes',5,0,0,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(60,20,'No',0,0,1,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(61,21,'No Deviation',5,0,0,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(62,21,'Minor',3,0,1,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(63,21,'Major',0,0,2,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(64,22,'Known and followed by all',5,0,0,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(65,22,'Known but not followed',3,0,1,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(66,22,'Not known',0,0,2,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(67,23,'Yes',5,0,0,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(68,23,'No',0,0,1,'2026-01-15 14:13:44.584','2026-01-15 14:13:44.584'),(69,24,'Option 1',0,0,0,'2026-01-15 18:49:00.651','2026-01-15 18:49:00.651'),(70,24,'Option 2',1,0,1,'2026-01-15 18:49:00.651','2026-01-15 18:49:00.651'),(71,25,'Option 1',0,0,0,'2026-01-30 19:51:01.749','2026-01-30 19:51:01.749'),(72,25,'Option 2',1,0,1,'2026-01-30 19:51:01.749','2026-01-30 19:51:01.749'),(73,26,'Followed',5,0,0,'2026-01-30 19:59:37.910','2026-01-30 19:59:37.910'),(74,26,'Partially Followed',3,0,1,'2026-01-30 19:59:37.910','2026-01-30 19:59:37.910'),(75,26,'Not followed',0,0,2,'2026-01-30 19:59:37.910','2026-01-30 19:59:37.910');
/*!40000 ALTER TABLE `AuditQuestionOptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuditResponse`
--

DROP TABLE IF EXISTS `AuditResponse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AuditResponse` (
  `id` int NOT NULL AUTO_INCREMENT,
  `auditId` int NOT NULL,
  `questionId` int NOT NULL,
  `answerText` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answerId` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `score` double DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `AuditResponse_auditId_questionId_key` (`auditId`,`questionId`),
  KEY `AuditResponse_questionId_fkey` (`questionId`),
  CONSTRAINT `AuditResponse_auditId_fkey` FOREIGN KEY (`auditId`) REFERENCES `Audit` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `AuditResponse_questionId_fkey` FOREIGN KEY (`questionId`) REFERENCES `AuditQuestion` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuditResponse`
--

LOCK TABLES `AuditResponse` WRITE;
/*!40000 ALTER TABLE `AuditResponse` DISABLE KEYS */;
INSERT INTO `AuditResponse` VALUES (7,9,22,'41',NULL,NULL,'2026-01-20 13:17:11.643','2026-01-20 13:17:11.643'),(8,9,23,'19',NULL,NULL,'2026-01-20 13:17:11.743','2026-01-20 13:17:11.743'),(9,9,24,'22',NULL,NULL,'2026-01-20 13:17:11.778','2026-01-20 13:17:11.778');
/*!40000 ALTER TABLE `AuditResponse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuditResponseOption`
--

DROP TABLE IF EXISTS `AuditResponseOption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AuditResponseOption` (
  `id` int NOT NULL AUTO_INCREMENT,
  `responseId` int NOT NULL,
  `optionId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AuditResponseOption_responseId_fkey` (`responseId`),
  KEY `AuditResponseOption_optionId_fkey` (`optionId`),
  CONSTRAINT `AuditResponseOption_optionId_fkey` FOREIGN KEY (`optionId`) REFERENCES `AuditQuestionOptions` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `AuditResponseOption_responseId_fkey` FOREIGN KEY (`responseId`) REFERENCES `AuditResponse` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuditResponseOption`
--

LOCK TABLES `AuditResponseOption` WRITE;
/*!40000 ALTER TABLE `AuditResponseOption` DISABLE KEYS */;
/*!40000 ALTER TABLE `AuditResponseOption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuditScore`
--

DROP TABLE IF EXISTS `AuditScore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AuditScore` (
  `id` int NOT NULL AUTO_INCREMENT,
  `auditId` int NOT NULL,
  `score` double NOT NULL,
  `total` double NOT NULL,
  `calculatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  UNIQUE KEY `AuditScore_auditId_key` (`auditId`),
  CONSTRAINT `AuditScore_auditId_fkey` FOREIGN KEY (`auditId`) REFERENCES `Audit` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuditScore`
--

LOCK TABLES `AuditScore` WRITE;
/*!40000 ALTER TABLE `AuditScore` DISABLE KEYS */;
INSERT INTO `AuditScore` VALUES (1,9,0,26,'2026-01-31 04:01:39.832');
/*!40000 ALTER TABLE `AuditScore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuditTemplate`
--

DROP TABLE IF EXISTS `AuditTemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AuditTemplate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdById` int DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  KEY `AuditTemplate_createdById_fkey` (`createdById`),
  CONSTRAINT `AuditTemplate_createdById_fkey` FOREIGN KEY (`createdById`) REFERENCES `User` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuditTemplate`
--

LOCK TABLES `AuditTemplate` WRITE;
/*!40000 ALTER TABLE `AuditTemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `AuditTemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuditTemplateQuestion`
--

DROP TABLE IF EXISTS `AuditTemplateQuestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AuditTemplateQuestion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `templateId` int NOT NULL,
  `questionId` int NOT NULL,
  `position` int NOT NULL DEFAULT '0',
  `weight` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `AuditTemplateQuestion_templateId_questionId_key` (`templateId`,`questionId`),
  KEY `AuditTemplateQuestion_questionId_fkey` (`questionId`),
  CONSTRAINT `AuditTemplateQuestion_questionId_fkey` FOREIGN KEY (`questionId`) REFERENCES `AuditQuestion` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `AuditTemplateQuestion_templateId_fkey` FOREIGN KEY (`templateId`) REFERENCES `AuditTemplate` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuditTemplateQuestion`
--

LOCK TABLES `AuditTemplateQuestion` WRITE;
/*!40000 ALTER TABLE `AuditTemplateQuestion` DISABLE KEYS */;
/*!40000 ALTER TABLE `AuditTemplateQuestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BusinessUnit`
--

DROP TABLE IF EXISTS `BusinessUnit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BusinessUnit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `status` enum('ENABLED','DISABLED') COLLATE utf8mb4_unicode_ci DEFAULT 'ENABLED',
  PRIMARY KEY (`id`),
  UNIQUE KEY `BusinessUnit_name_key` (`name`),
  KEY `BusinessUnit_name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BusinessUnit`
--

LOCK TABLES `BusinessUnit` WRITE;
/*!40000 ALTER TABLE `BusinessUnit` DISABLE KEYS */;
INSERT INTO `BusinessUnit` VALUES (1,'Interconnect','','2026-01-29 19:38:28.562','ENABLED'),(2,'Automobile','','2026-01-29 19:41:49.629','ENABLED');
/*!40000 ALTER TABLE `BusinessUnit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Department` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deptHeadId` int DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `status` enum('ENABLED','DISABLED') COLLATE utf8mb4_unicode_ci DEFAULT 'ENABLED',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Department_name_key` (`name`),
  KEY `Department_name_idx` (`name`),
  KEY `Department_deptHeadId_fkey` (`deptHeadId`),
  CONSTRAINT `Department_deptHeadId_fkey` FOREIGN KEY (`deptHeadId`) REFERENCES `User` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
INSERT INTO `Department` VALUES (1,'Production','Verna',NULL,'2026-01-25 22:04:41.954','ENABLED'),(2,'Planning','Verna',NULL,'2026-01-26 16:54:34.972','ENABLED'),(3,'Process','Verna',NULL,'2026-01-26 16:55:58.008','ENABLED'),(4,'Quality','Verna',NULL,'2026-01-26 16:55:58.016','ENABLED'),(5,'Admin','Verna',NULL,'2026-01-26 16:55:58.022','ENABLED'),(6,'Store','Verna',NULL,'2026-01-26 16:55:58.024','ENABLED'),(7,'Purchase','Verna',NULL,'2026-01-26 16:55:58.025','ENABLED'),(8,'Sales','Verna',NULL,'2026-01-26 16:55:58.027','ENABLED'),(9,'Maintenance','Verna',NULL,'2026-01-26 16:55:58.028','ENABLED'),(10,'Incoming Quality','Verna',NULL,'2026-01-26 16:55:58.030','ENABLED'),(11,'Supplier Quality','Verna',NULL,'2026-01-26 16:55:58.030','ENABLED'),(12,'Sourcing','Verna',NULL,'2026-01-26 16:55:58.031','ENABLED'),(13,'IT','Verna',NULL,'2026-01-26 16:55:58.033','ENABLED'),(14,'New Department',NULL,NULL,'2026-01-30 19:51:01.749','ENABLED');
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PasswordReset`
--

DROP TABLE IF EXISTS `PasswordReset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PasswordReset` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tokenHash` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` int NOT NULL,
  `expiresAt` datetime(3) NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `usedAt` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `PasswordReset_tokenHash_key` (`tokenHash`),
  KEY `PasswordReset_userId_idx` (`userId`),
  KEY `PasswordReset_expiresAt_idx` (`expiresAt`),
  CONSTRAINT `PasswordReset_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PasswordReset`
--

LOCK TABLES `PasswordReset` WRITE;
/*!40000 ALTER TABLE `PasswordReset` DISABLE KEYS */;
INSERT INTO `PasswordReset` VALUES (1,'d0aed7cf19aa7e73b64e9d7e60e6bd1722162b0a989279c121f63528d83126bc',1,'2026-02-23 12:21:27.207',1,'2026-02-23 11:21:27.208','2026-02-23 11:27:29.080'),(2,'bbabbce92c2fc2ac9b003bbb22f5ab327d358fe8e04cf63fd049698f2c993610',1,'2026-02-23 12:27:29.098',1,'2026-02-23 11:27:29.099','2026-02-23 12:25:55.938'),(3,'563fa37f902753b25c5fb2d6f30fd9ba5cfcf546951df04cb49220a6e8348b6e',1,'2026-02-23 13:25:55.951',1,'2026-02-23 12:25:55.952','2026-02-23 15:49:20.710'),(4,'da5cf133b9d9a56dd3d572ab1cc53ad937d2ac5645f2ca36780cf8182eefb050',1,'2026-02-23 16:49:20.725',1,'2026-02-23 15:49:20.726','2026-02-23 15:53:02.230'),(5,'d763e6ebff3cc80a560d708f38112dc0e98539651755fba48ff47d3b033e670f',1,'2026-02-24 16:04:59.055',0,'2026-02-24 15:04:59.056',NULL);
/*!40000 ALTER TABLE `PasswordReset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reminder`
--

DROP TABLE IF EXISTS `Reminder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reminder` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assignmentId` int DEFAULT NULL,
  `auditId` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `providerId` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'QUEUED',
  `attempts` int NOT NULL DEFAULT '0',
  `lastAttemptAt` datetime(3) DEFAULT NULL,
  `scheduledAt` datetime(3) DEFAULT NULL,
  `payload` json DEFAULT NULL,
  `providerResponse` json DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Reminder_assignmentId_idx` (`assignmentId`),
  KEY `Reminder_auditId_idx` (`auditId`),
  KEY `Reminder_userId_idx` (`userId`),
  KEY `Reminder_status_scheduledAt_idx` (`status`,`scheduledAt`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reminder`
--

LOCK TABLES `Reminder` WRITE;
/*!40000 ALTER TABLE `Reminder` DISABLE KEYS */;
INSERT INTO `Reminder` VALUES (1,6,9,1,'<578e7566-f9eb-92ab-1661-ba8244aeeb4e@gmail.com>','SENT',1,'2026-01-20 02:10:01.143','2026-01-20 02:09:57.463','{\"userId\": 1, \"auditId\": 9, \"subject\": \"Reminder: New Audit Creation Testing\", \"assignmentId\": 6}','{\"ehlo\": [\"SIZE 35882577\", \"8BITMIME\", \"AUTH LOGIN PLAIN XOAUTH2 PLAIN-CLIENTTOKEN OAUTHBEARER XOAUTH\", \"ENHANCEDSTATUSCODES\", \"PIPELINING\", \"CHUNKING\", \"SMTPUTF8\"], \"accepted\": [\"zomatocashback26+1@gmail.com\"], \"envelope\": {\"to\": [\"zomatocashback26+1@gmail.com\"], \"from\": \"zomatocashback26@gmail.com\"}, \"rejected\": [], \"response\": \"250 2.0.0 OK  1768875001 d2e1a72fcca58-81fa12913cesm10275683b3a.48 - gsmtp\", \"messageId\": \"<578e7566-f9eb-92ab-1661-ba8244aeeb4e@gmail.com>\", \"messageSize\": 972, \"messageTime\": 811, \"envelopeTime\": 935}','2026-01-20 02:09:57.465','2026-01-20 02:10:01.145'),(2,6,9,1,'<3c0fda7c-596d-f1a6-06b0-0d8372b30671@gmail.com>','SENT',1,'2026-01-20 02:14:03.451','2026-01-20 02:14:00.100','{\"userId\": 1, \"auditId\": 9, \"subject\": \"Reminder: New Audit Creation Testing\", \"assignmentId\": 6}','{\"ehlo\": [\"SIZE 35882577\", \"8BITMIME\", \"AUTH LOGIN PLAIN XOAUTH2 PLAIN-CLIENTTOKEN OAUTHBEARER XOAUTH\", \"ENHANCEDSTATUSCODES\", \"PIPELINING\", \"CHUNKING\", \"SMTPUTF8\"], \"accepted\": [\"zomatocashback26+1@gmail.com\"], \"envelope\": {\"to\": [\"zomatocashback26+1@gmail.com\"], \"from\": \"zomatocashback26@gmail.com\"}, \"rejected\": [], \"response\": \"250 2.0.0 OK  1768875243 d2e1a72fcca58-81fa12784c3sm10331419b3a.36 - gsmtp\", \"messageId\": \"<3c0fda7c-596d-f1a6-06b0-0d8372b30671@gmail.com>\", \"messageSize\": 972, \"messageTime\": 745, \"envelopeTime\": 825}','2026-01-20 02:14:00.101','2026-01-20 02:14:03.452'),(3,6,9,1,'<a288dd3d-3df7-9970-c2ee-4fee63c91e89@gmail.com>','SENT',1,'2026-01-20 02:15:28.203','2026-01-20 02:15:25.243','{\"userId\": 1, \"auditId\": 9, \"subject\": \"Reminder: New Audit Creation Testing\", \"assignmentId\": 6}','{\"ehlo\": [\"SIZE 35882577\", \"8BITMIME\", \"AUTH LOGIN PLAIN XOAUTH2 PLAIN-CLIENTTOKEN OAUTHBEARER XOAUTH\", \"ENHANCEDSTATUSCODES\", \"PIPELINING\", \"CHUNKING\", \"SMTPUTF8\"], \"accepted\": [\"zomatocashback26+1@gmail.com\"], \"envelope\": {\"to\": [\"zomatocashback26+1@gmail.com\"], \"from\": \"zomatocashback26@gmail.com\"}, \"rejected\": [], \"response\": \"250 2.0.0 OK  1768875328 d9443c01a7336-2a7193fb998sm107640015ad.69 - gsmtp\", \"messageId\": \"<a288dd3d-3df7-9970-c2ee-4fee63c91e89@gmail.com>\", \"messageSize\": 972, \"messageTime\": 819, \"envelopeTime\": 934}','2026-01-20 02:15:25.244','2026-01-20 02:15:28.204'),(4,6,9,1,'<9f766712-10d6-96fa-9d9a-a6c290cca14f@gmail.com>','SENT',1,'2026-01-20 02:17:56.581','2026-01-20 02:17:52.989','{\"userId\": 1, \"auditId\": 9, \"subject\": \"Reminder: New Audit Creation Testing\", \"assignmentId\": 6}','{\"ehlo\": [\"SIZE 35882577\", \"8BITMIME\", \"AUTH LOGIN PLAIN XOAUTH2 PLAIN-CLIENTTOKEN OAUTHBEARER XOAUTH\", \"ENHANCEDSTATUSCODES\", \"PIPELINING\", \"CHUNKING\", \"SMTPUTF8\"], \"accepted\": [\"zomatocashback26+1@gmail.com\"], \"envelope\": {\"to\": [\"zomatocashback26+1@gmail.com\"], \"from\": \"zomatocashback26@gmail.com\"}, \"rejected\": [], \"response\": \"250 2.0.0 OK  1768875476 98e67ed59e1d1-3527304c5d3sm10354309a91.3 - gsmtp\", \"messageId\": \"<9f766712-10d6-96fa-9d9a-a6c290cca14f@gmail.com>\", \"messageSize\": 972, \"messageTime\": 881, \"envelopeTime\": 860}','2026-01-20 02:17:52.990','2026-01-20 02:17:56.582'),(5,6,9,1,'<f8d3e003-2c39-4057-2298-19841f86e2ad@gmail.com>','SENT',1,'2026-01-20 02:20:26.497','2026-01-20 02:20:23.518','{\"userId\": 1, \"auditId\": 9, \"subject\": \"Reminder: New Audit Creation Testing\", \"assignmentId\": 6}','{\"ehlo\": [\"SIZE 35882577\", \"8BITMIME\", \"AUTH LOGIN PLAIN XOAUTH2 PLAIN-CLIENTTOKEN OAUTHBEARER XOAUTH\", \"ENHANCEDSTATUSCODES\", \"PIPELINING\", \"CHUNKING\", \"SMTPUTF8\"], \"accepted\": [\"zomatocashback26+1@gmail.com\"], \"envelope\": {\"to\": [\"zomatocashback26+1@gmail.com\"], \"from\": \"zomatocashback26@gmail.com\"}, \"rejected\": [], \"response\": \"250 2.0.0 OK  1768875626 d2e1a72fcca58-81fa108c23esm10438472b3a.8 - gsmtp\", \"messageId\": \"<f8d3e003-2c39-4057-2298-19841f86e2ad@gmail.com>\", \"messageSize\": 972, \"messageTime\": 819, \"envelopeTime\": 920}','2026-01-20 02:20:23.519','2026-01-20 02:20:26.498'),(6,6,9,1,'<0c4eee0a-c73e-ac26-7b46-32c55f531759@gmail.com>','SENT',1,'2026-01-20 02:24:38.199','2026-01-20 02:24:35.236','{\"userId\": 1, \"auditId\": 9, \"subject\": \"Rosenberger Nexus - Audit Assessment Reminder\", \"assignmentId\": 6}','{\"ehlo\": [\"SIZE 35882577\", \"8BITMIME\", \"AUTH LOGIN PLAIN XOAUTH2 PLAIN-CLIENTTOKEN OAUTHBEARER XOAUTH\", \"ENHANCEDSTATUSCODES\", \"PIPELINING\", \"CHUNKING\", \"SMTPUTF8\"], \"accepted\": [\"zomatocashback26+1@gmail.com\"], \"envelope\": {\"to\": [\"zomatocashback26+1@gmail.com\"], \"from\": \"zomatocashback26@gmail.com\"}, \"rejected\": [], \"response\": \"250 2.0.0 OK  1768875878 d9443c01a7336-2a7193fc8d9sm105828365ad.79 - gsmtp\", \"messageId\": \"<0c4eee0a-c73e-ac26-7b46-32c55f531759@gmail.com>\", \"messageSize\": 2136, \"messageTime\": 717, \"envelopeTime\": 1096}','2026-01-20 02:24:35.237','2026-01-20 02:24:38.200'),(7,6,9,1,'<f4b56c47-88f7-622d-2e71-f985543c930e@gmail.com>','SENT',1,'2026-01-20 04:46:29.651','2026-01-20 04:46:26.515','{\"userId\": 1, \"auditId\": 9, \"subject\": \"Rosenberger Nexus - Audit Assessment Reminder\", \"assignmentId\": 6}','{\"ehlo\": [\"SIZE 35882577\", \"8BITMIME\", \"AUTH LOGIN PLAIN XOAUTH2 PLAIN-CLIENTTOKEN OAUTHBEARER XOAUTH\", \"ENHANCEDSTATUSCODES\", \"PIPELINING\", \"CHUNKING\", \"SMTPUTF8\"], \"accepted\": [\"zomatocashback26+1@gmail.com\"], \"envelope\": {\"to\": [\"zomatocashback26+1@gmail.com\"], \"from\": \"zomatocashback26@gmail.com\"}, \"rejected\": [], \"response\": \"250 2.0.0 OK  1768884389 d2e1a72fcca58-81fa1291d29sm10576527b3a.53 - gsmtp\", \"messageId\": \"<f4b56c47-88f7-622d-2e71-f985543c930e@gmail.com>\", \"messageSize\": 2136, \"messageTime\": 684, \"envelopeTime\": 1088}','2026-01-20 04:46:26.516','2026-01-20 04:46:29.652'),(8,6,9,1,'<ae0b478a-05a8-1f35-d050-8a422d922640@gmail.com>','SENT',1,'2026-01-20 09:51:43.112','2026-01-20 09:51:39.155','{\"userId\": 1, \"auditId\": 9, \"subject\": \"Rosenberger Nexus - Audit Assessment Reminder\", \"assignmentId\": 6}','{\"ehlo\": [\"SIZE 35882577\", \"8BITMIME\", \"AUTH LOGIN PLAIN XOAUTH2 PLAIN-CLIENTTOKEN OAUTHBEARER XOAUTH\", \"ENHANCEDSTATUSCODES\", \"PIPELINING\", \"CHUNKING\", \"SMTPUTF8\"], \"accepted\": [\"zomatocashback26+1@gmail.com\"], \"envelope\": {\"to\": [\"zomatocashback26+1@gmail.com\"], \"from\": \"zomatocashback26@gmail.com\"}, \"rejected\": [], \"response\": \"250 2.0.0 OK  1768902702 98e67ed59e1d1-352677ec7dasm14230414a91.8 - gsmtp\", \"messageId\": \"<ae0b478a-05a8-1f35-d050-8a422d922640@gmail.com>\", \"messageSize\": 2181, \"messageTime\": 821, \"envelopeTime\": 1020}','2026-01-20 09:51:39.155','2026-01-20 09:51:43.113'),(9,6,9,1,'<cbef69d1-7755-2cb9-ced9-5577e7274225@gmail.com>','SENT',1,'2026-01-20 09:58:31.343','2026-01-20 09:58:27.811','{\"userId\": 1, \"auditId\": 9, \"subject\": \"Rosenberger Nexus - Audit Assessment Reminder\", \"assignmentId\": 6}','{\"ehlo\": [\"SIZE 35882577\", \"8BITMIME\", \"AUTH LOGIN PLAIN XOAUTH2 PLAIN-CLIENTTOKEN OAUTHBEARER XOAUTH\", \"ENHANCEDSTATUSCODES\", \"PIPELINING\", \"CHUNKING\", \"SMTPUTF8\"], \"accepted\": [\"zomatocashback26+1@gmail.com\"], \"envelope\": {\"to\": [\"zomatocashback26+1@gmail.com\"], \"from\": \"zomatocashback26@gmail.com\"}, \"rejected\": [], \"response\": \"250 2.0.0 OK  1768903111 d9443c01a7336-2a7190ca9d6sm109156335ad.25 - gsmtp\", \"messageId\": \"<cbef69d1-7755-2cb9-ced9-5577e7274225@gmail.com>\", \"messageSize\": 3165, \"messageTime\": 778, \"envelopeTime\": 920}','2026-01-20 09:58:27.812','2026-01-20 09:58:31.345'),(10,5,9,3,'<ee02c32a-6ef2-a596-011d-1fe28b000b8b@gmail.com>','SENT',1,'2026-01-20 10:00:03.034','2026-01-20 10:00:00.090','{\"userId\": 3, \"auditId\": 9, \"subject\": \"Rosenberger Nexus - Audit Assessment Reminder\", \"assignmentId\": 5}','{\"ehlo\": [\"SIZE 35882577\", \"8BITMIME\", \"AUTH LOGIN PLAIN XOAUTH2 PLAIN-CLIENTTOKEN OAUTHBEARER XOAUTH\", \"ENHANCEDSTATUSCODES\", \"PIPELINING\", \"CHUNKING\", \"SMTPUTF8\"], \"accepted\": [\"admin@rosenberger.com\"], \"envelope\": {\"to\": [\"admin@rosenberger.com\"], \"from\": \"zomatocashback26@gmail.com\"}, \"rejected\": [], \"response\": \"250 2.0.0 OK  1768903202 d9443c01a7336-2a71941c56bsm120251275ad.92 - gsmtp\", \"messageId\": \"<ee02c32a-6ef2-a596-011d-1fe28b000b8b@gmail.com>\", \"messageSize\": 3196, \"messageTime\": 743, \"envelopeTime\": 893}','2026-01-20 10:00:00.092','2026-01-20 10:00:03.035');
/*!40000 ALTER TABLE `Reminder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RotationRun`
--

DROP TABLE IF EXISTS `RotationRun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RotationRun` (
  `id` int NOT NULL AUTO_INCREMENT,
  `auditId` int NOT NULL,
  `initiatedById` int DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  KEY `RotationRun_auditId_fkey` (`auditId`),
  KEY `RotationRun_initiatedById_fkey` (`initiatedById`),
  CONSTRAINT `RotationRun_auditId_fkey` FOREIGN KEY (`auditId`) REFERENCES `Audit` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `RotationRun_initiatedById_fkey` FOREIGN KEY (`initiatedById`) REFERENCES `User` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RotationRun`
--

LOCK TABLES `RotationRun` WRITE;
/*!40000 ALTER TABLE `RotationRun` DISABLE KEYS */;
/*!40000 ALTER TABLE `RotationRun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Schedule`
--

DROP TABLE IF EXISTS `Schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Schedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recurrence` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timezone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `templateId` int DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `nextRunAt` datetime(3) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  KEY `Schedule_templateId_fkey` (`templateId`),
  CONSTRAINT `Schedule_templateId_fkey` FOREIGN KEY (`templateId`) REFERENCES `AuditTemplate` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Schedule`
--

LOCK TABLES `Schedule` WRITE;
/*!40000 ALTER TABLE `Schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `Schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ScheduledJob`
--

DROP TABLE IF EXISTS `ScheduledJob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ScheduledJob` (
  `id` int NOT NULL AUTO_INCREMENT,
  `scheduleId` int NOT NULL,
  `runAt` datetime(3) NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'queued',
  `result` json DEFAULT NULL,
  `attempts` int NOT NULL DEFAULT '0',
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  KEY `ScheduledJob_scheduleId_fkey` (`scheduleId`),
  CONSTRAINT `ScheduledJob_scheduleId_fkey` FOREIGN KEY (`scheduleId`) REFERENCES `Schedule` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ScheduledJob`
--

LOCK TABLES `ScheduledJob` WRITE;
/*!40000 ALTER TABLE `ScheduledJob` DISABLE KEYS */;
/*!40000 ALTER TABLE `ScheduledJob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `passwordHash` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `role` enum('USER','ADMIN','SUPER_ADMIN') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USER',
  PRIMARY KEY (`id`),
  UNIQUE KEY `User_email_key` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'seichoapplication@gmail.com','$2b$10$F0lFFKQ6aBrMaSLAZ94zKuJJlIcDO0Uy57H/p4rT/9DmSgbvvuuS.','Admin User','2025-12-30 07:26:59.087','ADMIN'),(2,'user@rosenberger.com','$2b$10$mGQKJj03XSkJs9JjdbhASerbuNfY0jg7NLzRvT1JfLB7jmPY1u1xC','Normal User','2026-01-02 10:46:57.880','USER'),(3,'admin@rosenberger.com','$2b$10$mGQKJj03XSkJs9JjdbhASerbuNfY0jg7NLzRvT1JfLB7jmPY1u1xC','Super Admin User','2026-01-02 10:48:08.915','ADMIN'),(4,'aman.kholker@rosenberger.in','$2b$10$fRs./HUwcOamIoGAvjL1AeNXGBTwSE/Qo/MaI0ygSVAbkycrXBRmy','Aman Kholker','2026-02-24 15:47:34.294','ADMIN'),(5,'pravit.naik@rosenberger.in','$2b$10$RK4hav1KkGO1i.wWrc6.Ke3m8UnV1F490EpBok88VcN1P53Ty2MGW','Pravit Naik','2026-02-24 15:48:04.551','USER');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserGroup`
--

DROP TABLE IF EXISTS `UserGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UserGroup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  UNIQUE KEY `UserGroup_name_key` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserGroup`
--

LOCK TABLES `UserGroup` WRITE;
/*!40000 ALTER TABLE `UserGroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `UserGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserGroupMember`
--

DROP TABLE IF EXISTS `UserGroupMember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UserGroupMember` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `groupId` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UserGroupMember_userId_groupId_key` (`userId`,`groupId`),
  KEY `UserGroupMember_groupId_idx` (`groupId`),
  CONSTRAINT `UserGroupMember_groupId_fkey` FOREIGN KEY (`groupId`) REFERENCES `UserGroup` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `UserGroupMember_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserGroupMember`
--

LOCK TABLES `UserGroupMember` WRITE;
/*!40000 ALTER TABLE `UserGroupMember` DISABLE KEYS */;
/*!40000 ALTER TABLE `UserGroupMember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Zone`
--

DROP TABLE IF EXISTS `Zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Zone` (
  `id` int NOT NULL AUTO_INCREMENT,
  `auditId` int DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `originalUserGroupId` int DEFAULT NULL,
  `areaId` int DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `leaderId` int DEFAULT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ENABLED','DISABLED') COLLATE utf8mb4_unicode_ci DEFAULT 'ENABLED',
  PRIMARY KEY (`id`),
  KEY `Zone_auditId_idx` (`auditId`),
  KEY `Zone_originalUserGroupId_fkey` (`originalUserGroupId`),
  KEY `Zone_areaId_idx` (`areaId`),
  KEY `Zone_leaderId_fkey` (`leaderId`),
  CONSTRAINT `Zone_areaId_fkey` FOREIGN KEY (`areaId`) REFERENCES `Area` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Zone_auditId_fkey` FOREIGN KEY (`auditId`) REFERENCES `Audit` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Zone_leaderId_fkey` FOREIGN KEY (`leaderId`) REFERENCES `User` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Zone_originalUserGroupId_fkey` FOREIGN KEY (`originalUserGroupId`) REFERENCES `UserGroup` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Zone`
--

LOCK TABLES `Zone` WRITE;
/*!40000 ALTER TABLE `Zone` DISABLE KEYS */;
INSERT INTO `Zone` VALUES (51,8,'Zone 1','2026-01-01 19:43:42.283',NULL,NULL,'',NULL,'','ENABLED'),(52,8,'Zone 2','2026-01-02 06:56:29.569',NULL,NULL,'',NULL,'','ENABLED'),(53,8,'Zone 3','2026-01-02 11:16:44.615',NULL,NULL,'',NULL,'','ENABLED'),(54,9,'Zone 4','2026-01-02 11:18:16.033',NULL,NULL,'',NULL,'','ENABLED'),(55,9,'Zone 5','2026-01-02 11:18:16.055',NULL,NULL,'',NULL,'','ENABLED'),(56,9,'Zone 6','2026-01-02 11:18:16.058',NULL,NULL,'',NULL,'','ENABLED');
/*!40000 ALTER TABLE `Zone` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-25 15:50:33
