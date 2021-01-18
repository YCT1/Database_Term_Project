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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- Dumping data for table databasehomework.generalelections: ~8 rows (approximately)
/*!40000 ALTER TABLE `generalelections` DISABLE KEYS */;
INSERT INTO `generalelections` (`id`, `date`, `voted`, `Turnout`) VALUES
	(1, '2018-06-24', 59367469, 86.22),
	(2, '2015-11-01', 56608817, 83.92),
	(3, '2015-06-07', 52806322, 83.16),
	(4, '2011-06-12', 52806322, 83.16),
	(5, '2007-07-22', 42799303, 84.25),
	(6, '2002-11-03', 41407027, 79.14),
	(7, '1999-04-18', 37495217, 87.09),
	(8, '1995-12-24', 34155981, 85.2),
	(9, '1991-10-20', 29979123, 83.9);
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- Dumping data for table databasehomework.ge_result: ~40 rows (approximately)
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
	(9, 10.76, 5148085, 59, 6, 6, 2),
	(10, 40.87, 18867411, 258, 11, 1, 3),
	(11, 24.95, 11518139, 132, 2, 2, 3),
	(12, 16.29, 7520006, 80, 3, 3, 3),
	(13, 13.12, 6058489, 80, 6, 6, 3),
	(14, 49.13, 21399082, 327, 1, 1, 4),
	(15, 25.98, 11155972, 135, 2, 2, 4),
	(16, 13.01, 5585513, 53, 3, 3, 4),
	(17, 5.02, 2135487, 36, 6, 10, 4),
	(18, 46.58, 16340534, 341, 1, 1, 5),
	(19, 20.87, 7300234, 112, 12, 2, 5),
	(20, 14.27, 5001869, 71, 3, 3, 5),
	(21, 5.41, 1334518, 22, 6, 11, 5),
	(22, 34.28, 10808229, 363, 1, 1, 6),
	(23, 19.39, 6113352, 178, 12, 2, 6),
	(24, 9.54, 3008942, 0, 13, 12, 6),
	(25, 8.36, 2635787, 0, 3, 3, 6),
	(26, 7.25, 2285598, 0, 15, 13, 6),
	(27, 6.22, 1960660, 0, 16, 14, 6),
	(28, 5.12, 1601322, 0, 19, 16, 6),
	(29, 22.18, 6919670, 136, 17, 15, 7),
	(30, 17.98, 5606583, 129, 3, 3, 7),
	(31, 15.41, 4805381, 111, 18, 17, 7),
	(32, 13.22, 4122929, 86, 19, 16, 7),
	(33, 12.01, 3745417, 85, 13, 12, 7),
	(34, 21.38, 6012450, 158, 14, 4, 8),
	(35, 19.65, 5527288, 132, 19, 16, 8),
	(36, 19.18, 5396009, 135, 13, 12, 8),
	(37, 14.64, 4118025, 76, 17, 15, 8),
	(38, 10.71, 3011076, 49, 12, 2, 8),
	(39, 8.18, 2301343, 0, 20, 3, 8),
	(40, 8.17, 2716096, 0, 12, 2, 7),
	(41, 27.03, 6600726, 178, 21, 12, 9),
	(42, 24.01, 5862623, 115, 19, 16, 9),
	(43, 20.75, 5066571, 88, 22, 18, 9),
	(44, 16.87, 4121355, 62, 14, 4, 9),
	(45, 10.74, 2624301, 7, 17, 15, 9);
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

