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
-- Table structure for table `eOrderdetails`
--

DROP TABLE IF EXISTS `eOrderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eOrderdetails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderId` int DEFAULT NULL,
  `productName` varchar(100) DEFAULT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `productId` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `sizeVarient` text,
  `colorVarient` text,
  `createdOn` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` int DEFAULT NULL,
  `updatedOn` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedBy` int DEFAULT NULL,
  `deleteFlag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eOrderdetails`
--

LOCK TABLES `eOrderdetails` WRITE;
/*!40000 ALTER TABLE `eOrderdetails` DISABLE KEYS */;
INSERT INTO `eOrderdetails` VALUES (1,2,'Pattu Frog','91fvA-kh7NL._SY879_.jpg;91J7nLKNjbL._SX679_.jpg',12,3,'2000.00','M','#FFdcba','2024-02-01 09:10:21',NULL,'2024-02-01 09:10:21',NULL,0),(2,3,'Sony laptop','Electronics.png',6,4,'500.00','','','2024-02-01 09:32:27',NULL,'2024-02-01 09:32:27',NULL,0),(3,3,'Pattu Frog','91fvA-kh7NL._SY879_.jpg;91J7nLKNjbL._SX679_.jpg',12,2,'2000.00','XXXL','#51FF00','2024-02-01 09:32:27',NULL,'2024-02-01 09:32:27',NULL,0),(4,4,'Apple laptop','under-construction.webp',4,1,'500.00','','','2024-02-01 10:25:23',NULL,'2024-02-01 10:25:23',NULL,0),(5,5,'Apple laptop','under-construction.webp',4,1,'500.00','','','2024-02-01 10:48:07',NULL,'2024-02-01 10:48:07',NULL,0);
/*!40000 ALTER TABLE `eOrderdetails` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-03 10:35:58
