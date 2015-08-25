<?php

class Mains extends LGB_Controller {

	public function main1(){
		$this->setViewName("main1");
		$this->setData(array());
		$this->loadView();
	}
}