-- Dumping data for table databasehomework.members: ~32 rows (approximately)
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
	(16, '2001-01-17', '2019-01-17', 1, 11),
	(17, '2011-01-17', '2014-01-17', 10, 6),
	(18, '2010-01-17', '2011-01-17', 10, 6),
	(19, '1968-01-17', '1980-01-17', 2, 12),
	(20, '1992-01-17', NULL, 2, 12),
	(21, '1990-01-18', '2002-01-18', 12, 13),
	(22, '2002-01-18', '2009-01-18', 13, 15),
	(23, '2003-01-18', '2011-01-18', 8, 14),
	(24, '1987-01-18', '1998-01-18', 4, 14),
	(25, '1953-01-18', '1981-01-18', 2, 17),
	(26, '1987-01-18', '2004-12-18', 15, 17),
	(27, '1983-01-18', '1998-01-18', 4, 18),
	(28, '2001-01-18', NULL, 8, 10),
	(29, '1991-01-18', '2002-01-18', 16, 19),
	(30, '1998-01-18', '2001-01-18', 17, 1),
	(31, '1969-01-18', '1981-01-18', 3, 20),
	(32, '1993-01-18', '1997-01-18', 3, 20),
	(33, '1987-01-18', '1993-01-18', 12, 21),
	(34, '1985-01-18', '1995-01-18', 18, 22),
	(35, '1995-01-18', '2001-01-18', 2, 22);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- Dumping data for table databasehomework.parties: ~17 rows (approximately)
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
	(9, 'Gelecek Partisi', 'GP', '2020-12-12', NULL, 'img/gelecek.svg'),
	(10, 'Barış ve Demokrasi Partisi', 'BDP', '2008-05-02', '2014-07-11', 'img/bdp.png'),
	(11, 'Demokratik Toplum Partisi', 'DTP', '2005-11-05', '2009-12-11', 'img/dtp.jpg'),
	(12, 'Doğru Yol Partisi', 'DYP', '1983-06-23', '2007-06-27', 'img/dyp.jpg'),
	(13, 'Genç Parti', 'GENÇPARTİ', '2002-06-23', NULL, 'img/genparti.svg'),
	(14, 'Demokratik Halk Partisi', 'DEHAP', '1997-01-18', '2005-01-18', 'img/dehap.jpg'),
	(15, 'Demokratik Sol Parti', 'DSP', '1985-11-14', NULL, 'img/dsp.jpg'),
	(16, 'Anavatan Partisi', 'ANAP', '1983-06-20', '2009-10-31', 'img/anap.jpg'),
	(17, 'Fazilet Partisi', 'FP', '1997-12-17', '2001-06-22', 'img/fp.jpg'),
	(18, 'Sosyaldemokrat Halkçı Parti', 'SHP', '1985-11-03', '1995-02-18', 'img/shp.jpg');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- Dumping data for table databasehomework.persons: ~20 rows (approximately)
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
	(11, 'Ahmet', 'Davutoğlu', 'Konya', '1959-02-26', NULL, 'img/davutoglu.jpg'),
	(12, 'Deniz', 'Baykal', 'Antalya', '1938-07-20', NULL, 'img/baykal.jpg'),
	(13, 'Tansu', 'Çiller', 'İstanbul', '1946-05-24', NULL, 'img/tansu.jpg'),
	(14, 'Necmettin', 'Erbakan', 'Sinop', '1926-10-29', '2011-02-27', 'img/erbakan.jpg'),
	(15, 'Cem', 'Uzan', 'Sakarya', '1960-12-26', NULL, 'img/uzan.jpg'),
	(16, 'u', 'u', 'u', '2021-01-18', NULL, 'img/u.jpg'),
	(17, 'Bülent', 'Ecevit', 'İstanbul', '1925-06-28', '2006-11-05', 'img/ecevit.jpg'),
	(18, 'Recai', 'Kutan', 'Malatya', '1930-01-01', NULL, 'img/kutan.jpg'),
	(19, 'Ahmet Mesut', 'Yılmaz', 'İstanbul', '1947-11-06', '2020-10-30', 'img/yilmaz.jpg'),
	(20, 'Alparslan', 'Türkeş', 'Lefkoşa', '1917-11-25', '1997-04-04', 'img/turkes.jpg'),
	(21, 'Süleyman', 'Demirel', 'Isparta', '1924-11-01', '2015-06-17', 'img/demirel.jpg'),
	(22, 'Erdal', 'İnönü', 'Ankara', '1926-06-06', '2007-10-31', 'img/erdal.jpg');
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
