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
							'id' => 'button_quest',
							'text' => 'クエスト',
							'nextScene' => 'quest',
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
				'backScene' => 'none',
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
				'backScene' => 'main',
			),
			'scene_quest' => array(
				'sceneName' => 'クエスト',
				'buttons' => array(
					array(
						'x' => 0,
						'y' => 35,
						'params' => array(
							'id' => 'button_quest_go_opt',
							'text' => 'クエスト出発',
							'nextScene' => 'quest_go_opt',
						),
					),
				),
			),
			'scene_quest_go_opt' => array(
				'sceneName' => 'クエスト出発',
				'buttons' => array(
					array(
						'x' => 0,
						'y' => 40,
						'params' => array(
							'id' => 'button_quest_list',
							'text' => 'クエスト選択',
							'nextScene' => 'quest_list',
						),
					),
					array(
						'x' => 0,
						'y' => 70,
						'params' => array(
							'id' => 'button_step',
							'text' => '目的階層選択',
							'nextScene' => 'step',
						),
					),
					array(
						'x' => 0,
						'y' => 100,
						'params' => array(
							'id' => 'button_weapon',
							'text' => '武器',
							'nextScene' => 'weapon',
						),
					),
					array(
						'x' => 0,
						'y' => 130,
						'params' => array(
							'id' => 'button_armor',
							'text' => '防具',
							'nextScece' => 'armor',
						),
					),
					array(
						'x' => 0,
						'y' => 160,
						'params' => array(
							'id' => 'button_item_1',
							'text' => 'アイテム1',
							'nextScene' => 'item_list',
						),
					),
					array(
						'x' => 0,
						'y' => 190,
						'params' => array(
							'id' => 'button_item_2',
							'text' => 'アイテム2',
							'nextScene' => 'item_list',
						),
					),
					array(
						'x' => 0,
						'y' => 220,
						'params' => array(
							'id' => 'button_time',
							'text' => '所要時間',
							'nextScene' => 'none',
						),
					),
					array(
						'x' => 0,
						'y' => 250,
						'params' => array(
							'id' => 'button_result_time',
							'text' => '期間予定時刻',
							'nextScene' => 'none',
						),
					),
					array(
						'x' => 0,
						'y' => 280,
						'params' => array(
							'id' => 'button_go',
							'text' => '出発',
							'nextScene' => 'go',
						),
					),
				),
			),
			'scene_quest_list' => array(
				'sceneName' => 'クエスト選択',
				'drawType' => "none",
				'actionType' => "quest_select",
				'buttons' => array(
					array(
						'x' => 0,
						'y' => 35,
						'params' => array(
							'id' => 'button_quest_1',
							'text' => 'クエスト1',
							'nextScene' => 'quest_go_opt',
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

