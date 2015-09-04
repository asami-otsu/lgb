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

		// クエスト情報
		$this->load->model('m_quest', 'm_quest');
		$m_quest = $this->m_quest->find_all();
		if ( empty($m_quest) ) {
			log_message('クエストがみつかりません。');
			return false;
		}

		// アイテム情報
		//$this->load->model('m_item', 'm_item');
		//$m_item = $this->

		// data整形
		foreach ( $m_scene as $scene_type => $scene ) {
			$current_scene = $scene[0];

			foreach ( $m_button[$scene_type] as $button ) {
				$data[$scene_type][] = array( 
								'sceneName' => $current_scene['name'],
								'drawType' => $current_scene['draw_type'],
								'backScene' => $current_scene['back_scene'],
								'buttons' => array (
									array(
									'x' => $button['x'],
									'y' => $button['y'],
									'width' => $button['width'],
									'height' => $button['height'],
									'params' => array(
										'id' => $button['tag_id'],
										'title' => $button['name'],
										'text' => $button['text'],
										'subText' => $button['sub_text'],
										'nextScene' => $button['next_scene'],
										'actionType' => $button['action_type'],
										),
									),
								),
							);
			}
		}
	
		return $data;
	}

}

