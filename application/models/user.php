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
		$this->db->set(array(
				'name' => $name, 
				'passwd' => $passwd, 
				'created' => $now, 
				'modified' => $now
		);
		$ret = $this->db->insert($this->_table, $this);
		if( $ret === FALSE){
			return FALSE;
		}
		return $this->db->insert_id();
	}
	
}
