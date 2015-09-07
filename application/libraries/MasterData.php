<?php
class MasterData extends CI_Controller {

	/**
	 * masterの取得
	 * @return array
	 */
	public function get_master () {
		$data = array();

		// マスタの取得
		$this->load->model('m_quest', 'm_quest');
		$quest = $this->m_quest->get_all_key_value('id');
		$data['quest'] = $quest;

		$this->load->model('m_item', 'm_item');
		$items = $this->m_item->get_all_key_value('id');
		$data['item'] = $items;

		return $data;
	}

}
