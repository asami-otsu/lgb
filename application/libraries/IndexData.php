<?php

class IndexData extends CI_Controller {
	
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
		$m_scene = $this->m_scene->get_all_key_value('scene_type');
		if ( empty($m_scene) ) {

		}

		// Button情報
		$this->load->model('m_button', 'm_button');
		$m_button = $this->m_button->get_all_key_value('scene_type');
		if ( empty($m_button) ) {
			log_message('ボタン情報がみつかりません。');
			return false;
		}

		// data整形
		foreach ( $m_scene as $scene_type => $scene ) {
			$current_scene = $scene[0];
			$buttons = $this->makeButtonParams($m_button[$scene_type]);

			$data[$scene_type][] = array( 
						'sceneName' => $current_scene['name'],
						'drawType' => $current_scene['draw_type'],
						'backScene' => $current_scene['back_scene'],
						'buttons' => array ($buttons),
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

		foreach ( $buttons as $button ) {
			$tmp = array();
			$value = 0;
			$mst = array();

			// action_typeがないやつは固定処理
			if ( $button['value'] == 'none' ) {
				$data['params'][] = $this->setButton($button, NULL, $button['x'], $button['y']);	
				continue;
			}

			switch ( $button['scene_type'] ) {
				case M_Button::SCENE_TYPE_QUEST_SELECT:

					// クエスト情報
					$this->load->model('m_quest', 'm_quest');
					$mst = $this->m_quest->find_all();
					if ( empty($mst) ) {
						log_message('クエストがみつかりません。');
					}

					break;

				case M_Button::SCENE_TYPE_WEAPON:
					break;

				case M_Button::SCENE_TYPE_ARMOR:
					break;

				case M_Button::SCENE_TYPE_ITEM:
					break;

				default:
					break;
				
			}

			$x = 0;
			$y = 0;
			foreach ( $mst as $v ) {
				$data['params'][] = $this->setButton($button, $v, $x, $y);
				$x += $button['x'];
				$y += $button['y'];
			}
		}

		return $data;
	}

	public function setButton($button, $value, $x, $y) {
		$value = empty($value)? $button : $value;
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

}

