<?php

class Pages extends CI_Controller{

	public function view1(){
		$data = array();
		$data['url'] = "redirect1";
		$data['params'] = array();

		$this->load->view('Pages/view1', $data);
	}


	public function hoge( array $num ){
	}


	public function fuga () {

	} // ! fuga



}
