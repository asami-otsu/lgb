<?php
require_once(APPPATH.'libraries/REST_Controller.php');
require_once(APPPATH.'libraries/IndexData.php');

class Test extends LGB_Controller {

	function menu() {
		$indexData = new IndexData();
		$data = $indexData->get_index();

                $this->output->set_output(json_encode($data));
                $this->output->_display();
		exit;
	}
}

