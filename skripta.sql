-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: fudbal_rezultati
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.22.04.1

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
-- Current Database: `fudbal_rezultati`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `fudbal_rezultati` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `fudbal_rezultati`;

--
-- Table structure for table `boja`
--

DROP TABLE IF EXISTS `boja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boja` (
  `idBoja` int NOT NULL AUTO_INCREMENT,
  `primarnaBoja` char(7) NOT NULL,
  `sekundarnaBoja` char(7) DEFAULT NULL,
  `naziv` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idBoja`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boja`
--

LOCK TABLES `boja` WRITE;
/*!40000 ALTER TABLE `boja` DISABLE KEYS */;
INSERT INTO `boja` (`idBoja`, `primarnaBoja`, `sekundarnaBoja`, `naziv`) VALUES (1,'#ff0000','#0000ff','Crveno-plava'),(2,'#0000ff','#000000','Plavo-bijela'),(3,'#ff0000','#000000','Crveno-bijela'),(4,'#ffffff','#000000','Crno-bijela'),(5,'#753632','#000000','Bordo-bijela'),(6,'#0e8ae3',NULL,'Svijetloplava'),(7,'#0e8ae3','#000000','Svijetloplavo-bijela');
/*!40000 ALTER TABLE `boja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clan`
--

DROP TABLE IF EXISTS `clan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clan` (
  `idKlub` int NOT NULL,
  `idLiga` int NOT NULL,
  PRIMARY KEY (`idKlub`,`idLiga`),
  KEY `FK_clan_liga_idx` (`idLiga`),
  CONSTRAINT `FK_clan_klub` FOREIGN KEY (`idKlub`) REFERENCES `klub` (`idKlub`),
  CONSTRAINT `FK_clan_liga` FOREIGN KEY (`idLiga`) REFERENCES `liga` (`idLiga`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clan`
--

LOCK TABLES `clan` WRITE;
/*!40000 ALTER TABLE `clan` DISABLE KEYS */;
INSERT INTO `clan` (`idKlub`, `idLiga`) VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,2),(14,2),(15,2),(16,2),(1,3),(2,3),(13,3),(14,3),(16,3),(17,3),(18,3),(19,3);
/*!40000 ALTER TABLE `clan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `clan_prikaz`
--

DROP TABLE IF EXISTS `clan_prikaz`;
/*!50001 DROP VIEW IF EXISTS `clan_prikaz`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `clan_prikaz` AS SELECT 
 1 AS `Klub`,
 1 AS `Liga`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `drzava`
--

DROP TABLE IF EXISTS `drzava`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drzava` (
  `idDrzava` int NOT NULL AUTO_INCREMENT,
  `drzava` varchar(100) NOT NULL,
  `kod` varchar(6) NOT NULL,
  PRIMARY KEY (`idDrzava`),
  UNIQUE KEY `kod_UNIQUE` (`kod`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drzava`
--

LOCK TABLES `drzava` WRITE;
/*!40000 ALTER TABLE `drzava` DISABLE KEYS */;
INSERT INTO `drzava` (`idDrzava`, `drzava`, `kod`) VALUES (1,'Bosna i Hercegovina','BIH'),(2,'Srbija','SRB'),(3,'Albanija','ALB'),(4,'Argentina','ARG'),(5,'Jermenija','ARM'),(6,'Alžir','DZA'),(7,'Australija','AUS'),(8,'Austrija','AUT'),(9,'Azerbejdžan','AZE'),(10,'Bjelorusija','BLR'),(11,'Belgija','BEL'),(12,'Brazil','BRA'),(13,'Bugarska','BGR'),(14,'Kamerun','CMR'),(15,'Kanada','CAN'),(16,'Kolumbija','COL'),(17,'Obala Slonovače','CIV'),(18,'Hrvatska','HRV'),(19,'Francuska','FRA'),(20,'Gabon','GAB'),(21,'Njemačka','GER'),(22,'Grčka','GRC'),(23,'Mađarska','HUN'),(24,'Izrael','ISR'),(25,'Italija','ITA'),(26,'Južna Koreja','KOR'),(27,'Crna Gora','MNE'),(28,'Sjeverna Makedonija','MKD'),(29,'Portugal','PRT'),(30,'Poljska','POL'),(31,'Rusija','RUS'),(32,'Slovenija','SVN'),(33,'Španija','ESP'),(34,'Turska','TUR'),(35,'Ukrajina','UKR'),(36,'Sjedinjene Američke Države','USA'),(37,'Venecuela','VEN'),(38,'Burkina Faso','BFA'),(39,'Gana','GHA'),(40,'Gruzija','GEO'),(41,'Solomonova Ostrva','SLB'),(42,'Nigerija','NGA'),(43,'Luksemburg','LUX'),(44,'Saudijska Arabija','SAU'),(45,'Danska','DNK'),(46,'Senegal','SEN'),(47,'Švedska','SWE'),(48,'Gambia','GMB'),(49,'Holandija','NLD'),(50,'Kurasao','CUW'),(51,'Kongo','COD'),(52,'Norveška','NOR'),(53,'Zambia','ZMB'),(54,'Novi Zeland','NZL'),(55,'Jamajka','JAM');
/*!40000 ALTER TABLE `drzava` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gol`
--

DROP TABLE IF EXISTS `gol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gol` (
  `idGol` int NOT NULL AUTO_INCREMENT,
  `idUtakmica` int NOT NULL,
  `idKlub` int NOT NULL,
  `idIgrac` int NOT NULL,
  `minut` int NOT NULL,
  PRIMARY KEY (`idGol`),
  KEY `fk_gol_klub_idx` (`idKlub`),
  KEY `FK_gol_fudbaler_idx` (`idIgrac`,`idUtakmica`),
  CONSTRAINT `FK_gol_igrac_na_utakmici` FOREIGN KEY (`idIgrac`, `idUtakmica`) REFERENCES `igrac_na_utakmici` (`idIgrac`, `idUtakmica`),
  CONSTRAINT `FK_gol_klub` FOREIGN KEY (`idKlub`) REFERENCES `klub` (`idKlub`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gol`
--

LOCK TABLES `gol` WRITE;
/*!40000 ALTER TABLE `gol` DISABLE KEYS */;
INSERT INTO `gol` (`idGol`, `idUtakmica`, `idKlub`, `idIgrac`, `minut`) VALUES (1,1,1,12,23),(2,1,1,26,91),(3,2,11,101,13),(4,2,2,32,14),(5,2,2,38,36),(6,2,2,38,55),(7,3,4,72,60),(8,3,10,98,74),(9,4,12,105,3),(10,6,7,86,45),(11,6,7,86,72),(12,7,12,106,45),(13,8,10,96,12),(14,8,11,102,33),(15,8,10,98,51),(16,9,3,57,51),(17,9,7,85,70),(18,9,7,86,90),(19,10,6,82,21),(20,11,2,34,18),(21,11,2,32,42),(22,12,1,12,6),(23,12,1,29,8),(24,12,1,12,67);
/*!40000 ALTER TABLE `gol` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `gol_BEFORE_INSERT` BEFORE INSERT ON `gol` FOR EACH ROW BEGIN
  declare karton_minut int;
  declare izmjena_minut int;
  select minut into karton_minut
  from karton
  where idIgrac = new.idIgrac and idUtakmica = new.idUtakmica and idKarton_tip in (2, 3);

  select minut into izmjena_minut
  from izmjena
  where idIgracIzlazi = new.idIgrac and idUtakmica = new.idUtakmica;
  
  if (karton_minut is not null and new.minut >= karton_minut) or 
    (izmjena_minut is not null and new.minut >= izmjena_minut) then
      signal sqlstate '45000'
      set message_text = 'Igrac sa crvenim ili drugim zutim kartonom ne moze postici gol';
  end if;
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `inkrement_golova` AFTER INSERT ON `gol` FOR EACH ROW BEGIN
  declare golDomaci int;
  declare golGosti int;
  
  select goloviDomaci into golDomaci
  from utakmica
  where idUtakmica = new.idUtakmica;

  select goloviGosti into golGosti
  from utakmica
  where idUtakmica = new.idUtakmica;

  if new.idKlub = (select idDomaci from utakmica where idUtakmica = new.idUtakmica) then
    update utakmica set goloviDomaci = golDomaci + 1 where idUtakmica = new.idUtakmica;
  else
    update utakmica set goloviGosti = golGosti + 1 where idUtakmica = new.idUtakmica;
  end if;
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `dekrement_golova` AFTER DELETE ON `gol` FOR EACH ROW BEGIN
  declare golDomaci int;
  declare golGosti int;

  select goloviDomaci into golDomaci
  from utakmica
  where idUtakmica = old.idUtakmica;

  select goloviGosti into golGosti
  from utakmica
  where idUtakmica = old.idUtakmica;

  if old.idKlub = (select idDomaci from utakmica where idUtakmica = old.idUtakmica) then
    update utakmica set goloviDomaci = golDomaci - 1 where idUtakmica = old.idUtakmica;
  else
    update utakmica set goloviGosti = golGosti - 1 where idUtakmica = old.idUtakmica;
  end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `igrac`
--

DROP TABLE IF EXISTS `igrac`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `igrac` (
  `idIgrac` int NOT NULL AUTO_INCREMENT,
  `ime` varchar(45) NOT NULL,
  `prezime` varchar(45) NOT NULL,
  `brojDresa` int NOT NULL,
  `godine` int DEFAULT NULL,
  `idDrzava` int NOT NULL,
  `idKlub` int NOT NULL,
  `oznakaPozicije` varchar(5) NOT NULL,
  `visina` int DEFAULT NULL,
  PRIMARY KEY (`idIgrac`),
  KEY `FK_fudbaler_drzava_idx` (`idDrzava`),
  KEY `FK_igrac_klub_idx` (`idKlub`),
  KEY `FK_igrac_pozicija_idx` (`oznakaPozicije`),
  CONSTRAINT `FK_igrac_drzava` FOREIGN KEY (`idDrzava`) REFERENCES `drzava` (`idDrzava`),
  CONSTRAINT `FK_igrac_klub` FOREIGN KEY (`idKlub`) REFERENCES `klub` (`idKlub`),
  CONSTRAINT `FK_igrac_pozicija` FOREIGN KEY (`oznakaPozicije`) REFERENCES `pozicija` (`oznakaPozicije`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `igrac`
--

LOCK TABLES `igrac` WRITE;
/*!40000 ALTER TABLE `igrac` DISABLE KEYS */;
INSERT INTO `igrac` (`idIgrac`, `ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`, `visina`) VALUES (1,'Milan','Mijatović',25,36,27,1,'GK',190),(2,'Nikola','Ćetković',21,21,1,1,'GK',190),(3,'Bojan','Pavlović',1,36,2,1,'GK',190),(4,'Ranko','Jokić',3,24,2,1,'CB',NULL),(5,'Savo','Sušić',31,18,1,1,'CB',NULL),(6,'Maks','Juraj Čelić',6,27,18,1,'CB',NULL),(7,'Nikola','Pejović',4,25,2,1,'CB',NULL),(8,'Aleksandar','Subić',18,30,1,1,'LB',NULL),(9,'Sebastian','Herrera',16,28,16,1,'LB',NULL),(10,'Slobodan','Đekić',2,22,1,1,'RB',NULL),(11,'Janez','Pišek',13,25,32,1,'DM',NULL),(12,'Srđan','Grahovac',15,31,1,1,'DM',NULL),(13,'Stefan','Fićović',8,25,2,1,'CM',NULL),(14,'Jovan','Nišić',45,25,2,1,'CM',NULL),(15,'Fedor','Predragović',14,28,1,1,'CM',NULL),(16,'Roslan','Barsky',10,31,24,1,'CM',NULL),(17,'Vasilije','Terzić',29,24,27,1,'AM',NULL),(18,'Stojan','Vranješ',23,37,1,1,'AM',NULL),(19,'Alen','Jurilj',7,27,18,1,'LW',NULL),(20,'Jose','Ricardo Cortes',11,29,16,1,'LW',NULL),(21,'Jakov','Blagaić',24,23,18,1,'LW',NULL),(22,'Nemanja','Mihajlović',77,27,2,1,'LW',NULL),(23,'Enver','Kulašin',27,20,1,1,'RW',NULL),(24,'Damir','Hrelja',55,22,1,1,'RW',NULL),(25,'David','Čavić',22,20,1,1,'RW',NULL),(26,'Zoran','Kvržić',20,35,1,1,'RW',NULL),(27,'Milan','Makarić',9,28,2,1,'CF',NULL),(28,'Glanfranco','Pena',90,23,16,1,'CF',NULL),(29,'Jovo','Lukić',19,24,1,1,'CF',NULL),(30,'Marko','Marić',35,27,18,2,'GK',193),(31,'Omer','Niron',55,22,24,2,'GK',195),(32,'Nemanja','Bilbija',99,33,1,2,'CF',NULL),(33,'Dario','Čanađija',5,29,18,2,'DM',NULL),(34,'Josip','Ćorluka',6,28,1,2,'RB',NULL),(35,'Mario','Ćuze',25,24,18,2,'LW',NULL),(36,'Slobodan','Jakovljević',27,34,2,2,'CB',NULL),(37,'Ivan','Jukić',7,27,1,2,'LW',NULL),(38,'Tomislav','Kiš',10,29,18,2,'CF',NULL),(39,'Luka','Marin',2,25,18,2,'LB',NULL),(40,'Stipe','Radić',15,23,18,2,'CB',NULL),(41,'Tarik','Ramić',19,20,1,2,'CM',NULL),(42,'Andrija','Balić',14,26,18,2,'CM',NULL),(43,'Antonio','Ivančić',20,28,18,2,'AM',NULL),(44,'Anton','Maglica',77,31,18,2,'CF',NULL),(45,'Kerim','Memija',50,27,1,2,'RB',NULL),(46,'Franko','Sabljić',9,20,1,2,'CF',NULL),(47,'Muhamed','Šahinović',1,20,1,3,'GK',191),(48,'Marin','Aničić',28,34,1,3,'CB',NULL),(49,'Momir','Đuričković',44,26,27,3,'CB',NULL),(50,'Slaviša','Radović',23,30,2,3,'LB',NULL),(51,'Amar','Beganović',22,23,1,3,'RB',NULL),(52,'Edin','Juraldžija',18,22,18,3,'DM',NULL),(53,'Daniel','Avramovski',27,28,28,3,'AM',NULL),(54,'Mirza','Mustafić',98,25,1,3,'AM',NULL),(55,'Almedin','Ziljkić',77,27,1,3,'LW',NULL),(56,'Ajdin','Hasić',17,22,1,3,'RW',NULL),(57,'Adalberto','Penarada',10,26,37,3,'CF',NULL),(58,'Lovre','Rogić',39,28,18,3,'GK',190),(59,'Vinko','Soldo',24,25,18,3,'CB',NULL),(60,'Mario','Vranić',8,34,1,3,'CM',NULL),(61,'Francis','Kyeremeh',11,26,39,3,'RW',NULL),(62,'Osman','Hadžikić',31,27,8,4,'GK',186),(63,'Bruno','Oliveira',96,27,12,4,'CB',NULL),(64,'Ante','Hrkač',8,31,1,4,'CB',NULL),(65,'Klemen','Šturm',23,29,32,4,'LB',NULL),(66,'Ante','Oreč',2,22,18,4,'RB',NULL),(67,'Omar','Pršeš',7,28,1,4,'CM',NULL),(68,'Tarik','Šikalo',16,19,1,4,'CM',NULL),(69,'Edo','Vehabović',28,28,1,4,'AM',NULL),(70,'Asmir','Suljić',10,32,1,4,'LW',NULL),(71,'Giorgi','Guliashvili',9,22,40,4,'RW',NULL),(72,'Nermin','Haskić',17,34,1,4,'CF',NULL),(73,'Tomislav','Tomić',12,26,18,5,'GK',189),(74,'Ivan','Saravanja',3,27,1,5,'CB',NULL),(75,'Marko','Capan',6,19,18,5,'DM',NULL),(76,'Stephen','Chinedu',9,23,42,5,'CF',NULL),(77,'Cyrille','Kpan',15,25,38,5,'RW',NULL),(78,'Vedad','Muftić',13,22,1,6,'GK',186),(79,'Marin','Galić',24,28,1,6,'RB',NULL),(80,'Nedim','Mekić',8,28,1,6,'CM',NULL),(81,'Joseph','Amoah',26,21,39,6,'RW',NULL),(82,'Sulejman','Krpić',7,32,1,6,'CF',NULL),(83,'Elvir','Trako',17,25,1,7,'GK',NULL),(84,'Miloš','Nikolić',4,29,2,7,'CB',NULL),(85,'Srđan','Grabež',35,32,2,7,'DM',NULL),(86,'Dejan','Vidić',99,30,2,7,'CF',NULL),(87,'Franko','Kolić',72,20,18,8,'GK',NULL),(88,'Luka','Lučić',35,28,18,8,'LB',NULL),(89,'Karlo','Kamenar',10,29,18,8,'AM',NULL),(90,'Dominik','Begić',17,26,1,8,'RW',NULL),(91,'Aldin','Ceman',12,28,1,9,'GK',NULL),(92,'Marko','Čubrilo',11,25,1,9,'LB',NULL),(93,'Armin','Besagić',4,25,1,9,'DM',NULL),(94,'Anel','Hebibović',7,33,1,9,'RW',NULL),(95,'Filip','Vasilj',22,23,1,10,'GK',NULL),(96,'Riad','Suta',6,21,1,10,'CB',NULL),(97,'Marko','Musulin',23,23,18,10,'DM',NULL),(98,'Nihad','Sero',24,24,1,10,'RW',NULL),(99,'Eldin','Lolić',1,19,1,11,'GK',NULL),(100,'Mirza','Delimedjač',5,24,2,11,'CB',NULL),(101,'Huso','Karjašević',17,26,1,11,'DM',NULL),(102,'Mirzad','Mehanović',10,30,1,11,'RW',NULL),(103,'Luka','Damjanović',83,20,1,12,'GK',NULL),(104,'Stefan','Šapić',65,26,2,12,'CB',NULL),(105,'Stefan','Veličković',18,24,2,12,'RB',NULL),(106,'Krsta','Đorđević',26,30,2,12,'CF',NULL),(107,'Omri','Glazer',18,27,24,13,'GK',190),(108,'Uroš','Spajić',5,30,2,13,'CB',NULL),(109,'Mirko','Ivanić',4,30,27,13,'CM',NULL),(110,'Jean-Philippe','Krasso',17,26,17,13,'CM',NULL),(111,'Cherif','Ndiaye',9,27,46,13,'CF',NULL),(112,'In-beom','Hwang',66,27,26,13,'CM',NULL),(113,'Aleksandar','Jovanović',1,30,1,14,'GK',NULL),(114,'Svetozar','Marković',6,23,1,14,'CB',NULL),(115,'Kristijan','Belić',40,22,1,14,'DM',NULL),(116,'Bibras','Natcho',10,35,24,14,'AM',NULL),(117,'Veljko','Ilić',12,20,1,15,'GK',NULL),(118,'Nemanja','Stojić',18,25,1,15,'CB',NULL),(119,'Ifet','Đakovac',35,25,1,15,'AM',NULL),(120,'Uroš','Milovanović',9,23,1,15,'CF',NULL),(121,'Lazar','Carević',25,24,27,16,'GK',NULL),(122,'Igor','Jeličić',15,23,1,16,'CB',NULL),(123,'Andrija','Radulović',49,21,27,16,'RM',NULL),(124,'Filip','Malbašić',29,30,1,16,'LM',NULL),(125,'Ederson','Moraes',31,30,12,17,'GK',188),(126,'Nathan','Ake',6,28,49,17,'CB',NULL),(127,'Julian','Alvarez',19,23,4,17,'AM',NULL),(128,'Erling','Haaland',9,23,52,17,'CF',NULL),(129,'Manuel','Neuer',1,37,21,18,'GK',193),(130,'Alphonso','Davies',19,23,15,18,'LB',NULL),(131,'Jamal','Musiala',42,20,21,18,'AM',NULL),(132,'Kingsley','Coman',11,27,19,18,'RW',NULL),(133,'Wojciech','Szczesny',1,33,30,19,'GK',196),(134,'Adrien','Rabiot',25,28,19,19,'CM',NULL),(135,'Filip','Kostić',11,31,2,19,'LM',NULL),(136,'Dušan','Vlahović',9,23,2,19,'CF',NULL);
/*!40000 ALTER TABLE `igrac` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `igrac_na_utakmici`
--

DROP TABLE IF EXISTS `igrac_na_utakmici`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `igrac_na_utakmici` (
  `idIgrac` int NOT NULL,
  `idUtakmica` int NOT NULL,
  `uIgri` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`idIgrac`,`idUtakmica`),
  KEY `FK_igrac_na_utakmici_utakmica_idx` (`idUtakmica`),
  CONSTRAINT `fk_igrac_na_utakmici_igrac` FOREIGN KEY (`idIgrac`) REFERENCES `igrac` (`idIgrac`),
  CONSTRAINT `FK_igrac_na_utakmici_utakmica` FOREIGN KEY (`idUtakmica`) REFERENCES `utakmica` (`idUtakmica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `igrac_na_utakmici`
--

LOCK TABLES `igrac_na_utakmici` WRITE;
/*!40000 ALTER TABLE `igrac_na_utakmici` DISABLE KEYS */;
INSERT INTO `igrac_na_utakmici` (`idIgrac`, `idUtakmica`, `uIgri`) VALUES (1,1,1),(1,12,1),(4,1,1),(6,1,1),(8,12,1),(9,1,1),(12,1,1),(12,12,1),(14,1,0),(17,1,0),(24,1,1),(25,1,1),(26,1,1),(29,1,0),(29,12,1),(30,2,1),(30,11,1),(32,2,1),(32,11,1),(34,11,1),(38,2,1),(40,2,1),(47,1,1),(47,9,1),(48,1,1),(49,1,1),(50,1,1),(51,1,1),(52,1,1),(52,9,1),(53,1,1),(54,1,1),(55,1,1),(56,1,1),(57,1,0),(57,9,1),(62,3,1),(62,7,1),(63,3,1),(63,7,1),(71,7,1),(72,3,1),(72,7,1),(73,5,1),(73,12,1),(74,5,1),(75,5,1),(76,5,1),(77,5,1),(78,6,1),(78,10,1),(79,6,0),(80,6,1),(81,6,1),(82,6,1),(82,10,1),(83,6,0),(83,9,1),(84,6,1),(85,6,1),(85,9,1),(86,6,1),(86,9,1),(87,5,1),(87,11,1),(88,5,1),(89,5,1),(89,11,1),(90,5,1),(91,4,1),(91,10,1),(92,4,1),(92,10,1),(93,4,1),(94,4,1),(95,3,1),(95,8,1),(96,3,1),(96,8,1),(97,3,1),(98,3,1),(98,8,1),(99,2,1),(99,8,1),(100,2,1),(101,2,1),(102,2,1),(102,8,1),(103,4,1),(103,7,1),(104,4,1),(104,7,1),(105,4,1),(105,7,1),(106,4,1),(106,7,1);
/*!40000 ALTER TABLE `igrac_na_utakmici` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ogranicenje_igraca` BEFORE INSERT ON `igrac_na_utakmici` FOR EACH ROW begin
  declare klub_id int;
  declare broj_igraca int;
  select idKlub into klub_id from igrac where idIgrac = new.idIgrac;
  select count(*) into broj_igraca from igrac_na_utakmici where idUtakmica = new.idUtakmica and idIgrac in (select idIgrac from igrac where idKlub = klub_id);
  if broj_igraca >= 11 then
    signal sqlstate '45000'
    set MESSAGE_TEXT = 'Ograničenje: Maksimalno 11 igrača iz istog kluba može u jednom trenutku igrati na utakmici.';
  end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `igraci_prikaz`
--

DROP TABLE IF EXISTS `igraci_prikaz`;
/*!50001 DROP VIEW IF EXISTS `igraci_prikaz`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `igraci_prikaz` AS SELECT 
 1 AS `Ime`,
 1 AS `Prezime`,
 1 AS `BrojDresa`,
 1 AS `Godine`,
 1 AS `Klub`,
 1 AS `Drzava`,
 1 AS `Pozicija`,
 1 AS `Visina`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `izmjena`
--

DROP TABLE IF EXISTS `izmjena`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `izmjena` (
  `idizmjena` int NOT NULL AUTO_INCREMENT,
  `idIgracUlazi` int NOT NULL,
  `idIgracIzlazi` int NOT NULL,
  `idUtakmica` int NOT NULL,
  `minut` int DEFAULT NULL,
  PRIMARY KEY (`idizmjena`),
  KEY `FK_izmjena_rezervni_igrac_idx` (`idIgracUlazi`),
  KEY `FK_izmjena_igrac_na_utakmici_idx` (`idIgracIzlazi`),
  KEY `FK_izmjena_utakmica_idx` (`idUtakmica`),
  CONSTRAINT `FK_izmjena_igrac_na_utakmici` FOREIGN KEY (`idIgracIzlazi`) REFERENCES `igrac_na_utakmici` (`idIgrac`),
  CONSTRAINT `FK_izmjena_rezervni_igrac` FOREIGN KEY (`idIgracUlazi`) REFERENCES `rezervni_igrac` (`idIgrac`),
  CONSTRAINT `FK_izmjena_utakmica` FOREIGN KEY (`idUtakmica`) REFERENCES `utakmica` (`idUtakmica`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `izmjena`
--

LOCK TABLES `izmjena` WRITE;
/*!40000 ALTER TABLE `izmjena` DISABLE KEYS */;
INSERT INTO `izmjena` (`idizmjena`, `idIgracUlazi`, `idIgracIzlazi`, `idUtakmica`, `minut`) VALUES (1,13,14,1,67),(2,21,17,1,67),(3,27,29,1,80),(4,58,57,1,81);
/*!40000 ALTER TABLE `izmjena` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `izmjena_BEFORE_INSERT` BEFORE INSERT ON `izmjena` FOR EACH ROW BEGIN
  declare igrac_ulaz_igri int;
  declare igrac_izlaz_igri int;
  declare klub_ulaz int;
  declare klub_izlaz int;
  declare karton_minut int;
  declare izmjena_izlaz_count int;
  declare izmjena_ulaz_count int;
  
  select minut into karton_minut
  from karton
  where idIgrac = new.idIgracIzlazi and idUtakmica = new.idUtakmica and idKarton_tip in (2, 3);
  
  select count(*) into izmjena_izlaz_count
  from izmjena
  where idIgracIzlazi = new.idIgracIzlazi and idUtakmica = new.idUtakmica;
  
  select count(*) into izmjena_ulaz_count
  from izmjena
  where idIgracUlazi = new.idIgracUlazi and idUtakmica = new.idUtakmica;

  select uIgri into igrac_ulaz_igri from rezervni_igrac where idIgrac = new.idIgracUlazi and idUtakmica = new.idUtakmica;
  select uIgri into igrac_izlaz_igri from igrac_na_utakmici where idIgrac = new.idIgracIzlazi and idUtakmica = new.idUtakmica;

  select idKlub into klub_ulaz from igrac where idIgrac = new.idIgracUlazi;
  select idKlub into klub_izlaz from igrac where idIgrac = new.idIgracIzlazi;
  
  if (igrac_ulaz_igri is null or igrac_izlaz_igri is null or klub_ulaz <> klub_izlaz) or 
  (karton_minut is not null and new.minut >= karton_minut) or (izmjena_izlaz_count > 0) or (izmjena_ulaz_count > 0) then
    signal sqlstate '45000'
    set message_text = 'Neispravni podaci za izmjenu igraca.';
  end if;
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `izmjena_AFTER_INSERT` AFTER INSERT ON `izmjena` FOR EACH ROW BEGIN
	update igrac_na_utakmici
	set uIgri = 0
    where idIgrac = new.idIgracIzlazi and idUtakmica = new.idUtakmica;
    
	update rezervni_igrac
	set uIgri = 1
    where idIgrac = new.idIgracUlazi and idUtakmica = new.idUtakmica;
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `izmjena_AFTER_DELETE` AFTER DELETE ON `izmjena` FOR EACH ROW BEGIN
	update igrac_na_utakmici
	set uIgri = 1
    where idIgrac = old.idIgracIzlazi and idUtakmica = old.idUtakmica;
    
	update rezervni_igrac
	set uIgri = 0
    where idIgrac = old.idIgracUlazi and idUtakmica = old.idUtakmica;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `karton`
--

DROP TABLE IF EXISTS `karton`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `karton` (
  `idKarton` int NOT NULL AUTO_INCREMENT,
  `idKarton_tip` int NOT NULL,
  `idIgrac` int NOT NULL,
  `idUtakmica` int NOT NULL,
  `minut` int NOT NULL,
  `razlog` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idKarton`),
  KEY `FK_karton_igrac_na_utakmici_idx` (`idIgrac`,`idUtakmica`),
  KEY `FK_karton_karton_tip_idx` (`idKarton_tip`),
  CONSTRAINT `FK_karton_igrac_na_utakmici` FOREIGN KEY (`idIgrac`, `idUtakmica`) REFERENCES `igrac_na_utakmici` (`idIgrac`, `idUtakmica`),
  CONSTRAINT `FK_karton_karton_tip` FOREIGN KEY (`idKarton_tip`) REFERENCES `karton_tip` (`idKarton_tip`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `karton`
--

LOCK TABLES `karton` WRITE;
/*!40000 ALTER TABLE `karton` DISABLE KEYS */;
INSERT INTO `karton` (`idKarton`, `idKarton_tip`, `idIgrac`, `idUtakmica`, `minut`, `razlog`) VALUES (1,1,9,1,12,'Povlačenje za dres'),(2,1,50,1,34,'Oštar start'),(3,1,55,1,62,'Prigovor'),(4,1,63,3,44,'Simuliranje'),(5,1,83,6,87,'Odugovlačenje'),(6,2,79,6,91,'Učešće u tuči'),(7,3,83,6,91,'Učešće u tuči');
/*!40000 ALTER TABLE `karton` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `karton_BEFORE_INSERT` BEFORE INSERT ON `karton` FOR EACH ROW BEGIN
  declare karton_minut int;
  declare izmjena_minut int;
  select minut into karton_minut
  from karton
  where idIgrac = new.idIgrac and idUtakmica = new.idUtakmica and idKarton_tip in (2, 3);

  select minut into izmjena_minut
  from izmjena
  where idIgracIzlazi = new.idIgrac and idUtakmica = new.idUtakmica;
  
  if (karton_minut is not null and new.minut >= karton_minut) or 
    (izmjena_minut is not null and new.minut >= izmjena_minut) then
      signal sqlstate '45000'
      set message_text = 'Igrac nije u igri';
  end if;
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `karton_AFTER_INSERT` AFTER INSERT ON `karton` FOR EACH ROW BEGIN
  if new.idKarton_tip in (2, 3) then
    update igrac_na_utakmici
    set uIgri = 0
    where idIgrac = new.idIgrac and idUtakmica = new.idUtakmica;
  end if;
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `karton_AFTER_DELETE` AFTER DELETE ON `karton` FOR EACH ROW BEGIN
  if old.idKarton_tip in (2, 3) then
    update igrac_na_utakmici
    set uIgri = 1
    where idIgrac = old.idIgrac and idUtakmica = old.idUtakmica;
  end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `karton_tip`
--

DROP TABLE IF EXISTS `karton_tip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `karton_tip` (
  `idKarton_tip` int NOT NULL AUTO_INCREMENT,
  `tip` varchar(45) NOT NULL,
  PRIMARY KEY (`idKarton_tip`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `karton_tip`
--

LOCK TABLES `karton_tip` WRITE;
/*!40000 ALTER TABLE `karton_tip` DISABLE KEYS */;
INSERT INTO `karton_tip` (`idKarton_tip`, `tip`) VALUES (1,'Žuti karton'),(2,'Crveni karton'),(3,'Drugi žuti - crveni karton');
/*!40000 ALTER TABLE `karton_tip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `kartoni_prikaz`
--

DROP TABLE IF EXISTS `kartoni_prikaz`;
/*!50001 DROP VIEW IF EXISTS `kartoni_prikaz`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `kartoni_prikaz` AS SELECT 
 1 AS `TipKartona`,
 1 AS `Igrac`,
 1 AS `Razlog`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `kategorija`
--

DROP TABLE IF EXISTS `kategorija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kategorija` (
  `idKategorija` int NOT NULL AUTO_INCREMENT,
  `starosnaKategorija` varchar(50) NOT NULL,
  `nivoTakmicenja` varchar(100) NOT NULL,
  PRIMARY KEY (`idKategorija`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategorija`
--

LOCK TABLES `kategorija` WRITE;
/*!40000 ALTER TABLE `kategorija` DISABLE KEYS */;
INSERT INTO `kategorija` (`idKategorija`, `starosnaKategorija`, `nivoTakmicenja`) VALUES (1,'U19','Prvi'),(2,'U17','Prvi'),(3,'Seniori','Prvi'),(4,'Seniori','Drugi'),(5,'Seniori','Prvi (Evropa)');
/*!40000 ALTER TABLE `kategorija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klub`
--

DROP TABLE IF EXISTS `klub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `klub` (
  `idKlub` int NOT NULL AUTO_INCREMENT,
  `nazivKluba` varchar(100) NOT NULL,
  `grad` varchar(100) NOT NULL,
  `idBoja` int DEFAULT NULL,
  PRIMARY KEY (`idKlub`),
  KEY `FK_klub_boja_idx` (`idBoja`),
  CONSTRAINT `FK_klub_boja` FOREIGN KEY (`idBoja`) REFERENCES `boja` (`idBoja`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klub`
--

LOCK TABLES `klub` WRITE;
/*!40000 ALTER TABLE `klub` DISABLE KEYS */;
INSERT INTO `klub` (`idKlub`, `nazivKluba`, `grad`, `idBoja`) VALUES (1,'FK Borac','Banja Luka',1),(2,'HŠK Zrinjski','Mostar',3),(3,'FK Sarajevo','Sarajevo',5),(4,'Velež','Mostar',3),(5,'NK Široki Brijeg','Široki Brijeg',2),(6,'FK Željezničar','Sarajevo',2),(7,'FK Sloga','Doboj',3),(8,'NK Posušje','Posušje',6),(9,'Igman','Konjic',3),(10,'GOŠK Gabela','Gabela',2),(11,'Tuzla City','Tuzla',7),(12,'Zvijezda 09','Bijeljina',3),(13,'FK Crvena zvezda','Beograd',3),(14,'FK Partizan','Beograd',4),(15,'TSC','Bačka Topola',2),(16,'Vojvodina','Novi Sad',3),(17,'Manchester City','Mančester',7),(18,'Bayern','Minhen',3),(19,'Juventus','Torino',4);
/*!40000 ALTER TABLE `klub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `klub_prikaz`
--

DROP TABLE IF EXISTS `klub_prikaz`;
/*!50001 DROP VIEW IF EXISTS `klub_prikaz`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `klub_prikaz` AS SELECT 
 1 AS `Klub`,
 1 AS `Grad`,
 1 AS `Boja`,
 1 AS `Primarna`,
 1 AS `Sekundarna`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `liga`
--

DROP TABLE IF EXISTS `liga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `liga` (
  `idLiga` int NOT NULL AUTO_INCREMENT,
  `nazivLige` varchar(100) NOT NULL,
  `idDrzava` int DEFAULT NULL,
  `datumPocetka` date DEFAULT NULL,
  `datumKraja` date DEFAULT NULL,
  `idKategorija` int NOT NULL,
  PRIMARY KEY (`idLiga`),
  KEY `FK_liga_drzava_idx` (`idDrzava`),
  KEY `FK_liga_kategorija_idx` (`idKategorija`),
  CONSTRAINT `FK_liga_drzava` FOREIGN KEY (`idDrzava`) REFERENCES `drzava` (`idDrzava`),
  CONSTRAINT `FK_liga_kategorija` FOREIGN KEY (`idKategorija`) REFERENCES `kategorija` (`idKategorija`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liga`
--

LOCK TABLES `liga` WRITE;
/*!40000 ALTER TABLE `liga` DISABLE KEYS */;
INSERT INTO `liga` (`idLiga`, `nazivLige`, `idDrzava`, `datumPocetka`, `datumKraja`, `idKategorija`) VALUES (1,'Premijer liga',1,'2023-07-28','2024-05-26',3),(2,'Superliga',2,'2023-07-29','2024-05-31',3),(3,'UEFA Champions League',NULL,'2023-06-27','2024-07-01',5);
/*!40000 ALTER TABLE `liga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `liga_prikaz`
--

DROP TABLE IF EXISTS `liga_prikaz`;
/*!50001 DROP VIEW IF EXISTS `liga_prikaz`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `liga_prikaz` AS SELECT 
 1 AS `Liga`,
 1 AS `Drzava`,
 1 AS `datumPocetka`,
 1 AS `datumKraja`,
 1 AS `Kategorija`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `odbrana`
--

DROP TABLE IF EXISTS `odbrana`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `odbrana` (
  `idOdbrana` int NOT NULL AUTO_INCREMENT,
  `idGolman` int NOT NULL,
  `idUtakmica` int NOT NULL,
  `minut` int NOT NULL,
  PRIMARY KEY (`idOdbrana`),
  KEY `FK_odbrana_igrac_na_utakmici_idx` (`idGolman`,`idUtakmica`),
  CONSTRAINT `FK_odbrana_igrac_na_utakmici` FOREIGN KEY (`idGolman`, `idUtakmica`) REFERENCES `igrac_na_utakmici` (`idIgrac`, `idUtakmica`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odbrana`
--

LOCK TABLES `odbrana` WRITE;
/*!40000 ALTER TABLE `odbrana` DISABLE KEYS */;
INSERT INTO `odbrana` (`idOdbrana`, `idGolman`, `idUtakmica`, `minut`) VALUES (1,1,1,23),(2,1,1,77),(3,1,1,96),(4,47,1,14),(5,47,1,66),(6,83,6,15),(7,78,6,34),(8,83,6,67),(9,78,6,88),(10,30,2,12);
/*!40000 ALTER TABLE `odbrana` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `odbrana_BEFORE_INSERT` BEFORE INSERT ON `odbrana` FOR EACH ROW BEGIN
  declare karton_minut int;
  select minut into karton_minut
  from karton
  where idIgrac = new.idGolman and idUtakmica = new.idUtakmica and idKarton_tip in (2, 3);

  if karton_minut is not null and new.minut >= karton_minut then
    signal sqlstate '45000'
    set message_text = 'Igrac sa crvenim ili drugim zutim kartonom ne moze postici gol';
  end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pozicija`
--

DROP TABLE IF EXISTS `pozicija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pozicija` (
  `oznakaPozicije` varchar(5) NOT NULL,
  `nazivPozicije` varchar(45) NOT NULL,
  PRIMARY KEY (`oznakaPozicije`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pozicija`
--

LOCK TABLES `pozicija` WRITE;
/*!40000 ALTER TABLE `pozicija` DISABLE KEYS */;
INSERT INTO `pozicija` (`oznakaPozicije`, `nazivPozicije`) VALUES ('AM','Ofanzivni vezni'),('CB','Štoper'),('CF','Centarfor'),('CM','Centralni vezni'),('DM','Defanzivni vezni'),('GK','Golman'),('LB','Lijevi bek'),('LM','Lijevi vezni'),('LW','Lijevo krilo'),('LWB','Krilni lijevi bek'),('RB','Desni bek'),('RM','Desni vezni'),('RW','Desno krilo'),('RWB','Krilni desni bek'),('SS','Polu-špic');
/*!40000 ALTER TABLE `pozicija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rezervni_igrac`
--

DROP TABLE IF EXISTS `rezervni_igrac`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rezervni_igrac` (
  `idIgrac` int NOT NULL,
  `idUtakmica` int NOT NULL,
  `uIgri` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`idIgrac`,`idUtakmica`),
  KEY `FK_rezervni_igrac_utakmica_idx` (`idUtakmica`),
  CONSTRAINT `FK_rezervni_igrac_igrac` FOREIGN KEY (`idIgrac`) REFERENCES `igrac` (`idIgrac`),
  CONSTRAINT `FK_rezervni_igrac_utakmica` FOREIGN KEY (`idUtakmica`) REFERENCES `utakmica` (`idUtakmica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rezervni_igrac`
--

LOCK TABLES `rezervni_igrac` WRITE;
/*!40000 ALTER TABLE `rezervni_igrac` DISABLE KEYS */;
INSERT INTO `rezervni_igrac` (`idIgrac`, `idUtakmica`, `uIgri`) VALUES (3,1,0),(5,1,1),(8,1,0),(11,1,1),(13,1,1),(18,1,0),(19,1,0),(20,1,0),(21,1,1),(22,1,0),(27,1,1),(58,1,1),(59,1,0),(60,1,0),(61,1,0);
/*!40000 ALTER TABLE `rezervni_igrac` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ogranicenje_igraca_klupa` BEFORE INSERT ON `rezervni_igrac` FOR EACH ROW BEGIN
  declare prisutan int;
  select count(*) into prisutan from fudbal_rezultati.igrac_na_utakmici where idUtakmica = NEW.idUtakmica and idIgrac = NEW.idIgrac;
  if prisutan > 0 then
    signal sqlstate '45000'
    set message_text = 'Ograničenje: Igrač već prisutan na utakmici u starnoj postavi!';
  end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `stadion`
--

DROP TABLE IF EXISTS `stadion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stadion` (
  `idStadion` int NOT NULL AUTO_INCREMENT,
  `naziv` varchar(100) NOT NULL,
  `grad` varchar(100) NOT NULL,
  `kapacitet` int DEFAULT NULL,
  `idVrsta_podloge` int DEFAULT NULL,
  PRIMARY KEY (`idStadion`),
  KEY `FK_stadion_vrsta_podloge_idx` (`idVrsta_podloge`),
  CONSTRAINT `FK_stadion_vrsta_podloge` FOREIGN KEY (`idVrsta_podloge`) REFERENCES `vrsta_podloge` (`idVrsta_podloge`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stadion`
--

LOCK TABLES `stadion` WRITE;
/*!40000 ALTER TABLE `stadion` DISABLE KEYS */;
INSERT INTO `stadion` (`idStadion`, `naziv`, `grad`, `kapacitet`, `idVrsta_podloge`) VALUES (1,'Gradski stadion','Banja Luka',9730,2),(2,'Bijeli brijeg','Mostar',9000,2),(3,'Koševo','Sarajevo',34500,2),(4,'Rođeni','Vrapčići',7000,1),(5,'Pecara','Široki Brijeg',6000,1),(6,'Grbavica','Sarajevo',13146,2),(7,'Luke','Doboj',3000,1),(8,'Mokri dolac','Posušje',8000,1),(9,'Gradski stadion','Konjic',3000,2),(10,'Perica-Pero Pavlović','Gabela',3000,1),(11,'Tušanj','Tuzla',7000,1),(12,'Gradski stadion','Ugljevik',5000,1),(13,'Rajko Mitić','Beograd',55538,2),(14,'JNA','Beograd',32712,2),(15,'TSC Arena','Bačka Topola',4500,2),(16,'Karađorđe','Novi Sad',14852,2),(17,'Etihad','Mančester',55017,2),(18,'Allianz Arena','Minhen',75024,1),(19,'Allianz Stadium','Torino',41507,1);
/*!40000 ALTER TABLE `stadion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `stadion_prikaz`
--

DROP TABLE IF EXISTS `stadion_prikaz`;
/*!50001 DROP VIEW IF EXISTS `stadion_prikaz`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `stadion_prikaz` AS SELECT 
 1 AS `Naziv`,
 1 AS `Grad`,
 1 AS `Kapacitet`,
 1 AS `Podloga`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `trener`
--

DROP TABLE IF EXISTS `trener`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trener` (
  `idTrener` int NOT NULL AUTO_INCREMENT,
  `ime` varchar(50) NOT NULL,
  `prezime` varchar(50) NOT NULL,
  `idDrzava` int DEFAULT NULL,
  `idKlub` int NOT NULL,
  PRIMARY KEY (`idTrener`),
  UNIQUE KEY `idKlub_UNIQUE` (`idKlub`),
  KEY `FK_trener_drzava_idx` (`idDrzava`),
  KEY `FK_trener_klub_idx` (`idKlub`),
  CONSTRAINT `FK_trener_drzava` FOREIGN KEY (`idDrzava`) REFERENCES `drzava` (`idDrzava`),
  CONSTRAINT `FK_trener_klub` FOREIGN KEY (`idKlub`) REFERENCES `klub` (`idKlub`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trener`
--

LOCK TABLES `trener` WRITE;
/*!40000 ALTER TABLE `trener` DISABLE KEYS */;
INSERT INTO `trener` (`idTrener`, `ime`, `prezime`, `idDrzava`, `idKlub`) VALUES (1,'Pep','Guardiola',33,17),(2,'Massimiliano','Allegri',25,19),(3,'Thomas','Tuchel',21,18),(4,'Igor','Duljaj',2,14),(5,'Barak','Bakhar',24,13),(6,'Žarko','Lazetić',2,15),(7,'Ranko','Popović',2,16),(8,'Vinko','Marinović',2,1),(9,'Krunoslav','Rendulić',18,2),(10,'Simon','Rožman',32,3),(11,'Dean','Klafurić',18,4),(12,'Marijan','Budimir',18,5),(13,'Haris','Alihodžić',1,6),(14,'Vlado','Jagodić',1,7),(15,'Branko','Karačić',18,8),(16,'Edis','Mulalić',1,9),(17,'Denis','Ćorić',18,10),(18,'Adnan','Osmanhodžić',1,11),(19,'Mihajlo','Jurasović',2,12);
/*!40000 ALTER TABLE `trener` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `treneri_prikaz`
--

DROP TABLE IF EXISTS `treneri_prikaz`;
/*!50001 DROP VIEW IF EXISTS `treneri_prikaz`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `treneri_prikaz` AS SELECT 
 1 AS `Ime`,
 1 AS `Prezime`,
 1 AS `Drzava`,
 1 AS `Klub`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `utakmica`
--

DROP TABLE IF EXISTS `utakmica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utakmica` (
  `idUtakmica` int NOT NULL AUTO_INCREMENT,
  `idDomaci` int NOT NULL,
  `idGosti` int NOT NULL,
  `idStadion` int NOT NULL,
  `datum` date NOT NULL,
  `vrijeme` time DEFAULT NULL,
  `goloviDomaci` int NOT NULL DEFAULT '0',
  `goloviGosti` int NOT NULL DEFAULT '0',
  `idLiga` int NOT NULL,
  `kolo` int NOT NULL,
  PRIMARY KEY (`idUtakmica`),
  KEY `FK_utakmica_stadion_idx` (`idStadion`),
  KEY `FK_utakmica_domaci_idx` (`idDomaci`),
  KEY `FK_utakmica_gosti_idx` (`idGosti`),
  KEY `FK_utakmica_liga_idx` (`idLiga`),
  CONSTRAINT `FK_utakmica_domaci` FOREIGN KEY (`idDomaci`) REFERENCES `klub` (`idKlub`),
  CONSTRAINT `FK_utakmica_gosti` FOREIGN KEY (`idGosti`) REFERENCES `klub` (`idKlub`),
  CONSTRAINT `FK_utakmica_liga` FOREIGN KEY (`idLiga`) REFERENCES `liga` (`idLiga`),
  CONSTRAINT `FK_utakmica_stadion` FOREIGN KEY (`idStadion`) REFERENCES `stadion` (`idStadion`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utakmica`
--

LOCK TABLES `utakmica` WRITE;
/*!40000 ALTER TABLE `utakmica` DISABLE KEYS */;
INSERT INTO `utakmica` (`idUtakmica`, `idDomaci`, `idGosti`, `idStadion`, `datum`, `vrijeme`, `goloviDomaci`, `goloviGosti`, `idLiga`, `kolo`) VALUES (1,1,3,1,'2023-10-18','19:00:00',2,0,1,1),(2,11,2,11,'2023-09-27','15:00:00',1,3,1,1),(3,4,10,4,'2023-08-06','17:00:00',1,1,1,1),(4,12,9,12,'2023-08-05','17:00:00',1,0,1,1),(5,8,5,8,'2023-08-04','17:00:00',0,0,1,1),(6,7,6,7,'2023-09-20','15:00:00',2,0,1,1),(7,4,12,4,'2023-07-29','20:30:00',0,1,1,2),(8,10,11,10,'2023-07-30','17:00:00',2,1,1,2),(9,3,7,3,'2023-07-30','20:00:00',1,2,1,2),(10,6,9,6,'2023-08-30','18:30:00',1,0,1,2),(11,2,8,2,'2023-09-13','18:30:00',2,0,1,2),(12,5,1,5,'2023-09-27','18:30:00',0,3,1,2);
/*!40000 ALTER TABLE `utakmica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vrsta_podloge`
--

DROP TABLE IF EXISTS `vrsta_podloge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vrsta_podloge` (
  `idVrsta_podloge` int NOT NULL AUTO_INCREMENT,
  `naziv` varchar(50) NOT NULL,
  `opis` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idVrsta_podloge`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vrsta_podloge`
--

LOCK TABLES `vrsta_podloge` WRITE;
/*!40000 ALTER TABLE `vrsta_podloge` DISABLE KEYS */;
INSERT INTO `vrsta_podloge` (`idVrsta_podloge`, `naziv`, `opis`) VALUES (1,'Prirodna trava','Prirodna trava nanesena u busenima dimenzija 1.20 m sirine x 30m duzine'),(2,'Hibridna podloga','Kombinacija prave trave i vještačkih niti, velike gustine i savršenog kvaliteta'),(3,'Vještačka trava','Pogodna za područija na kojima nema odgovarajućih uslova za pravu travu');
/*!40000 ALTER TABLE `vrsta_podloge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'fudbal_rezultati'
--

--
-- Dumping routines for database 'fudbal_rezultati'
--
/*!50003 DROP PROCEDURE IF EXISTS `PrikaziStatistikuKluba` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PrikaziStatistikuKluba`(in liga_id int)
begin
  select
    k.nazivKluba as Klub,
    k.grad as Grad,
    count(distinct u.idUtakmica) as BrojUtakmica,
    sum(case when u.goloviDomaci = u.goloviGosti then 1 else 0 end) as BrojNerjesenih,
    sum(case when (u.idDomaci = k.idKlub and u.goloviDomaci > u.goloviGosti) or (u.idGosti = k.idKlub and u.goloviGosti > u.goloviDomaci) then 1 else 0 end) as BrojPobjeda,
    sum(case when (u.idDomaci = k.idKlub and u.goloviDomaci < u.goloviGosti) or (u.idGosti = k.idKlub and u.goloviGosti < u.goloviDomaci) then 1 else 0 end) as BrojIzgubljenih,
    sum(case when u.idDomaci = k.idKlub then u.goloviDomaci else u.goloviGosti end) as BrojPostignutihGolova,
    sum(case when u.idGosti = k.idKlub then u.goloviDomaci else u.goloviGosti end) as BrojPrimljenihGolova,
    sum(case when u.idDomaci = k.idKlub then u.goloviDomaci else u.goloviGosti end) -
    sum(case when u.idGosti = k.idKlub then u.goloviDomaci else u.goloviGosti end) as GolRazlika,
    (sum(case when (u.idDomaci = k.idKlub and u.goloviDomaci > u.goloviGosti) or (u.idGosti = k.idKlub and u.goloviGosti > u.goloviDomaci) then 3 else 0 end) +
    sum(case when u.goloviDomaci = u.goloviGosti then 1 else 0 end)) as BrojBodova
  from
    fudbal_rezultati.klub k
    join fudbal_rezultati.clan c on k.idKlub = c.idKlub
    left join fudbal_rezultati.utakmica u on k.idKlub = u.idDomaci or k.idKlub = u.idGosti
  where
    c.idLiga = liga_id
  group by
    k.idKlub, k.nazivKluba, k.grad
  order by
    BrojBodova desc, GolRazlika desc, BrojUtakmica desc, BrojPostignutihGolova desc;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PrikaziTabeluBodova` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PrikaziTabeluBodova`(in liga_id int)
begin
  select
    k.nazivKluba as Klub,
    k.grad as Grad,
    sum(
      case
        when u.goloviDomaci = u.goloviGosti and (u.idDomaci = k.idKlub or u.idGosti = k.idKlub) then 1  -- Neriješeno, 1 bod
        when u.idDomaci = k.idKlub and u.goloviDomaci > u.goloviGosti then 3  -- Pobjeda domaćina, 3 boda
        when u.idGosti = k.idKlub and u.goloviGosti > u.goloviDomaci then 3  -- Pobjeda gosta, 3 boda
        else 0  -- Poraz, 0 bodova
      end
    ) as BrojBodova,
    count(distinct u.idUtakmica) as BrojUtakmica
  from
    fudbal_rezultati.klub k
    join fudbal_rezultati.clan c on k.idKlub = c.idKlub
    left join fudbal_rezultati.utakmica u on k.idKlub = u.idDomaci or k.idKlub = u.idGosti
  where
    c.idLiga = liga_id
  group by
    k.idKlub, k.nazivKluba, k.grad
  order by
    BrojBodova desc;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PrikaziUtakmiceKola` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PrikaziUtakmiceKola`(in liga_id int, in kolo int)
BEGIN
  select 
    kd.nazivKluba as Domaci, 
    kg.nazivKluba as Gosti,
    s.naziv as Stadion,
    s.grad as Grad,
    u.datum as Datum,
    u.vrijeme as Vrijeme,
    u.goloviDomaci as GoloviDomaci,
    u.goloviGosti as GoloviGosti
  from
    fudbal_rezultati.utakmica u
    left join fudbal_rezultati.klub kd on kd.idKlub = u.idDomaci
    left join fudbal_rezultati.klub kg on kg.idKlub = u.idGosti
    left join stadion s on s.idStadion = u.idStadion
  where
    u.idLiga = liga_id and u.kolo = kolo
  order by
    Datum asc, Vrijeme asc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PrikazStatistikeGolmanaLiga` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PrikazStatistikeGolmanaLiga`(in liga_id int)
BEGIN
  select
    i.ime as Ime,
    i.prezime as Prezime,
    k.nazivKluba as Klub,
    (select count(*) from fudbal_rezultati.igrac_na_utakmici inu where inu.idIgrac = i.idIgrac) as BrojUtakmica,
    (select count(*) from fudbal_rezultati.odbrana o where o.idGolman = i.idIgrac) as BrojOdbrana,
    (select count(*) from fudbal_rezultati.karton kar where kar.idIgrac = i.idIgrac and kar.idKarton_tip = 1) as ZutihKartona,
    (select count(*) from fudbal_rezultati.karton kar where kar.idIgrac = i.idIgrac and kar.idKarton_tip in (2, 3)) as CrvenihKartona
  from
    fudbal_rezultati.igrac i
    join fudbal_rezultati.klub k on i.idKlub = k.idKlub
    join clan c on k.idKlub = c.idKlub
    -- join fudbal_rezultati.odbrana o on i.idIgrac = o.idGolman
  where
    liga_id = c.idLiga and i.oznakaPozicije = 'GK'
  order by
    BrojOdbrana desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PrikazStatistikeKlub` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PrikazStatistikeKlub`(in klub_id int)
BEGIN
  select
    i.ime as Ime,
    i.prezime as Prezime,
    k.nazivKluba as Klub,
    p.nazivPozicije as Pozicija,
    (select count(*) from fudbal_rezultati.igrac_na_utakmici inu where inu.idIgrac = i.idIgrac) +
      (select count(*) from fudbal_rezultati.rezervni_igrac ri where ri.idIgrac = i.idIgrac and ri.uIgri = 1) as BrojUtakmica,
    (select count(*) from fudbal_rezultati.gol g where g.idIgrac = i.idIgrac) as BrojGolova,
    (select count(*) from fudbal_rezultati.karton kar where kar.idIgrac = i.idIgrac and kar.idKarton_tip = 1) as ZutihKartona,
    (select count(*) from fudbal_rezultati.karton kar where kar.idIgrac = i.idIgrac and kar.idKarton_tip in (2, 3)) as CrvenihKartona
  from
    fudbal_rezultati.igrac i
    join fudbal_rezultati.klub k on i.idKlub = k.idKlub
	join fudbal_rezultati.pozicija p on i.oznakaPozicije = p.oznakaPozicije
  where
    klub_id = i.idKlub
  order by
    BrojGolova desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PrikazStatistikeLiga` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PrikazStatistikeLiga`(in liga_id int)
BEGIN
  select
    i.ime as Ime,
    i.prezime as Prezime,
    k.nazivKluba as Klub,
    p.nazivPozicije as Pozicija,
    (select count(*) from fudbal_rezultati.igrac_na_utakmici inu where inu.idIgrac = i.idIgrac) as BrojUtakmica,
    (select count(*) from fudbal_rezultati.gol g where g.idIgrac = i.idIgrac) as BrojGolova,
    (select count(*) from fudbal_rezultati.karton kar where kar.idIgrac = i.idIgrac and kar.idKarton_tip = 1) as ZutihKartona,
    (select count(*) from fudbal_rezultati.karton kar where kar.idIgrac = i.idIgrac and kar.idKarton_tip in (2, 3)) as CrvenihKartona
  from
    fudbal_rezultati.igrac i
    join fudbal_rezultati.klub k on i.idKlub = k.idKlub
    join clan c on k.idKlub = c.idKlub
    join fudbal_rezultati.pozicija p on i.oznakaPozicije = p.oznakaPozicije
  where
    liga_id = c.idLiga
  order by
    BrojGolova desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `fudbal_rezultati`
--

USE `fudbal_rezultati`;

--
-- Final view structure for view `clan_prikaz`
--

/*!50001 DROP VIEW IF EXISTS `clan_prikaz`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `clan_prikaz` AS select `k`.`nazivKluba` AS `Klub`,group_concat(`l`.`nazivLige` separator ',') AS `Liga` from ((`clan` `c` join `klub` `k` on((`k`.`idKlub` = `c`.`idKlub`))) join `liga` `l` on((`l`.`idLiga` = `c`.`idLiga`))) group by `Klub` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `igraci_prikaz`
--

/*!50001 DROP VIEW IF EXISTS `igraci_prikaz`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `igraci_prikaz` AS select `i`.`ime` AS `Ime`,`i`.`prezime` AS `Prezime`,`i`.`brojDresa` AS `BrojDresa`,`i`.`godine` AS `Godine`,`k`.`nazivKluba` AS `Klub`,`d`.`drzava` AS `Drzava`,`p`.`nazivPozicije` AS `Pozicija`,`i`.`visina` AS `Visina` from (((`igrac` `i` left join `klub` `k` on((`k`.`idKlub` = `i`.`idKlub`))) left join `drzava` `d` on((`d`.`idDrzava` = `i`.`idDrzava`))) left join `pozicija` `p` on((`p`.`oznakaPozicije` = `i`.`oznakaPozicije`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `kartoni_prikaz`
--

/*!50001 DROP VIEW IF EXISTS `kartoni_prikaz`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `kartoni_prikaz` (`TipKartona`,`Igrac`,`Razlog`) AS select `kt`.`tip` AS `tip`,concat(`i`.`ime`,' ',`i`.`prezime`) AS `concat(i.ime, ' ', i.prezime)`,`kar`.`razlog` AS `razlog` from ((`karton` `kar` join `karton_tip` `kt` on((`kt`.`idKarton_tip` = `kar`.`idKarton_tip`))) left join `igrac` `i` on((`i`.`idIgrac` = `kar`.`idIgrac`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `klub_prikaz`
--

/*!50001 DROP VIEW IF EXISTS `klub_prikaz`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `klub_prikaz` AS select `k`.`nazivKluba` AS `Klub`,`k`.`grad` AS `Grad`,`b`.`naziv` AS `Boja`,`b`.`primarnaBoja` AS `Primarna`,`b`.`sekundarnaBoja` AS `Sekundarna` from (`klub` `k` join `boja` `b` on((`b`.`idBoja` = `k`.`idBoja`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `liga_prikaz`
--

/*!50001 DROP VIEW IF EXISTS `liga_prikaz`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `liga_prikaz` AS select `l`.`nazivLige` AS `Liga`,`d`.`drzava` AS `Drzava`,`l`.`datumPocetka` AS `datumPocetka`,`l`.`datumKraja` AS `datumKraja`,concat(`k`.`starosnaKategorija`,' ',`k`.`nivoTakmicenja`,' rang') AS `Kategorija` from ((`liga` `l` left join `drzava` `d` on((`d`.`idDrzava` = `l`.`idDrzava`))) left join `kategorija` `k` on((`k`.`idKategorija` = `l`.`idKategorija`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stadion_prikaz`
--

/*!50001 DROP VIEW IF EXISTS `stadion_prikaz`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stadion_prikaz` AS select `s`.`naziv` AS `Naziv`,`s`.`grad` AS `Grad`,`s`.`kapacitet` AS `Kapacitet`,`vp`.`naziv` AS `Podloga` from (`stadion` `s` join `vrsta_podloge` `vp` on((`vp`.`idVrsta_podloge` = `s`.`idVrsta_podloge`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `treneri_prikaz`
--

/*!50001 DROP VIEW IF EXISTS `treneri_prikaz`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `treneri_prikaz` AS select `t`.`ime` AS `Ime`,`t`.`prezime` AS `Prezime`,`d`.`drzava` AS `Drzava`,`k`.`nazivKluba` AS `Klub` from ((`trener` `t` left join `drzava` `d` on((`t`.`idDrzava` = `d`.`idDrzava`))) left join `klub` `k` on((`t`.`idKlub` = `k`.`idKlub`))) */;
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

-- Dump completed on 2023-11-14 14:57:24
