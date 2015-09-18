<?php

class Login_Controller extends LGB_Controller{
	
	public function login(){
		
	}

	public function loginValidate(){
		// post data
		$user_name = $this->input->get_post('user_name', TRUE);
		$password = $this->input->get_post('password', TRUE);

		$userData = new UserData();
		$isLogin = $userData->userLoginValidate($user_name, $password);

		$user = array();
		if( $isLogin ){
			$user = $userData->getUserByName($user_name);
			log_message('debug', 'ログイン成功');
		}else{
			$user['id'] = 0;
			log_message('debug', 'ログイン失敗');
			redirect('Login/login');
		}

		$data = $user;

		$this->setViewName('Mains/index');
		$this->setData($data);
		$this->loadView();
	}
}

