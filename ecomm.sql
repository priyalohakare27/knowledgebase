-- --------------------------------------------------------
-- Host:                         172.27.59.54
-- Server version:               5.1.73 - Source distribution
-- Server OS:                    redhat-linux-gnu
-- HeidiSQL Version:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for ecomm
CREATE DATABASE IF NOT EXISTS `ecomm` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ecomm`;


-- Dumping structure for table ecomm.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int(15) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(25) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table ecomm.buy_details
CREATE TABLE IF NOT EXISTS `buy_details` (
  `buy_id` varchar(15) NOT NULL DEFAULT '0',
  `user_id` varchar(15) NOT NULL,
  `product_id` varchar(15) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`buy_id`),
  KEY `user_id` (`user_id`,`product_id`),
  KEY `user_id_2` (`user_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table ecomm.buy_seq
CREATE TABLE IF NOT EXISTS `buy_seq` (
  `buy_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`buy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table ecomm.order_details
CREATE TABLE IF NOT EXISTS `order_details` (
  `order_id` varchar(15) NOT NULL,
  `buy_id` varchar(15) NOT NULL,
  `total_price` int(11) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `buy_id` (`buy_id`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`buy_id`) REFERENCES `buy_details` (`buy_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table ecomm.order_seq
CREATE TABLE IF NOT EXISTS `order_seq` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table ecomm.product_details
CREATE TABLE IF NOT EXISTS `product_details` (
  `product_id` varchar(15) NOT NULL DEFAULT '0',
  `product_name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `image_name` varchar(20) NOT NULL,
  `image_path` varchar(400) NOT NULL,
  `description` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table ecomm.product_seq
CREATE TABLE IF NOT EXISTS `product_seq` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table ecomm.regiStud
CREATE TABLE IF NOT EXISTS `regiStud` (
  `name` varchar(20) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `addrs` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='this table is for perl demo project';

-- Data exporting was unselected.


-- Dumping structure for table ecomm.user
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` varchar(15) NOT NULL DEFAULT '0',
  `email_id` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `is_active` int(11) DEFAULT '1',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table is for New User Creation';

-- Data exporting was unselected.


-- Dumping structure for table ecomm.user_details
CREATE TABLE IF NOT EXISTS `user_details` (
  `user_detail_id` varchar(15) NOT NULL DEFAULT '0',
  `mobile` varchar(10) NOT NULL,
  `address` varchar(400) NOT NULL,
  `city` varchar(50) NOT NULL,
  `zip` int(6) NOT NULL,
  `user_id` varchar(15) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  PRIMARY KEY (`user_detail_id`),
  KEY `user_id` (`user_id`),
  KEY `user_id_2` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table ecomm.user_details_seq
CREATE TABLE IF NOT EXISTS `user_details_seq` (
  `user_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`user_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table ecomm.user_seq
CREATE TABLE IF NOT EXISTS `user_seq` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for trigger ecomm.buy_trigger
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `buy_trigger` BEFORE INSERT ON `buy_details` FOR EACH ROW BEGIN
  INSERT INTO buy_seq VALUES (NULL);
  SET NEW.buy_id = CONCAT('BU', LPAD(LAST_INSERT_ID(), 3, '0'));
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger ecomm.order_trigger
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `order_trigger` BEFORE INSERT ON `order_details` FOR EACH ROW BEGIN
  INSERT INTO order_seq VALUES (NULL);
  SET NEW.order_id = CONCAT('ORD', LPAD(LAST_INSERT_ID(), 3, '0'));
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger ecomm.product_trigger
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `product_trigger` BEFORE INSERT ON `product_details` FOR EACH ROW BEGIN
  INSERT INTO user_seq VALUES (NULL);
  SET NEW.product_id = CONCAT('PROD', LPAD(LAST_INSERT_ID(), 3, '0'));
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger ecomm.user_details_trigger
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `user_details_trigger` BEFORE INSERT ON `user_details` FOR EACH ROW BEGIN
  INSERT INTO user_details_seq VALUES (NULL);
  SET NEW.user_detail_id = CONCAT('UD', LPAD(LAST_INSERT_ID(), 3, '0'));
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger ecomm.user_trigger
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `user_trigger` BEFORE INSERT ON `user` FOR EACH ROW BEGIN
  INSERT INTO user_seq VALUES (NULL);
  SET NEW.user_id = CONCAT('USER', LPAD(LAST_INSERT_ID(), 3, '0'));
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
