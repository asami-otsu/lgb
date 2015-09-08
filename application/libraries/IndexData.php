<?php

class IndexData extends CI_Controller {

	protected $_user_items = array();
	protected $_items = array();
	
	/**
	 * 最初に渡すデータをまとめる
	 * @param int user_id
	 * @return array
	 */
	public function get_index($user_id = 1) {
		$data = array();

		// ユーザ情報
		$this->load->model('user', 'user');
		$user = $this->user->find($user_id);
		if ( empty($user) ) {
			log_message('ユーザがみつかりません。user_id：' . $user_id);
			return false;
		}

		// Scene情報
		$this->load->model('m_scene', 'm_scene');
		$m_scene = $this->m_scene->get_all_key_value('scene_type', TRUE);
		if ( empty($m_scene) ) {

		}

		// Button情報
		$this->load->model('m_button', 'm_button');
		$m_button = $this->m_button->get_all_key_value('scene_type', TRUE);
		if ( empty($m_button) ) {
			log_message('ボタン情報がみつかりません。');
			return false;
		}

		// data整形
		foreach ( $m_scene as $scene_type => $scene ) {
			$current_scene = $scene[0];
			$buttons = $this->makeButtonParams($m_button[$scene_type]);

			$data[$scene_type] = array( 
						'sceneName' => $current_scene['name'],
						'drawType' => $current_scene['draw_type'],
						'backScene' => $current_scene['back_scene'],
						'buttons' => $buttons,
						);
		}
	
		return $data;
	}

	/**
	 * ボタンの詳細を返す
	 *
	 * @param 
	 * @return array
	 */
	public function makeButtonParams( $buttons ) {
		$data = array();
		$this->load->model('m_item', 'm_item');
		$this->_items = $this->m_item->get_all_key_value('id');

		$this->load->model('user_item', 'user_item');
		$this->_user_item = $this->user_item->get_all_key_value('item_id');

		foreach ( $buttons as $button ) {
			$tmp = array();
			$value = 0;
			$mst = array();

			// action_typeがないやつは固定処理
			if ( $button['value'] == 'none' ) {
				$data[]['params'] = $this->setButton($button, NULL, $button['x'], $button['y']);	
				continue;
			}

			switch ( $button['scene_type'] ) {

				case M_Button::SCENE_TYPE_QUEST_LIST:
					// クエスト情報
					$this->load->model('m_quest', 'm_quest');
					$mst = $this->m_quest->find_all();
					if ( empty($mst) ) {
						log_message('クエストがみつかりません。');
					}

					break;

				case M_Button::SCENE_TYPE_WEAPON_LIST:
					// 武器情報
					$mst = $this->user_item->get_item_list($this->_user_items, $this->_items, 1);

					break;

				case M_Button::SCENE_TYPE_ARMOR_LIST:
					// 防具情報
					$mst = $this->user_item->get_item_list($this->_user_items, $this->_items, 2);

					break;

				case M_Button::SCENE_TYPE_ITEM_LIST:
					// アイテム情報
					$mst = $this->user_item->get_item_list($this->_user_items, $this->_items, 3);

					break;

				default:
					break;
				
			}

			$x = 0;
			$y = 0;
			foreach ( $mst as $v ) {
				$data[]['params'] = $this->setButton($button, $v, $x, $y);
				$x += $button['x'];
				$y += $button['y'];
			}
		}

		return $data;
	}

	public function setButton($button, $value, $x, $y) {
		$value = empty($value)? $button : $value;

		// sub_text作る？
		if ($button['sub_text'] == M_Button::SUB_TEXT_GET_VALUE) {
			$button['sub_text'] = $this->getSubTextValue($button['action_type']);
		}
			
		return array(
			'x' => $x,
			'y' => $y,
			'width' => $button['width'],
			'height' => $button['height'],
			'id' => $button['tag_id'],
			'title' => $value['name'],
			'text' => $value['text'],
			'subText' => $button['sub_text'],
			'nextScene' => $button['next_scene'],
			'actionType' => $button['action_type'],
			'value' => $value['id'],
		);

	}

	/**
	 * sub_text作成
	 *
	 * @param action_type
	 * @return int
	 */
	public function getSubTextValue($action_type) {
		$type = 0;

		if ( stristr($action_type, 'weapon') ) {
			$type = 1;
		} else if ( stristr($action_type, 'armor') ) {
			$type = 2;
		} else if ( stristr($action_type, 'drag') ) {
			$type = 3;
		} else if ( stristr($action_type, 'ore') ) {
			$type = 4;
		}

		if ($type == 0) {
			return 0;
		}

		$this->load->model('m_item', 'm_item');
		$result = $this->m_item->get_all(array('type' => $type));
		return count($result);
	}

}

