-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: hospitaldb
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` varchar(10) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('admin','adminin');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `qualification` tinytext NOT NULL,
  `specialization` varchar(20) DEFAULT NULL,
  `address` tinytext NOT NULL,
  `email` varchar(30) NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  `password` varchar(20) NOT NULL,
  `gender` enum('Male','Female','Others') NOT NULL,
  `blood_group` varchar(5) NOT NULL,
  `room` varchar(7) NOT NULL,
  `job_type` enum('Doctor','Receptionist') NOT NULL,
  `joining_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Israt','Jahan','BSc Hon\'s in Mathematics from NU','','H-10,Block D, Banani,Dhaka North,Dhaka-1206','isratjahan@gmail.com','01789654231','israt','Female','A+','','Receptionist','2020-10-19 18:45:38'),(2,'Albert','Bandura','The University of Iowa (1952), The University of Iowa (1951), The University of British Columbia (1946–1949)','psychologist','32 StockHome,London','albertb@gmail','012345678910','alb','Male','AB+','101','Doctor','2020-10-19 18:48:40'),(3,'Ferdowsi','Marufa','University of of Hogwart ','Psychoanalysts','H-13,Block C,Gulsan 2,Dhaka North,Dhaka 1206','ferdowsimarufa@gmail.com','01543698752','mar','Female','O+','901','Doctor','2020-10-19 18:55:27'),(4,'Shafaet','Farhad','MBBS, FCPS, MRCPsych (London)\n','Psychiatry','122, Kazi Nazrul Islam Avenue, Dhaka 1000, Bangladesh','shafaetfarhad','01514246967','sha','Male','O+','902','Doctor','2020-10-19 18:59:32'),(5,'Md Saifullah','','MBBS, Phd, FCPS, MRC Psyc ( London ) , DCAP','Psychiatrists','113/A, Monipuripara, Gate No. 1 Farmgate, Tejgaon, Dhaka-1215, Bangladesh.','saifullah@gmail.com','01785496321','sai','Male','B-','904','Doctor','2020-10-19 19:02:22'),(6,'Nishat','Anjum','PhD, DPM, MCPS (Psych), MBBS','Psychiatrist','Green Super Market (3rd Floor), Farmgate, Dhaka, Bangladesh','nishatanjum@gmail','01896547321','nis','Female','AB+','1206','Doctor','2020-10-19 19:04:11'),(7,'Shakil','Ahmed','MBSS','Psychiarist','H-12,Block D,Banani,Dhaka','ahmed.shakil','01789456321','shakil','Male','A+','1010','Doctor','2020-10-20 09:35:10'),(8,'Tania','Afroz','Hon\'s in English','','17/B,Shahajadpur,Gulshan-2,Dhaka','taniaafroz@gmail.com','01569832147','tania','Female','B+','904','Receptionist','2020-10-20 09:36:37');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `illness` tinytext NOT NULL,
  `address` tinytext NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  `gender` enum('Male','Female','Others') NOT NULL,
  `blood_group` varchar(5) NOT NULL,
  `room` varchar(7) NOT NULL,
  `admission_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `patient_type` enum('Admitted','Released') NOT NULL,
  `doctor_id` int NOT NULL,
  `released_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'Riya','Chowdhury','Anxiety disorders, including panic disorder, obsessive-compulsive disorder, and phobias','Rohanpur,Gomostapur,Chapai Nawabganj','01745671968','Female','B+','1206','2020-10-20 05:29:49','Admitted',2,NULL),(2,'Seta','Alom','Depression, bipolar disorder, and other mood disorders','Road 36,Shiroil,Rajshahi','01789456321','Female','AB+','1003','2020-10-20 05:32:00','Admitted',4,NULL),(3,'Fatema','Anowar','Depression, bipolar disorder, and other mood disorders','Road 45, Sonadighirmor,Rajshahi','01345879652','Female','AB+','1005','2020-10-20 05:33:21','Admitted',5,NULL),(4,'Farhad','Hossain','Autism Spectrum Disorder','H-135,Manikdi,Dhaka North,1206','01521105269','Male','O+','902','2020-10-20 05:37:14','Admitted',3,NULL),(5,'Helena','Aktar','Depression, bipolar disorder, and other mood disorders','H-563,UttarKafrul,Cantonment','01769832145','Female','B+','701','2020-10-20 05:45:29','Admitted',6,NULL),(6,'Tanvir','Mahmood','Depression','H15,Sector 11,Uttara,Dhaka','01547896352','Male','A+','907','2020-10-20 08:07:22','Released',4,'2020-10-22'),(7,'Saif','Ullah','Personality disorders','17/B Sahajadpur, Gulshan 2,Dhaka','01789654349','Male','B-','706','2020-10-20 08:19:55','Admitted',2,NULL),(8,'Sonia','Farhana','as','1213,Kochukhet,Dhaka','41','Female','B+','102','2020-10-20 09:47:54','Admitted',4,NULL);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-20 16:12:54
