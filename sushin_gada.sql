-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: sushin_gada
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `accounts_view`
--

DROP TABLE IF EXISTS `accounts_view`;
/*!50001 DROP VIEW IF EXISTS `accounts_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `accounts_view` AS SELECT 
 1 AS `id_user`,
 1 AS `name`,
 1 AS `lastName1`,
 1 AS `lastName2`,
 1 AS `birthDate`,
 1 AS `gender`,
 1 AS `email`,
 1 AS `address`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `address` (
  `id_address` int(11) NOT NULL AUTO_INCREMENT,
  `street` varchar(50) NOT NULL,
  `number` varchar(7) NOT NULL,
  `interior_number` varchar(5) DEFAULT NULL,
  `neighborhood` varchar(50) DEFAULT NULL,
  `zip_code` char(6) DEFAULT NULL,
  `phone` char(10) DEFAULT NULL,
  PRIMARY KEY (`id_address`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'Avenida Luis Donaldo Colosio','119',NULL,'Jardines de la Concepción I','20120','4490000000'),(2,'Calle Pedro Parga','321',NULL,'Zona Centro','20000','4490000000'),(3,'Avenida Las Américas','1626',NULL,'Valle Dorado','20235','4490000000'),(4,'Luis Hidalgo Monroy','123',NULL,'Búlevares 1ra Secc','20288','4499999999'),(5,'Puerto Rico','113','A','Valle Dorado','20235','4499999999'),(6,'Prol. Libertad','128','C','Zona Centro','20000','4499999999'),(7,'San Francisco','221',NULL,'San Cayetano','20010','4499999999'),(8,'San Julián','239','B','San José del Arenal','20130','4499999999'),(9,'San Julián','239','D','San José del Arenal','20130','4499999999'),(10,'Licenciado Francisco Primo Verdad','639','B','Barrio de la Purísima','20259','4499999999'),(11,'Licenciado Francisco Primo Verdad','713',NULL,'Barrio de la Purísima','20259','4499999999'),(12,'Av. José Ma. Chávez','445',NULL,'Obraje','20230','4499999999'),(13,'Crepúsculo','218',NULL,'Vista del Sol I','20266','4499999999'),(14,'Av. Héroe de Nacozari','2414','D','Jardines del Parque','20276','4499999999'),(16,'Luis Hidalgo Monroy','121',NULL,'Búlevares Primera Sección','20288','4492621398'),(17,'Luis Hidalgo Monroy','121','A','Búlevares Primera Sección','20288','4492621398');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `discount` (
  `id_discount` int(11) NOT NULL AUTO_INCREMENT,
  `code` char(6) NOT NULL,
  `percentage` decimal(2,2) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  PRIMARY KEY (`id_discount`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount`
--

LOCK TABLES `discount` WRITE;
/*!40000 ALTER TABLE `discount` DISABLE KEYS */;
INSERT INTO `discount` VALUES (0,'N/A',0.00,'1000-01-01 00:00:00','9999-12-31 23:59:59'),(1,'GP3RY5',0.15,'2018-12-12 00:00:00','2019-01-06 23:59:59'),(2,'R4F4BD',0.10,'2019-07-25 00:00:00','2019-07-25 23:59:59'),(3,'L4L0BD',0.15,'2019-03-26 00:00:00','2019-03-26 23:59:59'),(4,'V1D4BD',0.05,'2019-05-17 00:00:00','2019-05-17 23:59:59'),(5,'MUTHUR',0.30,'2019-05-10 00:00:00','2019-05-10 23:59:59'),(6,'MAY4TH',0.25,'2019-05-04 00:00:00','2019-05-04 23:59:59'),(7,'LEIFER',0.50,'2019-10-09 00:00:00','2019-10-09 23:59:59'),(8,'VIVAMX',0.15,'2019-09-15 00:00:00','2019-09-16 23:59:59'),(9,'REVMEX',0.15,'2018-11-20 00:00:00','2018-11-20 23:59:59'),(10,'NAVIDA',0.35,'2018-12-24 00:00:00','2018-12-25 23:59:59'),(11,'2019NY',0.35,'2019-01-01 00:00:00','2019-01-01 23:59:59'),(12,'DININO',0.50,'2019-04-30 00:00:00','2019-04-30 23:59:59'),(13,'DPADRE',0.50,'2019-06-16 00:00:00','2019-06-16 23:59:59'),(14,'314DAY',0.31,'2019-03-14 00:00:00','2019-03-14 23:59:59'),(15,'SQUIDW',0.15,'2019-02-15 00:00:00','2019-02-15 23:59:59'),(16,'<3-DAY',0.40,'2019-02-14 00:00:00','2019-02-14 23:59:59');
/*!40000 ALTER TABLE `discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `items` (
  `id_items` int(11) NOT NULL AUTO_INCREMENT,
  `id_purchase` int(11) NOT NULL,
  `id_item` tinyint(4) NOT NULL,
  `quantity` tinyint(4) NOT NULL,
  `subtotal` decimal(5,2) DEFAULT NULL,
  `price` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id_items`),
  KEY `id_purchase` (`id_purchase`),
  KEY `id_item` (`id_item`),
  CONSTRAINT `items_ibfk_2` FOREIGN KEY (`id_item`) REFERENCES `menu` (`id_item`),
  CONSTRAINT `items_ibfk_3` FOREIGN KEY (`id_purchase`) REFERENCES `purchase` (`id_purchase`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,1,2,2,200.00,140.00),(2,1,4,1,150.00,150.00),(3,1,3,1,100.00,100.00),(4,2,1,1,120.00,120.00),(5,2,10,4,380.00,95.00),(6,2,1,1,120.00,120.00),(7,2,22,1,15.00,15.00),(8,1,2,1,140.00,140.00),(9,3,3,4,400.00,100.00),(13,4,1,1,120.00,120.00),(14,4,7,2,280.00,140.00),(15,4,20,1,60.00,60.00),(16,5,12,1,75.00,75.00),(17,5,23,2,30.00,15.00),(18,5,17,1,40.00,40.00),(19,5,9,1,150.00,150.00),(20,6,1,1,120.00,120.00),(21,6,3,1,100.00,100.00),(22,6,6,1,180.00,180.00),(23,6,23,3,45.00,15.00),(29,7,3,2,200.00,100.00),(30,7,11,3,246.00,82.00),(31,7,21,1,80.00,80.00),(32,7,20,1,60.00,60.00),(33,7,19,1,50.00,50.00),(34,7,24,1,15.00,15.00),(35,8,1,1,120.00,120.00),(36,8,24,1,15.00,15.00),(37,8,19,1,50.00,50.00),(38,9,1,1,120.00,120.00),(39,9,7,1,140.00,140.00),(40,9,9,1,150.00,150.00),(41,9,22,1,15.00,15.00),(42,9,23,1,15.00,15.00),(43,9,21,1,80.00,80.00),(44,10,2,1,140.00,140.00),(45,10,3,1,100.00,100.00),(46,11,1,1,120.00,120.00),(47,12,4,1,178.00,178.00),(48,8,4,2,300.00,150.00),(49,13,4,4,600.00,150.00),(50,13,3,4,400.00,100.00),(51,13,2,2,280.00,140.00),(52,13,1,3,360.00,120.00),(53,13,21,1,80.00,80.00),(54,14,3,1,100.00,100.00),(55,14,4,1,150.00,150.00);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `purchase_trigger_ins` AFTER INSERT ON `items` FOR EACH ROW begin
	call update_purchase(new.id_purchase);
end */;;
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
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `purchase_trigger_upd` AFTER UPDATE ON `items` FOR EACH ROW begin
	call update_purchase(new.id_purchase);
