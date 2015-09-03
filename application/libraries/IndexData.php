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

		// Button情報
		$this->load->model('m_button', 'm_button');
		$m_button = $this->m_button->find_all();
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
		foreach ( $m_button as $values) {
			$data[$values->scene_type][] = array( 'sceneName' => 'hogetitle',
								'buttons' => array (
									array(
										'x' => $values->x,
										'y' => $values->y,
										'params' => array(
											'text' => $values->name,
											'nextScene' => $values->next_scene,
										),
									),
								),
							);
		}
	
		return $data;
	}

}
