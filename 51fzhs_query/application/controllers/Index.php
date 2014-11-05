<?php
/**
 * @name IndexController
 * @author gejing-pc\gejing
 * @desc 默认控制器
 * @see http://www.php.net/manual/en/class.yaf-controller-abstract.php
 */
class IndexController extends Yaf_Controller_Abstract {

	/** 
     * 默认动作
     * Yaf支持直接把Yaf_Request_Abstract::getParam()得到的同名参数作为Action的形参
     * 对于如下的例子, 当访问http://yourhost/Sample/index/index/index/name/gejing-pc\gejing 的时候, 你就会发现不同
     */
	public function indexAction($name = "Stranger") {
		//1. fetch query
		$get = $this->getRequest()->getQuery("get", "default value");

		//2. fetch model
		$model = new SampleModel();

		//3. assign
		$this->getView()->assign("content", $model->selectSample());
		$this->getView()->assign("name", $name);

		//4. render by Yaf, 如果这里返回FALSE, Yaf将不会调用自动视图引擎Render模板
        return TRUE;
	}
	
	/**
	 * 获取所有的用户信息
	 */
	public function getAllUserInfoAction(){
		//实例化model对象
		$model=new IndexModel();
		//调用model查询方法
		$users=$model->getAllUserInfo();
		//返回json数据
		echo  json_encode($users);
		//yaf将不会调用自动视图引擎
		return FALSE;
	}
	
	
	
}
