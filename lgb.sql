-- --------------------------------------------------------
-- ホスト:                          192.168.56.10
-- サーバのバージョン:                    5.6.26 - MySQL Community Server (GPL)
-- サーバー OS:                      Linux
-- HeidiSQL バージョン:               9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for lgb_local
DROP DATABASE IF EXISTS `lgb_local`;
CREATE DATABASE IF NOT EXISTS `lgb_local` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `lgb_local`;


-- Dumping structure for テーブル lgb_local.log_quest
DROP TABLE IF EXISTS `log_quest`;
CREATE TABLE IF NOT EXISTS `log_quest` (
  `id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `quest_id` int(11) DEFAULT '0',
  `result` tinyint(4) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  KEY `id` (`id`),
  KEY `idx_log_quest` (`quest_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lgb_local.log_quest: ~0 rows (approximately)
/*!40000 ALTER TABLE `log_quest` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_quest` ENABLE KEYS */;


-- Dumping structure for テーブル lgb_local.m_event
DROP TABLE IF EXISTS `m_event`;
CREATE TABLE IF NOT EXISTS `m_event` (
  `id` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `message` varchar(64) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lgb_local.m_event: ~0 rows (approximately)
/*!40000 ALTER TABLE `m_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_event` ENABLE KEYS */;


-- Dumping structure for テーブル lgb_local.m_item
DROP TABLE IF EXISTS `m_item`;
CREATE TABLE IF NOT EXISTS `m_item` (
  `id` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT '0',
  `rarity` int(11) DEFAULT '0',
  `name` varchar(32) DEFAULT NULL,
  `note` varchar(64) DEFAULT NULL,
  `param` int(11) DEFAULT NULL,
  `set_item_id` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `add_price` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lgb_local.m_item: ~0 rows (approximately)
/*!40000 ALTER TABLE `m_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_item` ENABLE KEYS */;


-- Dumping structure for テーブル lgb_local.m_monster
DROP TABLE IF EXISTS `m_monster`;
CREATE TABLE IF NOT EXISTS `m_monster` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `attack` int(11) DEFAULT '0',
  `defense` int(11) DEFAULT '0',
  `hp` int(11) DEFAULT '0',
  `hit` int(11) DEFAULT '0',
  `dex` int(11) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lgb_local.m_monster: ~0 rows (approximately)
/*!40000 ALTER TABLE `m_monster` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_monster` ENABLE KEYS */;


-- Dumping structure for テーブル lgb_local.m_quest
DROP TABLE IF EXISTS `m_quest`;
CREATE TABLE IF NOT EXISTS `m_quest` (
  `id` int(11) DEFAULT NULL,
  `name` int(11) DEFAULT NULL,
  `floor_max` int(11) DEFAULT NULL,
  `floor_time` int(11) DEFAULT NULL,
  `before_quest_id` int(11) NOT NULL,
  `clear_num` int(11) NOT NULL,
  `note` text NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lgb_local.m_quest: ~0 rows (approximately)
/*!40000 ALTER TABLE `m_quest` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_quest` ENABLE KEYS */;


-- Dumping structure for テーブル lgb_local.m_quest_item
DROP TABLE IF EXISTS `m_quest_item`;
CREATE TABLE IF NOT EXISTS `m_quest_item` (
  `id` int(11) DEFAULT NULL,
  `quest_id` int(11) DEFAULT '0',
  `floor_num` int(11) DEFAULT '0',
  `item_id` int(11) DEFAULT '0',
  `lv` int(11) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  KEY `id` (`id`),
  KEY `idx_quest_item` (`quest_id`,`floor_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lgb_local.m_quest_item: ~0 rows (approximately)
/*!40000 ALTER TABLE `m_quest_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_quest_item` ENABLE KEYS */;


-- Dumping structure for テーブル lgb_local.m_quest_monster
DROP TABLE IF EXISTS `m_quest_monster`;
CREATE TABLE IF NOT EXISTS `m_quest_monster` (
  `id` int(11) DEFAULT NULL,
  `quest_id` int(11) DEFAULT '0',
  `floor_num` int(11) DEFAULT '0',
  `monster_id` int(11) DEFAULT '0',
  `lv` int(11) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  KEY `id` (`id`),
  KEY `idx_quest_monster` (`quest_id`,`floor_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lgb_local.m_quest_monster: ~0 rows (approximately)
/*!40000 ALTER TABLE `m_quest_monster` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_quest_monster` ENABLE KEYS */;


-- Dumping structure for テーブル lgb_local.m_shop
DROP TABLE IF EXISTS `m_shop`;
CREATE TABLE IF NOT EXISTS `m_shop` (
  `id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lgb_local.m_shop: ~0 rows (approximately)
/*!40000 ALTER TABLE `m_shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_shop` ENABLE KEYS */;


-- Dumping structure for テーブル lgb_local.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) DEFAULT '0',
  `money` int(11) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table lgb_local.user: ~1 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `status`, `money`, `created`, `modified`) VALUES
	(1, 0, 1000, '2015-08-31 16:17:01', '2015-08-31 16:17:01');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


-- Dumping structure for テーブル lgb_local.user_item
DROP TABLE IF EXISTS `user_item`;
CREATE TABLE IF NOT EXISTS `user_item` (
  `id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `item_id` int(11) DEFAULT '0',
  `lv` int(11) DEFAULT '0',
  `quantity` int(11) DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  KEY `id` (`id`),
  KEY `idx_user_item` (`user_id`,`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lgb_local.user_item: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_item` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
