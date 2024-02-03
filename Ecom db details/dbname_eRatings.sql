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
-- Table structure for table `eRatings`
--

DROP TABLE IF EXISTS `eRatings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eRatings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ratings` decimal(10,1) NOT NULL,
  `productId` bigint NOT NULL,
  `image` text,
  `comments` text,
  `createdOn` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` int DEFAULT NULL,
  `updatedOn` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedBy` int DEFAULT NULL,
  `deleteFlag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eRatings`
--

LOCK TABLES `eRatings` WRITE;
/*!40000 ALTER TABLE `eRatings` DISABLE KEYS */;
INSERT INTO `eRatings` VALUES (1,5.0,8,'ecommerce-platform-data-1.webp','Very Good Product','2024-02-01 12:00:38',1,'2024-02-01 12:00:38',NULL,0),(2,5.0,1,'ecommerce-platform-data-1.webp','Very Good Product','2024-02-01 12:02:39',10007,'2024-02-01 12:02:39',NULL,0),(3,2.0,8,'ecommerce-platform-data-1.webp','Very Good Product','2024-02-01 12:45:30',10007,'2024-02-01 12:45:30',NULL,0),(4,5.0,1,'ecommerce-platform-data-1.webp','Very Good Product','2024-02-01 12:47:22',10007,'2024-02-01 12:47:22',NULL,0),(5,3.0,2,'ecommerce-platform-data-1.webp','Very Good Product','2024-02-01 12:47:29',10007,'2024-02-01 12:47:29',NULL,0),(6,4.0,3,'ecommerce-platform-data-1.webp','Very Good Product','2024-02-01 12:47:35',10007,'2024-02-01 12:47:35',NULL,0),(7,5.0,4,'ecommerce-platform-data-1.webp','Very Good Product','2024-02-01 12:47:41',10007,'2024-02-01 12:47:41',NULL,0),(8,4.0,6,'ecommerce-platform-data-1.webp','Very Good Product','2024-02-01 12:50:09',10007,'2024-02-01 12:50:09',NULL,0),(9,4.0,8,'ecommerce-platform-data-1.webp','Very Good Product','2024-02-01 12:50:13',10007,'2024-02-01 12:50:13',NULL,0),(10,3.0,10,'ecommerce-platform-data-1.webp','Very Good Product','2024-02-01 12:50:19',10007,'2024-02-01 12:50:19',NULL,0),(11,4.0,5,'image_picker_5DA81438-B4A5-4B0D-9AAF-2D95354AD2F6-11691-000000312C5D4A50.jpg;image_picker_9AAFC192-0AD9-4C6E-A25A-83822D6C8522-11691-00000031329FF243.jpg','Hi','2024-02-01 17:33:40',10007,'2024-02-01 17:33:40',NULL,0),(12,2.0,4,'image_picker_2D00FAE1-9943-4040-A659-D50E4E78E1F7-11691-00000034B4D9CEF8.jpg;image_picker_90590DE5-6A14-424F-A810-340BBA960A9C-11691-00000034B86FFA7C.jpg','test','2024-02-01 17:44:14',10007,'2024-02-01 17:44:14',NULL,0),(13,3.5,3,'image_picker_55799187-617F-42C0-BE5C-676A5045825A-11691-00000035FC397563.jpg','test','2024-02-01 17:47:52',10007,'2024-02-01 17:47:52',NULL,0),(14,5.0,4,'sa.png;ecommerce-platform-data-1.webp','Very Good Product','2024-02-02 10:27:17',10007,'2024-02-02 10:27:17',NULL,0),(15,5.0,4,'sa.png;ecommerce-platform-data-1.webp','','2024-02-02 16:14:33',10007,'2024-02-02 16:14:33',NULL,0);
/*!40000 ALTER TABLE `eRatings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-03 10:35:42
