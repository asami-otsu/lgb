<?php
class User extends LGB_Model {
	const USER_STATUS_GO = 1;
	const USER_STATUS_WAIT = 0;


	public function find_name($name){
		$ret = $this->db->where(array('name' => $name))->get($this->_table)->row_array();
		return $ret;
	}

	public function create($name, $passwd){
		$now = $this->now();
		$this->name = $name;
		$this->password = $passwd;
		$ret = $this->insert();
		if( $ret === FALSE){
			log_message('error', 'ユーザーデータの作成に失敗しました。');
			return FALSE;
		}
		log_message('debug', 'ユーザーデータの作成に成功しました。');
		return true;
	}
	
}

