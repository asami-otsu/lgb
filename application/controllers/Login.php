<?php

class Login extends LGB_Controller{

	public function __construct(){
		parent::__construct();
	}
	
	public function login(){
		$this->setViewName('login');
		$this->setData(array());
		$this->loadView();
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

		$data['data'] = $user['id'];

		$this->load->view( 'Mains/index', $data );
	}
}

