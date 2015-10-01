-- --------------------------------------------------------
-- ホスト:                          192.168.56.10
-- サーバのバージョン:                    5.6.26 - MySQL Community Server (GPL)
-- サーバー OS:                      Linux
-- HeidiSQL バージョン:               9.1.0.4867
-- --------------------------------------------------------

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

-- Dumping data for table lgb_local.m_button: ~25 rows (approximately)
/*!40000 ALTER TABLE `m_button` DISABLE KEYS */;
INSERT INTO `m_button` (`id`, `scene_type`, `name`, `text`, `sub_text`, `tag_id`, `x`, `y`, `width`, `height`, `next_scene`, `action_type`, `value`, `created`, `modified`) VALUES
	(1, 'scene_menu', 'クエスト', 'クエストを始めたりログを確認します', 'none', 'button_quest', 0, 0, 400, 30, 'scene_quest', 'none', 'none', '2015-09-01 16:32:05', '2015-09-01 16:32:05'),
	(2, 'scene_menu', '所持品', '持ち物を確認します', 'none', 'button_item', 0, 30, 400, 30, 'scene_my_item', 'none', 'none', '2015-09-01 16:32:05', '2015-09-01 16:32:05'),
	(3, 'scene_menu', 'アイテムショップ', '買い物をします', 'none', 'button_shop', 0, 60, 400, 30, 'scene_shop', 'none', 'none', '2015-09-01 16:32:05', '2015-09-01 16:32:05'),
	(4, 'scene_menu', '強化屋', '武具を強化します', 'none', 'button_enchance', 0, 90, 400, 30, 'scene_enhance', 'none', 'none', '2015-09-01 16:32:05', '2015-09-01 16:32:05'),
	(5, 'scene_menu', '記録', '各ダンジョンの記録を確認します', 'none', 'button_logs', 0, 120, 400, 30, 'scene_logs', 'none', 'none', '2015-09-01 16:32:05', '2015-09-01 16:32:05'),
	(6, 'scene_quest', 'クエスト出発', '新しいクエストへ出発します', 'none', 'button_quest_go_opt', 0, 0, 400, 30, 'scene_quest_go_opt', 'none', 'none', '2015-09-03 19:59:51', '2015-09-03 19:59:51'),
	(7, 'scene_quest', 'ダンジョン名', '出発日時', 'none', 'button_log_list', 0, 0, 400, 30, 'scene_log_list', 'log_list', 'log_id', '2015-09-06 20:47:26', '2015-09-06 20:47:28'),
	(8, 'scene_quest_go_opt', 'ダンジョン', 'none', 'none', 'button_quest_list', 0, 0, 400, 30, 'scene_quest_list', 'none', 'none', '2015-09-03 19:59:51', '2015-09-03 19:59:51'),
	(9, 'scene_quest_go_opt', '目的階', 'none', 'none', 'button_floor', 0, 30, 400, 30, 'none', 'none', 'none', '2015-09-03 19:59:51', '2015-09-03 19:59:51'),
	(10, 'scene_quest_go_opt', '武器', 'none', 'なし', 'button_weapon', 0, 60, 400, 30, 'scene_weapon_select', 'none', 'none', '2015-09-03 19:59:51', '2015-09-03 19:59:51'),
	(11, 'scene_quest_go_opt', '防具', 'none', 'なし', 'button_armor', 0, 90, 400, 30, 'scene_armor_select', 'none', 'none', '2015-09-03 19:59:51', '2015-09-03 19:59:51'),
	(12, 'scene_quest_go_opt', 'アイテム１', 'none', 'なし', 'button_item1', 0, 120, 400, 30, 'scene_item_select', 'none', 'none', '2015-09-03 19:59:51', '2015-09-03 19:59:51'),
	(13, 'scene_quest_go_opt', 'アイテム２', 'none', 'なし', 'button_item2', 0, 150, 400, 30, 'scene_item_select', 'none', 'none', '2015-09-03 19:59:51', '2015-09-03 19:59:51'),
	(14, 'scene_quest_go_opt', '所要時間', 'none', 'none', 'button_time', 0, 180, 400, 30, 'none', 'none', 'none', '2015-09-03 19:59:51', '2015-09-03 19:59:51'),
	(15, 'scene_quest_go_opt', '帰還予定時刻', 'none', 'none', 'button_left_time', 0, 210, 400, 30, 'none', 'none', 'none', '2015-09-03 19:59:51', '2015-09-03 19:59:51'),
	(16, 'scene_quest_go_opt', '出発', 'none', 'none', 'button_go', 0, 240, 400, 30, 'scene_quest', 'go', 'none', '2015-09-06 20:33:51', '2015-09-06 20:33:53'),
	(17, 'scene_quest_list', 'ダンジョン選択', 'none', 'none', 'none', 0, 0, 400, 30, 'none', 'none', 'quest_select', '2015-09-04 17:42:43', '2015-09-04 17:42:45'),
	(18, 'scene_my_item', '新着', '新着を確認します', 'get_value', 'button_new_item', 0, 0, 400, 30, 'scene_new_item', 'none', 'none', '2015-09-06 20:18:18', '2015-09-06 20:18:20'),
	(19, 'scene_my_item', '武器', '武器を確認します', 'get_value', 'button_weapon_list', 0, 30, 400, 30, 'scene_weapon_select', 'none', 'none', '2015-09-06 20:24:19', '2015-09-06 20:24:20'),
	(20, 'scene_my_item', '防具', '防具を確認します', 'get_value', 'button_armor_list', 0, 60, 400, 30, 'scene_armor_select', 'none', 'none', '2015-09-06 20:35:35', '2015-09-06 20:35:36'),
	(21, 'scene_my_item', 'アイテム', 'アイテムを確認します', 'get_value', 'button_item_list', 0, 90, 400, 30, 'scene_item_select', 'none', 'none', '2015-09-06 20:37:03', '2015-09-06 20:37:04'),
	(22, 'scene_my_item', '鉱石', '鉱石を確認します', 'get_value', 'button_ore_list', 0, 120, 400, 30, 'scene_ore_list', 'none', 'none', '2015-09-06 20:39:15', '2015-09-06 20:39:16'),
	(23, 'scene_new_item', 'アイテム名', 'none', 'none', 'none', 0, 30, 400, 30, 'none', 'none', 'none', '2015-09-06 22:40:00', '2015-09-06 22:40:03'),
	(24, 'scene_weapon_select', '武器選択', 'none', 'none', 'none', 0, 30, 400, 30, 'none', 'none', 'weapon_select', '2015-09-07 09:58:18', '2015-09-07 09:58:18'),
	(25, 'scene_armor_select', '防具選択', 'none', 'none', 'none', 0, 30, 400, 30, 'none', 'none', 'armor_select', '2015-09-07 09:58:23', '2015-09-07 09:58:21'),
	(26, 'scene_item_select', 'アイテム選択', 'none', 'none', 'none', 0, 30, 400, 30, 'none', 'none', 'none', NULL, NULL);
/*!40000 ALTER TABLE `m_button` ENABLE KEYS */;

