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
	 * ログインバリデート
	 */
	public function login(){
		$data = array();

		$user_name = $this->input->get_post('user_name', TRUE);
		$passwd = $this->input->get_post('passwd', TRUE);

		$userData = new UserData();
		$isLogin = $userData->userLoginValidate($user_name, $passwd);

		$user = array();
		if( $isLogin ){
			$user = $userData->getUserByName($user_name);
			log_message('debug', 'ログインに成功しているようです。');
		}else{
			$user['id'] = 0;
			log_message('debug', 'ログインに失敗しているようです。');
		}

		$data = $user;

		$this->output->set_output(json_encode($data));
		$this->output->_display();
		exit;
	}

}
