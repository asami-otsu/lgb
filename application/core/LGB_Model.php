<?php

/**
 * LGB_Model
 *
 * @author localdisk <info@localdisk.org>
 * @property CI_DB_active_record $db
 */
class LGB_Model extends CI_Model {

	/**
	 * table name
	 * 
	 * @var string
	 */
	protected $_table;

	/**
	 * constructor
	 */
	public function __construct() {
		parent::__construct();
		$this->load->database();
		$clazz = get_class($this);
		$this->_table = strtolower($clazz);
		//$this->_table = strtolower(substr($clazz, 0, strpos($clazz, '_')));
	}

	/**
	 * insert
	 * 
	 * @return integer 
	 */
	public function insert() {
		$now = $this->now();
		$this->db->set(array('created' => $now, 'modified' => $now));
		$ret = $this->db->insert($this->_table, $this);
		if ($ret === FALSE) {
			return FALSE;
		}
		return $this->db->insert_id();
	}

	/**
	 * update
	 * 
	 * @param integer|string $id
	 */
	public function update($id, $data = null) {
		if ($data === null) {
			$data = $this;
		}
		$ret = $this->db->update($this->_table, $data, array('id' => $id));
		if ($ret === FALSE) {
			return FALSE;
		}
	}

	/**
	 * delete
	 * 
	 * @param integer|strng $id 
	 */
	public function delete($id) {
		$this->db->delete($this->_table, array('id' => $id));
	}

	/**
	 * find_all
	 * 
	 * @return array
	 */
	public function find_all() {
		return $this->db->get($this->_table)->result_array();
	}

	/**
	 * find_list
	 * 
	 * @param  integer|string $limit
	 * @return array
	 */
	public function find_list($limit = 10) {
		return $this->db->limit($limit)->order_by('id')->get($this->_table)->result();
	}

	/**
	 * find
	 * 
	 * @param  integer|string $id
	 * @return array
	 */
	public function find($id) {
		$ret = $this->db->where(array('id' => $id))->get($this->_table)->row_array();
		return $ret;
	}

	/**
	 * get_all
	 * 
	 * @param  array
	 * @return array
	 */
	public function get_all($where) {
		if ( empty($where) || !is_array($where) ) {
			$ret = $this->find_all();
		} else {
			$ret = $this->db->where($where)->get($this->_table)->result_array();
		}
		return $ret;
	}

	/**
	 * now
	 * 
	 * @return string
	 */
	public function now() {
		return date('Y-m-d H:i:s');
	}

	/**
	 * key_valueで取得する
	 * 
	 * @param string $key
	 * @param boolean $duplicate_flg
	 * @return array
	 */
	public function get_all_key_value($key = 'id', $duplicate_flg=FALSE) {
                $data = array();

                $result = $this->db->get($this->_table)->result_array();
		if ( empty($result) || count($result) == 0 ) {
			return $data;
		}

		if ( $duplicate_flg == TRUE ) {
                	foreach ( $result as $value) {
                        	$data[$value[$key]][] = $value;
                	}
		} else {
			foreach ( $result as $value ) {
				$data[$value[$key]] = $value;
			}
		}
		return $data;
        }

}

