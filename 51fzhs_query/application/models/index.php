<?php
include_once('mysql.php');
/**
 * index模型类
 *@ClassName: TestModel
 *@Description: index控制器的模型类
 *@author gejing gjblmdlm@sina.com 
 *@date 2014年11月2日 下午2:28:07
 */
class  IndexModel{
	private $db=null;
	public function __construct(){
			$this->db = MySQL::getInstance("127.0.0.1","root","","51fzhs_info");
	}
	/**
	 * 从数据库查询所有的用户信息
	 */
	public function getAllUserInfo(){
		//构造sql语句
		$sql="select * from user";
		//查询数据库
		$users['users']=$this->db->getRowsArray($sql, MYSQL_ASSOC);
		//统计记录条数
		$num=count($users['users']);
		//对每一条数据进行丰富
		for ($i=0;$i<$num;$i++){
			//增加其学校
			$user=$users['users'][$i];
			$sql='select sname from school where sid ='.$user["sid"];
			$users['users'][$i]['school']=$this->db->getFields($sql, 0);
			
			//增加其学历信息
			$education=$user['education'];
			
			if (null==$education||0==$education){//默认值
				$users['users'][$i]['education']="UNKNOWN";
				
				
				return $users;
			}
			if (1==$education){//本科
				$users['users'][$i]['education']="本科";
				//查询本科生表
				$sql='select * from undergraduate where uid='.$user["uid"];
				$temp=$this->db->getRowsArray($sql,MYSQL_ASSOC);
				//获得专业信息
				$sql='select mname from major where mid='.$temp[0]["mid"];
				$users['users'][$i]['major']=$this->db->getFields($sql, 0);
				//获取学校信息
				$sql='select * from collegeinfo where cid='.$temp[0]['cid'];
				$temp2=$this->db->getRowsArray($sql,MYSQL_ASSOC);
				$users['users'][$i]['college']=$temp2[0]['cname'];
				$users['users'][$i]['province']=$temp2[0]['pname'];
				$users['users'][$i]['area']=$temp2[0]['aname'];
				
				
			}else if (2==$education){//硕士
				$users['users'][$i]['education']="硕士";
				//查询硕士生表
				$sql='select * from postgraduate where uid='.$user["uid"];
				$temp=$this->db->getRowsArray($sql,MYSQL_ASSOC);
				//获得专业信息
				$sql='select mname from major where mid='.$temp[0]["mid"];
				$users['users'][$i]['major']=$this->db->getFields($sql, 0);
				//获取学校信息
				$sql='select * from collegeinfo where cid='.$temp[0]['cid'];
				$temp2=$this->db->getRowsArray($sql,MYSQL_ASSOC);
				$users['users'][$i]['college']=$temp2[0]['cname'];
				$users['users'][$i]['province']=$temp2[0]['pname'];
				$users['users'][$i]['area']=$temp2[0]['aname'];
				
				
				
			}else if (3==$education){//博士
				$users['users'][$i]['education']="博士";
				//查询博士生表
				$sql='select * from doctoral where uid='.$user["uid"];
				$temp=$this->db->getRowsArray($sql,MYSQL_ASSOC);
				//获得专业信息
				$sql='select mname from major where mid='.$temp[0]["mid"];
				$users['users'][$i]['major']=$this->db->getFields($sql, 0);
				//获取学校信息
				$sql='select * from collegeinfo where cid='.$temp[0]['cid'];
				$temp2=$this->db->getRowsArray($sql,MYSQL_ASSOC);
				$users['users'][$i]['college']=$temp2[0]['cname'];
				$users['users'][$i]['province']=$temp2[0]['pname'];
				$users['users'][$i]['area']=$temp2[0]['aname'];
				
			}else{//未知
				$users['users'][$i]['education']="UNKNOWN";
			}
			
			
			
			
		}
		
		return $users;
	}
	
	
}











