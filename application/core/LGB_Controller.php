<?php

class LGB_Controller extends CI_Controller{

	protected $data_ = array();
	protected $view_name = "";


	function __construct(){
		parent::__construct();
		// load header
	}

	function __destruct(){
		// load footer
	}

	protected function loadView( $filepath = null ){
		$class = get_class($this);
		$file_name = empty($filepath) ? $class."/".$this->view_name : $filepath;
		$this->load->view( $file_name, $this->data_ );
	}

	protected function setViewName( $name ){
		$this->view_name = $name;
	}

	protected function setData( $data ){
		$this->data_ = $data;
	}
}

