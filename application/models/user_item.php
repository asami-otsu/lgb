<?php
class User_item extends LGB_Model {
	const STATUS_GET = 0;
	const STATUS_NEW = 1;
	const STATUS_SELL = 2;
	const STATUS_LOST = 3;

	/**
	 * アイテムリストを抽出
	 * 
	 * @param array
	 * @param array
	 * @param int
	 * @return array
	 */
	public function get_item_list($user_items, $item, $type) {
		$data = array();

		if (empty($type)) {
			return $user_items;
		}

		foreach ($item as $value) {
			$item_id = $value['id'];

			if ( $value['type'] != $type || ! isset($user_items[$item_id]) ) {
				continue;
			}

			$data[$user_items[$item_id]['id']] = $user_items[$item_id];
		}

		return $data;
	}

}
