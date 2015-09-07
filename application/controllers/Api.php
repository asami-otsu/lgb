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
						'params' => array(
							'x' => 1,
							'y' => 1,
							"text" => "hoge",
							"nextScene" => "fuga",
							'actionType' => 'none',
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
						'params' => array(
							'x' => 1,
							'y' => 35,
							'id' => 'button_quest',
							'text' => 'クエスト',
							'nextScene' => 'quest',
							'actionType' => 'none',
						),
					),
					array(
						'params' => array(
							'x' => 1,
							'y' => 70,
							'id' => 'button_fuga',
							'text' => 'fuga',
							'nextScene' => 'main',
							'actionType' => 'none',
						),
					),
				),
				'backScene' => 'none',
			),
			'scene_main' => array(
				'sceneName' => 'メイン',
				'buttons' => array(
					array(
						'params' => array(
							'x' => 1,
							'y' => 30,
							'id' => 'button_fuga',
							'text' => 'fuga',
							'nextScene' => 'menu',
							'actionType' => 'none',
						),
					),
				),
				'backScene' => 'main',
			),
			'scene_quest' => array(
				'sceneName' => 'クエスト',
				'buttons' => array(
					array(
						'params' => array(
							'x' => 0,
							'y' => 35,
							'id' => 'button_quest_go_opt',
							'text' => 'クエスト出発',
							'nextScene' => 'quest_go_opt',
							'actionType' => 'none',
						),
					),
				),
			),
			'scene_quest_go_opt' => array(
				'sceneName' => 'クエスト出発',
				'buttons' => array(
					array(
						'params' => array(
							'x' => 0,
							'y' => 40,
							'id' => 'button_quest_list',
							'text' => 'クエスト選択',
							'nextScene' => 'quest_list',
							'actionType' => 'none',
						),
					),
					array(
						'params' => array(
							'x' => 0,
							'y' => 70,
							'id' => 'button_step',
							'text' => '目的階層選択',
							'nextScene' => 'step',
							'actionType' => 'none',
						),
					),
					array(
						'params' => array(
							'x' => 0,
							'y' => 100,
							'id' => 'button_weapon',
							'text' => '武器',
							'nextScene' => 'weapon',
							'actionType' => 'none',
						),
					),
					array(
						'params' => array(
							'x' => 0,
							'y' => 130,
							'id' => 'button_armor',
							'text' => '防具',
							'nextScece' => 'armor',
							'actionType' => 'none',
						),
					),
					array(
						'params' => array(
							'x' => 0,
							'y' => 160,
							'id' => 'button_item_1',
							'text' => 'アイテム1',
							'nextScene' => 'item_list',
							'actionType' => 'none',
						),
					),
					array(
						'params' => array(
							'x' => 0,
							'y' => 190,
							'id' => 'button_item_2',
							'text' => 'アイテム2',
							'nextScene' => 'item_list',
							'actionType' => 'none',
						),
					),
					array(
						'params' => array(
							'x' => 0,
							'y' => 220,
							'id' => 'button_time',
							'text' => '所要時間',
							'nextScene' => 'none',
							'actionType' => 'none',
						),
					),
					array(
						'params' => array(
							'x' => 0,
							'y' => 250,
							'id' => 'button_result_time',
							'text' => '期間予定時刻',
							'nextScene' => 'none',
							'actionType' => 'none',
						),
					),
					array(
						'params' => array(
							'x' => 0,
							'y' => 280,
							'id' => 'button_go',
							'text' => '出発',
							'nextScene' => 'go',
							'actionType' => 'quest_go',
						),
					),
				),
			),
			'scene_quest_list' => array(
				'sceneName' => 'クエスト選択',
				'drawType' => "none",
				'buttons' => array(
					array(
						'params' => array(
							'x' => 0,
							'y' => 35,
							'id' => 'button_quest_1',
							'title' => 'ダンジョン1',
							'text' => 'クエスト1',
							'nextScene' => 'quest_go_opt',
							'actionType' => 'questSelect',
							'value' => 1,
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

