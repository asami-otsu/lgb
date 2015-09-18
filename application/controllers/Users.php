<?php
class Users extends LGB_Controller {

	/**
	 * 出発させる
	 * @params
	 * @return
	 */
	public function questGo() {
		$data = array();

		$user_id = $this->input->get_post('user_id', TRUE);
		$quest_data = $this->input->get_post('quest_select', TRUE);
		$userData = new UserData();
		$userData->userQuestGo($user_id, $quest_data);

		// 更新したデータを返す
		$data = $userData->getUser($user_id);

                $this->output->set_output(json_encode($data));
                $this->output->_display();
		exit;
	}

	/**
	 * ユーザーデータ取得
	 * @param int (user_id)
	 * @return array (user data)
	 */
	public function getUserData(){
		$user_id = $this->input->get_post('id', TRUE);
		$user_data = new UserData();
		$data = $user_data->getUser($user_id);

		$this->output->set_output(json_encode($data));
		$this->output->_display();
		exit;
	}
}

