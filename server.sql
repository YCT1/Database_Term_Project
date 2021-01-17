-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.22 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for databasehomework
CREATE DATABASE IF NOT EXISTS `databasehomework` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_turkish_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `databasehomework`;

-- Dumping structure for table databasehomework.generalelections
CREATE TABLE IF NOT EXISTS `generalelections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `voted` int DEFAULT '0',
  `Turnout` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- Dumping data for table databasehomework.generalelections: ~1 rows (approximately)
/*!40000 ALTER TABLE `generalelections` DISABLE KEYS */;
INSERT INTO `generalelections` (`id`, `date`, `voted`, `Turnout`) VALUES
	(1, '2018-06-24', 59367469, 86.22),
	(2, '2015-11-01', 56965099, 85.18),
	(3, '2015-06-07', 56608817, 83.92),
	(4, '2015-06-12', 52806322, 83.16),
	(5, '2007-07-22', 42799303, 84.25),
	(6, '2011-06-12', 52806322, 83.16);
/*!40000 ALTER TABLE `generalelections` ENABLE KEYS */;

-- Dumping structure for table databasehomework.ge_result
CREATE TABLE IF NOT EXISTS `ge_result` (
  `id` int NOT NULL AUTO_INCREMENT,
  `percantage` float DEFAULT NULL,
  `vote` int DEFAULT NULL,
  `seat` int DEFAULT NULL,
  `personid` int DEFAULT NULL,
  `partyid` int DEFAULT NULL,
  `election` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `partyid` (`partyid`),
  KEY `f2` (`election`),
  KEY `FK_ge_result_persons` (`personid`),
  CONSTRAINT `f2` FOREIGN KEY (`election`) REFERENCES `generalelections` (`id`),
  CONSTRAINT `FK_ge_result_persons` FOREIGN KEY (`personid`) REFERENCES `persons` (`idpersons`),
  CONSTRAINT `partyid` FOREIGN KEY (`partyid`) REFERENCES `parties` (`idParties`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- Dumping data for table databasehomework.ge_result: ~0 rows (approximately)
/*!40000 ALTER TABLE `ge_result` DISABLE KEYS */;
INSERT INTO `ge_result` (`id`, `percantage`, `vote`, `seat`, `personid`, `partyid`, `election`) VALUES
	(1, 42.56, 21338693, 295, 1, 1, 1),
	(2, 22.65, 11354190, 146, 2, 2, 1),
	(3, 11.7, 5867302, 67, 10, 6, 1),
	(4, 11.1, 5565331, 49, 3, 3, 1),
	(5, 9.96, 4993479, 43, 5, 5, 1),
	(6, 49.5, 23681926, 317, 11, 1, 2),
	(7, 25.32, 12111812, 134, 2, 2, 2),
	(8, 11.9, 5694136, 40, 3, 3, 2),
	(9, 10.76, 5148085, 59, 6, 6, 2);
/*!40000 ALTER TABLE `ge_result` ENABLE KEYS */;

-- Dumping structure for table databasehomework.members
CREATE TABLE IF NOT EXISTS `members` (
  `members_id` int DEFAULT NULL,
  `started` date DEFAULT NULL,
  `ended` date DEFAULT NULL,
  `party` int DEFAULT NULL,
  `person` int DEFAULT NULL,
  KEY `party` (`party`),
  KEY `person` (`person`),
  CONSTRAINT `party` FOREIGN KEY (`party`) REFERENCES `parties` (`idParties`),
  CONSTRAINT `person` FOREIGN KEY (`person`) REFERENCES `persons` (`idpersons`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- Dumping data for table databasehomework.members: ~13 rows (approximately)
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` (`members_id`, `started`, `ended`, `party`, `person`) VALUES
	(1, '1983-12-23', '1998-12-23', 4, 1),
	(2, '2001-12-23', '2014-12-23', 1, 1),
	(3, '2002-12-23', NULL, 2, 2),
	(4, '1993-12-23', NULL, 3, 3),
	(5, '2017-12-23', NULL, 1, 1),
	(6, '1992-01-16', NULL, 2, 4),
	(7, '2001-01-16', '2016-01-01', 3, 5),
	(8, '2017-10-25', NULL, 5, 5),
	(9, '2012-10-15', NULL, 6, 6),
	(10, '1987-01-17', '1998-01-17', 4, 7),
	(11, '2001-01-17', NULL, 8, 7),
	(12, '2015-01-17', NULL, 3, 8),
	(13, '2015-01-17', NULL, 7, 9),
	(14, '2018-02-11', '2020-02-23', 6, 10),
	(15, '2020-12-12', NULL, 9, 11),
	(16, '2001-01-17', '2019-01-17', 1, 11);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;

