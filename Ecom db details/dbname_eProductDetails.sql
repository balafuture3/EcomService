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
-- Table structure for table `eProductDetails`
--

DROP TABLE IF EXISTS `eProductDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eProductDetails` (
  `productId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text NOT NULL,
  `image` text NOT NULL,
  `sizes` text,
  `colors` text,
  `aboutItem` text,
  `additionalInfo` text,
  `discountId` bigint NOT NULL DEFAULT '1',
  `l1CategoryId` int NOT NULL,
  `l2CategoryId` int NOT NULL,
  `l3CategoryId` int NOT NULL,
  `createdBy` int NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` int NOT NULL,
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleteFlag` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eProductDetails`
--

LOCK TABLES `eProductDetails` WRITE;
/*!40000 ALTER TABLE `eProductDetails` DISABLE KEYS */;
INSERT INTO `eProductDetails` VALUES (4,'Apple laptop',500.00,'To share one or multiple files, invoke the static shareXFiles method anywhere in your Dart code. The method returns a ShareResult. Optionally, you can pass subject, text and sharePositionOrigin.','under-construction.webp',NULL,NULL,NULL,NULL,2,1,1,1,1234,'2023-12-29 04:32:32',1234,'2024-01-03 08:36:28',0),(6,'Sony laptop',500.00,'test','Electronics.png',NULL,NULL,NULL,NULL,1,1,1,1,1234,'2023-12-31 16:47:06',1234,'2024-01-03 07:24:51',0),(8,'Mens Dress',500.00,'test','Fashion.png',NULL,NULL,NULL,NULL,1,1,1,1,1234,'2023-12-31 17:02:28',1234,'2024-01-03 07:24:51',0),(9,'Surf Excel',200.00,'test','Grocery.png',NULL,NULL,NULL,NULL,1,1,1,1,1234,'2023-12-31 17:03:36',1234,'2024-01-03 07:24:51',0),(10,'Macbook Pro',200.00,'test','Toys.png',NULL,NULL,NULL,NULL,3,1,1,1,1234,'2023-12-31 19:21:50',1234,'2024-01-03 08:13:42',0),(11,'Sony Camera',2000.00,'test','sony-apsc-ilce-6100y-b-in5-mirrorless-original-imafm6msr4fghzfw.webp;sony-apsc-ilce-6100y-b-in5-mirrorless-original-imafmsk4ghubfdpy.webp;sony-apsc-ilce-6100y-b-in5-mirrorless-original-imafmsk5bbgzgc5x.webp;sony-apsc-ilce-6100y-b-in5-mirrorless-original-imafmsk5nzcgnvjc.webp;sony-apsc-ilce-6100y-b-in5-mirrorless-original-imafmsk5ukm4f2za.webp;sony-apsc-ilce-6100y-b-in5-mirrorless-original-imafmsk44yf24ejk.webp',NULL,NULL,NULL,NULL,2,1,1,1,1234,'2024-01-02 07:15:10',1234,'2024-01-03 08:13:41',0),(12,'Pattu Frog',2000.00,'To share one or multiple files, invoke the static shareXFiles method anywhere in your Dart code. The method returns a ShareResult. Optionally, you can pass subject, text and sharePositionOrigin.','91fvA-kh7NL._SY879_.jpg;91J7nLKNjbL._SX679_.jpg','S;L;M;XL;XXL;XXXL','#FF5733;#FFdcba;#51FF00','Highly Elastic Fabric:Mens fitted dress shirts are made of high stretch fabric with high quality nylon, allowing the body to move more freely, comfortable, breathable and smooth to the touch.\nFeatures:Mens button down shirts are made with special craftsmanship, not easy to wrinkle and easy to take care of. High-grade fabrics can bring you a cool feeling.\nSlim And Muscular Fit:Modern muscle fit slim fit dress shirts for men have enough stretch for easy movement, classic neckline designed to fit all sizes of bow ties with or without tie, smooth body, no pockets, and wide cut for a neat look of the shirt.\nMoisture Wicking:Long sleeve mens dress shirts are designed to wick away sweat to keep you dry, breathable and comfortable even when youre exercising; the wrinkle resistant fabric is easy to care for and iron.\nOccasion:Business casual shirts for men are suitable for business, wedding, banquet, dating and other occasions, whether it is a formal occasion or daily leisure, it can bring you charm at any time. It is also the ideal gift for Thanksgiving, Fathers Day, Valentines Day, Christmas, family, lovers and friends','Manufacturer:PW PLATYPUS WORLD, PW PLATYPUS WORLD TEAM',3,1,1,1,1234,'2024-01-02 12:12:25',1234,'2024-01-03 08:13:41',0),(14,'Manoj',5000.00,'Understanding the Concept of Infinite Lists\nCreating a Basic List in Flutter','Mobile.png','S;L;M;XL,XXL,XXXL','#FF5733;#FFFFFF;#51FF00','Highly Elastic Fabric:Mens fitted dress shirts are made of high stretch fabric with high quality nylon, allowing the body to move more freely, comfortable, breathable and smooth to the touch.\nFeatures:Mens button down shirts are made with special craftsmanship, not easy to wrinkle and easy to take care of. High-grade fabrics can bring you a cool feeling.\nSlim And Muscular Fit:Modern muscle fit slim fit dress shirts for men have enough stretch for easy movement, classic neckline designed to fit all sizes of bow ties with or without tie, smooth body, no pockets, and wide cut for a neat look of the shirt.\nMoisture Wicking:Long sleeve mens dress shirts are designed to wick away sweat to keep you dry, breathable and comfortable even when youre exercising; the wrinkle resistant fabric is easy to care for and iron.\nOccasion:Business casual shirts for men are suitable for business, wedding, banquet, dating and other occasions, whether it is a formal occasion or daily leisure, it can bring you charm at any time. It is also the ideal gift for Thanksgiving, Fathers Day, Valentines Day, Christmas, family, lovers and friends','Manufacturer:PW PLATYPUS WORLD, PW PLATYPUS WORLD TEAM',1,1,1,1,1234,'2024-01-05 11:36:56',1234,'2024-01-05 11:36:56',0),(15,'Test',5000.00,'Understanding the Concept of Infinite Lists\nCreating a Basic List in Flutter','img.png','S;L;M;XL,XXL,XXXL','#FF5733;#FFFFFF;#51FF00','Highly Elastic Fabric:Mens fitted dress shirts are made of high stretch fabric with high quality nylon, allowing the body to move more freely, comfortable, breathable and smooth to the touch.\nFeatures:Mens button down shirts are made with special craftsmanship, not easy to wrinkle and easy to take care of. High-grade fabrics can bring you a cool feeling.\nSlim And Muscular Fit:Modern muscle fit slim fit dress shirts for men have enough stretch for easy movement, classic neckline designed to fit all sizes of bow ties with or without tie, smooth body, no pockets, and wide cut for a neat look of the shirt.\nMoisture Wicking:Long sleeve mens dress shirts are designed to wick away sweat to keep you dry, breathable and comfortable even when youre exercising; the wrinkle resistant fabric is easy to care for and iron.\nOccasion:Business casual shirts for men are suitable for business, wedding, banquet, dating and other occasions, whether it is a formal occasion or daily leisure, it can bring you charm at any time. It is also the ideal gift for Thanksgiving, Fathers Day, Valentines Day, Christmas, family, lovers and friends','Manufacturer:PW PLATYPUS WORLD, PW PLATYPUS WORLD TEAM',1,1,1,1,1234,'2024-01-07 05:30:27',1234,'2024-01-07 05:30:27',0),(16,'Test1',5000.00,'Understanding the Concept of Infinite Lists\nCreating a Basic List in Flutter','img.png','S;L;M;XL,XXL,XXXL','#FF5733;#FFFFFF;#51FF00','Highly Elastic Fabric:Mens fitted dress shirts are made of high stretch fabric with high quality nylon, allowing the body to move more freely, comfortable, breathable and smooth to the touch.\nFeatures:Mens button down shirts are made with special craftsmanship, not easy to wrinkle and easy to take care of. High-grade fabrics can bring you a cool feeling.\nSlim And Muscular Fit:Modern muscle fit slim fit dress shirts for men have enough stretch for easy movement, classic neckline designed to fit all sizes of bow ties with or without tie, smooth body, no pockets, and wide cut for a neat look of the shirt.\nMoisture Wicking:Long sleeve mens dress shirts are designed to wick away sweat to keep you dry, breathable and comfortable even when youre exercising; the wrinkle resistant fabric is easy to care for and iron.\nOccasion:Business casual shirts for men are suitable for business, wedding, banquet, dating and other occasions, whether it is a formal occasion or daily leisure, it can bring you charm at any time. It is also the ideal gift for Thanksgiving, Fathers Day, Valentines Day, Christmas, family, lovers and friends','Manufacturer:PW PLATYPUS WORLD, PW PLATYPUS WORLD TEAM',1,1,1,1,1234,'2024-01-07 05:34:23',1234,'2024-01-07 05:34:23',0),(17,'Test2',5000.00,'Understanding the Concept of Infinite Lists\nCreating a Basic List in Flutter','img.png','S;L;M;XL,XXL,XXXL','#FF5733;#FFFFFF;#51FF00','Highly Elastic Fabric:Mens fitted dress shirts are made of high stretch fabric with high quality nylon, allowing the body to move more freely, comfortable, breathable and smooth to the touch.\nFeatures:Mens button down shirts are made with special craftsmanship, not easy to wrinkle and easy to take care of. High-grade fabrics can bring you a cool feeling.\nSlim And Muscular Fit:Modern muscle fit slim fit dress shirts for men have enough stretch for easy movement, classic neckline designed to fit all sizes of bow ties with or without tie, smooth body, no pockets, and wide cut for a neat look of the shirt.\nMoisture Wicking:Long sleeve mens dress shirts are designed to wick away sweat to keep you dry, breathable and comfortable even when youre exercising; the wrinkle resistant fabric is easy to care for and iron.\nOccasion:Business casual shirts for men are suitable for business, wedding, banquet, dating and other occasions, whether it is a formal occasion or daily leisure, it can bring you charm at any time. It is also the ideal gift for Thanksgiving, Fathers Day, Valentines Day, Christmas, family, lovers and friends','Manufacturer:PW PLATYPUS WORLD, PW PLATYPUS WORLD TEAM',1,1,1,1,1234,'2024-01-07 05:34:26',1234,'2024-01-07 05:34:26',0),(18,'Test3',5000.00,'Understanding the Concept of Infinite Lists\nCreating a Basic List in Flutter','img.png','S;L;M;XL,XXL,XXXL','#FF5733;#FFFFFF;#51FF00','Highly Elastic Fabric:Mens fitted dress shirts are made of high stretch fabric with high quality nylon, allowing the body to move more freely, comfortable, breathable and smooth to the touch.\nFeatures:Mens button down shirts are made with special craftsmanship, not easy to wrinkle and easy to take care of. High-grade fabrics can bring you a cool feeling.\nSlim And Muscular Fit:Modern muscle fit slim fit dress shirts for men have enough stretch for easy movement, classic neckline designed to fit all sizes of bow ties with or without tie, smooth body, no pockets, and wide cut for a neat look of the shirt.\nMoisture Wicking:Long sleeve mens dress shirts are designed to wick away sweat to keep you dry, breathable and comfortable even when youre exercising; the wrinkle resistant fabric is easy to care for and iron.\nOccasion:Business casual shirts for men are suitable for business, wedding, banquet, dating and other occasions, whether it is a formal occasion or daily leisure, it can bring you charm at any time. It is also the ideal gift for Thanksgiving, Fathers Day, Valentines Day, Christmas, family, lovers and friends','Manufacturer:PW PLATYPUS WORLD, PW PLATYPUS WORLD TEAM',1,1,1,1,1234,'2024-01-07 05:34:31',1234,'2024-01-07 05:34:31',0);
/*!40000 ALTER TABLE `eProductDetails` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-03 10:35:51
