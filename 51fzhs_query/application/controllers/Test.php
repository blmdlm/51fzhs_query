<?php
class TestController extends Yaf_Controller_Abstract {
	public function indexAction(){
		$db=new TestModel();
		echo $db->getVersion();
	}
}