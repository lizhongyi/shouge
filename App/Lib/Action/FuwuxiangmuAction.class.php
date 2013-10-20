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



class FuwuxiangmuAction extends GlobalAction

{

    public $dao;

    function _initialize()

    {

        parent::_initialize();

       $this->assign('moduleTitle', '服务项目');
	

    }

    

    /**

     * 详细信息

     *

     */

    public function index(){
	    
		 $info= $_GET['info'];
		 
		 if($info=="") $info ="wangzhanjianshe";
		 $list=M('Page')->field('id,link_label,title')->where('category_id=124')->order('id desc')->select();
		 
		 
		 
	     $detail=M('Page')->where('link_label="'.$info.'"')->find();
		 
	   
	   $this->assign('list',$list);
	   $this->assign('detail',$detail);
	   
	   $this->assign('moduleTitle', '服务项目');
	   $this->display();
	   }
	

	
}