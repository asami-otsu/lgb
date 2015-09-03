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
		$sample = array(
			'sceneType' => array(
				'sceneName' => "hogehoge",
				'buttons' => array(
					array(
						'x' => 1,
						'y' => 1,
						'params' => array(
							"text" => "hoge",
							"nextScene" => "fuga",
						),
					),
				),
			),
		);
		$data = array(
			'scene_menu' => array(
				'sceneName' => 'メニュー',
				'buttons' => array(
					array(
						'x' => 1,
						'y' => 35,
						'params' => array(
							'id' => 'button_hoge',
							'text' => 'hoge',
							'nextScene' => 'main',
						),
					),
					array(
						'x' => 1,
						'y' => 70,
						'params' => array(
							'id' => 'button_fuga',
							'text' => 'fuga',
							'nextScene' => 'main',
						),
					),
				),
			),
			'scene_main' => array(
				'sceneName' => 'メイン',
				'buttons' => array(
					array(
						'x' => 1,
						'y' => 30,
						'params' => array(
							'id' => 'button_fuga',
							'text' => 'fuga',
							'nextScene' => 'menu',
						),
					),
				),
			),
		);
		$this->output->set_output(json_encode($data));
		$this->output->_display();
		exit;
	}
}

