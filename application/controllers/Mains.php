<?php

class Mains extends LGB_Controller {
	
	public function __construct(){
		parent::__construct();
	}

	public function index(){
		$this->setViewName("index");
		$this->setData(array());
		$this->loadView();
	}
}

