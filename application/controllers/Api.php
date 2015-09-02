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

	public function getButtons(){
		$a = array(
			'sceneType' => array(
				'x' => 1,
				'y' => 1,
				'params' => array(
					"text" => "hoge",
					"nextScene" => "fuga",
				),
			),
		);
		$data = array(
			'menu' => array(
				array(
					'x' => 1,
					'y' => 1,
					'params' => array(
						'text' => 'hoge',
						'nextScene' => 'main',
					),
				),
				array(
					'x' => 1,
					'y' => 40,
					'params' => array(
						'text' => 'fuga',
						'nextScene' => 'main',
					),
				),
			),
			'main' => array(
				array(
					'x' => 1,
					'y' => 30,
					'params' => array(
						'text' => 'fuga',
						'nextScene' => 'menu',
					),
				),
			),
		);
		$this->output->set_output(json_encode($data));
		$this->output->_display();
		exit;
	}
}