-- Dumping structure for table databasehomework.parties
CREATE TABLE IF NOT EXISTS `parties` (
  `idParties` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `shortname` varchar(10) COLLATE utf8_turkish_ci DEFAULT NULL,
  `foundation` date DEFAULT NULL,
  `dissolution` date DEFAULT NULL,
  `img` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`idParties`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- Dumping data for table databasehomework.parties: ~8 rows (approximately)
/*!40000 ALTER TABLE `parties` DISABLE KEYS */;
INSERT INTO `parties` (`idParties`, `name`, `shortname`, `foundation`, `dissolution`, `img`) VALUES
	(1, 'AK Parti', 'AKP', '2001-08-14', NULL, 'img/akp.jpg'),
	(2, 'Cumhuriyet Halk Partisi', 'CHP', '1923-09-16', NULL, 'img/chp.jpg'),
	(3, 'Milliyetçi Hareket Partisi', 'MHP', '1969-02-09', NULL, 'img/mhp.jpg'),
	(4, 'Refah Partisi', 'RP', '1983-08-19', '1998-01-16', 'img/rp.jpg'),
	(5, 'İYİ Parti', 'İYİ', '2017-10-25', NULL, 'img/iyi.svg'),
	(6, 'Halkların Demokrat Partisi', 'HDP', '2012-10-15', NULL, 'img/hdp.svg'),
	(7, 'Vatan Partisi', 'VATAN', '2015-02-15', NULL, 'img/vatan.jpg'),
	(8, 'Saadet Partisi', 'SAADET', '2001-07-20', NULL, 'img/saadet.svg'),
	(9, 'Gelecek Partisi', 'GP', '2020-12-12', NULL, 'img/gelecek.svg');
/*!40000 ALTER TABLE `parties` ENABLE KEYS */;

-- Dumping structure for table databasehomework.persons
CREATE TABLE IF NOT EXISTS `persons` (
  `idpersons` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `surname` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `hometown` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `deathdate` date DEFAULT NULL,
  `img` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`idpersons`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- Dumping data for table databasehomework.persons: ~9 rows (approximately)
/*!40000 ALTER TABLE `persons` DISABLE KEYS */;
INSERT INTO `persons` (`idpersons`, `name`, `surname`, `hometown`, `birthdate`, `deathdate`, `img`) VALUES
	(1, 'Recep Tayyip', 'Erdoğan', 'İstanbul', '1954-02-26', NULL, 'img/erdogan.jpg'),
	(2, 'Kemal', 'Kılıçdaroğlu', 'Tunceli', '1948-12-17', NULL, 'img/kiliclaroglu.jpg'),
	(3, 'Devlet', 'Bahçeli', 'Osmaniye', '1948-01-01', NULL, 'img/bahceli.jpg'),
	(4, 'Muharrem', 'Ince', 'Yalova', '1964-06-04', NULL, 'img/ince.jpg'),
	(5, 'Meral', 'Aksener', 'İzmit', '1956-07-18', NULL, 'img/aksener.jpg'),
	(6, 'Selahattin', 'Demirtaş', 'Elazığ', '1973-04-10', NULL, 'img/demirtas.jpg'),
	(7, 'Temel', 'Karamollaoğlu', 'Kahramanmaraş', '1941-06-07', NULL, 'img/temel.jpg'),
	(8, 'Ekmeleddin', 'İhsanoğlu', 'Kahire', '1943-12-26', NULL, 'img/ekmeleddin.jpg'),
	(9, 'Doğu', 'Perinçek', 'Gaziantep', '1942-06-17', NULL, 'img/dogu.jpg'),
	(10, 'Sezai', 'Temelli', 'İstanbul', '1963-01-01', NULL, 'img/temelli.jpg'),
	(11, 'Ahmet', 'Davutoğlu', 'Konya', '1959-02-26', NULL, 'img/davutoglu.jpg');
/*!40000 ALTER TABLE `persons` ENABLE KEYS */;

-- Dumping structure for table databasehomework.presidentialcand
CREATE TABLE IF NOT EXISTS `presidentialcand` (
  `id` int NOT NULL AUTO_INCREMENT,
  `result_people` int NOT NULL,
  `result_percantage` float NOT NULL DEFAULT '0',
  `personId` int DEFAULT NULL,
  `election` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `personId` (`personId`),
  KEY `election` (`election`),
  CONSTRAINT `election` FOREIGN KEY (`election`) REFERENCES `presidentialelect` (`id`),
  CONSTRAINT `personId` FOREIGN KEY (`personId`) REFERENCES `persons` (`idpersons`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- Dumping data for table databasehomework.presidentialcand: ~9 rows (approximately)
/*!40000 ALTER TABLE `presidentialcand` DISABLE KEYS */;
INSERT INTO `presidentialcand` (`id`, `result_people`, `result_percantage`, `personId`, `election`) VALUES
	(1, 26330823, 52.59, 1, 1),
	(2, 15340321, 30.64, 4, 1),
	(3, 3649030, 7.29, 5, 1),
	(4, 4039390, 8.32, 6, 1),
	(5, 443704, 0.89, 7, 1),
	(6, 20670826, 51.65, 1, 2),
	(7, 15434167, 38.57, 8, 2),
	(8, 3914359, 9.78, 6, 2),
	(9, 98955, 0.2, 9, 1);
/*!40000 ALTER TABLE `presidentialcand` ENABLE KEYS */;

-- Dumping structure for table databasehomework.presidentialelect
CREATE TABLE IF NOT EXISTS `presidentialelect` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `voted` int NOT NULL DEFAULT '0',
  `turnout` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- Dumping data for table databasehomework.presidentialelect: ~2 rows (approximately)
/*!40000 ALTER TABLE `presidentialelect` DISABLE KEYS */;
INSERT INTO `presidentialelect` (`id`, `date`, `voted`, `turnout`) VALUES
	(1, '2018-06-24', 59354840, 86.24),
	(2, '2014-08-14', 40019352, 77.05);
/*!40000 ALTER TABLE `presidentialelect` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
