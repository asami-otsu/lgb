<?php

class LGB_Controller extends CI_Controller{

	protected $data_ = array();
	protected $view_name = "";


	function __construct(){
		parent::__construct();
		// load header
		$data = array(
			'favicon_path' => '/application/favicon.ico',
			'controller_name' => get_class($this),
			'lib_js_path' => '/application/js/common.js',
			'main_js_path' => '/application/js/main.js',
			'common_css_path' => '/application/css/common.css',
			);
		/* $data にヘッダー用のデータをつっこんだのち、表示 */
		$this->load->view('template/header.php', $data);
	}

	function __destruct(){
		// load footer
		$data = array();
		/* $data にフッター用のデータをつっこんだのち、表示 */
		$this->load->view('template/footer.php', $data);
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