end */;;
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
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `purchase_trigger_del` AFTER DELETE ON `items` FOR EACH ROW begin
	call update_purchase(old.id_purchase);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `location` (
  `id_location` int(11) NOT NULL AUTO_INCREMENT,
  `id_address` int(11) NOT NULL,
  `latitude` char(12) DEFAULT NULL,
  `longitude` char(12) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_location`),
  KEY `id_address` (`id_address`),
  CONSTRAINT `location_ibfk_1` FOREIGN KEY (`id_address`) REFERENCES `address` (`id_address`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,1,'21.9241668','-102.3137507','Sucursal Jardines'),(2,2,'21.8855385','-102.2915971','Sucursal Centro'),(3,3,'21.8624478','-102.3035201','Sucursal Las Américas');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_schedule`
--

DROP TABLE IF EXISTS `location_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `location_schedule` (
  `id_location` int(11) DEFAULT NULL,
  `id_schedule` int(11) DEFAULT NULL,
  `day` char(3) DEFAULT NULL,
  KEY `id_location` (`id_location`),
  KEY `id_schedule` (`id_schedule`),
  CONSTRAINT `location_schedule_ibfk_1` FOREIGN KEY (`id_location`) REFERENCES `location` (`id_location`) ON DELETE CASCADE,
  CONSTRAINT `location_schedule_ibfk_2` FOREIGN KEY (`id_schedule`) REFERENCES `schedule` (`id_schedule`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_schedule`
--

LOCK TABLES `location_schedule` WRITE;
/*!40000 ALTER TABLE `location_schedule` DISABLE KEYS */;
INSERT INTO `location_schedule` VALUES (1,1,'mon'),(1,1,'tue'),(1,4,'wed'),(1,1,'thu'),(1,2,'fri'),(1,2,'sat'),(1,3,'sun'),(2,1,'mon'),(2,4,'tue'),(2,3,'wed'),(2,1,'thu'),(2,2,'fri'),(2,2,'sat'),(2,3,'sun'),(3,3,'mon'),(3,3,'tue'),(3,3,'wed'),(3,3,'thu'),(3,3,'fri'),(3,3,'sat'),(3,3,'sun');
/*!40000 ALTER TABLE `location_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `locations_view`
--

DROP TABLE IF EXISTS `locations_view`;
/*!50001 DROP VIEW IF EXISTS `locations_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `locations_view` AS SELECT 
 1 AS `name`,
 1 AS `address`,
 1 AS `coordinates`,
 1 AS `schedule`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `menu` (
  `id_item` tinyint(4) NOT NULL AUTO_INCREMENT,
  `id_type` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(120) NOT NULL,
  `picture` char(30) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `available` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_item`),
  KEY `id_type` (`id_type`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `type` (`id_type`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,1,'Unagui','Rollo de alga, salmón y anguila.','https://imgur.com/oogRI5R.jpg',120.00,1),(2,1,'Maguro Avocado Uramaki','Uramaki de aguacate y atún.','https://imgur.com/2YS3ovm.jpg',140.00,1),(3,1,'Shake Maki','Maki de salmón.','https://imgur.com/0V2Afb0.jpg',100.00,1),(4,1,'California Uramaki','Uramaki de aguacate y cangrejo.','https://imgur.com/Wodtght.jpg',150.00,1),(5,1,'Mango Avocado Uramaki','Uramaki de mango y aguacate.','https://imgur.com/IAT5GKx.jpg',100.00,1),(6,1,'Sushi No Moriawase','Variedad de sushi (3 Nigirils + 4 Makis).','https://imgur.com/v08ll1w.jpg',180.00,1),(7,1,'Ebi Avocado Tobiko Uramaki','Langostino, aguacate, huevas de pez volador.','https://imgur.com/U6LRsWb.jpg',140.00,1),(8,1,'Ukai Uramaki','Rollo de queso fresco recubierto de salmón y aguacate.','https://imgur.com/jlRokYv.jpg',120.00,1),(9,1,'Oli Uramaki','Salmón, albahacacon, queso fresco, tomate seco y esparrago verde.','https://imgur.com/RFs3ZHV.jpg',150.00,1),(10,1,'Banana Roll','Rollo de plátano horneado con camarón tempura, topping maki y philadelphia.','https://imgur.com/LEN9Eih.jpg',95.00,1),(11,1,'Tres Quesos','Empanizado de queso manchego, queso amarillo y philadelphia.','https://imgur.com/KyfakjL.jpg',82.00,1),(12,1,'Mar y Tierra','Empanizado de res, camarón, aguacate y queso philadelphia por dentro.','https://imgur.com/IyLp5Te.jpg',75.00,1),(13,1,'Camarón Blue','Camarón, tocino, aguacate, philadelphia por dentro y queso manchego por fuera.','https://imgur.com/gOzerzO.jpg',82.00,1),(14,1,'Sushin\' Gada Roll','Cangrejo y philadelphia con topping maki bañado con salsa de anguila.','https://imgur.com/q5TIYlW.jpg',135.00,1),(15,1,'Beluman','Salmón por fuera, pasta maki, camarón y philadelphia por dentro.','https://imgur.com/xmiamfS.jpg',129.00,1),(16,2,'Té Negro','Producto hecho de la planta Camellia sinensis con un alto grado de oxidación.','https://imgur.com/7WDraUj.jpg',40.00,1),(17,2,'Té Verde','Producto hecho de la planta Camellia sinensis que no ha sufrido oxidación.','https://imgur.com/LZuz5Eg.jpg',40.00,1),(18,2,'Té Helado','Té helado de limón adornado con hojas de menta y rodajas de limón.','https://imgur.com/ZbVM4ZC.jpg',35.00,1),(19,3,'Sake','Bebida tradicional japonesa hecha de licor de arroz (300ml).','https://imgur.com/d5vuzo3.jpg',50.00,1),(20,3,'Syou-Chû','Bebida tradicional japonesa hecha de licor de trigo o patatas (300ml).','https://imgur.com/uqI7fAm.jpg',60.00,1),(21,3,'Amazake','Bebida tradicional japonesa hecha de licor de arroz dulce (300ml).','https://imgur.com/COj0ooy.jpg',80.00,1),(22,2,'Coca-Cola','Bebida carbonatada sabor cola (600ml).','https://imgur.com/OP78h7k.png',15.00,1),(23,2,'Fanta','Bebida carbonatada sabor naranja (600ml).','https://imgur.com/ltrxnOf.png',15.00,1),(24,2,'Sprite','Bebida carbonatada sabor lima-limón (600ml).','https://imgur.com/WPnYdCv.jpg',15.00,1);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_prices` BEFORE UPDATE ON `menu` FOR EACH ROW begin
	declare done int default false;
	declare c_closed int;
	declare c_purchase int;
	declare c_cursor cursor for select closed, id_purchase from purchase;
	declare continue handler for not found set done = true;
    	open c_cursor;
    	if new.price != old.price then
		read_loop: loop
			fetch c_cursor into c_closed, c_purchase;
            		if done then
				leave read_loop;
			end if;
			if c_closed = 0 then
				update items set price = new.price, subtotal = new.price*quantity where id_item = new.id_item and id_purchase = c_purchase;
            		end if;
		end loop;
	end if;
    close c_cursor;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `menu_view`
--

DROP TABLE IF EXISTS `menu_view`;
/*!50001 DROP VIEW IF EXISTS `menu_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `menu_view` AS SELECT 
 1 AS `idItem`,
 1 AS `name`,
 1 AS `type`,
 1 AS `description`,
 1 AS `picture`,
 1 AS `quantity`,
 1 AS `price`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `orders_view`
--

DROP TABLE IF EXISTS `orders_view`;
/*!50001 DROP VIEW IF EXISTS `orders_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `orders_view` AS SELECT 
 1 AS `id_user`,
 1 AS `id`,
 1 AS `closed`,
 1 AS `date`,
 1 AS `discount`,
 1 AS `taxes`,
 1 AS `total`,
 1 AS `items`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `purchase` (
  `id_purchase` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_location` int(11) DEFAULT NULL,
  `id_discount` int(11) DEFAULT NULL,
  `closed` tinyint(4) NOT NULL,
  `date` datetime NOT NULL,
  `taxes` varchar(45) NOT NULL,
  `total` varchar(45) NOT NULL,
  `id_billing_address` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_purchase`),
  KEY `id_user` (`id_user`),
  KEY `id_location` (`id_location`),
  KEY `id_discount` (`id_discount`),
  KEY `id_billing_address` (`id_billing_address`),
  CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  CONSTRAINT `purchase_ibfk_2` FOREIGN KEY (`id_location`) REFERENCES `location` (`id_location`),
  CONSTRAINT `purchase_ibfk_3` FOREIGN KEY (`id_discount`) REFERENCES `discount` (`id_discount`),
  CONSTRAINT `purchase_ibfk_4` FOREIGN KEY (`id_billing_address`) REFERENCES `address` (`id_address`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` VALUES (1,1,NULL,0,0,'2018-11-18 00:16:36','94.4000015258789','590',NULL),(2,4,NULL,0,1,'2018-11-18 00:17:16','101.60000000000001','635.00',1),(3,4,NULL,0,1,'2018-12-10 23:18:21','64','400.00',2),(4,4,2,0,1,'2018-12-20 18:04:41','73.5999984741211','460',2),(5,4,1,1,1,'2018-12-20 18:06:03','40.119998931884766','250.75',2),(6,4,1,1,1,'2018-12-20 18:07:21','60.52000045776367','378.25',2),(7,4,2,1,1,'2018-12-20 18:09:11','88.53599548339844','553.3499755859375',2),(8,4,NULL,0,0,'2018-12-20 18:09:36','77.5999984741211','485',NULL),(9,7,1,0,1,'2018-12-20 18:13:06','83.19999694824219','520',16),(10,7,2,0,1,'2018-12-20 18:14:47','38.400001525878906','240',16),(11,7,3,0,1,'2018-12-20 18:15:45','19.200000762939453','120',17),(12,7,2,0,1,'2018-12-20 18:31:18','28.479999542236328','178',17),(13,3,1,0,1,'2018-12-20 21:09:55','275.20001220703125','1720',1),(14,3,1,1,1,'2018-12-20 21:11:21','34','212.5',1);
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `schedule` (
  `id_schedule` int(11) NOT NULL AUTO_INCREMENT,
  `start` time DEFAULT NULL,
  `end` time DEFAULT NULL,
  PRIMARY KEY (`id_schedule`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,'10:00:00','22:00:00'),(2,'10:00:00','23:59:59'),(3,'12:00:00','22:00:00'),(4,NULL,NULL);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `type` (
  `id_type` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(7) NOT NULL,
  PRIMARY KEY (`id_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'dish'),(2,'drink'),(3,'alcohol');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `id_shipping_address` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `last_name1` varchar(45) DEFAULT NULL,
  `last_name2` varchar(45) DEFAULT NULL,
  `birth_date` date NOT NULL,
  `gender` tinyint(4) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `account_type` tinyint(4) DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  KEY `id_shipping_address` (`id_shipping_address`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_shipping_address`) REFERENCES `address` (`id_address`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,4,'Marco','Rubio','Cortéz','1965-08-14',0,'marco.rubio@correo.com','3e6dc62f220c57f4e44e3dd541c175b3a4fd22986bafa16d47ce3d4c2b224ac8',1,1),(2,5,'Sarah','Connor',NULL,'1956-09-26',1,'t2isdabest@correo.com','3e6dc62f220c57f4e44e3dd541c175b3a4fd22986bafa16d47ce3d4c2b224ac8',1,1),(3,1,'Miguel','Hidalgo','Costilla','1753-05-08',0,'padre-de-la-patria@correo.com','3e6dc62f220c57f4e44e3dd541c175b3a4fd22986bafa16d47ce3d4c2b224ac8',0,1),(4,7,'Andrés Manuel','López','Obrador','1953-11-13',0,'amlove@correo.com','3e6dc62f220c57f4e44e3dd541c175b3a4fd22986bafa16d47ce3d4c2b224ac8',1,1),(5,2,'Obi','Wan','Kenobi','1977-05-25',0,'otfan@correo.com','3e6dc62f220c57f4e44e3dd541c175b3a4fd22986bafa16d47ce3d4c2b224ac8',0,1),(6,8,'Bond','James','Bond','1962-10-05',0,'dr.no@correo.com','3e6dc62f220c57f4e44e3dd541c175b3a4fd22986bafa16d47ce3d4c2b224ac8',1,1),(7,10,'Lara','Croft',NULL,'1996-10-25',1,'tomb-raider@correo.com','3e6dc62f220c57f4e44e3dd541c175b3a4fd22986bafa16d47ce3d4c2b224ac8',1,1),(8,3,'Sor Juana','Inés','De La Cruz','1648-11-12',1,'10ma-musa@correo.com','3e6dc62f220c57f4e44e3dd541c175b3a4fd22986bafa16d47ce3d4c2b224ac8',0,1),(9,1,'Gordon','Freeman',NULL,'1998-11-19',0,'half-life@correo.com','3e6dc62f220c57f4e44e3dd541c175b3a4fd22986bafa16d47ce3d4c2b224ac8',1,1),(10,11,'Neta','Lee','Hershlag','1981-06-09',1,'natalie-portman@correo.com','3e6dc62f220c57f4e44e3dd541c175b3a4fd22986bafa16d47ce3d4c2b224ac8',1,1),(11,12,'Mario Fortino Alfonso','Moreno','Reyes','1911-08-12',1,'cantinflas@correo.com','3e6dc62f220c57f4e44e3dd541c175b3a4fd22986bafa16d47ce3d4c2b224ac8',1,1),(12,14,'Enrique','Peña','Nieto','1966-07-20',1,'infraestuctochor@correo.com','3e6dc62f220c57f4e44e3dd541c175b3a4fd22986bafa16d47ce3d4c2b224ac8',1,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `accounts_view`
--

/*!50001 DROP VIEW IF EXISTS `accounts_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `accounts_view` AS select `user`.`id_user` AS `id_user`,`user`.`name` AS `name`,`user`.`last_name1` AS `lastName1`,`user`.`last_name2` AS `lastName2`,`user`.`birth_date` AS `birthDate`,`user`.`gender` AS `gender`,`user`.`email` AS `email`,json_object('street',`address`.`street`,'number',`address`.`number`,'interiorNumber',`address`.`interior_number`,'neighborhood',`address`.`neighborhood`,'zipCode',`address`.`zip_code`,'phone',`address`.`phone`) AS `address` from (`user` join `address` on((`user`.`id_shipping_address` = `address`.`id_address`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `locations_view`
--

/*!50001 DROP VIEW IF EXISTS `locations_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `locations_view` AS select `location`.`name` AS `name`,json_object('street',`address`.`street`,'number',`address`.`number`,'interiorNumber',`address`.`interior_number`,'neighborhood',`address`.`neighborhood`,'zipCode',`address`.`zip_code`,'phone',`address`.`phone`) AS `address`,json_object('latitude',`location`.`latitude`,'longitude',`location`.`longitude`) AS `coordinates`,json_arrayagg(json_object('day',`location_schedule`.`day`,'start',`schedule`.`start`,'end',`schedule`.`end`)) AS `schedule` from (((`location` join `location_schedule` on((`location`.`id_location` = `location_schedule`.`id_location`))) join `schedule` on((`location_schedule`.`id_schedule` = `schedule`.`id_schedule`))) join `address` on((`location`.`id_address` = `address`.`id_address`))) group by `location`.`id_location` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `menu_view`
--

/*!50001 DROP VIEW IF EXISTS `menu_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `menu_view` AS select `menu`.`id_item` AS `idItem`,`menu`.`name` AS `name`,`type`.`name` AS `type`,`menu`.`description` AS `description`,`menu`.`picture` AS `picture`,1 AS `quantity`,`menu`.`price` AS `price` from (`menu` join `type` on((`menu`.`id_type` = `type`.`id_type`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orders_view`
--

/*!50001 DROP VIEW IF EXISTS `orders_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `orders_view` AS select `purchase`.`id_user` AS `id_user`,`purchase`.`id_purchase` AS `id`,`purchase`.`closed` AS `closed`,`purchase`.`date` AS `date`,`discount`.`percentage` AS `discount`,`purchase`.`taxes` AS `taxes`,`purchase`.`total` AS `total`,json_arrayagg(json_object('name',`menu`.`name`,'type',`type`.`name`,'description',`menu`.`description`,'picture',`menu`.`picture`,'quantity',`items`.`quantity`,'price',`items`.`price`)) AS `items` from ((((`purchase` join `items` on((`purchase`.`id_purchase` = `items`.`id_purchase`))) join `menu` on((`items`.`id_item` = `menu`.`id_item`))) join `discount` on((`purchase`.`id_discount` = `discount`.`id_discount`))) join `type` on((`menu`.`id_type` = `type`.`id_type`))) group by `purchase`.`id_purchase` */;
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

-- Dump completed on 2018-12-20 22:56:35
