-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `swiftcard`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `swiftcard` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `swiftcard`;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `level` int(11) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `log_time` double DEFAULT NULL,
  `prefix` text,
  `message` text,
  PRIMARY KEY (`id`),
  KEY `idx_log_level` (`level`),
  KEY `idx_log_category` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CardID` int(11) NOT NULL,
  `RegisterDate` int(10) NOT NULL,
  `Money` float NOT NULL DEFAULT '0',
  `Bonuses` float DEFAULT '0',
  `Tickets` int(11) DEFAULT '0',
  `ChargedTickets` int(11) NOT NULL DEFAULT '0',
  `SpendTickets` int(11) NOT NULL DEFAULT '0',
  `Spend` float NOT NULL DEFAULT '0',
  `SpendBonuses` float NOT NULL DEFAULT '0',
  `Blocked` tinyint(1) NOT NULL DEFAULT '0',
  `InPawn` float NOT NULL DEFAULT '0',
  `LevelID` int(11) NOT NULL,
  `Deleted` tinyint(1) NOT NULL DEFAULT '0',
  `Charged` float NOT NULL DEFAULT '0',
  `ChargedBonuses` float NOT NULL DEFAULT '0',
  `BonusGames` int(11) NOT NULL DEFAULT '0',
  `BonusGamesCounter` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `TAccount_Deleted` (`Deleted`),
  KEY `CardID` (`CardID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actions`
--

DROP TABLE IF EXISTS `actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actions` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `settings` text NOT NULL,
  `schedule` varchar(255) NOT NULL,
  `dateFrom` int(10) unsigned NOT NULL,
  `dateTo` int(10) unsigned NOT NULL,
  `disabled` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `withHighPriority` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `enabled` (`disabled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions`
--

LOCK TABLES `actions` WRITE;
/*!40000 ALTER TABLE `actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actionuse`
--

DROP TABLE IF EXISTS `actionuse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actionuse` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ActionID` int(11) NOT NULL,
  `PersonID` int(11) NOT NULL,
  `UseDate` int(10) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `TActionUse_ActionID` (`ActionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actionuse`
--

LOCK TABLES `actionuse` WRITE;
/*!40000 ALTER TABLE `actionuse` DISABLE KEYS */;
/*!40000 ALTER TABLE `actionuse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `card` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `HardID` varchar(255) NOT NULL,
  `ShortID` smallint(5) DEFAULT NULL,
  `ServiceCard` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Come from Group',
  `GroupID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `HardID` (`HardID`),
  KEY `TCard_HardID` (`HardID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cardgroup`
--

DROP TABLE IF EXISTS `cardgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cardgroup` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Role` varchar(16) DEFAULT NULL,
  `CardDeposit` float NOT NULL,
  `EmitCardCost` float NOT NULL,
  `MinMoneyToEmit` float NOT NULL,
  `Deleted` tinyint(1) NOT NULL,
  `CardRepairCost` float NOT NULL,
  `IsService` tinyint(1) NOT NULL,
  `IsStaff` tinyint(1) NOT NULL,
  `IsDefaultForNewCard` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `created_at` int(10) NOT NULL DEFAULT '0',
  `updated_at` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IsDefaultForNewCard` (`IsDefaultForNewCard`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cardgroup`
--

LOCK TABLES `cardgroup` WRITE;
/*!40000 ALTER TABLE `cardgroup` DISABLE KEYS */;
INSERT INTO `cardgroup` VALUES (1,'root','Root group','root',0,0,0,0,0,1,0,0,0,0),(2,'Кассир призотеки','Кассир призотеки','giftmaster',0,0,0,0,0,0,0,0,0,0),(3,'Администраторы','Управляющие залом','administrator',0,0,0,0,0,1,1,0,0,0),(4,'Кассиры',NULL,'paymaster',0,0,0,0,0,0,0,0,0,0),(5,'Техники',NULL,'technician',0,0,0,0,0,1,0,0,0,0),(6,'Клиенты',NULL,NULL,7,0,0,0,0,0,0,1,0,0);
/*!40000 ALTER TABLE `cardgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cash`
--

DROP TABLE IF EXISTS `cash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cash` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CashBox` float NOT NULL,
  `Safe` float NOT NULL,
  `Type` tinyint(1) NOT NULL,
  `AccountantID` int(11) NOT NULL,
  `updated_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash`
--

LOCK TABLES `cash` WRITE;
/*!40000 ALTER TABLE `cash` DISABLE KEYS */;
/*!40000 ALTER TABLE `cash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finance`
--

DROP TABLE IF EXISTS `finance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finance` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassID` int(11) unsigned NOT NULL,
  `EventTime` int(10) unsigned NOT NULL,
  `AccountantID` int(11) NOT NULL,
  `ContractorID` int(11) NOT NULL,
  `CashSum` float NOT NULL,
  `ObjectID` int(11) unsigned NOT NULL,
  `FunctionID` int(11) NOT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `CancelAccountID` int(11) NOT NULL,
  `CancelTime` int(10) unsigned NOT NULL,
  `ObjectGroupID` int(11) NOT NULL,
  `CardGroupID` int(11) unsigned NOT NULL,
  `Coins` int(11) NOT NULL,
  `Safe` float NOT NULL,
  `RoomID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `TFinance_ClassID` (`ClassID`),
  KEY `TFinance_EventTime` (`EventTime`),
  KEY `TFinance_RoomID` (`RoomID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finance`
--

LOCK TABLES `finance` WRITE;
/*!40000 ALTER TABLE `finance` DISABLE KEYS */;
/*!40000 ALTER TABLE `finance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financeclass`
--

DROP TABLE IF EXISTS `financeclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `financeclass` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` mediumtext,
  `ContractorRequired` tinyint(1) NOT NULL,
  `Deleted` tinyint(1) NOT NULL,
  `Type` tinyint(3) unsigned NOT NULL,
  `UserSpace` tinyint(1) NOT NULL,
  `ObjectRequired` tinyint(1) NOT NULL,
  `DefaultCost` float NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financeclass`
--

LOCK TABLES `financeclass` WRITE;
/*!40000 ALTER TABLE `financeclass` DISABLE KEYS */;
INSERT INTO `financeclass` VALUES (1,'Использование функции объекта','Использование функции объекта',1,0,0,0,1,0),(2,'Регистрация карты','Доход от регистрации карты',1,0,1,0,0,0),(3,'Возврат билетов на карту','Возврат билетов на карту',1,0,0,0,0,0),(4,'Обмен билетов на товар','Обмен билетов на товар',1,0,0,0,0,0),(5,'Размен купюры на жетоны','Размен купюры на жетоны',0,1,1,0,0,0),(6,'Пополнение счета','Пополнение счета',1,0,1,0,0,0),(7,'Снятие со счета','Снятие со счета',1,0,2,0,0,0),(8,'Игра на жетоны','Игра на жетоны',0,1,0,0,1,0),(9,'Неиспользованные купюры в объектах','Неиспользованные купюры в объектах',0,1,1,0,1,0),(10,'Добавлены жетоны в терминал','Добавлены жетоны в терминал',1,1,0,0,1,0),(11,'Выемка наличных из терминала','Выемка наличных из терминала',1,0,0,0,1,0),(12,'Пополнение счета при регистрации','Пополнение счета при регистрации',1,0,1,0,0,0),(13,'Возврат залога по карте','Возврат залога по карте',1,0,0,0,0,0),(14,'Регистрация залога','Внесение залоговой суммы за карту',1,0,1,0,0,0),(15,'Регистрации подарочной карты','Пополнение счета при регистрации подарочной карты',1,0,0,0,0,0),(16,'Регистрация залога подарочной карты','Регистрация залога подарочной карты',1,0,0,0,0,0),(17,'Оплата из внешней сети','Оплата из внешней сети',1,0,0,0,0,0),(18,'Акционное пополнение','Акционное пополнение счета',1,0,0,0,0,0),(19,'Плата за восстановление карты','Плата за восстановление карты',1,0,0,0,0,0),(20,'Оплачено бонусами','Оплачено бонусами',1,0,0,0,0,0),(21,'Начисление бонусов','Начисление бонусов',1,0,0,0,0,0),(22,'Оплата услуги','Оплата услуги',1,0,0,0,0,0);
/*!40000 ALTER TABLE `financeclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `levels`
--

DROP TABLE IF EXISTS `levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `levels` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Discount` float NOT NULL,
  `PersonsExpression` tinyint(3) unsigned NOT NULL,
  `ReturnPawn` tinyint(1) NOT NULL,
  `Deleted` tinyint(1) NOT NULL,
  `Charge` float NOT NULL,
  `StartLevel` tinyint(1) NOT NULL,
  `OneCheckCharge` float NOT NULL,
  `created_at` int(10) NOT NULL DEFAULT '0',
  `updated_at` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `levels`
--

LOCK TABLES `levels` WRITE;
/*!40000 ALTER TABLE `levels` DISABLE KEYS */;
INSERT INTO `levels` VALUES (1,'Первый уровень',0,0,0,0,0,1,0,0,0),(3,'Второй уровень',2,0,0,1,1000,0,1000,0,0),(4,'Третий уровень',3,0,0,1,2000,0,2000,0,0),(5,'Все включено',100,0,1,1,800000,0,20000,0,0),(7,'VIP',50,1,0,1,50000,0,2000,0,1472381596);
/*!40000 ALTER TABLE `levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objectfunctions`
--

DROP TABLE IF EXISTS `objectfunctions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objectfunctions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Price` tinyint(3) unsigned NOT NULL,
  `Code` tinyint(3) unsigned NOT NULL,
  `ObjectID` int(11) NOT NULL,
  `Deleted` tinyint(1) NOT NULL,
  `created_at` int(10) NOT NULL DEFAULT '0',
  `updated_at` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objectfunctions`
--

LOCK TABLES `objectfunctions` WRITE;
/*!40000 ALTER TABLE `objectfunctions` DISABLE KEYS */;
/*!40000 ALTER TABLE `objectfunctions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objectgroup`
--

DROP TABLE IF EXISTS `objectgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objectgroup` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Image` varchar(255) DEFAULT NULL,
  `Deleted` tinyint(1) NOT NULL,
  `RoomID` int(11) NOT NULL,
  `IsWicket` tinyint(1) NOT NULL,
  `WicketCounter` int(11) NOT NULL,
  `WicketLimit` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objectgroup`
--

LOCK TABLES `objectgroup` WRITE;
/*!40000 ALTER TABLE `objectgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `objectgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objects`
--

DROP TABLE IF EXISTS `objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objects` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `HardID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Status` tinyint(3) unsigned NOT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `CoinPrice` float NOT NULL,
  `Disabled` tinyint(1) NOT NULL,
  `Cost` float NOT NULL,
  `Area` float NOT NULL,
  `IsTerminal` tinyint(1) NOT NULL,
  `Coins` int(11) NOT NULL,
  `LastChargeCoins` int(11) NOT NULL,
  `Cash` float NOT NULL,
  `PlayTime` int(11) NOT NULL,
  `RoomID` int(11) NOT NULL,
  `created_at` int(10) NOT NULL DEFAULT '0',
  `updated_at` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objects`
--

LOCK TABLES `objects` WRITE;
/*!40000 ALTER TABLE `objects` DISABLE KEYS */;
/*!40000 ALTER TABLE `objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Deleted` tinyint(1) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` mediumtext NOT NULL,
  `ClassName` varchar(255) NOT NULL,
  `Settings` mediumtext NOT NULL,
  `Enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solddiscountservice`
--

DROP TABLE IF EXISTS `solddiscountservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solddiscountservice` (
  `ID` int(11) NOT NULL,
  `ActionID` int(11) NOT NULL,
  `CardID` int(11) NOT NULL,
  `RoomID` int(11) NOT NULL,
  `DateFrom` int(10) unsigned NOT NULL,
  `DateTo` int(10) unsigned NOT NULL,
  `FinanceRowID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solddiscountservice`
--

LOCK TABLES `solddiscountservice` WRITE;
/*!40000 ALTER TABLE `solddiscountservice` DISABLE KEYS */;
/*!40000 ALTER TABLE `solddiscountservice` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-10  0:55:18
