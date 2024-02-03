-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: ec2-43-204-56-154.ap-south-1.compute.amazonaws.com    Database: dbname
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

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
-- Table structure for table `eDashimages`
--

DROP TABLE IF EXISTS `eDashimages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eDashimages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` varchar(1000) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `createdOn` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedOn` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleteFlag` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eDashimages`
--

LOCK TABLES `eDashimages` WRITE;
/*!40000 ALTER TABLE `eDashimages` DISABLE KEYS */;
INSERT INTO `eDashimages` VALUES (1,'1.jpg','Electronics','2023-12-31 05:04:24',NULL,0),(2,'2.jpg','Food','2023-12-31 05:04:35',NULL,0),(3,'3.jpg','Home Appliances','2023-12-31 05:04:53',NULL,0);
/*!40000 ALTER TABLE `eDashimages` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-03 10:35:53
