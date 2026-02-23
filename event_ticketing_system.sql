-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: event_ticketing_system
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

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
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `booking_date` date DEFAULT NULL,
  `booking_status` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `event_id` (`event_id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`),
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`),
  CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,1,1001,25480,'2024-01-10','confirmed'),(2,1,1002,36594,'2024-01-11','confirmed'),(3,2,1005,36594,'2024-01-11','confirmed'),(4,3,1007,10967,'2024-03-12','pending'),(5,2,1003,56094,'2024-02-14','cancelled'),(6,2,1003,78506,'2024-02-05','confirmed'),(7,3,1006,90459,'2024-03-19','pending'),(8,2,1005,90459,'2024-02-15','cancelled'),(9,2,1004,46078,'2024-01-19','confirmed'),(10,1,1001,25480,'2024-01-15','pending'),(11,2,1002,36594,'2024-01-16','confirmed');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER default_status
BEFORE INSERT ON booking
FOR EACH ROW
BEGIN
IF NEW.booking_status IS NULL THEN
SET NEW.booking_status = 'pending';
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  `customer_email` varchar(100) DEFAULT NULL,
  `customer_contact` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (10967,'Kristina Leonardo','kris_leo@hotmail.com','011-1093-2788'),(25480,'Kelvin Choi Jia Le','kelvin_choi@gmail.com','019-378-6601'),(36594,'Alibaba','ali88@gmail.com','016-788-1080'),(46078,'Joy Fu Kai Xin','happyfu_0912@gmail.com','012-365-2035'),(56094,'Tan Gang Qin','piano@yahoo.my','014-623-7899'),(78506,'Hu Er Yu','eryuhu_02@gmail.com','019-498-2077'),(90459,'Xia Zie Ji','summer0713@gmail.com','011-1083-9397');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(50) DEFAULT NULL,
  `event_type` varchar(25) DEFAULT NULL,
  `event_date` date DEFAULT NULL,
  `event_venue` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (1,'Marathon','sports','2024-01-05','Dataran Merdeka'),(2,'Concert','performance','2024-02-15','Axiata Arena'),(3,'Blood Donation','charity','2024-03-29','National Stadium');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `payment_amount` decimal(10,2) DEFAULT NULL,
  `payment_method` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,25480,100.00,'TNG eWallet'),(2,36594,100.00,'credit card'),(3,36594,388.00,'credit card'),(4,10967,300.00,'TNG eWallet'),(6,78506,2888.00,'credit card'),(7,90459,100.00,'TNG eWallet'),(8,90459,388.00,'TNG eWallet'),(9,46078,1888.00,'credit card');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `ticket_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `ticket_type` varchar(50) DEFAULT NULL,
  `ticket_price` decimal(10,2) DEFAULT NULL,
  `ticket_status` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1001,1,'VIP',100.00,'available'),(1002,1,'general admission',50.00,'sold out'),(1003,2,'VVIP',2888.00,'available'),(1004,2,'VIP',1888.00,'available'),(1005,2,'grandstand ticket',388.00,'sold out'),(1006,3,'voucher',100.00,'available'),(1007,3,'gifts',300.00,'available');
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-26 17:06:23
