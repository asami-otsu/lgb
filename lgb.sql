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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0',
  `quest_id` int(11) DEFAULT '0',
  `result` tinyint(4) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_log_quest` (`quest_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lgb_local.log_quest: ~0 rows (approximately)
/*!40000 ALTER TABLE `log_quest` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_quest` ENABLE KEYS */;


-- Dumping structure for テーブル lgb_local.log_quest_event
DROP TABLE IF EXISTS `log_quest_event`;
CREATE TABLE IF NOT EXISTS `log_quest_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_quest_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(64) NOT NULL,
  `detail` text NOT NULL,
  `order` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_log_quest_event` (`log_quest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lgb_local.log_quest_event: ~0 rows (approximately)
/*!40000 ALTER TABLE `log_quest_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_quest_event` ENABLE KEYS */;


-- Dumping structure for テーブル lgb_local.m_button
DROP TABLE IF EXISTS `m_button`;
CREATE TABLE IF NOT EXISTS `m_button` (
  `id` int(11) NOT NULL DEFAULT '0',
  `scene_type` varchar(32) DEFAULT NULL,
  `name` varchar(32) NOT NULL,
  `text` varchar(32) NOT NULL DEFAULT 'none',
  `sub_text` varchar(32) NOT NULL DEFAULT 'none',
  `tag_id` varchar(32) NOT NULL,
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) NOT NULL DEFAULT '0',
  `width` int(11) NOT NULL DEFAULT '400',
  `height` int(11) NOT NULL DEFAULT '30',
  `next_scene` varchar(32) DEFAULT NULL,
  `action_type` varchar(32) DEFAULT 'none',
  `value` varchar(32) NOT NULL DEFAULT 'none',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `scene_type` (`scene_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lgb_local.m_button: ~22 rows (approximately)
/*!40000 ALTER TABLE `m_button` DISABLE KEYS */;
INSERT INTO `m_button` (`id`, `scene_type`, `name`, `text`, `sub_text`, `tag_id`, `x`, `y`, `width`, `height`, `next_scene`, `action_type`, `value`, `created`, `modified`) VALUES
	(1, 'scene_menu', 'クエスト', 'クエストを始めたりログを確認します', 'none', 'button_quest', 0, 0, 400, 30, 'quest', 'none', 'none', '2015-09-01 16:32:05', '2015-09-01 16:32:05'),
	(2, 'scene_menu', '所持品', '持ち物を確認します', 'none', 'button_item', 0, 30, 400, 30, 'my_item', 'none', 'none', '2015-09-01 16:32:05', '2015-09-01 16:32:05'),
	(3, 'scene_menu', 'アイテムショップ', '買い物をします', 'none', 'button_shop', 0, 60, 400, 30, 'shop', 'none', 'none', '2015-09-01 16:32:05', '2015-09-01 16:32:05'),
	(4, 'scene_menu', '強化屋', '武具を強化します', 'none', 'button_enchance', 0, 90, 400, 30, 'enhance', 'none', 'none', '2015-09-01 16:32:05', '2015-09-01 16:32:05'),
	(5, 'scene_menu', '記録', '各ダンジョンの記録を確認します', 'none', 'button_logs', 0, 120, 400, 30, 'logs', 'none', 'none', '2015-09-01 16:32:05', '2015-09-01 16:32:05'),
	(6, 'scene_quest', 'クエスト出発', '新しいクエストへ出発します', 'none', 'button_quest_go_opt', 0, 0, 400, 30, 'quest_go_opt', 'none', 'none', '2015-09-03 19:59:51', '2015-09-03 19:59:51'),
	(7, 'scene_quest', 'ダンジョン名', '出発日時', 'none', 'button_log_list', 0, 0, 400, 30, 'log_list', 'log_list', 'log_id', '2015-09-06 20:47:26', '2015-09-06 20:47:28'),
	(8, 'scene_quest_go_opt', 'ダンジョン', 'none', 'none', 'button_quest_list', 0, 0, 400, 30, 'quest_select', 'quest_select', 'none', '2015-09-03 19:59:51', '2015-09-03 19:59:51'),
	(9, 'scene_quest_go_opt', '目的階', 'none', 'none', 'button_floor', 0, 30, 400, 30, 'none', 'none', 'none', '2015-09-03 19:59:51', '2015-09-03 19:59:51'),
	(10, 'scene_quest_go_opt', '武器', 'none', 'なし', 'button_weapon', 0, 60, 400, 30, 'weapon_select', 'none', 'none', '2015-09-03 19:59:51', '2015-09-03 19:59:51'),
	(11, 'scene_quest_go_opt', '防具', 'none', 'なし', 'button_armor', 0, 90, 400, 30, 'armor_select', 'none', 'none', '2015-09-03 19:59:51', '2015-09-03 19:59:51'),
	(12, 'scene_quest_go_opt', 'アイテム１', 'none', 'なし', 'button_item1', 0, 120, 400, 30, 'item_select', 'none', 'none', '2015-09-03 19:59:51', '2015-09-03 19:59:51'),
	(13, 'scene_quest_go_opt', 'アイテム２', 'none', 'なし', 'button_item2', 0, 150, 400, 30, 'item_select', 'none', 'none', '2015-09-03 19:59:51', '2015-09-03 19:59:51'),
	(14, 'scene_quest_go_opt', '所要時間', 'none', 'none', 'button_time', 0, 180, 400, 30, 'none', 'none', 'none', '2015-09-03 19:59:51', '2015-09-03 19:59:51'),
	(15, 'scene_quest_go_opt', '帰還予定時刻', 'none', 'none', 'button_left_time', 0, 210, 400, 30, 'none', 'none', 'none', '2015-09-03 19:59:51', '2015-09-03 19:59:51'),
	(16, 'scene_quest_go_opt', '出発', 'none', 'none', 'button_go', 0, 240, 400, 30, 'go', 'go', 'none', '2015-09-06 20:33:51', '2015-09-06 20:33:53'),
	(17, 'scene_quest_select', 'ダンジョン選択', 'none', 'none', 'none', 0, 0, 400, 30, 'none', 'none', 'quest_select', '2015-09-04 17:42:43', '2015-09-04 17:42:45'),
	(18, 'scene_my_item', '新着', '新着を確認します', 'get_value', 'button_new_item', 0, 0, 400, 30, 'new_item', 'none', 'none', '2015-09-06 20:18:18', '2015-09-06 20:18:20'),
	(19, 'scene_my_item', '武器', '武器を確認します', 'get_value', 'button_weapon_list', 0, 30, 400, 30, 'weapon_select', 'weapon_list', 'none', '2015-09-06 20:24:19', '2015-09-06 20:24:20'),
	(20, 'scene_my_item', '防具', '防具を確認します', 'get_value', 'button_armor_list', 0, 60, 400, 30, 'armor_select', 'armor_list', 'none', '2015-09-06 20:35:35', '2015-09-06 20:35:36'),
	(21, 'scene_my_item', 'アイテム', 'アイテムを確認します', 'get_value', 'button_item_list', 0, 90, 400, 30, 'item_select', 'drag_list', 'none', '2015-09-06 20:37:03', '2015-09-06 20:37:04'),
	(22, 'scene_my_item', '鉱石', '鉱石を確認します', 'get_value', 'button_ore_list', 0, 120, 400, 30, 'ore_list', 'ore_list', 'none', '2015-09-06 20:39:15', '2015-09-06 20:39:16'),
	(23, 'scene_new_item', 'アイテム名', 'none', 'none', 'none', 0, 30, 400, 30, 'none', 'none', 'none', '2015-09-06 22:40:00', '2015-09-06 22:40:03'),
	(24, 'scene_weapon_select', '武器選択', 'none', 'none', 'none', 0, 30, 400, 30, 'none', 'none', 'weapon_select', '2015-09-07 09:58:18', '2015-09-07 09:58:18'),
	(25, 'scene_armor_select', '防具選択', 'none', 'none', 'none', 0, 30, 400, 30, 'none', 'none', 'armor_select', '2015-09-07 09:58:23', '2015-09-07 09:58:21'),
	(26, 'scene_item_select', 'アイテム選択', 'none', 'none', 'none', 0, 30, 400, 30, 'none', 'none', 'none', NULL, NULL);
/*!40000 ALTER TABLE `m_button` ENABLE KEYS */;


-- Dumping structure for テーブル lgb_local.m_event
DROP TABLE IF EXISTS `m_event`;
CREATE TABLE IF NOT EXISTS `m_event` (
  `id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `message` varchar(64) NOT NULL,
  `param` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lgb_local.m_event: ~6 rows (approximately)
/*!40000 ALTER TABLE `m_event` DISABLE KEYS */;
INSERT INTO `m_event` (`id`, `type`, `message`, `param`, `created`, `modified`) VALUES
	(1, 0, '敵に遭遇した', 0, '2015-09-02 12:00:02', '2015-09-02 12:00:02'),
	(2, 0, '宝箱をみつけた', 0, '2015-09-02 12:00:02', '2015-09-02 12:00:02'),
	(3, 1, '泉をみつけた', 5, '2015-09-02 12:00:02', '2015-09-02 12:00:02'),
	(4, 2, '泉をみつけた', 5, '2015-09-02 12:00:02', '2015-09-02 12:00:02'),
	(5, 3, '泉をみつけた', 5, '2015-09-02 12:00:02', '2015-09-02 12:00:02'),
	(6, 4, '泉をみつけた', 5, '2015-09-02 12:00:02', '2015-09-02 12:00:02');
/*!40000 ALTER TABLE `m_event` ENABLE KEYS */;


-- Dumping structure for テーブル lgb_local.m_item
DROP TABLE IF EXISTS `m_item`;
CREATE TABLE IF NOT EXISTS `m_item` (
  `id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) DEFAULT '0',
  `rarity` int(11) DEFAULT '0',
  `name` varchar(32) DEFAULT NULL,
  `note` varchar(64) DEFAULT NULL,
  `param` int(11) DEFAULT '0',
  `set_item_id` int(11) DEFAULT '0',
  `buy_price` int(11) DEFAULT '0',
  `add_price` int(11) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_m_item` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lgb_local.m_item: ~12 rows (approximately)
/*!40000 ALTER TABLE `m_item` DISABLE KEYS */;
INSERT INTO `m_item` (`id`, `type`, `rarity`, `name`, `note`, `param`, `set_item_id`, `buy_price`, `add_price`, `created`, `modified`) VALUES
	(1001, 1, 1, 'ひのきのぼう', '初期装備はこれで', 5, 0, 100, 10, '2015-09-01 17:00:46', '2015-09-01 17:00:46'),
	(1002, 1, 1, 'こんぼう', 'ちょっと強くなったよ', 10, 0, 200, 15, '2015-09-01 17:00:46', '2015-09-01 17:00:46'),
	(1003, 1, 1, 'どうのけん', 'そろそろ旅にでれそう', 15, 0, 300, 30, '2015-09-01 17:00:46', '2015-09-01 17:00:46'),
	(1004, 2, 1, 'てつのけん', '一般的な武器', 20, 2004, 400, 40, '2015-09-01 17:00:46', '2015-09-01 17:00:46'),
	(1005, 2, 1, 'はがねのけん', '気持ち強めの武器', 40, 2005, 500, 50, '2015-09-01 17:00:46', '2015-09-01 17:00:46'),
	(1006, 2, 1, 'ドラゴンキラー', 'ドラゴンに強いらしい', 50, 2006, 600, 100, '2015-09-01 17:00:46', '2015-09-01 17:00:46'),
	(2001, 1, 1, 'ぬののふく', 'やっぱこれでしょ', 5, 0, 100, 10, '2015-09-01 17:00:46', '2015-09-01 17:00:46'),
	(2002, 1, 1, '旅人の服', '旅人が着てそうなやつ', 5, 0, 200, 15, '2015-09-01 17:00:46', '2015-09-01 17:00:46'),
	(2003, 1, 1, 'どうのむねあて', 'ちょっと重い', 5, 0, 300, 30, '2015-09-01 17:00:46', '2015-09-01 17:00:46'),
	(2004, 2, 1, 'てつのよろい', '一般的な防具', 5, 1004, 400, 40, '2015-09-01 17:00:46', '2015-09-01 17:00:46'),
	(2005, 2, 1, 'はがねのよろい', '気持ち強めの防具', 5, 1005, 500, 50, '2015-09-01 17:00:46', '2015-09-01 17:00:46'),
	(2006, 2, 1, 'ドラゴンメイル', 'ドラゴンからのダメージが減るらしい', 5, 1006, 600, 100, '2015-09-01 17:00:46', '2015-09-01 17:00:46'),
	(3001, 3, 1, 'やくそう', 'やや苦い', 10, 0, 30, 0, '2015-09-06 21:15:10', '2015-09-06 21:15:12');
/*!40000 ALTER TABLE `m_item` ENABLE KEYS */;


-- Dumping structure for テーブル lgb_local.m_monster
DROP TABLE IF EXISTS `m_monster`;
CREATE TABLE IF NOT EXISTS `m_monster` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `attack` int(11) NOT NULL DEFAULT '0',
  `defense` int(11) NOT NULL DEFAULT '0',
  `hp` int(11) NOT NULL DEFAULT '0',
  `hit` int(11) NOT NULL DEFAULT '0',
  `dex` int(11) NOT NULL DEFAULT '0',
  `exp` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lgb_local.m_monster: ~25 rows (approximately)
/*!40000 ALTER TABLE `m_monster` DISABLE KEYS */;
INSERT INTO `m_monster` (`id`, `name`, `attack`, `defense`, `hp`, `hit`, `dex`, `exp`, `created`, `modified`) VALUES
	(1, 'スライム', 1, 1, 6, 3, 3, 1, '2015-09-01 17:34:55', '2015-09-01 17:34:55'),
	(2, 'ぶちスライム', 1, 1, 10, 3, 3, 2, '2015-09-01 17:34:55', '2015-09-01 17:34:55'),
	(3, 'おおきづち', 1, 1, 12, 3, 3, 3, '2015-09-01 17:34:55', '2015-09-01 17:34:55'),
	(4, 'いっかくうさぎ', 1, 1, 12, 3, 3, 4, '2015-09-01 17:34:55', '2015-09-01 17:34:55'),
	(5, 'ドラキー', 1, 1, 10, 3, 3, 5, '2015-09-01 17:34:55', '2015-09-01 17:34:55'),
	(6, 'ぐんたいあり', 1, 1, 15, 3, 3, 6, '2015-09-01 17:34:55', '2015-09-01 17:34:55'),
	(7, 'キャタピラー', 1, 1, 14, 3, 3, 7, '2015-09-01 17:34:55', '2015-09-01 17:34:55'),
	(8, 'ホイミスライム', 1, 1, 27, 3, 3, 8, '2015-09-01 17:34:55', '2015-09-01 17:34:55'),
	(9, 'ベビーパンサー', 1, 1, 33, 3, 3, 9, '2015-09-01 17:34:55', '2015-09-01 17:34:55'),
	(10, 'スライムナイト', 1, 1, 36, 3, 3, 10, '2015-09-01 17:34:55', '2015-09-01 17:34:55'),
	(11, 'ベビードラゴン', 1, 1, 34, 3, 3, 11, '2015-09-01 17:34:55', '2015-09-01 17:34:55'),
	(12, 'バブルスライム', 1, 1, 23, 3, 3, 12, '2015-09-01 17:34:55', '2015-09-01 17:34:55'),
	(13, 'ゴーレム', 1, 1, 106, 3, 3, 13, '2015-09-01 17:34:55', '2015-09-01 17:34:55'),
	(14, 'はぐれスライム', 100, 100, 6, 3, 3, 100000, '2015-09-01 17:34:55', '2015-09-01 17:34:55'),
	(15, 'メタルスライム', 100, 100, 3, 3, 3, 10000, '2015-09-01 17:34:55', '2015-09-01 17:34:55'),
	(16, 'キラーマシン', 1, 1, 156, 3, 3, 16, '2015-09-01 17:34:55', '2015-09-01 17:34:55'),
	(17, 'オーク', 1, 1, 136, 3, 3, 17, '2015-09-01 17:34:55', '2015-09-01 17:34:55'),
	(18, 'アークデーモン', 1, 1, 276, 3, 3, 18, '2015-09-01 17:34:55', '2015-09-01 17:34:55'),
	(19, 'イエティ', 1, 1, 236, 3, 3, 19, '2015-09-01 17:34:55', '2015-09-01 17:34:55'),
	(20, 'ビッグアイ', 1, 1, 286, 3, 3, 20, '2015-09-01 17:34:55', '2015-09-01 17:34:55'),
	(21, 'グレイトドラゴン', 1, 1, 666, 3, 3, 21, '2015-09-01 17:34:55', '2015-09-01 17:34:55'),
	(22, 'キメラ', 1, 1, 146, 3, 3, 22, '2015-09-01 17:34:55', '2015-09-01 17:34:55'),
	(23, 'キングスライム', 1, 1, 206, 3, 3, 23, '2015-09-01 17:34:55', '2015-09-01 17:34:55'),
	(24, 'うごくせきぞう', 1, 1, 336, 3, 3, 24, '2015-09-01 17:34:55', '2015-09-01 17:34:55'),
	(25, 'おばけキノコ', 1, 1, 116, 3, 3, 25, '2015-09-01 17:34:55', '2015-09-01 17:34:55');
/*!40000 ALTER TABLE `m_monster` ENABLE KEYS */;


-- Dumping structure for テーブル lgb_local.m_quest
DROP TABLE IF EXISTS `m_quest`;
CREATE TABLE IF NOT EXISTS `m_quest` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `floor_max` int(11) NOT NULL DEFAULT '0',
  `floor_time` int(11) NOT NULL DEFAULT '0',
  `before_quest_id` int(11) NOT NULL DEFAULT '0',
  `clear_num` int(11) NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lgb_local.m_quest: ~5 rows (approximately)
/*!40000 ALTER TABLE `m_quest` DISABLE KEYS */;
INSERT INTO `m_quest` (`id`, `name`, `floor_max`, `floor_time`, `before_quest_id`, `clear_num`, `text`, `created`, `modified`) VALUES
	(1, 'さいしょの洞窟', 5, 1, 0, 0, '家の隣にある洞窟', '2015-09-01 17:16:07', '2015-09-01 17:16:07'),
	(2, '寂れた城', 7, 2, 1, 5, '廃城となって30年目', '2015-09-01 17:16:07', '2015-09-01 17:16:07'),
	(3, '穏やかそうな河', 10, 3, 2, 7, '穏やかなのは気のせいだった。。。', '2015-09-01 17:16:07', '2015-09-01 17:16:07'),
	(4, '煌びやかな城下町', 12, 4, 3, 10, '夜に出歩いてはいけない', '2015-09-01 17:16:07', '2015-09-01 17:16:07'),
	(5, '苔むした洞窟', 14, 5, 4, 12, '結構じめじめしてる', '2015-09-01 17:16:07', '2015-09-01 17:16:07');
/*!40000 ALTER TABLE `m_quest` ENABLE KEYS */;


-- Dumping structure for テーブル lgb_local.m_quest_event
DROP TABLE IF EXISTS `m_quest_event`;
CREATE TABLE IF NOT EXISTS `m_quest_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quest_id` int(11) NOT NULL DEFAULT '0',
  `floor_id` int(11) NOT NULL DEFAULT '0',
  `event_id` int(11) NOT NULL DEFAULT '0',
  `rate` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_quest_event` (`floor_id`,`quest_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- Dumping data for table lgb_local.m_quest_event: ~24 rows (approximately)
/*!40000 ALTER TABLE `m_quest_event` DISABLE KEYS */;
INSERT INTO `m_quest_event` (`id`, `quest_id`, `floor_id`, `event_id`, `rate`, `created`, `modified`) VALUES
	(1, 1, 1, 1, 30, '2015-09-02 12:18:26', '2015-09-02 12:18:26'),
	(2, 1, 1, 2, 30, '2015-09-02 12:18:26', '2015-09-02 12:18:26'),
	(3, 1, 1, 3, 30, '2015-09-02 12:18:26', '2015-09-02 12:18:26'),
	(4, 1, 1, 4, 30, '2015-09-02 12:18:26', '2015-09-02 12:18:26'),
	(5, 1, 2, 1, 30, '2015-09-02 12:18:26', '2015-09-02 12:18:26'),
	(6, 1, 2, 2, 30, '2015-09-02 12:18:26', '2015-09-02 12:18:26'),
	(7, 1, 2, 3, 30, '2015-09-02 12:18:26', '2015-09-02 12:18:26'),
	(8, 1, 2, 4, 30, '2015-09-02 12:18:26', '2015-09-02 12:18:26'),
	(9, 1, 2, 5, 30, '2015-09-02 12:18:26', '2015-09-02 12:18:26'),
	(10, 1, 3, 1, 30, '2015-09-02 12:18:26', '2015-09-02 12:18:26'),
	(11, 1, 3, 2, 30, '2015-09-02 12:18:26', '2015-09-02 12:18:26'),
	(12, 1, 3, 3, 30, '2015-09-02 12:18:26', '2015-09-02 12:18:26'),
	(13, 1, 3, 4, 30, '2015-09-02 12:18:26', '2015-09-02 12:18:26'),
	(14, 1, 3, 5, 30, '2015-09-02 12:18:26', '2015-09-02 12:18:26'),
	(15, 1, 4, 1, 30, '2015-09-02 12:18:26', '2015-09-02 12:18:26'),
	(16, 1, 4, 2, 30, '2015-09-02 12:18:26', '2015-09-02 12:18:26'),
	(17, 1, 4, 3, 30, '2015-09-02 12:18:26', '2015-09-02 12:18:26'),
	(18, 1, 4, 4, 30, '2015-09-02 12:18:26', '2015-09-02 12:18:26'),
	(19, 1, 5, 5, 30, '2015-09-02 12:18:26', '2015-09-02 12:18:26'),
	(20, 1, 5, 1, 30, '2015-09-02 12:18:26', '2015-09-02 12:18:26'),
	(21, 1, 5, 2, 30, '2015-09-02 12:18:26', '2015-09-02 12:18:26'),
	(22, 1, 5, 3, 30, '2015-09-02 12:18:26', '2015-09-02 12:18:26'),
	(23, 1, 5, 4, 30, '2015-09-02 12:18:26', '2015-09-02 12:18:26'),
	(24, 1, 5, 5, 30, '2015-09-02 12:18:26', '2015-09-02 12:18:26');
/*!40000 ALTER TABLE `m_quest_event` ENABLE KEYS */;


-- Dumping structure for テーブル lgb_local.m_quest_item
DROP TABLE IF EXISTS `m_quest_item`;
CREATE TABLE IF NOT EXISTS `m_quest_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quest_id` int(11) NOT NULL DEFAULT '0',
  `floor_num` int(11) NOT NULL DEFAULT '0',
  `item_id` int(11) NOT NULL DEFAULT '0',
  `amount` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_quest_item` (`quest_id`,`floor_num`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Dumping data for table lgb_local.m_quest_item: ~10 rows (approximately)
/*!40000 ALTER TABLE `m_quest_item` DISABLE KEYS */;
INSERT INTO `m_quest_item` (`id`, `quest_id`, `floor_num`, `item_id`, `amount`, `created`, `modified`) VALUES
	(1, 1, 1, 1001, 1, '2015-09-01 17:47:02', '2015-09-01 17:47:02'),
	(2, 1, 1, 2001, 1, '2015-09-01 17:47:02', '2015-09-01 17:47:02'),
	(3, 1, 2, 1001, 2, '2015-09-01 17:47:02', '2015-09-01 17:47:02'),
	(4, 1, 2, 2001, 2, '2015-09-01 17:47:02', '2015-09-01 17:47:02'),
	(5, 1, 3, 1001, 3, '2015-09-01 17:47:02', '2015-09-01 17:47:02'),
	(6, 1, 3, 2001, 3, '2015-09-01 17:47:02', '2015-09-01 17:47:02'),
	(7, 1, 4, 1001, 4, '2015-09-01 17:47:02', '2015-09-01 17:47:02'),
	(8, 1, 4, 2001, 4, '2015-09-01 17:47:02', '2015-09-01 17:47:02'),
	(9, 1, 5, 1001, 5, '2015-09-01 17:47:02', '2015-09-01 17:47:02'),
	(10, 1, 5, 2001, 5, '2015-09-01 17:47:02', '2015-09-01 17:47:02');
/*!40000 ALTER TABLE `m_quest_item` ENABLE KEYS */;


-- Dumping structure for テーブル lgb_local.m_quest_monster
DROP TABLE IF EXISTS `m_quest_monster`;
CREATE TABLE IF NOT EXISTS `m_quest_monster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quest_id` int(11) NOT NULL DEFAULT '0',
  `floor_num` int(11) NOT NULL DEFAULT '0',
  `monster_id` int(11) NOT NULL DEFAULT '0',
  `lv` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_quest_monster` (`quest_id`,`floor_num`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Dumping data for table lgb_local.m_quest_monster: ~10 rows (approximately)
/*!40000 ALTER TABLE `m_quest_monster` DISABLE KEYS */;
INSERT INTO `m_quest_monster` (`id`, `quest_id`, `floor_num`, `monster_id`, `lv`, `created`, `modified`) VALUES
	(1, 1, 1, 1, 1, '2015-09-01 17:42:46', '2015-09-01 17:42:46'),
	(2, 1, 1, 2, 1, '2015-09-01 17:42:46', '2015-09-01 17:42:46'),
	(3, 1, 2, 1, 2, '2015-09-01 17:42:46', '2015-09-01 17:42:46'),
	(4, 1, 2, 2, 2, '2015-09-01 17:42:46', '2015-09-01 17:42:46'),
	(5, 1, 3, 1, 3, '2015-09-01 17:42:46', '2015-09-01 17:42:46'),
	(6, 1, 3, 2, 3, '2015-09-01 17:42:46', '2015-09-01 17:42:46'),
	(7, 1, 4, 1, 4, '2015-09-01 17:42:46', '2015-09-01 17:42:46'),
	(8, 1, 4, 2, 4, '2015-09-01 17:42:46', '2015-09-01 17:42:46'),
	(9, 1, 5, 1, 5, '2015-09-01 17:42:46', '2015-09-01 17:42:46'),
	(10, 1, 5, 2, 5, '2015-09-01 17:42:46', '2015-09-01 17:42:46');
/*!40000 ALTER TABLE `m_quest_monster` ENABLE KEYS */;


-- Dumping structure for テーブル lgb_local.m_scene
DROP TABLE IF EXISTS `m_scene`;
CREATE TABLE IF NOT EXISTS `m_scene` (
  `id` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `draw_type` varchar(32) DEFAULT NULL,
  `scene_type` varchar(32) DEFAULT NULL,
  `back_scene` varchar(32) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_scene` (`scene_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lgb_local.m_scene: ~4 rows (approximately)
/*!40000 ALTER TABLE `m_scene` DISABLE KEYS */;
INSERT INTO `m_scene` (`id`, `name`, `draw_type`, `scene_type`, `back_scene`, `created`, `modified`) VALUES
	(1, 'メインメニュー', 'none', 'scene_menu', 'none', '2015-09-03 19:51:05', '2015-09-03 19:51:05'),
	(2, 'クエスト', 'none', 'scene_quest', 'scene_menu', '2015-09-03 19:51:05', '2015-09-03 19:51:05'),
	(3, 'クエスト出発', 'none', 'scene_quest_go_opt', 'scene_quest', '2015-09-03 19:51:05', '2015-09-03 19:51:05'),
	(4, 'ダンジョン選択', 'none', 'scene_quest_select', 'scene_quest_go_opt', '2015-09-04 18:08:14', '2015-09-04 18:08:16'),
	(5, '所持品', 'none', 'scene_my_item', 'scene_menu', '2015-09-06 21:59:37', '2015-09-06 21:59:40'),
	(6, '新着', 'none', 'scene_new_item', 'scene_my_item', '2015-09-06 22:00:19', '2015-09-06 22:00:21'),
	(7, '武器選択', 'none', 'scene_weapon_select', 'scene_quest_go_opt', '2015-09-07 09:55:32', '2015-09-07 09:55:34'),
	(8, '防具選択', 'none', 'scene_armor_select', 'scene_quest_go_opt', '2015-09-07 09:56:18', '2015-09-07 09:56:19'),
	(9, 'アイテム選択', 'none', 'scene_armor_select', 'scene_quest_go_opt', '2015-09-07 09:57:03', '2015-09-07 09:57:04');
/*!40000 ALTER TABLE `m_scene` ENABLE KEYS */;


-- Dumping structure for テーブル lgb_local.m_shop
DROP TABLE IF EXISTS `m_shop`;
CREATE TABLE IF NOT EXISTS `m_shop` (
  `id` int(11) NOT NULL DEFAULT '0',
  `item_id` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lgb_local.m_shop: ~12 rows (approximately)
/*!40000 ALTER TABLE `m_shop` DISABLE KEYS */;
INSERT INTO `m_shop` (`id`, `item_id`, `created`, `modified`) VALUES
	(1, 1001, '2015-09-01 17:52:57', '2015-09-01 17:52:57'),
	(2, 1002, '2015-09-01 17:52:57', '2015-09-01 17:52:57'),
	(3, 1003, '2015-09-01 17:52:57', '2015-09-01 17:52:57'),
	(4, 1004, '2015-09-01 17:52:57', '2015-09-01 17:52:57'),
	(5, 1005, '2015-09-01 17:52:57', '2015-09-01 17:52:57'),
	(6, 1006, '2015-09-01 17:52:57', '2015-09-01 17:52:57'),
	(7, 2001, '2015-09-01 17:52:57', '2015-09-01 17:52:57'),
	(8, 2002, '2015-09-01 17:52:57', '2015-09-01 17:52:57'),
	(9, 2003, '2015-09-01 17:52:57', '2015-09-01 17:52:57'),
	(10, 2004, '2015-09-01 17:52:57', '2015-09-01 17:52:57'),
	(11, 2005, '2015-09-01 17:52:57', '2015-09-01 17:52:57'),
	(12, 2006, '2015-09-01 17:52:57', '2015-09-01 17:52:57');
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `item_id` int(11) NOT NULL DEFAULT '0',
  `lv` int(11) NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_item` (`user_id`,`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lgb_local.user_item: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_item` ENABLE KEYS */;


-- Dumping structure for テーブル lgb_local.user_quest
DROP TABLE IF EXISTS `user_quest`;
CREATE TABLE IF NOT EXISTS `user_quest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `quest_id` int(11) NOT NULL DEFAULT '0',
  `status` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_quest` (`user_id`,`quest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table lgb_local.user_quest: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_quest` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_quest` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
