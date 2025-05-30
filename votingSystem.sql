-- MySQL dump 10.13  Distrib 8.0.35, for Win64 (x86_64)
--
-- Host: localhost    Database: voting
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Current Database: `voting`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `voting` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `voting`;

--
-- Table structure for table `candidatelist`
--

DROP TABLE IF EXISTS `candidatelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidatelist` (
  `candidateID` int NOT NULL AUTO_INCREMENT,
  `symbol` varchar(100) NOT NULL,
  `electionID` int DEFAULT NULL,
  `voterId` varchar(20) DEFAULT NULL,
  `mobileNo` bigint DEFAULT NULL,
  PRIMARY KEY (`candidateID`),
  KEY `fk_candidateElectionID` (`electionID`),
  KEY `voterId` (`voterId`),
  CONSTRAINT `candidatelist_ibfk_1` FOREIGN KEY (`voterId`) REFERENCES `voterlist` (`voterID`),
  CONSTRAINT `fk_candidateElectionID` FOREIGN KEY (`electionID`) REFERENCES `electionlist` (`electionID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidatelist`
--

LOCK TABLES `candidatelist` WRITE;
/*!40000 ALTER TABLE `candidatelist` DISABLE KEYS */;
INSERT INTO `candidatelist` VALUES (1,'chair.png',1,'SVK1234567',9865328754),(2,'bulb.png',1,'SMM1234567',8546921357),(3,'bench.png',1,'YGC1234567',9645128563),(4,'cupboard.png',1,'MVA1234567',7548621559);
/*!40000 ALTER TABLE `candidatelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `electionlist`
--

DROP TABLE IF EXISTS `electionlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `electionlist` (
  `electionID` int NOT NULL AUTO_INCREMENT,
  `electionName` varchar(20) NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `startDate` date NOT NULL,
  `enddate` date DEFAULT NULL,
  PRIMARY KEY (`electionID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `electionlist`
--

LOCK TABLES `electionlist` WRITE;
/*!40000 ALTER TABLE `electionlist` DISABLE KEYS */;
INSERT INTO `electionlist` VALUES (1,'General Election',1,'2024-02-12',NULL);
/*!40000 ALTER TABLE `electionlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration` (
  `firstName` varchar(15) NOT NULL,
  `middleName` varchar(15) DEFAULT NULL,
  `lastName` varchar(15) NOT NULL,
  `dateOfBirth` date NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `password` varchar(10) NOT NULL,
  `mobileNo` bigint NOT NULL,
  `aadhaarNo` bigint NOT NULL,
  `gender` varchar(7) NOT NULL,
  `age` int DEFAULT NULL,
  PRIMARY KEY (`aadhaarNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration`
--

LOCK TABLES `registration` WRITE;
/*!40000 ALTER TABLE `registration` DISABLE KEYS */;
INSERT INTO `registration` VALUES ('Sonali','sudhir','khune','1992-03-04','sonalikhune92@gmail.com','567sonali!',7875258914,561284569523,'female',32),('Aarvi','Arvind','Balkundi','2005-10-27','balkundiaarvi@gmail.com','@@rv!27B',9173824650,606395928784,'female',18),('Nikita ','sahil','Mhetre','2003-01-07','nikmhetre45@gmail.com','N!k!ta07',9854328754,985687452103,'female',21);
/*!40000 ALTER TABLE `registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voterlist`
--

DROP TABLE IF EXISTS `voterlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voterlist` (
  `voterID` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `aadhaarNo` varchar(12) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `middleName` varchar(20) DEFAULT NULL,
  `lastName` varchar(20) NOT NULL,
  `dateOfBirth` date NOT NULL,
  `emailID` varchar(30) DEFAULT NULL,
  `mobileNo` bigint NOT NULL,
  `gender` varchar(10) NOT NULL,
  `age` int DEFAULT NULL,
  PRIMARY KEY (`voterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voterlist`
--

LOCK TABLES `voterlist` WRITE;
/*!40000 ALTER TABLE `voterlist` DISABLE KEYS */;
INSERT INTO `voterlist` VALUES ('ABC1234567','voterABC','123456789012','Amey','Bapu','Chougule','2000-02-24','ameychougule2402@gmail.com',9563127485,'Male\r',NULL),('DEF1234567','voterDEF','234567890123','Dolly','Eric','Fernandes','1999-07-14','dollyfer99@gmail.com',9845451212,'Female\r',NULL),('GHI1234567','voterGHI','345678901234','Gajanan','Hiralal','Ingale','1995-02-14','gajaningale@outlook.com',8454512912,'Male\r',NULL),('JKL1234567','voterJKL','456789012345','Jayesh','Kiran','Londhe','2003-08-05','jaylondhe03@gmail.com',7454556912,'Male\r',NULL),('MNO1234567','voterMNO','678901234567','Mamta','Niraj','Ojha','2002-04-13','omamta1302@outlook.com',9312748576,'Female\r',NULL),('MVA1234567','voterMVA','849567516230','Manisha','Viresh','Agarkar','1982-03-08','manishaagarkar@gmail.com',7548621559,'Female',NULL),('PQR1234567','voterPQR','234567890123','Phatima','Qadir','Rafiq','1978-10-06','',8512389562,'Female\r',NULL),('RRR8888888','RamRam','888888888888','Ramchandra','Ravichandra','Ranghuvanshi','1992-01-02','rrr@fancy.com',8888888888,'Male\r',NULL),('RVT1234904','voterRVT','567830988922','Rohini','Vikram','Tembhurni','1998-09-08','rohitem@outlook.com',7710499886,'Female\r',NULL),('SMM1234567','voterSMM','302165749825',' Suresh','Mahesh','Mhetre','1977-08-29',' sureshmhetre@gmail.com',8546921357,'Male',NULL),('SSK2004709','ItsMe','456237235734','Soundarya','Santosh','Kumbharikar','2004-07-09','soundaryak974@gmail.com',9487806244,'Female\r',NULL),('SVK1234567','voterSVK','472530692514','Shital','Vittal','Kore','1989-11-06','shitalkore26@gmail.com',9865328754,'Female',NULL),('YGC1234567','voterYGC','748596415263','Yogesh','Ganesh','Choudhari','1969-05-19','yogeshchoudhari@gmail.com',9645128563,'Male',NULL),('YST9991602','voterYST','890378906745','Yogiraj','Suryakant','Tambake','1999-02-16','yogirajst@gmail.com',7892089056,'Male\r',NULL);
/*!40000 ALTER TABLE `voterlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votes`
--

DROP TABLE IF EXISTS `votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `votes` (
  `voterID` varchar(20) NOT NULL,
  `electionID` int NOT NULL,
  `candidateID` int NOT NULL,
  PRIMARY KEY (`voterID`,`electionID`),
  KEY `candidateID` (`candidateID`),
  KEY `electionID` (`electionID`),
  CONSTRAINT `votes_ibfk_1` FOREIGN KEY (`voterID`) REFERENCES `voterlist` (`voterID`),
  CONSTRAINT `votes_ibfk_2` FOREIGN KEY (`candidateID`) REFERENCES `candidatelist` (`candidateID`),
  CONSTRAINT `votes_ibfk_3` FOREIGN KEY (`voterID`) REFERENCES `voterlist` (`voterID`),
  CONSTRAINT `votes_ibfk_4` FOREIGN KEY (`electionID`) REFERENCES `electionlist` (`electionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votes`
--

LOCK TABLES `votes` WRITE;
/*!40000 ALTER TABLE `votes` DISABLE KEYS */;
INSERT INTO `votes` VALUES ('SSK2004709',1,1),('GHI1234567',1,2),('YST9991602',1,2),('ABC1234567',1,3),('PQR1234567',1,3),('RVT1234904',1,3);
/*!40000 ALTER TABLE `votes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-25  8:01:27
