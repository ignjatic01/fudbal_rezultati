-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: fudbal_rezultati
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.22.04.1

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
-- Dumping data for table `boja`
--

LOCK TABLES `boja` WRITE;
/*!40000 ALTER TABLE `boja` DISABLE KEYS */;
INSERT INTO `boja` VALUES (1,'#ff0000','#0000ff','Crveno-plava'),(2,'#0000ff','#000000','Plavo-bijela'),(3,'#ff0000','#000000','Crveno-bijela'),(4,'#ffffff','#000000','Crno-bijela'),(5,'#753632','#000000','Bordo-bijela'),(6,'#0e8ae3',NULL,'Svijetloplava'),(7,'#0e8ae3','#000000','Svijetloplavo-bijela');
/*!40000 ALTER TABLE `boja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `clan`
--

LOCK TABLES `clan` WRITE;
/*!40000 ALTER TABLE `clan` DISABLE KEYS */;
INSERT INTO `clan` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,2),(14,2),(15,2),(16,2),(1,3),(2,3),(13,3),(14,3),(16,3),(17,3),(18,3),(19,3);
/*!40000 ALTER TABLE `clan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `drzava`
--

LOCK TABLES `drzava` WRITE;
/*!40000 ALTER TABLE `drzava` DISABLE KEYS */;
INSERT INTO `drzava` VALUES (1,'Bosna i Hercegovina','BIH'),(2,'Srbija','SRB'),(3,'Albanija','ALB'),(4,'Argentina','ARG'),(5,'Jermenija','ARM'),(6,'Alžir','DZA'),(7,'Australija','AUS'),(8,'Austrija','AUT'),(9,'Azerbejdžan','AZE'),(10,'Bjelorusija','BLR'),(11,'Belgija','BEL'),(12,'Brazil','BRA'),(13,'Bugarska','BGR'),(14,'Kamerun','CMR'),(15,'Kanada','CAN'),(16,'Kolumbija','COL'),(17,'Obala Slonovače','CIV'),(18,'Hrvatska','HRV'),(19,'Francuska','FRA'),(20,'Gabon','GAB'),(21,'Njemačka','GER'),(22,'Grčka','GRC'),(23,'Mađarska','HUN'),(24,'Izrael','ISR'),(25,'Italija','ITA'),(26,'Južna Koreja','KOR'),(27,'Crna Gora','MNE'),(28,'Sjeverna Makedonija','NMK'),(29,'Portugal','PRT'),(30,'Poljska','POL'),(31,'Rusija','RUS'),(32,'Slovenija','SVN'),(33,'Španija','ESP'),(34,'Turska','TUR'),(35,'Ukrajina','UKR'),(36,'Sjedinjene Američke Države','USA'),(37,'Venecuela','VEN'),(38,'Burkina Faso','BFA'),(39,'Gana','GHA'),(40,'Gruzija','GEO'),(41,'Solomonova Ostrva','SLB'),(42,'Nigerija','NGA'),(43,'Luksemburg','LUX'),(44,'Saudijska Arabija','SAU'),(45,'Danska','DNK'),(46,'Senegal','SEN'),(47,'Švedska','SWE'),(48,'Gambia','GMB'),(49,'Holandija','NLD'),(50,'Kurasao','CUW'),(51,'Kongo','COD'),(52,'Norveška','NOR'),(53,'Zambia','ZMB'),(54,'Novi Zeland','NZL'),(55,'Jamajka','JAM'),(56,'Irska','IRL'),(57,'Katar','QAT'),(58,'Jemen','YEM'),(59,'Tanzanija','TAN'),(60,'Mozambik','MOZ');
/*!40000 ALTER TABLE `drzava` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `gol`
--

LOCK TABLES `gol` WRITE;
/*!40000 ALTER TABLE `gol` DISABLE KEYS */;
INSERT INTO `gol` VALUES (1,1,1,12,23),(2,1,1,26,91),(3,2,11,101,13),(4,2,2,32,14),(5,2,2,38,36),(6,2,2,38,55),(7,3,4,72,60),(8,3,10,98,74),(9,4,12,105,3),(10,6,7,86,45),(11,6,7,86,72),(12,7,12,106,45),(13,8,10,96,12),(14,8,11,102,33),(15,8,10,98,51),(16,9,3,57,51),(17,9,7,85,70),(18,9,7,86,90),(19,10,6,82,21),(20,11,2,34,18),(21,11,2,32,42),(22,12,1,12,6),(23,12,1,29,8),(24,12,1,12,67),(26,13,13,109,69),(27,13,1,19,71);
/*!40000 ALTER TABLE `gol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `igrac`
--

LOCK TABLES `igrac` WRITE;
/*!40000 ALTER TABLE `igrac` DISABLE KEYS */;
INSERT INTO `igrac` VALUES (1,'Milan','Mijatović',25,36,27,1,'GK',190),(2,'Nikola','Ćetković',21,21,1,1,'GK',190),(3,'Bojan','Pavlović',1,36,2,1,'GK',190),(4,'Ranko','Jokić',3,24,2,1,'CB',NULL),(5,'Savo','Sušić',31,18,1,1,'CB',NULL),(6,'Maks','Juraj Čelić',6,27,18,1,'CB',NULL),(7,'Nikola','Pejović',4,25,2,1,'CB',NULL),(8,'Aleksandar','Subić',18,30,1,1,'LB',NULL),(9,'Sebastian','Herrera',16,28,16,1,'LB',NULL),(10,'Slobodan','Đekić',2,22,1,1,'RB',NULL),(11,'Janez','Pišek',13,25,32,1,'DM',NULL),(12,'Srđan','Grahovac',15,31,1,1,'DM',NULL),(13,'Stefan','Fićović',8,25,2,1,'CM',NULL),(14,'Jovan','Nišić',45,25,2,1,'CM',NULL),(15,'Fedor','Predragović',14,28,1,1,'CM',NULL),(16,'Roslan','Barsky',10,31,24,1,'CM',NULL),(17,'Vasilije','Terzić',29,24,27,1,'AM',NULL),(18,'Stojan','Vranješ',23,37,1,1,'AM',NULL),(19,'Alen','Jurilj',7,27,18,1,'LW',NULL),(20,'Jose','Ricardo Cortes',11,29,16,1,'LW',NULL),(21,'Jakov','Blagaić',24,23,18,1,'LW',NULL),(22,'Nemanja','Mihajlović',77,27,2,1,'LW',NULL),(23,'Enver','Kulašin',27,20,1,1,'RW',NULL),(24,'Damir','Hrelja',55,22,1,1,'RW',NULL),(25,'David','Čavić',22,20,1,1,'RW',NULL),(26,'Zoran','Kvržić',20,35,1,1,'RW',NULL),(27,'Milan','Makarić',9,28,2,1,'CF',NULL),(28,'Glanfranco','Pena',90,23,16,1,'CF',NULL),(29,'Jovo','Lukić',19,24,1,1,'CF',NULL),(30,'Marko','Marić',35,27,18,2,'GK',193),(31,'Omer','Niron',55,22,24,2,'GK',195),(32,'Nemanja','Bilbija',99,33,1,2,'CF',NULL),(33,'Dario','Čanađija',5,29,18,2,'DM',NULL),(34,'Josip','Ćorluka',6,28,1,2,'RB',NULL),(35,'Mario','Ćuze',25,24,18,2,'LW',NULL),(36,'Slobodan','Jakovljević',27,34,2,2,'CB',NULL),(37,'Ivan','Jukić',7,27,1,2,'LW',NULL),(38,'Tomislav','Kiš',10,29,18,2,'CF',NULL),(39,'Luka','Marin',2,25,18,2,'LB',NULL),(40,'Stipe','Radić',15,23,18,2,'CB',NULL),(41,'Tarik','Ramić',19,20,1,2,'CM',NULL),(42,'Andrija','Balić',14,26,18,2,'CM',NULL),(43,'Antonio','Ivančić',20,28,18,2,'AM',NULL),(44,'Anton','Maglica',77,31,18,2,'CF',NULL),(45,'Kerim','Memija',50,27,1,2,'RB',NULL),(46,'Franko','Sabljić',9,20,1,2,'CF',NULL),(47,'Muhamed','Šahinović',1,20,1,3,'GK',191),(48,'Marin','Aničić',28,34,1,3,'CB',NULL),(49,'Momir','Đuričković',44,26,27,3,'CB',NULL),(50,'Slaviša','Radović',23,30,2,3,'LB',NULL),(51,'Amar','Beganović',22,23,1,3,'RB',NULL),(52,'Edin','Juraldžija',18,22,18,3,'DM',NULL),(53,'Daniel','Avramovski',27,28,28,3,'AM',NULL),(54,'Mirza','Mustafić',98,25,1,3,'AM',NULL),(55,'Almedin','Ziljkić',77,27,1,3,'LW',NULL),(56,'Ajdin','Hasić',17,22,1,3,'RW',NULL),(57,'Adalberto','Penarada',10,26,37,3,'CF',NULL),(58,'Lovre','Rogić',39,28,18,3,'GK',190),(59,'Vinko','Soldo',24,25,18,3,'CB',NULL),(60,'Mario','Vranić',8,34,1,3,'CM',NULL),(61,'Francis','Kyeremeh',11,26,39,3,'RW',NULL),(62,'Osman','Hadžikić',31,27,8,4,'GK',186),(63,'Bruno','Oliveira',96,27,12,4,'CB',NULL),(64,'Ante','Hrkač',8,31,1,4,'CB',NULL),(65,'Klemen','Šturm',23,29,32,4,'LB',NULL),(66,'Ante','Oreč',2,22,18,4,'RB',NULL),(67,'Omar','Pršeš',7,28,1,4,'CM',NULL),(68,'Tarik','Šikalo',16,19,1,4,'CM',NULL),(69,'Edo','Vehabović',28,28,1,4,'AM',NULL),(70,'Asmir','Suljić',10,32,1,4,'LW',NULL),(71,'Giorgi','Guliashvili',9,22,40,4,'RW',NULL),(72,'Nermin','Haskić',17,34,1,4,'CF',NULL),(73,'Tomislav','Tomić',12,26,18,5,'GK',189),(74,'Ivan','Saravanja',3,27,1,5,'CB',NULL),(75,'Marko','Capan',6,19,18,5,'DM',NULL),(76,'Stephen','Chinedu',9,23,42,5,'CF',NULL),(77,'Cyrille','Kpan',15,25,38,5,'RW',NULL),(78,'Vedad','Muftić',13,22,1,6,'GK',186),(79,'Marin','Galić',24,28,1,6,'RB',NULL),(80,'Nedim','Mekić',8,28,1,6,'CM',NULL),(81,'Joseph','Amoah',26,21,39,6,'RW',NULL),(82,'Sulejman','Krpić',7,32,1,6,'CF',NULL),(83,'Elvir','Trako',17,25,1,7,'GK',NULL),(84,'Miloš','Nikolić',4,29,2,7,'CB',NULL),(85,'Srđan','Grabež',35,32,2,7,'DM',NULL),(86,'Dejan','Vidić',99,30,2,7,'CF',NULL),(87,'Franko','Kolić',72,20,18,8,'GK',NULL),(88,'Luka','Lučić',35,28,18,8,'LB',NULL),(89,'Karlo','Kamenar',10,29,18,8,'AM',NULL),(90,'Dominik','Begić',17,26,1,8,'RW',NULL),(91,'Aldin','Ceman',12,28,1,9,'GK',NULL),(92,'Marko','Čubrilo',11,25,1,9,'LB',NULL),(93,'Armin','Besagić',4,25,1,9,'DM',NULL),(94,'Anel','Hebibović',7,33,1,9,'RW',NULL),(95,'Filip','Vasilj',22,23,1,10,'GK',NULL),(96,'Riad','Suta',6,21,1,10,'CB',NULL),(97,'Marko','Musulin',23,23,18,10,'DM',NULL),(98,'Nihad','Sero',24,24,1,10,'RW',NULL),(99,'Eldin','Lolić',1,19,1,11,'GK',NULL),(100,'Mirza','Delimedjač',5,24,2,11,'CB',NULL),(101,'Huso','Karjašević',17,26,1,11,'DM',NULL),(102,'Mirzad','Mehanović',10,30,1,11,'RW',NULL),(103,'Luka','Damjanović',83,20,1,12,'GK',NULL),(104,'Stefan','Šapić',65,26,2,12,'CB',NULL),(105,'Stefan','Veličković',18,24,2,12,'RB',NULL),(106,'Krsta','Đorđević',26,30,2,12,'CF',NULL),(107,'Omri','Glazer',18,27,24,13,'GK',190),(108,'Uroš','Spajić',5,30,2,13,'CB',NULL),(109,'Mirko','Ivanić',4,30,27,13,'CM',NULL),(110,'Jean-Philippe','Krasso',17,26,17,13,'CM',NULL),(111,'Cherif','Ndiaye',9,27,46,13,'CF',NULL),(112,'In-beom','Hwang',66,27,26,13,'CM',NULL),(113,'Aleksandar','Jovanović',1,30,1,14,'GK',NULL),(114,'Svetozar','Marković',6,23,1,14,'CB',NULL),(115,'Kristijan','Belić',40,22,1,14,'DM',NULL),(116,'Bibras','Natcho',10,35,24,14,'AM',NULL),(117,'Veljko','Ilić',12,20,1,15,'GK',NULL),(118,'Nemanja','Stojić',18,25,1,15,'CB',NULL),(119,'Ifet','Đakovac',35,25,1,15,'AM',NULL),(120,'Uroš','Milovanović',9,23,1,15,'CF',NULL),(121,'Lazar','Carević',25,24,27,16,'GK',NULL),(122,'Igor','Jeličić',15,23,1,16,'CB',NULL),(123,'Andrija','Radulović',49,21,27,16,'RM',NULL),(124,'Filip','Malbašić',29,30,1,16,'LM',NULL),(125,'Ederson','Moraes',31,30,12,17,'GK',188),(126,'Nathan','Ake',6,28,49,17,'CB',NULL),(127,'Julian','Alvarez',19,23,4,17,'AM',NULL),(128,'Erling','Haaland',9,23,52,17,'CF',NULL),(129,'Manuel','Neuer',1,37,21,18,'GK',193),(130,'Alphonso','Davies',19,23,15,18,'LB',NULL),(131,'Jamal','Musiala',42,20,21,18,'AM',NULL),(132,'Kingsley','Coman',11,27,19,18,'RW',NULL),(133,'Wojciech','Szczesny',1,33,30,19,'GK',196),(134,'Adrien','Rabiot',25,28,19,19,'CM',NULL),(135,'Filip','Kostić',11,31,2,19,'LM',NULL),(136,'Dušan','Vlahović',9,23,2,19,'CF',NULL);
/*!40000 ALTER TABLE `igrac` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `igrac_na_utakmici`
--

LOCK TABLES `igrac_na_utakmici` WRITE;
/*!40000 ALTER TABLE `igrac_na_utakmici` DISABLE KEYS */;
INSERT INTO `igrac_na_utakmici` VALUES (1,1,1),(1,12,1),(1,13,1),(3,1,0),(4,1,1),(5,1,0),(6,1,1),(8,1,0),(8,12,1),(9,1,1),(11,1,0),(12,1,1),(12,12,1),(13,1,1),(13,12,1),(14,1,0),(14,12,0),(17,1,0),(18,1,0),(18,13,1),(19,1,0),(19,13,1),(20,1,0),(21,1,1),(22,1,0),(24,1,1),(25,1,1),(26,1,1),(27,1,1),(28,1,0),(29,1,0),(29,12,1),(30,2,1),(30,11,1),(32,2,1),(32,11,1),(34,11,1),(38,2,1),(40,2,1),(47,1,1),(47,9,1),(48,1,1),(49,1,1),(50,1,1),(51,1,1),(52,1,1),(52,9,1),(53,1,1),(54,1,1),(55,1,1),(56,1,1),(57,1,0),(57,9,1),(58,1,0),(59,1,1),(60,1,0),(61,1,0),(62,3,1),(62,7,1),(63,3,1),(63,7,1),(71,7,1),(72,3,1),(72,7,1),(73,5,1),(73,12,1),(74,5,1),(75,5,1),(76,5,1),(77,5,1),(78,6,1),(78,10,1),(79,6,0),(80,6,1),(81,6,1),(82,6,1),(82,10,1),(83,6,0),(83,9,1),(84,6,1),(85,6,1),(85,9,1),(86,6,1),(86,9,1),(87,5,1),(87,11,1),(88,5,1),(89,5,1),(89,11,1),(90,5,1),(91,4,1),(91,10,1),(92,4,1),(92,10,1),(93,4,1),(94,4,1),(95,3,1),(95,8,1),(96,3,1),(96,8,1),(97,3,1),(98,3,1),(98,8,1),(99,2,1),(99,8,1),(100,2,1),(101,2,1),(102,2,1),(102,8,1),(103,4,1),(103,7,1),(104,4,1),(104,7,1),(105,4,1),(105,7,1),(106,4,1),(106,7,1),(109,13,1);
/*!40000 ALTER TABLE `igrac_na_utakmici` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `izmjena`
--

LOCK TABLES `izmjena` WRITE;
/*!40000 ALTER TABLE `izmjena` DISABLE KEYS */;
INSERT INTO `izmjena` VALUES (1,13,14,1,67),(2,21,17,1,67),(3,27,29,1,80),(4,59,57,1,81),(5,13,14,12,90);
/*!40000 ALTER TABLE `izmjena` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `karton`
--

LOCK TABLES `karton` WRITE;
/*!40000 ALTER TABLE `karton` DISABLE KEYS */;
INSERT INTO `karton` VALUES (1,1,9,1,12,'Povlačenje za dres'),(2,1,50,1,34,'Oštar start'),(3,1,55,1,62,'Prigovor'),(4,1,63,3,44,'Simuliranje'),(5,1,83,6,87,'Odugovlačenje'),(6,2,79,6,91,'Učešće u tuči'),(7,3,83,6,91,'Učešće u tuči'),(11,2,9,1,50,'Prigovor');
/*!40000 ALTER TABLE `karton` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `karton_tip`
--

LOCK TABLES `karton_tip` WRITE;
/*!40000 ALTER TABLE `karton_tip` DISABLE KEYS */;
INSERT INTO `karton_tip` VALUES (1,'Žuti karton'),(2,'Crveni karton'),(3,'Drugi žuti - crveni karton');
/*!40000 ALTER TABLE `karton_tip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `kategorija`
--

LOCK TABLES `kategorija` WRITE;
/*!40000 ALTER TABLE `kategorija` DISABLE KEYS */;
INSERT INTO `kategorija` VALUES (1,'U19','Prvi'),(2,'U17','Prvi'),(3,'Seniori','Prvi'),(4,'Seniori','Drugi'),(5,'Seniori','Prvi (Evropa)'),(6,'U19','Prvi (Evropa)');
/*!40000 ALTER TABLE `kategorija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `klub`
--

LOCK TABLES `klub` WRITE;
/*!40000 ALTER TABLE `klub` DISABLE KEYS */;
INSERT INTO `klub` VALUES (1,'FK Borac','Banja Luka',1),(2,'HŠK Zrinjski','Mostar',3),(3,'FK Sarajevo','Sarajevo',5),(4,'Velež','Mostar',3),(5,'NK Široki Brijeg','Široki Brijeg',2),(6,'FK Željezničar','Sarajevo',2),(7,'FK Sloga','Doboj',3),(8,'NK Posušje','Posušje',6),(9,'Igman','Konjic',3),(10,'GOŠK Gabela','Gabela',2),(11,'Tuzla City','Tuzla',7),(12,'Zvijezda 09','Bijeljina',3),(13,'FK Crvena zvezda','Beograd',3),(14,'FK Partizan','Beograd',4),(15,'TSC','Bačka Topola',2),(16,'Vojvodina','Novi Sad',3),(17,'Manchester City','Mančester',7),(18,'Bayern','Minhen',3),(19,'Juventus','Torino',4);
/*!40000 ALTER TABLE `klub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `liga`
--

LOCK TABLES `liga` WRITE;
/*!40000 ALTER TABLE `liga` DISABLE KEYS */;
INSERT INTO `liga` VALUES (1,'Premijer liga',1,'2023-07-28','2024-05-26',3),(2,'Superliga',2,'2023-07-29','2024-05-31',3),(3,'UEFA Champions League',NULL,'2023-06-27','2024-07-01',5),(4,'Seria A',25,'2023-07-18','2024-05-25',3);
/*!40000 ALTER TABLE `liga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `odbrana`
--

LOCK TABLES `odbrana` WRITE;
/*!40000 ALTER TABLE `odbrana` DISABLE KEYS */;
INSERT INTO `odbrana` VALUES (1,1,1,23),(2,1,1,77),(3,1,1,96),(4,47,1,14),(5,47,1,66),(6,83,6,15),(7,78,6,34),(8,83,6,67),(9,78,6,88),(10,30,2,12),(11,1,1,88);
/*!40000 ALTER TABLE `odbrana` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pozicija`
--

LOCK TABLES `pozicija` WRITE;
/*!40000 ALTER TABLE `pozicija` DISABLE KEYS */;
INSERT INTO `pozicija` VALUES ('AM','Ofanzivni vezni'),('CB','Štoper'),('CF','Centarfor'),('CM','Centralni vezni'),('DM','Defanzivni vezni'),('GK','Golman'),('LB','Lijevi bek'),('LM','Lijevi vezni'),('LW','Lijevo krilo'),('LWB','Krilni lijevi bek'),('RB','Desni bek'),('RM','Desni vezni'),('RW','Desno krilo'),('RWB','Krilni desni bek'),('SS','Polu-špic');
/*!40000 ALTER TABLE `pozicija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `stadion`
--

LOCK TABLES `stadion` WRITE;
/*!40000 ALTER TABLE `stadion` DISABLE KEYS */;
INSERT INTO `stadion` VALUES (1,'Gradski stadion','Banja Luka',9730,2),(2,'Bijeli brijeg','Mostar',9000,2),(3,'Koševo','Sarajevo',34500,2),(4,'Rođeni','Vrapčići',7000,1),(5,'Pecara','Široki Brijeg',6000,1),(6,'Grbavica','Sarajevo',13146,2),(7,'Luke','Doboj',3000,1),(8,'Mokri dolac','Posušje',8000,1),(9,'Gradski stadion','Konjic',3000,2),(10,'Perica-Pero Pavlović','Gabela',3000,1),(11,'Tušanj','Tuzla',7000,1),(12,'Gradski stadion','Ugljevik',5000,1),(13,'Rajko Mitić','Beograd',55538,2),(14,'JNA','Beograd',32712,2),(15,'TSC Arena','Bačka Topola',4500,2),(16,'Karađorđe','Novi Sad',14852,2),(17,'Etihad','Mančester',55017,2),(18,'Allianz Arena','Minhen',75024,1),(19,'Allianz Stadium','Torino',41507,1);
/*!40000 ALTER TABLE `stadion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `trener`
--

LOCK TABLES `trener` WRITE;
/*!40000 ALTER TABLE `trener` DISABLE KEYS */;
INSERT INTO `trener` VALUES (1,'Pep','Guardiola',33,17),(2,'Massimiliano','Allegri',25,19),(3,'Thomas','Tuchel',21,18),(4,'Igor','Duljaj',2,14),(5,'Barak','Bakhar',24,13),(6,'Žarko','Lazetić',2,15),(7,'Ranko','Popović',2,16),(8,'Vinko','Marinović',2,1),(9,'Krunoslav','Rendulić',18,2),(10,'Simon','Rožman',32,3),(11,'Dean','Klafurić',18,4),(12,'Marijan','Budimir',18,5),(13,'Haris','Alihodžić',1,6),(14,'Vlado','Jagodić',1,7),(15,'Branko','Karačić',18,8),(16,'Edis','Mulalić',1,9),(17,'Denis','Ćorić',18,10),(18,'Adnan','Osmanhodžić',1,11),(19,'Mihajlo','Jurasović',2,12);
/*!40000 ALTER TABLE `trener` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `utakmica`
--

LOCK TABLES `utakmica` WRITE;
/*!40000 ALTER TABLE `utakmica` DISABLE KEYS */;
INSERT INTO `utakmica` VALUES (1,1,3,1,'2023-10-18','19:00:00',2,0,1,1),(2,11,2,11,'2023-09-27','15:00:00',1,3,1,1),(3,4,10,4,'2023-08-06','17:00:00',1,1,1,1),(4,12,9,12,'2023-08-05','17:00:00',1,0,1,1),(5,8,5,8,'2023-08-04','17:00:00',0,0,1,1),(6,7,6,7,'2023-09-20','15:00:00',2,0,1,1),(7,4,12,4,'2023-07-29','20:30:00',0,1,1,2),(8,10,11,10,'2023-07-30','17:00:00',2,1,1,2),(9,3,7,3,'2023-07-30','20:00:00',1,2,1,2),(10,6,9,6,'2023-08-30','18:30:00',1,0,1,2),(11,2,8,2,'2023-09-13','18:30:00',2,0,1,2),(12,5,1,5,'2023-09-27','18:30:00',0,3,1,2),(13,1,13,1,'2023-02-02','17:00:00',1,1,3,1),(15,13,14,13,'2023-12-06','19:00:00',0,0,2,1),(16,15,16,13,'2023-12-06','20:00:00',0,0,2,1);
/*!40000 ALTER TABLE `utakmica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `vrsta_podloge`
--

LOCK TABLES `vrsta_podloge` WRITE;
/*!40000 ALTER TABLE `vrsta_podloge` DISABLE KEYS */;
INSERT INTO `vrsta_podloge` VALUES (1,'Prirodna trava','Prirodna trava nanesena u busenima dimenzija 1.20 m sirine x 30m duzine'),(2,'Hibridna podloga','Kombinacija prave trave i vještačkih niti, velike gustine i savršenog kvaliteta'),(3,'Vještačka trava','Pogodna za područija na kojima nema odgovarajućih uslova za pravu travu');
/*!40000 ALTER TABLE `vrsta_podloge` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-01 16:06:47
