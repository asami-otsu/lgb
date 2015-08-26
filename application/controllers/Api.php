<?php

class Api extends CI_Controller {
	
	public static $response_format = "json";

	public function get(){
		$data = array(
			'text' => "hoge",
		);

			$data = json_encode( $data );
		$this->output->set_output($data);
		$this->output->_display();
		exit;
	}
}
