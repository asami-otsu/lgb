<?php
class Log_Data extends LGB_Controller {

	/**
	 * ダンジョン中ならイベント作る
	 *
	 * @param user_id
	 *
	 */
	function makeEvent( $user_id ) {
		$tmp_item = array();
		$this->load->model('user', 'user');
		$this->load->model('m_quest', 'quest');

		$user = $this->user->find($user_id);
		if ( $user['status'] != USER_STATUS_GO ) {
			return;
		}

		$quest = $this->quest->find($quest_id);
		$this->doEvent( $user, $quest );
	}

	/**d
	 * イベント実処理
	 *
	 * @param array
	 * @param array
	 * @return array
	 */
	function doEvent( $user, $quest, $quest_data ) {
		$get_items = array();
		$tmp_user = $user;
		$this->load->model('log_quest_event', 'log_event');
		$this->load->model('m_event_item', 'event_item');
		$this->load->model('m_event_monster', 'event_monster');
		$this->load->model('m_event', 'event');
		$this->load->model('user_item', 'user_item');

		while ( $continue_flg == TRUE ) {
			$event_type = $event['type'];
			switch ($event_type) {
				case M_event:: EVENT_TYPE_SPRING_HP:
					$user['hp'] += $event['param'];
					break;

				case M_event:: EVENT_TYPE_SPRING_ATK:
					$user['attack'] += $event['param'];
					break;

				case M_event:: EVENT_TYPE_SPRING_EXP:
					$user['exp'] += $event['param'];
					break;

				case M_event:: EVENT_TYPE_SPRING_DEF:
					$user['def'] += $event['param'];
					break;

				case M_event:: EVENT_TYPE_ITEM:
					$get_items[] = $this->event_item($quest_id);
					break;

				case M_event:: EVENT_TYPE_ENCOUNT:
					$monster = $this->event_monster($quest_id);
					$tmp_user = $this->battle($tmp_user, $monster);
					break;

				case M_event::EVENT_TYPE_STAIRS:
					$floor += 1;
					break;
			}

			// HPがなくなったら終了
			if ( $tmp_user['hp'] <= 0) {
				$continue_flg = FALSE;

				// 拾っていたアイテムは空に
				$get_items = array();

				// 装備品も捨てる
				$this->item_lost($user_id, $item_id);
			}

			// ゴールしたら終了
			if ( $floor == $quest['floor'] ) {
				$continue_flg = FALSE;
			}
		}

		/** クエスト清算処理 */
		// アイテム清算
		foreach ($get_items as $item) {
			$params = array(
					'user_id' => $user_id,
					'item_id' => $item['id'],
					'lv' => $item['level'],
					'status' => User_item::STATUS_NEW,
				);
			$this->user_item->insert($params);
		}

		// ユーザ更新
		$this->user->update(

	}

	/**
	 * 戦闘処理
	 *
	 * @param array
	 * @param array
	 * @return array
	 */
	function battle( $user, $monster) {
		$battle_flg = TRUE;

		while ($battle_flg == TRUE) {


		}
	}
}
