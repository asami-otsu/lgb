<?php

class Pages extends LGB_Controller{

	public function view1(){
		$this->load->model('user', 'user');
		$user = $this->user->find(1);
		var_dump($user);

		$data = array();
		$data['url'] = "redirect1";
		$data['params'] = array();

		$this->load->view('Pages/view1', $data);
	}


	public function hoge( array $num ){
	}


	public function fuga () {
		phpinfo();

	} // ! fuga



}
