<?php

/**

 * 

 * 单页

 *

 * @package      	YIGECMS_CORP

 *

 * @license         http://www.YIGECMS.cn/license.txt

 * @version        	$Id: PageAction.class.php v1.0 2012-01-01 06:59:03 



 */



class PageAction extends GlobalAction

{

    public $dao;

    function _initialize()

    {

        parent::_initialize();

        $this->dao = M('Page')->order('id desc');

		

	$p_list = $this->dao->select();

	$this->assign('p_list',$p_list);

	

    }

    

    /**

     * 详细信息

     *

     */
	 
	public function guanyuwomen(){
		           
				   
				   $label=$_GET['lei'];
				   
				   $label=explode('/',$label);
				 
				   $label=$label[0];
				   if($label <> ''){
					     
						 $dt=M('Page')->where('link_label="'.$label.'"')->find();
					   
					   }else{
						   
						    $dt=M('Page')->where('link_label="gongsijianjie"')->find();
						   
					   }
					   
					   $this->assign('dt',$dt);
					   $this->display();
		
		
		} 
		
		
		
		public function fuwuxiangmu(){
		           
				   
				   $label=$_GET['label'];
				   
				   $label=explode('/',$label);
				    print_r($label);
				   $label=$label[0];
				   if($label <> ''){
					     
						 $dt=M('Page')->where('link_label="'.$label.'"')->find();
					   
					   }else{
						   
						    $dt=M('Page')->where('link_label="shanghaidaijiaoshebao"')->find();
						   
					   }
					   
					   $this->assign('dt',$dt);
					   $this->display();
		
		
		} 
		
		
	 

    public function index()

    {

		$item = trim($_GET['item']);

        parent::getDetail("link_label='{$item}'");

    }

	

	 public function about()

    {

		$item = trim($_GET['item']);

        parent::getDetail("link_label='{$item}'");

    }

}