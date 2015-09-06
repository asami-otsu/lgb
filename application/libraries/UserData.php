<?php
class UserData extends CI_Controller {

	/**
	 * ユーザの情報取得
	 */
	function get_user ( $user_id = 1) {
		$data = array();

		$this->load->model('user', 'user');
		$user = $this->user->find($user_id);
		if (empty($user)) {
			log_message('ユーザが見つかりません。user_id:'. $user_id);
		}
		$data['id'] = $user_id;
		$data['money'] = $user['money'];
		$data['status'] = $user['status'];

		$this->load->model('user_item', 'user_item');
		$user_items = $this->user_item->get_all_key_value('item_id');
		$data['data']['items'] = $user_items;

		$this->load->model('user_quest', 'user_quest');
		$user_quest = $this->user_quest->get_all_key_value('quest_id');
		$data['data']['quest'] = $user_quest;

		return $data;
	}


}

