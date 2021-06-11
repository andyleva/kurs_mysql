-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(145) NOT NULL,
  `chapter_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_article_chapter1_idx` (`chapter_id`),
  CONSTRAINT `fk_article_chapter1` FOREIGN KEY (`chapter_id`) REFERENCES `chapter` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,'Выставки',1),(2,'Аренда',2),(3,'Связь',3),(4,'Кайтеринг',4),(5,'Обслуживание',5),(6,'Реклама',1),(7,'Лекторы',2),(8,'Продвижение',3),(9,'Новые разработки',4),(10,'Буклеты',5),(11,'Переводчики',1),(12,'Расход 01',2),(13,'Расход 02',3),(14,'Расход 03',4),(15,'Расход 04',5);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chapter`
--

DROP TABLE IF EXISTS `chapter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chapter` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chapter`
--

LOCK TABLES `chapter` WRITE;
/*!40000 ALTER TABLE `chapter` DISABLE KEYS */;
INSERT INTO `chapter` VALUES (4,'Зарплата'),(1,'Маркетинг'),(2,'Налоги'),(5,'Прочее'),(3,'Хозрасходы');
/*!40000 ALTER TABLE `chapter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direction`
--

DROP TABLE IF EXISTS `direction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direction` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(145) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direction`
--

LOCK TABLES `direction` WRITE;
/*!40000 ALTER TABLE `direction` DISABLE KEYS */;
INSERT INTO `direction` VALUES (2,'Курсы Т'),(3,'Курсы Х'),(1,'Практикум');
/*!40000 ALTER TABLE `direction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(145) NOT NULL,
  `direction_ig` int unsigned NOT NULL,
  `comment_event` varchar(245) DEFAULT NULL,
  `date_event` date DEFAULT NULL,
  `lecturer_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_event_direction_idx` (`direction_ig`),
  KEY `fk_event_lecturer1_idx` (`lecturer_id`),
  CONSTRAINT `fk_event_direction` FOREIGN KEY (`direction_ig`) REFERENCES `direction` (`id`),
  CONSTRAINT `fk_event_lecturer1` FOREIGN KEY (`lecturer_id`) REFERENCES `lecturer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (1,'Курс 01',1,NULL,'2021-01-15',1),(2,'Курс 02',2,NULL,'2021-02-10',5),(3,'Курс 03',3,NULL,'2021-02-10',4),(4,'Курс 04',1,NULL,'2021-02-15',2),(5,'Курс 05',2,NULL,'2021-03-04',1),(6,'Курс 06',3,NULL,'2021-04-11',3),(7,'Курс 07',1,NULL,'2021-04-20',4),(8,'Курс 08',2,NULL,'2021-05-16',5),(9,'Курс 09',3,NULL,'2021-05-30',2),(10,'Курс 10',1,NULL,'2021-06-10',3);
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fact_cost`
--

DROP TABLE IF EXISTS `fact_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_cost` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `comment` varchar(45) DEFAULT NULL,
  `summa` float(15,2) DEFAULT NULL,
  `sub_articles_id_receipt` int unsigned DEFAULT NULL,
  `sub_articles_id_charge` int unsigned DEFAULT NULL,
  `record_id` int unsigned NOT NULL,
  `event_id_receipt` int unsigned DEFAULT NULL,
  `event_id_charge` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_fact_cost_sub_articles1_idx` (`sub_articles_id_receipt`),
  KEY `fk_fact_cost_sub_articles2_idx` (`sub_articles_id_charge`),
  KEY `fk_fact_cost_record1_idx` (`record_id`),
  KEY `fk_fact_cost_event1_idx` (`event_id_receipt`),
  KEY `fk_fact_cost_event2_idx` (`event_id_charge`),
  CONSTRAINT `fk_fact_cost_event1` FOREIGN KEY (`event_id_receipt`) REFERENCES `event` (`id`),
  CONSTRAINT `fk_fact_cost_event2` FOREIGN KEY (`event_id_charge`) REFERENCES `event` (`id`),
  CONSTRAINT `fk_fact_cost_record1` FOREIGN KEY (`record_id`) REFERENCES `record` (`id`),
  CONSTRAINT `fk_fact_cost_sub_articles1` FOREIGN KEY (`sub_articles_id_receipt`) REFERENCES `sub_articles` (`id`),
  CONSTRAINT `fk_fact_cost_sub_articles2` FOREIGN KEY (`sub_articles_id_charge`) REFERENCES `sub_articles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_cost`
--

LOCK TABLES `fact_cost` WRITE;
/*!40000 ALTER TABLE `fact_cost` DISABLE KEYS */;
INSERT INTO `fact_cost` VALUES (1,NULL,124876.00,1,1,1,4,5),(2,NULL,347834.00,2,5,2,8,6),(3,NULL,106465.00,3,6,3,8,5),(4,NULL,683999.00,4,13,4,9,6),(5,NULL,530719.00,5,5,5,9,5),(6,NULL,26037.00,6,13,6,10,5),(7,NULL,214428.00,7,8,7,10,2),(8,NULL,608829.00,8,13,8,2,9),(9,NULL,792609.00,9,13,9,6,5),(10,NULL,941381.00,10,12,10,7,7),(11,NULL,67955.00,11,5,11,4,8),(12,NULL,879101.00,12,15,12,9,2),(13,NULL,480110.00,13,2,13,4,2),(14,NULL,295026.00,14,8,14,3,2),(15,NULL,184739.00,15,5,15,8,4),(16,NULL,749280.00,1,13,16,6,2),(17,NULL,115392.00,2,5,17,4,7),(18,NULL,4198.00,3,2,18,9,9),(19,NULL,531532.00,4,9,19,8,5),(20,NULL,71501.00,5,8,20,9,5),(21,NULL,565115.00,6,14,21,3,2),(22,NULL,66655.00,7,3,22,5,3),(23,NULL,40489.00,8,12,23,5,7),(24,NULL,8560.00,9,8,24,1,9),(25,NULL,453450.00,10,4,25,7,3),(26,NULL,817429.00,11,10,26,4,4),(27,NULL,65647.00,12,7,27,8,3),(28,NULL,140567.00,13,6,28,8,1),(29,NULL,757938.00,14,7,29,6,4),(30,NULL,305302.00,15,15,30,6,8),(31,NULL,543167.00,1,10,31,9,1),(32,NULL,108245.00,2,5,32,2,7),(33,NULL,617981.00,3,10,33,7,5),(34,NULL,152723.00,4,6,34,10,3),(35,NULL,975977.00,5,12,35,9,5),(36,NULL,888090.00,6,12,36,5,9),(37,NULL,284242.00,7,11,37,6,3),(38,NULL,88970.00,8,1,38,4,3),(39,NULL,251345.00,9,15,39,2,7),(40,NULL,602892.00,10,14,40,8,7),(41,NULL,678102.00,11,12,41,4,4),(42,NULL,585632.00,12,3,42,6,8),(43,NULL,666318.00,13,6,43,6,8),(44,NULL,17301.00,14,6,44,4,7),(45,NULL,606666.00,15,12,45,1,8),(46,NULL,869757.00,1,10,46,9,2),(47,NULL,69128.00,2,15,47,7,4),(48,NULL,81966.00,3,1,48,4,10),(49,NULL,41999.00,4,2,49,1,1),(50,NULL,978519.00,5,4,50,9,3),(51,NULL,971734.00,6,12,51,6,3),(52,NULL,980986.00,7,8,52,9,4),(53,NULL,406974.00,8,2,53,2,8),(54,NULL,967966.00,9,13,54,7,3),(55,NULL,21178.00,10,14,55,2,6),(56,NULL,495817.00,11,4,56,6,5),(57,NULL,487290.00,12,5,57,6,2),(58,NULL,228184.00,13,10,58,2,7),(59,NULL,653183.00,14,5,59,10,7),(60,NULL,903897.00,15,11,60,5,4),(61,NULL,648410.00,1,11,61,2,9),(62,NULL,580940.00,2,7,62,5,2),(63,NULL,287450.00,3,2,63,9,3),(64,NULL,669679.00,4,15,64,3,8),(65,NULL,796910.00,5,12,65,5,2),(66,NULL,763757.00,6,13,66,4,2),(67,NULL,496900.00,7,2,67,3,4),(68,NULL,61790.00,8,9,68,4,4),(69,NULL,359500.00,9,12,69,2,6),(70,NULL,387734.00,10,2,70,5,8),(71,NULL,747370.00,11,2,71,9,2),(72,NULL,585464.00,12,5,72,3,4),(73,NULL,145679.00,13,3,73,4,6),(74,NULL,5209.00,14,12,74,2,5),(75,NULL,463130.00,15,8,75,4,7),(76,NULL,798191.00,1,2,76,4,8),(77,NULL,965133.00,2,14,77,6,3),(78,NULL,104811.00,3,5,78,8,7),(79,NULL,411844.00,4,13,79,4,5),(80,NULL,318349.00,5,4,80,5,5),(81,NULL,5607.00,6,11,81,1,2),(82,NULL,314323.00,7,13,82,9,8),(83,NULL,722344.00,8,4,83,4,9),(84,NULL,809625.00,9,5,84,3,3),(85,NULL,712290.00,10,14,85,9,3),(86,NULL,761476.00,11,13,86,7,6),(87,NULL,907915.00,12,6,87,8,1),(88,NULL,3507.00,13,4,88,8,6),(89,NULL,591078.00,14,2,89,7,7),(90,NULL,397615.00,15,9,90,8,6),(91,NULL,688210.00,1,12,91,2,1),(92,NULL,191791.00,2,5,92,4,4),(93,NULL,827886.00,3,3,93,3,7),(94,NULL,875244.00,4,11,94,3,2),(95,NULL,663771.00,5,3,95,4,8),(96,NULL,129310.00,6,10,96,9,3),(97,NULL,447781.00,7,9,97,7,3),(98,NULL,714712.00,8,3,98,6,2),(99,NULL,467550.00,9,2,99,9,2),(100,NULL,24504.00,10,12,100,7,2),(101,NULL,213357.00,11,12,101,6,4),(102,NULL,436073.00,12,8,102,9,2),(103,NULL,184155.00,13,3,103,6,6),(104,NULL,290842.00,14,6,104,5,7),(105,NULL,216959.00,15,6,105,5,7),(106,NULL,720019.00,1,9,106,9,5),(107,NULL,264517.00,2,13,107,2,10),(108,NULL,107416.00,3,10,108,1,6),(109,NULL,679867.00,4,8,109,6,2),(110,NULL,905462.00,5,9,110,9,8),(111,NULL,699580.00,6,5,111,9,6),(112,NULL,757815.00,7,13,112,8,4),(113,NULL,818652.00,8,6,113,10,10),(114,NULL,974345.00,9,3,114,8,9),(115,NULL,160859.00,10,12,115,8,5),(116,NULL,156198.00,11,9,116,7,5),(117,NULL,699062.00,12,6,117,2,3),(118,NULL,896903.00,13,3,118,3,7),(119,NULL,779914.00,14,8,119,2,6),(120,NULL,452481.00,15,3,120,9,7),(121,NULL,303535.00,1,5,121,8,8),(122,NULL,986185.00,2,9,122,6,8),(123,NULL,854581.00,3,8,123,4,6),(124,NULL,658716.00,4,3,124,9,6),(125,NULL,82223.00,5,7,125,6,10),(126,NULL,326923.00,6,9,126,2,4),(127,NULL,666773.00,7,8,127,1,7),(128,NULL,690090.00,8,13,128,8,6),(129,NULL,391893.00,9,10,129,7,8),(130,NULL,569351.00,10,11,130,10,3),(131,NULL,435403.00,11,11,131,9,8),(132,NULL,814321.00,12,9,132,7,4),(133,NULL,65690.00,13,7,133,5,4),(134,NULL,145229.00,14,10,134,6,6),(135,NULL,24586.00,15,13,135,3,9),(136,NULL,649505.00,1,5,136,5,6),(137,NULL,21651.00,2,1,137,6,3),(138,NULL,575124.00,3,3,138,5,7),(139,NULL,155523.00,4,11,139,6,6),(140,NULL,683110.00,5,2,140,7,7),(141,NULL,663862.00,6,3,141,6,7),(142,NULL,908436.00,7,11,142,6,4),(143,NULL,607294.00,8,14,143,4,9),(144,NULL,379106.00,9,8,144,8,4),(145,NULL,454467.00,10,11,145,10,2),(146,NULL,508403.00,11,3,146,6,6),(147,NULL,763807.00,12,11,147,8,3),(148,NULL,276922.00,13,14,148,5,7),(149,NULL,652446.00,14,11,149,9,5),(150,NULL,218949.00,15,9,150,2,5),(151,NULL,261782.00,1,12,151,9,7),(152,NULL,70658.00,2,4,152,3,10),(153,NULL,473610.00,3,11,153,2,9),(154,NULL,130553.00,4,13,154,3,4),(155,NULL,163472.00,5,4,155,7,4),(156,NULL,207230.00,6,7,156,8,4),(157,NULL,634952.00,7,7,157,8,9),(158,NULL,465040.00,8,14,158,5,6),(159,NULL,844623.00,9,5,159,10,9),(160,NULL,984157.00,10,11,160,7,1),(161,NULL,852713.00,11,9,161,2,3),(162,NULL,992179.00,12,14,162,9,3),(163,NULL,737043.00,13,12,163,1,3),(164,NULL,696382.00,14,5,164,5,8),(165,NULL,844105.00,15,14,165,2,2),(166,NULL,734620.00,1,14,166,5,1),(167,NULL,454344.00,2,14,167,8,8),(168,NULL,669694.00,3,12,168,4,2),(169,NULL,509167.00,4,2,169,5,10),(170,NULL,468634.00,5,2,170,3,6),(171,NULL,38029.00,6,3,171,10,8),(172,NULL,537710.00,7,6,172,3,6),(173,NULL,178254.00,8,6,173,9,3),(174,NULL,810124.00,9,10,174,1,4),(175,NULL,429422.00,10,6,175,4,9),(176,NULL,925017.00,11,12,176,5,8),(177,NULL,831700.00,12,13,177,6,2),(178,NULL,318909.00,13,14,178,4,5),(179,NULL,769816.00,14,2,179,9,6),(180,NULL,347751.00,15,7,180,5,4),(181,NULL,387630.00,1,3,181,7,4),(182,NULL,503672.00,2,4,182,8,6),(183,NULL,743401.00,3,12,183,8,7),(184,NULL,841592.00,4,6,184,8,7),(185,NULL,189661.00,5,6,185,5,5),(186,NULL,205669.00,6,9,186,9,1),(187,NULL,64651.00,7,1,187,2,9),(188,NULL,161553.00,8,4,188,9,5),(189,NULL,423550.00,9,2,189,3,7),(190,NULL,661715.00,10,13,190,5,8),(191,NULL,333502.00,11,13,191,5,8),(192,NULL,106170.00,12,10,192,9,9),(193,NULL,680383.00,13,12,193,2,1),(194,NULL,903543.00,14,14,194,8,4),(195,NULL,789281.00,15,6,195,5,9),(196,NULL,398476.00,1,13,196,3,2),(197,NULL,584476.00,2,5,197,8,3),(198,NULL,589157.00,3,13,198,3,7),(199,NULL,968209.00,4,6,199,8,6),(200,NULL,35712.00,5,5,200,4,10);
/*!40000 ALTER TABLE `fact_cost` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `fact_cost_BEFORE_INSERT` BEFORE INSERT ON `fact_cost` FOR EACH ROW BEGIN
	IF NEW.event_id_receipt = NEW.event_id_charge THEN		
        IF NEW.sub_articles_id_receipt = NEW.sub_articles_id_charge THEN
			SIGNAL sqlstate '45000'
			SET message_text = 'identical sub-aticles';
		END IF;
	END IF;
    IF NEW.sub_articles_id_receipt = NEW.sub_articles_id_charge THEN		
        IF NEW.event_id_receipt = NEW.event_id_charge THEN
			SIGNAL sqlstate '45000'
			SET message_text = 'identical events';
		END IF;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `fact_cost_BEFORE_UPDATE` BEFORE UPDATE ON `fact_cost` FOR EACH ROW BEGIN
	IF NEW.event_id_receipt = NEW.event_id_charge THEN		
        IF NEW.sub_articles_id_receipt = NEW.sub_articles_id_charge THEN
			SET NEW.sub_articles_id_receipt = OLD.sub_articles_id_receipt;
			SET NEW.sub_articles_id_charge = OLD.sub_articles_id_charge;
    	END IF;
	END IF;    
        
     IF NEW.sub_articles_id_receipt = NEW.sub_articles_id_charge THEN		
        IF NEW.event_id_receipt = NEW.event_id_charge THEN  
        	SET NEW.event_id_receipt = OLD.event_id_receipt;
			SET NEW.event_id_charge = OLD.event_id_charge;
		END IF;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `file` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES (1,_binary 'http://lorempixel.com/300/300/technics/'),(2,_binary 'http://lorempixel.com/300/300/technics/'),(3,_binary 'http://lorempixel.com/300/300/technics/'),(4,_binary 'http://lorempixel.com/300/300/technics/'),(5,_binary 'http://lorempixel.com/300/300/technics/'),(6,_binary 'http://lorempixel.com/300/300/technics/'),(7,_binary 'http://lorempixel.com/300/300/technics/'),(8,_binary 'http://lorempixel.com/300/300/technics/'),(9,_binary 'http://lorempixel.com/300/300/technics/'),(10,_binary 'http://lorempixel.com/300/300/technics/'),(11,_binary 'http://lorempixel.com/300/300/technics/'),(12,_binary 'http://lorempixel.com/300/300/technics/'),(13,_binary 'http://lorempixel.com/300/300/technics/'),(14,_binary 'http://lorempixel.com/300/300/technics/'),(15,_binary 'http://lorempixel.com/300/300/technics/'),(16,_binary 'http://lorempixel.com/300/300/technics/'),(17,_binary 'http://lorempixel.com/300/300/technics/'),(18,_binary 'http://lorempixel.com/300/300/technics/'),(19,_binary 'http://lorempixel.com/300/300/technics/'),(20,_binary 'http://lorempixel.com/300/300/technics/'),(21,_binary 'http://lorempixel.com/300/300/technics/'),(22,_binary 'http://lorempixel.com/300/300/technics/'),(23,_binary 'http://lorempixel.com/300/300/technics/'),(24,_binary 'http://lorempixel.com/300/300/technics/'),(25,_binary 'http://lorempixel.com/300/300/technics/'),(26,_binary 'http://lorempixel.com/300/300/technics/'),(27,_binary 'http://lorempixel.com/300/300/technics/'),(28,_binary 'http://lorempixel.com/300/300/technics/'),(29,_binary 'http://lorempixel.com/300/300/technics/'),(30,_binary 'http://lorempixel.com/300/300/technics/'),(31,_binary 'http://lorempixel.com/300/300/technics/'),(32,_binary 'http://lorempixel.com/300/300/technics/'),(33,_binary 'http://lorempixel.com/300/300/technics/'),(34,_binary 'http://lorempixel.com/300/300/technics/'),(35,_binary 'http://lorempixel.com/300/300/technics/'),(36,_binary 'http://lorempixel.com/300/300/technics/'),(37,_binary 'http://lorempixel.com/300/300/technics/'),(38,_binary 'http://lorempixel.com/300/300/technics/'),(39,_binary 'http://lorempixel.com/300/300/technics/'),(40,_binary 'http://lorempixel.com/300/300/technics/'),(41,_binary 'http://lorempixel.com/300/300/technics/'),(42,_binary 'http://lorempixel.com/300/300/technics/'),(43,_binary 'http://lorempixel.com/300/300/technics/'),(44,_binary 'http://lorempixel.com/300/300/technics/'),(45,_binary 'http://lorempixel.com/300/300/technics/'),(46,_binary 'http://lorempixel.com/300/300/technics/'),(47,_binary 'http://lorempixel.com/300/300/technics/'),(48,_binary 'http://lorempixel.com/300/300/technics/'),(49,_binary 'http://lorempixel.com/300/300/technics/'),(50,_binary 'http://lorempixel.com/300/300/technics/');
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `firma`
--

DROP TABLE IF EXISTS `firma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `firma` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `inn` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inn_UNIQUE` (`inn`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firma`
--

LOCK TABLES `firma` WRITE;
/*!40000 ALTER TABLE `firma` DISABLE KEYS */;
INSERT INTO `firma` VALUES (1,'Фирма 1',312899965429),(2,'Фирма 2',813148437593),(3,'Фирма 3',840317249162),(4,'Фирма 4',955678477840),(5,'Фирма 5',963883584357),(6,'Фирма 6',445587406623),(7,'Фирма 7',591239405649),(8,'Фирма 8',882649699780),(9,'Фирма 9',716774622816),(10,'Фирма 10',683749831130),(11,'Фирма 11',220063001033),(12,'Фирма 12',307909945079),(13,'Фирма 13',926029877697),(14,'Фирма 14',285297236943),(15,'Фирма 15',875495597036),(16,'Фирма 16',423020387245),(17,'Фирма 17',683447536444),(18,'Фирма 18',233856184790),(19,'Фирма 19',733807923994),(20,'Фирма 20',634651507787),(21,'Фирма 21',217868033085),(22,'Фирма 22',126568338532),(23,'Фирма 23',838882229108),(24,'Фирма 24',470627699303),(25,'Фирма 25',189749934011),(26,'Фирма 26',291340364912),(27,'Фирма 27',561972575607),(28,'Фирма 28',446323340999),(29,'Фирма 29',232315991052),(30,'Фирма 30',703661907818),(31,'Фирма 31',393055378556),(32,'Фирма 32',795853724156),(33,'Фирма 33',802018777500),(34,'Фирма 34',117001075821),(35,'Фирма 35',520436740177),(36,'Фирма 36',323430021097),(37,'Фирма 37',274876513346),(38,'Фирма 38',683937864150),(39,'Фирма 39',216118139924),(40,'Фирма 40',280870354203),(41,'Фирма 41',907872871222),(42,'Фирма 42',132670077421),(43,'Фирма 43',679188585066),(44,'Фирма 44',422992025096),(45,'Фирма 45',610811787292),(46,'Фирма 46',746743345679),(47,'Фирма 47',321515864234),(48,'Фирма 48',401309298202),(49,'Фирма 49',889972466487),(50,'Фирма 50',892349603852),(51,'Фирма 51',987745714554),(52,'Фирма 52',816301920570),(53,'Фирма 53',65811912105),(54,'Фирма 54',200132883739),(55,'Фирма 55',198213751232),(56,'Фирма 56',273323857473),(57,'Фирма 57',351309116217),(58,'Фирма 58',657445724371),(59,'Фирма 59',869767010527),(60,'Фирма 60',321063193646),(61,'Фирма 61',893399273593),(62,'Фирма 62',292831958556),(63,'Фирма 63',740400989253),(64,'Фирма 64',77294736880),(65,'Фирма 65',958342332222),(66,'Фирма 66',678309764535),(67,'Фирма 67',356921848874),(68,'Фирма 68',981941664496),(69,'Фирма 69',360560769499),(70,'Фирма 70',805998022510),(71,'Фирма 71',827498790698),(72,'Фирма 72',933966085929),(73,'Фирма 73',56173152592),(74,'Фирма 74',293922379553),(75,'Фирма 75',846943234515),(76,'Фирма 76',167673700972),(77,'Фирма 77',291729917800),(78,'Фирма 78',361909400705),(79,'Фирма 79',543002270629),(80,'Фирма 80',322503828917),(81,'Фирма 81',771553014905),(82,'Фирма 82',974326539042),(83,'Фирма 83',165995679054),(84,'Фирма 84',491398162751),(85,'Фирма 85',157741804991),(86,'Фирма 86',103243595578),(87,'Фирма 87',837213553791),(88,'Фирма 88',942332895532),(89,'Фирма 89',555712914787),(90,'Фирма 90',542028079786),(91,'Фирма 91',474325998802),(92,'Фирма 92',455154544675),(93,'Фирма 93',908388074358),(94,'Фирма 94',651568339727),(95,'Фирма 95',876264776176),(96,'Фирма 96',47997377584),(97,'Фирма 97',821226002122),(98,'Фирма 98',104298951238),(99,'Фирма 99',802791992694),(100,'Фирма 100',423717933296);
/*!40000 ALTER TABLE `firma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecturer`
--

DROP TABLE IF EXISTS `lecturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecturer` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `surname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturer`
--

LOCK TABLES `lecturer` WRITE;
/*!40000 ALTER TABLE `lecturer` DISABLE KEYS */;
INSERT INTO `lecturer` VALUES (1,'Артур','Смирнов'),(2,'Александр','Иванов'),(3,'Елена','Соколова'),(4,'Ирина','Кузнецова'),(5,'Сергей','Скоробогатов');
/*!40000 ALTER TABLE `lecturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type_receipt_id` int unsigned NOT NULL,
  `data_payment` date NOT NULL,
  `number_paymet` int NOT NULL,
  `sum_payment` float(15,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_payment_type_receipt1_idx` (`type_receipt_id`),
  CONSTRAINT `fk_payment_type_receipt1` FOREIGN KEY (`type_receipt_id`) REFERENCES `type_receipt` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,'1990-09-17',462,60564.00),(2,2,'2017-02-01',85,460139.00),(3,3,'1980-01-04',981,718474.00),(4,4,'2014-01-06',805,923235.00),(5,1,'2020-05-24',580,600696.00),(6,2,'2010-03-17',414,391857.00),(7,3,'2012-12-13',558,817908.00),(8,4,'2014-03-20',73,705550.00),(9,1,'2006-03-03',293,297732.00),(10,2,'1980-05-10',465,190081.00),(11,3,'2002-08-07',317,92161.00),(12,4,'1999-08-05',312,590302.00),(13,1,'1986-08-25',74,843001.00),(14,2,'2015-04-20',500,878078.00),(15,3,'2009-03-08',937,225552.00),(16,4,'1988-12-07',577,581694.00),(17,1,'1983-01-04',646,235091.00),(18,2,'1994-05-29',166,737295.00),(19,3,'1970-06-27',81,791656.00),(20,4,'2011-01-31',807,851125.00),(21,1,'1970-06-06',36,706037.00),(22,2,'1979-09-26',908,674694.00),(23,3,'2019-08-12',464,620660.00),(24,4,'1987-10-03',540,509459.00),(25,1,'2021-01-01',563,658195.00),(26,2,'2020-05-28',893,257246.00),(27,3,'1994-02-01',176,779608.00),(28,4,'1997-02-12',56,392212.00),(29,1,'1984-12-11',418,887172.00),(30,2,'1992-07-02',335,329598.00),(31,3,'1992-08-13',780,708797.00),(32,4,'1976-03-11',643,679214.00),(33,1,'2017-07-09',150,944434.00),(34,2,'2012-03-24',64,239055.00),(35,3,'1977-05-06',920,929417.00),(36,4,'1997-05-13',298,142062.00),(37,1,'1973-11-26',932,626651.00),(38,2,'1970-03-14',75,733214.00),(39,3,'1983-05-23',829,668472.00),(40,4,'1972-09-30',621,845210.00),(41,1,'2012-09-20',502,106048.00),(42,2,'1976-04-21',721,232235.00),(43,3,'2011-10-31',552,851495.00),(44,4,'1983-09-12',486,134823.00),(45,1,'1979-11-26',650,408535.00),(46,2,'2017-10-15',656,629537.00),(47,3,'1978-06-05',215,374061.00),(48,4,'1999-04-21',445,306894.00),(49,1,'2002-07-26',983,690654.00),(50,2,'2007-03-10',457,615434.00),(51,3,'2011-09-07',415,800005.00),(52,4,'2019-03-04',380,273440.00),(53,1,'1998-12-01',174,589927.00),(54,2,'2011-11-28',55,685276.00),(55,3,'1987-09-16',666,43968.00),(56,4,'2002-06-18',883,509404.00),(57,1,'1999-05-01',103,608689.00),(58,2,'1991-11-24',289,689040.00),(59,3,'1990-06-08',98,715728.00),(60,4,'1993-03-21',300,481953.00),(61,1,'2005-10-10',349,465056.00),(62,2,'1989-03-05',201,46481.00),(63,3,'1981-10-07',739,31760.00),(64,4,'1979-02-20',421,792881.00),(65,1,'1977-10-02',520,530012.00),(66,2,'2017-02-03',595,354426.00),(67,3,'1992-10-11',760,614070.00),(68,4,'1983-08-29',494,434011.00),(69,1,'1995-04-29',167,861785.00),(70,2,'2019-05-06',25,810662.00),(71,3,'2011-06-20',648,98017.00),(72,4,'1973-03-25',269,302988.00),(73,1,'1991-11-09',225,749618.00),(74,2,'2019-10-23',624,654661.00),(75,3,'1997-12-22',783,872200.00),(76,4,'1987-11-05',777,381341.00),(77,1,'1981-12-15',734,632303.00),(78,2,'1993-08-04',531,713416.00),(79,3,'2002-07-05',803,647467.00),(80,4,'1986-08-22',368,943872.00),(81,1,'2014-07-18',874,348133.00),(82,2,'1991-06-20',282,504213.00),(83,3,'2016-07-21',309,282083.00),(84,4,'1983-12-16',35,611735.00),(85,1,'2012-04-06',278,417506.00),(86,2,'2000-01-01',451,227403.00),(87,3,'2006-11-07',697,365986.00),(88,4,'2004-01-27',731,109152.00),(89,1,'1982-09-25',582,59012.00),(90,2,'2005-12-01',91,503005.00),(91,3,'1997-05-29',140,91976.00),(92,4,'2001-06-08',488,666588.00),(93,1,'1985-10-17',778,211502.00),(94,2,'2016-05-25',592,186046.00),(95,3,'1984-08-02',294,59840.00),(96,4,'1994-04-04',688,561968.00),(97,1,'1984-12-11',182,789868.00),(98,2,'2016-04-19',4,959039.00),(99,3,'2019-09-01',603,179699.00),(100,4,'1977-12-07',591,233425.00),(101,1,'1995-01-11',652,461493.00),(102,2,'1980-04-26',698,140575.00),(103,3,'1972-07-21',95,952942.00),(104,4,'2003-06-11',771,407502.00),(105,1,'1999-10-31',986,290474.00),(106,2,'2003-02-14',350,88256.00),(107,3,'2000-01-24',229,776774.00),(108,4,'1978-06-14',548,929187.00),(109,1,'2019-09-09',80,71542.00),(110,2,'1977-11-25',810,442255.00),(111,3,'1994-06-02',651,633692.00),(112,4,'1993-08-01',861,78456.00),(113,1,'2015-11-17',13,805124.00),(114,2,'2001-08-01',537,490098.00),(115,3,'1996-12-20',503,478708.00),(116,4,'1993-04-16',308,112597.00),(117,1,'1981-04-18',227,652533.00),(118,2,'1974-04-08',291,306857.00),(119,3,'1998-10-11',677,78403.00),(120,4,'1972-05-25',896,84041.00),(121,1,'2009-12-15',606,218499.00),(122,2,'1997-08-19',561,287362.00),(123,3,'2008-07-11',287,113856.00),(124,4,'1974-08-13',333,801375.00),(125,1,'1986-03-27',126,442368.00),(126,2,'1983-08-16',809,95934.00),(127,3,'2001-11-27',38,502692.00),(128,4,'2009-11-02',528,807386.00),(129,1,'2001-07-02',374,985030.00),(130,2,'1979-09-13',316,381577.00),(131,3,'2018-08-27',482,758288.00),(132,4,'1982-02-14',214,552467.00),(133,1,'2015-06-20',142,336635.00),(134,2,'1975-04-22',857,562183.00),(135,3,'1995-07-08',141,469552.00),(136,4,'1987-10-23',231,777744.00),(137,1,'1990-10-12',956,401261.00),(138,2,'2000-03-02',408,256685.00),(139,3,'1979-11-07',993,575565.00),(140,4,'2007-09-23',413,628399.00),(141,1,'2000-10-17',59,396153.00),(142,2,'1979-06-03',41,740818.00),(143,3,'1979-12-19',751,931036.00),(144,4,'1986-02-04',804,161443.00),(145,1,'1981-10-21',837,997372.00),(146,2,'1977-12-20',962,334140.00),(147,3,'1988-09-01',559,891613.00),(148,4,'1997-12-15',454,709526.00),(149,1,'2012-04-17',900,634820.00),(150,2,'1979-08-16',609,98658.00),(151,3,'1986-10-04',923,628441.00),(152,4,'1994-11-26',941,158332.00),(153,1,'2012-12-18',397,858557.00),(154,2,'2008-05-30',37,719263.00),(155,3,'1986-09-13',124,167600.00),(156,4,'1996-02-20',259,346570.00),(157,1,'1992-02-28',754,827542.00),(158,2,'1982-03-29',79,620903.00),(159,3,'1998-09-12',891,789779.00),(160,4,'2002-01-11',237,546997.00),(161,1,'1971-12-16',657,431175.00),(162,2,'2015-09-27',860,762819.00),(163,3,'2017-08-29',97,671718.00),(164,4,'2003-10-26',545,918235.00),(165,1,'1985-07-08',161,17152.00),(166,2,'2018-09-04',169,544974.00),(167,3,'1996-11-24',613,663536.00),(168,4,'2011-02-02',198,306712.00),(169,1,'2010-03-22',440,106388.00),(170,2,'2002-01-29',146,541086.00),(171,3,'2003-07-05',358,497405.00),(172,4,'1971-08-06',533,678840.00),(173,1,'2021-02-07',820,561559.00),(174,2,'1997-05-22',840,579960.00),(175,3,'1997-04-19',224,105298.00),(176,4,'2000-03-17',530,974932.00),(177,1,'1993-11-01',631,663743.00),(178,2,'1991-07-16',33,420327.00),(179,3,'1992-12-09',990,541314.00),(180,4,'1986-12-27',355,511244.00),(181,1,'1997-07-13',938,541098.00),(182,2,'1975-11-24',985,613696.00),(183,3,'2000-11-06',205,756963.00),(184,4,'2017-12-02',958,145112.00),(185,1,'1974-07-02',903,982979.00),(186,2,'1990-01-13',839,729239.00),(187,3,'2012-07-21',441,636522.00),(188,4,'2010-06-16',945,436251.00),(189,1,'2005-06-06',514,598180.00),(190,2,'1979-03-22',439,391003.00),(191,3,'1997-09-08',654,485151.00),(192,4,'1998-12-04',155,448062.00),(193,1,'1977-08-31',165,992933.00),(194,2,'1975-02-06',748,219814.00),(195,3,'1990-08-13',170,894285.00),(196,4,'1995-03-15',841,650950.00),(197,1,'1997-10-23',853,195782.00),(198,2,'2019-12-23',490,245722.00),(199,3,'1974-07-23',755,717853.00),(200,4,'1987-08-07',638,606518.00);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_cost`
--

DROP TABLE IF EXISTS `plan_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_cost` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `comment` varchar(245) DEFAULT NULL,
  `dateplan` date NOT NULL,
  `sub_articles_id` int unsigned NOT NULL,
  `plan_sum` float(15,2) unsigned NOT NULL,
  `event_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_plan_cost_sub_articles1_idx` (`sub_articles_id`),
  KEY `fk_plan_cost_event1_idx` (`event_id`),
  CONSTRAINT `fk_plan_cost_event1` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`),
  CONSTRAINT `fk_plan_cost_sub_articles1` FOREIGN KEY (`sub_articles_id`) REFERENCES `sub_articles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_cost`
--

LOCK TABLES `plan_cost` WRITE;
/*!40000 ALTER TABLE `plan_cost` DISABLE KEYS */;
INSERT INTO `plan_cost` VALUES (1,'Комментарий 1','1989-06-06',1,300000.00,6),(2,'Комментарий 2','1978-01-12',1,250000.00,9),(3,'Комментарий 3','2003-08-07',3,150000.00,5),(4,'Комментарий 4','2013-01-29',4,100000.00,8),(5,'Комментарий 5','2006-05-10',5,380000.00,6),(6,'Комментарий 6','1973-09-09',6,500000.00,3),(7,'Комментарий 7','2008-02-03',7,400000.00,6),(8,'Комментарий 8','2018-04-15',8,120000.00,3),(9,'Комментарий 9','1973-07-22',9,1000000.00,4),(10,'Комментарий 10','1986-11-19',10,40000.00,3),(11,'Комментарий 11','2021-01-10',10,205000.00,8),(12,'Комментарий 12','2021-02-11',12,125000.00,5),(13,'Комментарий 13','2021-03-23',13,650000.00,8),(14,'Комментарий 14','2021-04-25',14,700000.00,5),(15,'Комментарий 15','2021-05-01',15,240000.00,10);
/*!40000 ALTER TABLE `plan_cost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile` (
  `user_id` int unsigned NOT NULL,
  `passwrd_hash` char(64) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_profile_user1_idx` (`user_id`),
  CONSTRAINT `fk_profile_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (1,'f8ad5e584ba1dfad1a3519bd8e8626a7707e0130'),(2,'8b72c1ce3e17e9f9f7f1245dd0c31dd5ba592339'),(3,'f58f9ad11d05f03267c6f4c7a5b0ea69e1cf9196'),(4,'3ec654c0be244ef9885ce1469133368397b21a70'),(5,'73a02aa8bde850b2952980cca8c0558e6cfa46a3'),(6,'c4bc9204e3626720498108e27f0ecd77534f3b5d'),(7,'73f44937db09e9d62d7588938f1aac947168ac92'),(8,'694ba4714d8a6877fc4626408830f7ce25dcb8d7'),(9,'e86aa2d023b1b92cc39ec8c83bd18a1aebc25872'),(10,'50ea9e6fbffbbbc434f2ec67b46f04d08d7f5069');
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record`
--

DROP TABLE IF EXISTS `record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `record` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `profile_user_id` int unsigned NOT NULL,
  `payment_id` int unsigned NOT NULL,
  `firma_id` int unsigned NOT NULL,
  `file_id` int unsigned DEFAULT NULL,
  `comment` varchar(245) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_record_payment1_idx` (`payment_id`),
  KEY `fk_record_organization1_idx` (`firma_id`),
  KEY `fk_record_file1_idx` (`file_id`),
  KEY `fk_record_profile1_idx` (`profile_user_id`),
  CONSTRAINT `fk_record_file1` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`),
  CONSTRAINT `fk_record_organization1` FOREIGN KEY (`firma_id`) REFERENCES `firma` (`id`),
  CONSTRAINT `fk_record_payment1` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`),
  CONSTRAINT `fk_record_profile1` FOREIGN KEY (`profile_user_id`) REFERENCES `profile` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record`
--

LOCK TABLES `record` WRITE;
/*!40000 ALTER TABLE `record` DISABLE KEYS */;
INSERT INTO `record` VALUES (1,1,1,1,1,NULL),(2,2,2,2,2,NULL),(3,3,3,3,3,NULL),(4,4,4,4,4,NULL),(5,5,5,5,5,NULL),(6,6,6,6,6,NULL),(7,7,7,7,7,NULL),(8,8,8,8,8,NULL),(9,9,9,9,9,NULL),(10,10,10,10,10,NULL),(11,1,11,11,11,NULL),(12,2,12,12,12,NULL),(13,3,13,13,13,NULL),(14,4,14,14,14,NULL),(15,5,15,15,15,NULL),(16,6,16,16,16,NULL),(17,7,17,17,17,NULL),(18,8,18,18,18,NULL),(19,9,19,19,19,NULL),(20,10,20,20,20,NULL),(21,1,21,21,21,NULL),(22,2,22,22,22,NULL),(23,3,23,23,23,NULL),(24,4,24,24,24,NULL),(25,5,25,25,25,NULL),(26,6,26,26,26,NULL),(27,7,27,27,27,NULL),(28,8,28,28,28,NULL),(29,9,29,29,29,NULL),(30,10,30,30,30,NULL),(31,1,31,31,31,NULL),(32,2,32,32,32,NULL),(33,3,33,33,33,NULL),(34,4,34,34,34,NULL),(35,5,35,35,35,NULL),(36,6,36,36,36,NULL),(37,7,37,37,37,NULL),(38,8,38,38,38,NULL),(39,9,39,39,39,NULL),(40,10,40,40,40,NULL),(41,1,41,41,41,NULL),(42,2,42,42,42,NULL),(43,3,43,43,43,NULL),(44,4,44,44,44,NULL),(45,5,45,45,45,NULL),(46,6,46,46,46,NULL),(47,7,47,47,47,NULL),(48,8,48,48,48,NULL),(49,9,49,49,49,NULL),(50,10,50,50,50,NULL),(51,1,51,51,1,NULL),(52,2,52,52,2,NULL),(53,3,53,53,3,NULL),(54,4,54,54,4,NULL),(55,5,55,55,5,NULL),(56,6,56,56,6,NULL),(57,7,57,57,7,NULL),(58,8,58,58,8,NULL),(59,9,59,59,9,NULL),(60,10,60,60,10,NULL),(61,1,61,61,11,NULL),(62,2,62,62,12,NULL),(63,3,63,63,13,NULL),(64,4,64,64,14,NULL),(65,5,65,65,15,NULL),(66,6,66,66,16,NULL),(67,7,67,67,17,NULL),(68,8,68,68,18,NULL),(69,9,69,69,19,NULL),(70,10,70,70,20,NULL),(71,1,71,71,21,NULL),(72,2,72,72,22,NULL),(73,3,73,73,23,NULL),(74,4,74,74,24,NULL),(75,5,75,75,25,NULL),(76,6,76,76,26,NULL),(77,7,77,77,27,NULL),(78,8,78,78,28,NULL),(79,9,79,79,29,NULL),(80,10,80,80,30,NULL),(81,1,81,81,31,NULL),(82,2,82,82,32,NULL),(83,3,83,83,33,NULL),(84,4,84,84,34,NULL),(85,5,85,85,35,NULL),(86,6,86,86,36,NULL),(87,7,87,87,37,NULL),(88,8,88,88,38,NULL),(89,9,89,89,39,NULL),(90,10,90,90,40,NULL),(91,1,91,91,41,NULL),(92,2,92,92,42,NULL),(93,3,93,93,43,NULL),(94,4,94,94,44,NULL),(95,5,95,95,45,NULL),(96,6,96,96,46,NULL),(97,7,97,97,47,NULL),(98,8,98,98,48,NULL),(99,9,99,99,49,NULL),(100,10,100,100,50,NULL),(101,1,101,1,1,NULL),(102,2,102,2,2,NULL),(103,3,103,3,3,NULL),(104,4,104,4,4,NULL),(105,5,105,5,5,NULL),(106,6,106,6,6,NULL),(107,7,107,7,7,NULL),(108,8,108,8,8,NULL),(109,9,109,9,9,NULL),(110,10,110,10,10,NULL),(111,1,111,11,11,NULL),(112,2,112,12,12,NULL),(113,3,113,13,13,NULL),(114,4,114,14,14,NULL),(115,5,115,15,15,NULL),(116,6,116,16,16,NULL),(117,7,117,17,17,NULL),(118,8,118,18,18,NULL),(119,9,119,19,19,NULL),(120,10,120,20,20,NULL),(121,1,121,21,21,NULL),(122,2,122,22,22,NULL),(123,3,123,23,23,NULL),(124,4,124,24,24,NULL),(125,5,125,25,25,NULL),(126,6,126,26,26,NULL),(127,7,127,27,27,NULL),(128,8,128,28,28,NULL),(129,9,129,29,29,NULL),(130,10,130,30,30,NULL),(131,1,131,31,31,NULL),(132,2,132,32,32,NULL),(133,3,133,33,33,NULL),(134,4,134,34,34,NULL),(135,5,135,35,35,NULL),(136,6,136,36,36,NULL),(137,7,137,37,37,NULL),(138,8,138,38,38,NULL),(139,9,139,39,39,NULL),(140,10,140,40,40,NULL),(141,1,141,41,41,NULL),(142,2,142,42,42,NULL),(143,3,143,43,43,NULL),(144,4,144,44,44,NULL),(145,5,145,45,45,NULL),(146,6,146,46,46,NULL),(147,7,147,47,47,NULL),(148,8,148,48,48,NULL),(149,9,149,49,49,NULL),(150,10,150,50,50,NULL),(151,1,151,51,1,NULL),(152,2,152,52,2,NULL),(153,3,153,53,3,NULL),(154,4,154,54,4,NULL),(155,5,155,55,5,NULL),(156,6,156,56,6,NULL),(157,7,157,57,7,NULL),(158,8,158,58,8,NULL),(159,9,159,59,9,NULL),(160,10,160,60,10,NULL),(161,1,161,61,11,NULL),(162,2,162,62,12,NULL),(163,3,163,63,13,NULL),(164,4,164,64,14,NULL),(165,5,165,65,15,NULL),(166,6,166,66,16,NULL),(167,7,167,67,17,NULL),(168,8,168,68,18,NULL),(169,9,169,69,19,NULL),(170,10,170,70,20,NULL),(171,1,171,71,21,NULL),(172,2,172,72,22,NULL),(173,3,173,73,23,NULL),(174,4,174,74,24,NULL),(175,5,175,75,25,NULL),(176,6,176,76,26,NULL),(177,7,177,77,27,NULL),(178,8,178,78,28,NULL),(179,9,179,79,29,NULL),(180,10,180,80,30,NULL),(181,1,181,81,31,NULL),(182,2,182,82,32,NULL),(183,3,183,83,33,NULL),(184,4,184,84,34,NULL),(185,5,185,85,35,NULL),(186,6,186,86,36,NULL),(187,7,187,87,37,NULL),(188,8,188,88,38,NULL),(189,9,189,89,39,NULL),(190,10,190,90,40,NULL),(191,1,191,91,41,NULL),(192,2,192,92,42,NULL),(193,3,193,93,43,NULL),(194,4,194,94,44,NULL),(195,5,195,95,45,NULL),(196,6,196,96,46,NULL),(197,7,197,97,47,NULL),(198,8,198,98,48,NULL),(199,9,199,99,49,NULL),(200,10,200,100,50,NULL);
/*!40000 ALTER TABLE `record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `sample_article`
--

DROP TABLE IF EXISTS `sample_article`;
/*!50001 DROP VIEW IF EXISTS `sample_article`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `sample_article` AS SELECT 
 1 AS `id`,
 1 AS `chapter`,
 1 AS `article`,
 1 AS `sub_article`,
 1 AS `plan_sum`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `sample_balance`
--

DROP TABLE IF EXISTS `sample_balance`;
/*!50001 DROP VIEW IF EXISTS `sample_balance`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `sample_balance` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `date_event`,
 1 AS `lecturer`,
 1 AS `direction`,
 1 AS `comment`,
 1 AS `balance`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `sample_fact_cost`
--

DROP TABLE IF EXISTS `sample_fact_cost`;
/*!50001 DROP VIEW IF EXISTS `sample_fact_cost`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `sample_fact_cost` AS SELECT 
 1 AS `id`,
 1 AS `summa`,
 1 AS `sub_articles_receipt`,
 1 AS `name_event_receipt`,
 1 AS `comment`,
 1 AS `sub_article_charge`,
 1 AS `name_event_charge`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sub_articles`
--

DROP TABLE IF EXISTS `sub_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_articles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(145) NOT NULL,
  `article_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_sub_articles_article1_idx` (`article_id`),
  CONSTRAINT `fk_sub_articles_article1` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_articles`
--

LOCK TABLES `sub_articles` WRITE;
/*!40000 ALTER TABLE `sub_articles` DISABLE KEYS */;
INSERT INTO `sub_articles` VALUES (1,'Подзатрата 01',1),(2,'Подзатрата 02',1),(3,'Подзатрата 03',3),(4,'Подзатрата 04',4),(5,'Подзатрата 05',5),(6,'Подзатрата 06',6),(7,'Подзатрата 07',7),(8,'Подзатрата 08',8),(9,'Подзатрата 09',8),(10,'Подзатрата 10',10),(11,'Подзатрата 11',11),(12,'Подзатрата 12',12),(13,'Подзатрата 13',13),(14,'Подзатрата 14',14),(15,'Подзатрата 15',15);
/*!40000 ALTER TABLE `sub_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_receipt`
--

DROP TABLE IF EXISTS `type_receipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_receipt` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_receipt`
--

LOCK TABLES `type_receipt` WRITE;
/*!40000 ALTER TABLE `type_receipt` DISABLE KEYS */;
INSERT INTO `type_receipt` VALUES (1,'Карты'),(3,'ПКО '),(4,'Платежка'),(2,'РКО');
/*!40000 ALTER TABLE `type_receipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Иван'),(2,'Андрей'),(3,'Алексей'),(4,'Ольга'),(5,'Игорь'),(6,'Елена'),(7,'Максим'),(8,'Сергей'),(9,'Ирина'),(10,'Анатолий');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mydb'
--

--
-- Dumping routines for database 'mydb'
--
/*!50003 DROP FUNCTION IF EXISTS `Balance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Balance`(id_int int) RETURNS float
    READS SQL DATA
BEGIN	
	DECLARE balance float;
    SET balance = (SELECT
		((select sum(summa) from mydb.fact_cost fc where fc.event_id_receipt = ev.id group by ev.id) + (select -sum(summa) from mydb.fact_cost fc where fc.event_id_charge = ev.id group by ev.id))
	FROM mydb.event ev
    Where ev.id = id_int);
RETURN balance;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Balance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Balance`(IN id_int int)
BEGIN
SELECT
	((select sum(summa) from mydb.fact_cost fc where fc.event_id_receipt = ev.id group by ev.id) + (select -sum(summa) from mydb.fact_cost fc where fc.event_id_charge = ev.id group by ev.id)) as fact_balance,
    (Select sum(plan_sum) From plan_cost where event_id=ev.id group by ev.id) as plan_balance    
FROM mydb.event ev
Where ev.id = id_int;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `sample_article`
--

/*!50001 DROP VIEW IF EXISTS `sample_article`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sample_article` AS select `sar`.`id` AS `id`,`ar`.`chapter` AS `chapter`,`ar`.`article` AS `article`,`sar`.`name` AS `sub_article`,ifnull((select `plan_cost`.`plan_sum` from `plan_cost` where (`plan_cost`.`sub_articles_id` = `sar`.`id`) order by `plan_cost`.`dateplan` desc limit 1),0) AS `plan_sum` from (`sub_articles` `sar` join (select `art`.`id` AS `id`,`ch`.`name` AS `chapter`,`art`.`name` AS `article` from (`article` `art` left join `chapter` `ch` on((`ch`.`id` = `art`.`chapter_id`)))) `ar` on((`ar`.`id` = `sar`.`article_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sample_balance`
--

/*!50001 DROP VIEW IF EXISTS `sample_balance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sample_balance` AS select `event`.`id` AS `id`,`event`.`name` AS `name`,`event`.`date_event` AS `date_event`,(select concat(`lecturer`.`name`,' ',`lecturer`.`surname`) from `lecturer` where (`lecturer`.`id` = `event`.`lecturer_id`)) AS `lecturer`,(select `direction`.`name` from `direction` where (`direction`.`id` = `event`.`direction_ig`)) AS `direction`,`event`.`comment_event` AS `comment`,((select sum(`fc`.`summa`) from `fact_cost` `fc` where (`fc`.`event_id_receipt` = `event`.`id`) group by `event`.`id`) + (select -(sum(`fc`.`summa`)) from `fact_cost` `fc` where (`fc`.`event_id_charge` = `event`.`id`) group by `event`.`id`)) AS `balance` from `event` order by ((select sum(`fc`.`summa`) from `fact_cost` `fc` where (`fc`.`event_id_receipt` = `event`.`id`) group by `event`.`id`) + (select -(sum(`fc`.`summa`)) from `fact_cost` `fc` where (`fc`.`event_id_charge` = `event`.`id`) group by `event`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sample_fact_cost`
--

/*!50001 DROP VIEW IF EXISTS `sample_fact_cost`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sample_fact_cost` AS select `fc`.`id` AS `id`,`fc`.`summa` AS `summa`,`sa_1`.`name` AS `sub_articles_receipt`,`er_1`.`name` AS `name_event_receipt`,`fc`.`comment` AS `comment`,`sa_2`.`name` AS `sub_article_charge`,`er_2`.`name` AS `name_event_charge` from ((((`fact_cost` `fc` left join `sub_articles` `sa_1` on((`fc`.`sub_articles_id_receipt` = `sa_1`.`id`))) left join `sub_articles` `sa_2` on((`fc`.`sub_articles_id_charge` = `sa_2`.`id`))) left join `event` `er_1` on((`fc`.`event_id_receipt` = `er_1`.`id`))) left join `event` `er_2` on((`fc`.`event_id_charge` = `er_2`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-11 15:40:33
