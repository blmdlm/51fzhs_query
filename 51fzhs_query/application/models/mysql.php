<?php
/**
 * 
 *@ClassName: MySQL
 *@Description: 操作数据库的类
 *@author gejing gjblmdlm@sina.com 
 *@date 2014年11月1日 下午4:45:55
 */
class  MySQL{
	private $host;                                        //服务器地址
	private $name;										//登录账号		
	private $pwd;                                         //登录密码
	private $dBase;										//数据库名称			
	private $conn;										//数据库连接资源
	private $result;										//结果集
	private $msg;											//返回结果
	private $fields;										//返回字段
	private $fieldsNum;								//返回字段数
	private $rowsNum;								//返回结果数
	private $rowsRst;									//返回单条记录的字段数组
	private $filesArray=array();					//返回字段数组
	private $rowsArray=array();					//返回结果数组
	private $charset='utf8';							//设置操作的字符集		
	private $query_count=0;						//查询结果次数
	static private $_instance;						//存储对象
	
	/**
	 * 构造函数
	 * @param string $host
	 * @param string $name
	 * @param string $pwd
	 * @param string $dBase
	 */
	private function  __construct($host='',$name='',$pwd='',$dBase=''){
		if ($host!='') $this->host=$host;
		if ($name!='') $this->name=$name;
		if ($pwd!='') $this->pwd=$pwd;
		if ($dBase!='') $this->dBase=$dBase;
		$this->init_conn();		
	}
	/**
	 * 防止被克隆
	 */
	private function __clone(){}
	public static  function getInstance($host='',$name='',$pwd='',$dBase=''){
		if (FALSE==(self::$_instance instanceof  self)){
			self::$_instance=new self($host,$name,$pwd,$dBase);
		}
		return self::$_instance;
	} 
	
	public function __set($name,$value){
		$this->$name=$value;
	}
	
	public function __get($name){
		return $this->$name;
	}
	
	/**
	 * 初始化连接数据库
	 */
	function init_conn(){
		$this->conn=@mysql_connect($this->host,$this->name,$this->conn)
		or die('连接数据库失败！');
		@mysql_select_db($this->dBase,$this->conn)
		or die('选择数据库失败！');
		mysql_query("set names ".$this->charset);
	}
	
	/**
	 * 返回查询结果集
	 * @param unknown $sql
	 */
	function mysql_query_rst($sql){
		if ($this->conn=='') $this->init_conn();
		$this->result=@mysql_query($sql,$this->conn);
		$this->query_count++;
	}
	/**
	 * 返回字段数
	 * @param unknown $sql
	 */
	function getFieldsNum($sql){
		$this->mysql_query_rst($sql);
		$this->fieldsNum=@mysql_num_fields($this->result);
	}
	/**
	 * 返回查询结果数
	 * @param unknown $sql
	 * @return string
	 */
	function getRowsNum($sql){
		$this->mysql_query_rst($sql);
		if (mysql_errno()==0){
			return  @mysql_num_rows($this->result);
		}else{
			return '';
		}
	}
	/**
	 * 返回记录数组(单条记录)
	 * @param unknown $sql
	 * @param string $type
	 * @return string|multitype:
	 */
	function getRowsRst($sql,$type=MYSQL_BOTH){
		$this->mysql_query_rst($sql);
		if (empty($this->result)) return '';
		if (mysql_errno()==0){
			$this->rowsRst=mysql_fetch_array($this->result,$type);
			return $this->rowsRst;
		}else {
			return '';
		}
	}
	/**
	 * 返回记录数组(多条记录)
	 * @param unknown $sql
	 * @param string $type
	 * @return string
	 */
	function getRowsArray($sql,$type=MYSQL_BOTH){
		!empty($this->rowsArray) ? $this->rowsArray=array():'';
		$this->mysql_query_rst($sql);
		if (mysql_errno()==0){
			while ($row=mysql_fetch_array($this->result,$type)){
				$this->rowsArray[]=$row;
			}
			return $this->rowsArray;
		}else{
			return '';
		}

	}
	/**
	 * 更新、删除、添加记录数
	 * @param unknown $sql
	 * @return string
	 */
	function uidRst($sql){
		if ($this->conn==''){
			$this->init_conn();
		}
		@mysql_query($sql);
		$this->rowsNum=@mysql_affected_rows();
		if (mysql_errno()==0){
			return $this->rowsNum;
		}else{
			return '';
		}
	}
	
	function returnRstId($sql){
		if ($this->conn==''){
			$this->init_conn();
		}
		@mysql_query($sql);
		if (mysql_errno()==0){
			return mysql_insert_id();
		}else{
			return '';
		}
			
	}
	
	/**
	 * 返回对应的字段值
	 * @param unknown $sql
	 * @param unknown $fields
	 * @return string
	 */
	function getFields($sql,$fields){
		$this->mysql_query_rst($sql);
		if (mysql_errno()==0){
			if (mysql_num_rows($this->result)>0){
				$tmpfld=@mysql_fetch_row($this->result);
				$this->fields=$tmpfld[$fields];
			}
			return $this->fields;
		}else{
			return '';
		}
	}
	/**
	 * 返回错误信息
	 * @return string
	 */
	function msg_error(){
		if (mysql_errno()!=0){
			$this->msg=mysql_error();
		}
		return $this->msg;
	}
	
	/**
	 * 释放结果集
	 */
	function close_rst(){
		mysql_free_result($this->result);
		$this->msg='';
		$this->fieldsNum=0;
		$this->rowsNum=0;
		$this->filesArray='';
		$this->rowsArray='';
	}
	/**
	 * 关闭数据库连接资源
	 */
	function  close_conn(){
		$this->close_rst();
		mysql_close($this->conn);
		$this->conn='';
	}
	/**
	 * 返回数据库版本
	 */
	function db_version(){
		return mysql_get_server_info();
	}
	
	
	
	
	
	
	
	
}


























