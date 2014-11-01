<?php
include_once('mysql.php');
class  TestModel{
	private $db=null;
	public function __construct(){
		
			$this->db = MySQL::getInstance("127.0.0.1","root","","51fzhs_info");
		
		
	}
	
	public function getVersion(){
		
		return  $this->db->db_version();
	}
	
	
}











