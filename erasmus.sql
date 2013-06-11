-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.27 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2013-06-11 04:26:09
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping structure for table erasmus.agreements
CREATE TABLE IF NOT EXISTS `agreements` (
  `agreementCode` char(25) NOT NULL DEFAULT '',
  `universityCode` char(25) NOT NULL,
  `departmentId` int(10) NOT NULL,
  `startDate` timestamp NULL DEFAULT NULL,
  `endDate` timestamp NULL DEFAULT NULL,
  `underGraduateCount` int(10) DEFAULT NULL,
  `graduateCount` int(10) DEFAULT NULL,
  `employeeCount` int(10) DEFAULT NULL,
  PRIMARY KEY (`agreementCode`),
  KEY `FK__universities` (`universityCode`),
  KEY `FK_agreements_owndepartments` (`departmentId`),
  CONSTRAINT `FK_agreements_owndepartments` FOREIGN KEY (`departmentId`) REFERENCES `owndepartments` (`departmentId`),
  CONSTRAINT `FK__universities` FOREIGN KEY (`universityCode`) REFERENCES `universities` (`universityCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table erasmus.agreements: ~4 rows (approximately)
DELETE FROM `agreements`;
/*!40000 ALTER TABLE `agreements` DISABLE KEYS */;
INSERT INTO `agreements` (`agreementCode`, `universityCode`, `departmentId`, `startDate`, `endDate`, `underGraduateCount`, `graduateCount`, `employeeCount`) VALUES
	('AGGTR919', 'TRK99', 1503, NULL, NULL, NULL, NULL, NULL),
	('FRANCE033', 'F TARBES03', 1500, '2011-12-16 00:49:27', '2016-12-16 00:49:29', 4, 4, 1500),
	('PLWARSAW022', 'PL WARSZAW02', 1503, '2013-12-16 00:48:59', '2015-12-16 00:49:01', 2, 2, 2),
	('TURKEY011', 'TR2029', 1503, '2013-06-10 00:14:37', '2013-06-13 00:14:39', 1, 5, 999);
/*!40000 ALTER TABLE `agreements` ENABLE KEYS */;


-- Dumping structure for table erasmus.cities
CREATE TABLE IF NOT EXISTS `cities` (
  `cityCode` int(10) NOT NULL AUTO_INCREMENT,
  `countryCode` char(4) NOT NULL,
  `cityName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cityCode`),
  KEY `FK_cities_countries` (`countryCode`),
  CONSTRAINT `FK_cities_countries` FOREIGN KEY (`countryCode`) REFERENCES `countries` (`countryErasmusCode`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table erasmus.cities: ~5 rows (approximately)
DELETE FROM `cities`;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` (`cityCode`, `countryCode`, `cityName`) VALUES
	(1, 'PL', 'Varşova'),
	(2, 'D', 'Berlin'),
	(3, 'PL', 'Lodz'),
	(4, 'D', 'Stuttgart'),
	(5, 'F', 'Paris');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;


-- Dumping structure for table erasmus.countries
CREATE TABLE IF NOT EXISTS `countries` (
  `countryErasmusCode` char(4) NOT NULL,
  `countryName` char(50) NOT NULL,
  `countryLanguage` char(50) DEFAULT NULL,
  PRIMARY KEY (`countryErasmusCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table erasmus.countries: ~32 rows (approximately)
DELETE FROM `countries`;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` (`countryErasmusCode`, `countryName`, `countryLanguage`) VALUES
	('A', 'Avusturya', ''),
	('B', 'Belçika', ''),
	('BG', 'Bulgaristan', 'Bulgarca'),
	('CY', 'Kıbrıs R.K.', ''),
	('CZ', 'Çek Cumhuriyeti', 'Çekce'),
	('D', 'Almanya', 'Almanca'),
	('DK', 'Danimarka', 'Danimarkaca'),
	('E', 'İspanya', 'İspanyolca'),
	('EE', 'Estonya', 'Estonyaca'),
	('F', 'Fransa', 'Fransızca'),
	('FL', 'Lihtenştayn', ''),
	('G', 'Yunanistan', 'Yunanca'),
	('HU', 'Macaristan', 'Macarca'),
	('I', 'İtalya', 'İtalyanca'),
	('IRL', 'İrlanda', 'İrlandaca'),
	('IS', 'İzlanda', 'İzlandaca'),
	('LT', 'Litvanya', 'Litvanyaca'),
	('LUX', 'Lüksemburg', ''),
	('LV', 'Letonya', 'Letonyaca'),
	('MT', 'Malta', 'Maltaca'),
	('N', 'Norveç', 'Norveçce'),
	('NL', 'Hollanda', 'Hollandaca'),
	('OT', 'Diğer**', 'Diğer'),
	('P', 'Portekiz', 'Portekizce'),
	('PL', 'Polonya', 'Lehce'),
	('RO', 'Romanya', 'Romence'),
	('S', 'İsveç', 'İsveçce'),
	('SF', 'Finlandiya', 'Fince'),
	('SI', 'Slovenya', 'Slovence'),
	('SK', 'Slovakya', 'Slovakça'),
	('TR', 'Türkiye**', 'Türkçe'),
	('UK', 'İngiltere', 'İngilizce');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;


-- Dumping structure for table erasmus.grants
CREATE TABLE IF NOT EXISTS `grants` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `mobilityId` int(10) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `desc` varchar(100) DEFAULT NULL,
  `status` enum('paid','waiting') DEFAULT 'waiting',
  `cdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK__mobility` (`mobilityId`),
  CONSTRAINT `FK__mobility` FOREIGN KEY (`mobilityId`) REFERENCES `mobility` (`mobilityId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table erasmus.grants: ~0 rows (approximately)
DELETE FROM `grants`;
/*!40000 ALTER TABLE `grants` DISABLE KEYS */;
/*!40000 ALTER TABLE `grants` ENABLE KEYS */;


-- Dumping structure for table erasmus.grantsbyyears
CREATE TABLE IF NOT EXISTS `grantsbyyears` (
  `countryCode` char(5) NOT NULL,
  `yearCode` int(10) NOT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`countryCode`,`yearCode`),
  KEY `FK__years` (`yearCode`),
  CONSTRAINT `FK__countries` FOREIGN KEY (`countryCode`) REFERENCES `countries` (`countryErasmusCode`),
  CONSTRAINT `FK__years` FOREIGN KEY (`yearCode`) REFERENCES `years` (`yearCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table erasmus.grantsbyyears: ~3 rows (approximately)
DELETE FROM `grantsbyyears`;
/*!40000 ALTER TABLE `grantsbyyears` DISABLE KEYS */;
INSERT INTO `grantsbyyears` (`countryCode`, `yearCode`, `amount`) VALUES
	('D', 20122013, 520),
	('F', 20122013, 570),
	('PL', 20122013, 403);
/*!40000 ALTER TABLE `grantsbyyears` ENABLE KEYS */;


-- Dumping structure for table erasmus.lastaddstd
CREATE TABLE IF NOT EXISTS `lastaddstd` (
  `stdname` varchar(50) NOT NULL,
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table erasmus.lastaddstd: ~3 rows (approximately)
DELETE FROM `lastaddstd`;
/*!40000 ALTER TABLE `lastaddstd` DISABLE KEYS */;
INSERT INTO `lastaddstd` (`stdname`, `Time`) VALUES
	('Burcu Taskaya', '2013-06-10 22:15:24'),
	('Deneme Test', '2013-06-10 22:22:43'),
	('Kerem Aytaç', '2013-06-10 22:30:03');
/*!40000 ALTER TABLE `lastaddstd` ENABLE KEYS */;


-- Dumping structure for table erasmus.log
CREATE TABLE IF NOT EXISTS `log` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `ProcessType` char(2) DEFAULT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ProcessDef` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;

-- Dumping data for table erasmus.log: ~21 rows (approximately)
DELETE FROM `log`;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` (`ID`, `ProcessType`, `TimeStamp`, `ProcessDef`) VALUES
	(2, 'US', '2013-06-09 21:54:13', 'Recep Tayyip Erdogan Adli Üniversite silindi'),
	(9, 'UE', '2013-06-09 22:59:01', 'Yildiz Teknik Universitesi Adli Üniversite eklendi'),
	(10, 'OE', '2013-06-09 22:59:26', 'Kerem Aytac Adli Ogrenci eklendi'),
	(11, 'OS', '2013-06-09 23:10:30', 'Kadir Aram adli Ogrenci sonsuza kadar silindi'),
	(43, 'OE', '2013-06-10 12:05:12', 'Kadir Arabeni adli ogrenci eklendi'),
	(44, 'OE', '2013-06-10 12:05:47', 'Ayhan Abi adli ogrenci eklendi'),
	(45, 'OS', '2013-06-10 12:05:59', 'Ayhan Abi adli ogrenci silindi'),
	(46, 'OS', '2013-06-10 12:06:02', 'Kadir Arabeni adli ogrenci silindi'),
	(48, 'UE', '2013-06-10 12:12:23', 'Baba üniversites adli universite eklendi'),
	(49, 'US', '2013-06-10 12:12:45', 'Baba üniversites adli universite silindi'),
	(50, 'UE', '2013-06-10 12:56:29', 'REAL MADRID UNIVERSITIAD adli universite eklendi'),
	(51, 'UE', '2013-06-10 14:16:27', 'Trakya Üniversitesi adli universite eklendi'),
	(52, 'UE', '2013-06-10 21:15:10', 'Kerkük Üni adli universite eklendi'),
	(53, 'OE', '2013-06-10 21:21:55', 'Yasemin Kaçar adli ogrenci eklendi'),
	(59, 'OS', '2013-06-10 21:39:07', 'Ben Ya adli ogrenci silindi'),
	(60, 'US', '2013-06-10 21:40:06', 'Gel uni adli universite silindi'),
	(61, 'OE', '2013-06-10 21:48:03', 'Yasemin ?enlik adli ogrenci eklendi'),
	(62, 'OE', '2013-06-10 22:15:24', 'Burcu Ta?kaya adli ogrenci eklendi'),
	(63, 'OE', '2013-06-10 22:22:43', 'Deneme Test adli ogrenci eklendi'),
	(64, 'OE', '2013-06-10 22:30:03', '  adli ogrenci eklendi'),
	(65, 'OS', '2013-06-10 22:30:25', '  adli ogrenci silindi');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;


-- Dumping structure for table erasmus.mobility
CREATE TABLE IF NOT EXISTS `mobility` (
  `mobilityId` int(10) NOT NULL AUTO_INCREMENT,
  `studentId` int(10) NOT NULL DEFAULT '0',
  `agreementCode` char(25) DEFAULT NULL,
  `yearCode` int(10) DEFAULT NULL,
  `type` enum('Fall','Spring','Fall+Spring','Summer') NOT NULL,
  `filecaseNumber` varchar(20) DEFAULT NULL,
  `startDate` timestamp NULL DEFAULT NULL,
  `endDate` timestamp NULL DEFAULT NULL,
  `status` enum('ok','hold','canceled','noGrant') DEFAULT 'ok',
  `totalMoney` double DEFAULT NULL,
  `remainingMoney` double DEFAULT NULL,
  PRIMARY KEY (`mobilityId`),
  KEY `FK__agreements` (`agreementCode`),
  KEY `FK_mobility_students` (`studentId`),
  CONSTRAINT `FK_mobility_students` FOREIGN KEY (`studentId`) REFERENCES `students` (`studentId`),
  CONSTRAINT `FK__agreements` FOREIGN KEY (`agreementCode`) REFERENCES `agreements` (`agreementCode`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table erasmus.mobility: ~3 rows (approximately)
DELETE FROM `mobility`;
/*!40000 ALTER TABLE `mobility` DISABLE KEYS */;
INSERT INTO `mobility` (`mobilityId`, `studentId`, `agreementCode`, `yearCode`, `type`, `filecaseNumber`, `startDate`, `endDate`, `status`, `totalMoney`, `remainingMoney`) VALUES
	(1, 1, 'PLWARSAW022', 20122013, 'Fall+Spring', '5', NULL, NULL, 'ok', 3627, 723),
	(2, 2, 'FRANCE033', 20122013, 'Fall', '6', NULL, NULL, 'canceled', 5000, 5000),
	(3, 3, 'TURKEY011', 20122013, 'Summer', '7', NULL, NULL, 'ok', 1, 2);
/*!40000 ALTER TABLE `mobility` ENABLE KEYS */;


-- Dumping structure for table erasmus.outgoingstudents
CREATE TABLE IF NOT EXISTS `outgoingstudents` (
  `studentId` int(10) NOT NULL,
  `departmentId` int(10) NOT NULL,
  `studentNumber` int(10) DEFAULT NULL,
  `SSN` int(10) DEFAULT NULL,
  PRIMARY KEY (`studentId`),
  KEY `FK__owndepartments` (`departmentId`),
  CONSTRAINT `FK__owndepartments` FOREIGN KEY (`departmentId`) REFERENCES `owndepartments` (`departmentId`),
  CONSTRAINT `FK__students` FOREIGN KEY (`studentId`) REFERENCES `students` (`studentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table erasmus.outgoingstudents: ~3 rows (approximately)
DELETE FROM `outgoingstudents`;
/*!40000 ALTER TABLE `outgoingstudents` DISABLE KEYS */;
INSERT INTO `outgoingstudents` (`studentId`, `departmentId`, `studentNumber`, `SSN`) VALUES
	(1, 1503, 150110812, 5155),
	(2, 1500, 31232, 3123),
	(3, 1503, 524112905, 1000);
/*!40000 ALTER TABLE `outgoingstudents` ENABLE KEYS */;


-- Dumping structure for table erasmus.owndepartments
CREATE TABLE IF NOT EXISTS `owndepartments` (
  `departmentId` int(10) NOT NULL DEFAULT '0',
  `facultyId` int(10) DEFAULT NULL,
  `departmentName` varchar(100) DEFAULT NULL,
  `coordinatorName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`departmentId`),
  KEY `FK__ownfaculties` (`facultyId`),
  CONSTRAINT `FK__ownfaculties` FOREIGN KEY (`facultyId`) REFERENCES `ownfaculties` (`facultyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table erasmus.owndepartments: ~2 rows (approximately)
DELETE FROM `owndepartments`;
/*!40000 ALTER TABLE `owndepartments` DISABLE KEYS */;
INSERT INTO `owndepartments` (`departmentId`, `facultyId`, `departmentName`, `coordinatorName`) VALUES
	(1500, 1500, 'Mühendislik', NULL),
	(1503, 1500, 'Bilgisayar Mühendisliği', NULL);
/*!40000 ALTER TABLE `owndepartments` ENABLE KEYS */;


-- Dumping structure for table erasmus.ownfaculties
CREATE TABLE IF NOT EXISTS `ownfaculties` (
  `facultyId` int(10) NOT NULL AUTO_INCREMENT,
  `facultyName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`facultyId`)
) ENGINE=InnoDB AUTO_INCREMENT=1501 DEFAULT CHARSET=utf8;

-- Dumping data for table erasmus.ownfaculties: ~2 rows (approximately)
DELETE FROM `ownfaculties`;
/*!40000 ALTER TABLE `ownfaculties` DISABLE KEYS */;
INSERT INTO `ownfaculties` (`facultyId`, `facultyName`) VALUES
	(2, 'AEF'),
	(1500, 'Mühendislik');
/*!40000 ALTER TABLE `ownfaculties` ENABLE KEYS */;


-- Dumping structure for table erasmus.students
CREATE TABLE IF NOT EXISTS `students` (
  `studentId` int(10) NOT NULL AUTO_INCREMENT,
  `studentFirstName` varchar(50) DEFAULT NULL,
  `studentMiddleName` varchar(50) DEFAULT NULL,
  `studentLastName` varchar(50) DEFAULT NULL,
  `studentPhone` varchar(50) DEFAULT NULL,
  `studentEmail` varchar(255) DEFAULT NULL,
  `studentType` enum('Incoming','Outgoing') NOT NULL DEFAULT 'Outgoing',
  PRIMARY KEY (`studentId`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- Dumping data for table erasmus.students: ~7 rows (approximately)
DELETE FROM `students`;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` (`studentId`, `studentFirstName`, `studentMiddleName`, `studentLastName`, `studentPhone`, `studentEmail`, `studentType`) VALUES
	(1, 'Şakir', NULL, 'Temel', '555', 'sakirtemel@gmail.com', 'Outgoing'),
	(2, 'Mehmet', 'Yavuz', 'Aktaş', '444', 'myavuz@hotmail.com', 'Outgoing'),
	(3, 'Kerem', '', 'Aytaç', '23', 'keremaytac@gmail.com', 'Incoming'),
	(21, 'Yasemin', 'Evden', 'Kaçar', '893363', 'yase@kac.com.tr.tc.dd', 'Outgoing'),
	(29, 'Yasemin', 'Evlere', 'Şenlik', '8966', 'yas@sen.com', 'Outgoing'),
	(30, 'Burcu', 'm', 'Taşkaya', '930390', 'burcu@m.com', 'Outgoing'),
	(31, 'Deneme', '', 'Test', '9000', 'tester@te.somc', 'Outgoing');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;


-- Dumping structure for table erasmus.universities
CREATE TABLE IF NOT EXISTS `universities` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `universityCode` char(25) NOT NULL,
  `universityName` varchar(100) NOT NULL,
  `universityAddress` varchar(500) DEFAULT NULL,
  `cityCode` int(11) DEFAULT NULL,
  `countryCode` char(4) DEFAULT NULL,
  `universityWebsite` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`universityCode`),
  KEY `FK_universities_countries` (`countryCode`),
  KEY `Id` (`Id`),
  CONSTRAINT `FK_universities_countries` FOREIGN KEY (`countryCode`) REFERENCES `countries` (`countryErasmusCode`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- Dumping data for table erasmus.universities: ~9 rows (approximately)
DELETE FROM `universities`;
/*!40000 ALTER TABLE `universities` DISABLE KEYS */;
INSERT INTO `universities` (`Id`, `universityCode`, `universityName`, `universityAddress`, `cityCode`, `countryCode`, `universityWebsite`) VALUES
	(0, '0233', 'Samet Üni', NULL, NULL, 'TR', NULL),
	(1, '2323', 'Kerem üni', NULL, NULL, 'TR', NULL),
	(9, 'F TARBES03', 'ECOLE NATIONALE D\'INGENIEURS DE TARBES ', NULL, NULL, 'F', NULL),
	(10, 'I TORINO02', 'POLITECNICO DI TORINO', NULL, NULL, 'I', NULL),
	(21, 'KRK33', 'Kerkük Üni', 'Address', 0, 'IRL', 'dubker.kerkuk.edu.tr'),
	(11, 'PL WARSZAW02', 'WARSAW UNIVERSITY OF TECHNOLOGY  ', NULL, NULL, 'PL', NULL),
	(19, 'SPAIN11', 'REAL MADRID UNIVERSITIAD', NULL, NULL, 'E', NULL),
	(12, 'TR2029', 'Aga uni', NULL, NULL, 'TR', NULL),
	(20, 'TRK99', 'Trakya Üniversitesi', 'Az ilerde sağda', 0, 'TR', 'www.nerdetrakordabirak.edu.tr');
/*!40000 ALTER TABLE `universities` ENABLE KEYS */;


-- Dumping structure for table erasmus.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `usertype` enum('admin','moderator','user') DEFAULT 'user',
  `cdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table erasmus.users: ~0 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `password`, `email`, `usertype`, `cdate`) VALUES
	(1, 'group14', 'group14', 'group14@gmail.com', 'admin', '2013-06-11 00:58:57');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


-- Dumping structure for table erasmus.years
CREATE TABLE IF NOT EXISTS `years` (
  `yearCode` int(10) NOT NULL DEFAULT '0',
  `totalBudget` double DEFAULT NULL,
  PRIMARY KEY (`yearCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table erasmus.years: ~1 rows (approximately)
DELETE FROM `years`;
/*!40000 ALTER TABLE `years` DISABLE KEYS */;
INSERT INTO `years` (`yearCode`, `totalBudget`) VALUES
	(20122013, 1000000);
/*!40000 ALTER TABLE `years` ENABLE KEYS */;


-- Dumping structure for trigger erasmus.logaddstd
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `logaddstd` AFTER INSERT ON `students` FOR EACH ROW BEGIN
DECLARE uni VARCHAR(30);
SET @lid = NEW.studentId;
SET @uni= (select CONCAT(studentFirstName,' ', studentLastName) from students where studentId=@lid);

INSERT INTO log(ProcessType,ProcessDef) VALUES('OE',CONCAT(@uni,' ', 'adli ogrenci eklendi'));
INSERT INTO lastaddstd(stdname) VALUES(@uni);
END//
DELIMITER ;
SET SQL_MODE=@OLD_SQL_MODE;


-- Dumping structure for trigger erasmus.logadduni
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `logadduni` AFTER INSERT ON `universities` FOR EACH ROW BEGIN
DECLARE uni VARCHAR(30);
SET @lid = NEW.Id;
SET @uni= (select universityName from universities where Id=@lid);

INSERT INTO log(ProcessType,ProcessDef) VALUES('UE',CONCAT(@uni,' ', 'adli universite eklendi'));
END//
DELIMITER ;
SET SQL_MODE=@OLD_SQL_MODE;


-- Dumping structure for trigger erasmus.logdeletestd
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `logdeletestd` BEFORE DELETE ON `students` FOR EACH ROW BEGIN
DECLARE uni VARCHAR(30);
SET @lid = OLD.studentId;
SET @uni= (select CONCAT(studentFirstName,' ', studentLastName) from students where studentId=@lid);

INSERT INTO log(ProcessType,ProcessDef) VALUES('OS',CONCAT(@uni,' ', 'adli ogrenci silindi'));
END//
DELIMITER ;
SET SQL_MODE=@OLD_SQL_MODE;


-- Dumping structure for trigger erasmus.logdeleteuni
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `logdeleteuni` BEFORE DELETE ON `universities` FOR EACH ROW BEGIN
DECLARE uni VARCHAR(30);
SET @lid = OLD.Id;
SET @uni= (select universityName from universities where Id=@lid);

INSERT INTO log(ProcessType,ProcessDef) VALUES('US',CONCAT(@uni,' ', 'adli universite silindi'));
END//
DELIMITER ;
SET SQL_MODE=@OLD_SQL_MODE;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
