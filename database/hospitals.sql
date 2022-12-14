-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: hospitals
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospital` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital`
--

LOCK TABLES `hospital` WRITE;
/*!40000 ALTER TABLE `hospital` DISABLE KEYS */;
INSERT INTO `hospital` VALUES (1,'Apollo Hospital'),(2,'Jawaharlal Nehru Medical College and Hospital\n'),(3,'Indira Gandhi Institute of Medical Sciences (IGIMS)'),(4,'AIIMS - All India Institute Of Medical Science\n');
/*!40000 ALTER TABLE `hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone_no` text NOT NULL,
  `password` text NOT NULL,
  `patient_photo_path` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `psychiatrists`
--

DROP TABLE IF EXISTS `psychiatrists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `psychiatrists` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `patients_count` int NOT NULL,
  `hospital_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `psychiatrists`
--

LOCK TABLES `psychiatrists` WRITE;
/*!40000 ALTER TABLE `psychiatrists` DISABLE KEYS */;
INSERT INTO `psychiatrists` VALUES (1,'Sara Rodriguez',10,3),(2,'Brian Munoz',28,3),(3,'Kimberly Rogers',35,1),(4,'Nathan Hayes',5,3),(5,'Adam Gonzalez',7,3),(6,'Priscilla Richards',16,1),(7,'James Hart',30,3),(8,'Logan Woods',9,1),(9,'Stacy Townsend',50,4),(10,'Bobby Pearson',9,4),(11,'Rebecca Chan',15,2),(12,'Mary Smith',12,3),(13,'Gary Smith',20,1),(14,'Alexandra Schwartz',45,4),(15,'Nicole Kelley',41,3),(16,'Laura Drake',34,4),(17,'April Myers',36,1),(18,'Jacqueline Clark',6,2),(19,'Ashley Wright',39,1),(20,'Ashley Harvey',32,1),(21,'Mr. Daniel Huynh',20,1),(22,'Michelle Fisher',43,4),(23,'Jonathan Wright',26,1),(24,'Matthew Bowen',10,2),(25,'Brett Jones',31,1),(26,'Beth Dillon MD',16,3),(27,'Jennifer Cooper',37,4),(28,'Isabella Garcia',22,1),(29,'Tanner Phillips',8,3),(30,'John Lopez',44,4),(31,'Rachel Gardner MD',43,2),(32,'Danielle Figueroa',17,1),(33,'Fernando Oliver',17,4),(34,'Alexis Kelly',8,2),(35,'Jesse Howard',25,2),(36,'Mary Larson',22,4),(37,'Caroline Bennett',50,4),(38,'Mr. Charles Clark',6,3),(39,'Kiara Williams',34,3),(40,'Miss Michele Miller',33,3),(41,'Eddie Evans',6,2),(42,'Mark Huffman',8,2),(43,'Andrew Payne',24,3),(44,'Peter Baldwin',22,4),(45,'Phyllis Mcdonald',9,2),(46,'Rebecca Walton',29,1),(47,'Mark Carter',19,2),(48,'Wanda Baker',50,1),(49,'Jeff Johnson',23,2),(50,'Lori Robertson',13,1);
/*!40000 ALTER TABLE `psychiatrists` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-29 15:03:38
