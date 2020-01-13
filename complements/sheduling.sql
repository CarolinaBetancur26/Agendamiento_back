-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.6.12-log - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             8.1.0.4545
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para scheduling
CREATE DATABASE IF NOT EXISTS `scheduling` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `scheduling`;


-- Volcando estructura para tabla scheduling.available_days
CREATE TABLE IF NOT EXISTS `available_days` (
  `available_id` int(11) NOT NULL AUTO_INCREMENT,
  `date_initial` timestamp NULL DEFAULT NULL,
  `date_finally` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`available_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla scheduling.available_days: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `available_days` DISABLE KEYS */;
INSERT INTO `available_days` (`available_id`, `date_initial`, `date_finally`) VALUES
	(1, '2020-01-06 00:00:00', '2020-01-06 23:59:00'),
	(2, '2020-01-07 00:00:00', '2020-01-11 23:59:00'),
	(3, '2020-01-08 00:00:00', '2020-01-11 23:59:00'),
	(4, '2020-01-09 00:00:00', '2020-01-11 23:59:00'),
	(5, '2020-01-10 00:00:00', '2020-01-11 23:59:00'),
	(6, '2020-01-11 00:00:00', '2020-01-11 23:59:00');
/*!40000 ALTER TABLE `available_days` ENABLE KEYS */;


-- Volcando estructura para tabla scheduling.intervals
CREATE TABLE IF NOT EXISTS `intervals` (
  `interval_id` int(11) NOT NULL AUTO_INCREMENT,
  `hora` time NOT NULL DEFAULT '00:00:00',
  `available_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`interval_id`),
  KEY `FK_interval_available_days` (`available_id`),
  CONSTRAINT `FK_interval_available_days` FOREIGN KEY (`available_id`) REFERENCES `available_days` (`available_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla scheduling.intervals: ~22 rows (aproximadamente)
/*!40000 ALTER TABLE `intervals` DISABLE KEYS */;
INSERT INTO `intervals` (`interval_id`, `hora`, `available_id`) VALUES
	(1, '07:00:00', 1),
	(2, '07:20:00', 1),
	(3, '07:40:00', 1),
	(4, '08:00:00', 1),
	(5, '08:20:00', 1),
	(6, '08:40:00', 1),
	(7, '09:00:00', 1),
	(8, '09:20:00', 1),
	(9, '09:40:00', 1),
	(10, '10:00:00', 1),
	(11, '10:20:00', 1),
	(12, '10:40:00', 1),
	(13, '11:00:00', 1),
	(14, '11:20:00', 1),
	(15, '11:40:00', 1),
	(16, '12:00:00', 1),
	(17, '07:00:00', 2),
	(18, '07:20:00', 2),
	(19, '07:40:00', 2),
	(20, '08:00:00', 2),
	(21, '08:20:00', 2),
	(22, '08:40:00', 2),
	(23, '09:00:00', 2),
	(24, '07:00:00', 3),
	(25, '08:00:00', 3),
	(26, '09:00:00', 3),
	(27, '10:00:00', 3),
	(28, '11:00:00', 3),
	(29, '12:00:00', 3),
	(30, '10:00:00', 4),
	(31, '10:20:00', 4),
	(32, '10:40:00', 4),
	(33, '11:00:00', 4),
	(34, '11:20:00', 4),
	(35, '11:40:00', 4),
	(36, '12:00:00', 4),
	(37, '08:00:00', 5),
	(38, '08:20:00', 5),
	(39, '08:40:00', 5),
	(40, '09:00:00', 5),
	(41, '09:20:00', 5),
	(42, '09:40:00', 5),
	(43, '10:00:00', 5);
/*!40000 ALTER TABLE `intervals` ENABLE KEYS */;


-- Volcando estructura para tabla scheduling.schedule
CREATE TABLE IF NOT EXISTS `schedule` (
  `id_schedule` int(11) NOT NULL AUTO_INCREMENT,
  `sede_id` int(11) DEFAULT NULL,
  `prestacion_id` int(11) DEFAULT NULL,
  `available_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_schedule`),
  KEY `FK1_sede` (`sede_id`),
  KEY `FK2_services` (`prestacion_id`),
  KEY `FK3_available` (`available_id`),
  CONSTRAINT `FK3_available` FOREIGN KEY (`available_id`) REFERENCES `available_days` (`available_id`),
  CONSTRAINT `FK1_sede` FOREIGN KEY (`sede_id`) REFERENCES `sedes` (`sede_id`),
  CONSTRAINT `FK2_services` FOREIGN KEY (`prestacion_id`) REFERENCES `services` (`prestacion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla scheduling.schedule: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` (`id_schedule`, `sede_id`, `prestacion_id`, `available_id`) VALUES
	(1, 1, 1, 1),
	(2, 1, 2, 1),
	(3, 1, 3, 1),
	(4, 2, 1, 2),
	(5, 2, 2, 2),
	(6, 2, 3, 2),
	(7, 1, 1, 2),
	(8, 1, 1, 3),
	(9, 1, 1, 4),
	(10, 1, 1, 5);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;


-- Volcando estructura para tabla scheduling.sedes
CREATE TABLE IF NOT EXISTS `sedes` (
  `sede_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`sede_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla scheduling.sedes: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `sedes` DISABLE KEYS */;
INSERT INTO `sedes` (`sede_id`, `name`) VALUES
	(1, 'Poblado'),
	(2, 'Monterrey');
/*!40000 ALTER TABLE `sedes` ENABLE KEYS */;


-- Volcando estructura para tabla scheduling.services
CREATE TABLE IF NOT EXISTS `services` (
  `prestacion_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`prestacion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla scheduling.services: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` (`prestacion_id`, `name`) VALUES
	(1, 'General'),
	(2, 'Holter'),
	(3, 'Mapa');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
