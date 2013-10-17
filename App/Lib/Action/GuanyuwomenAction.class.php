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



class GuanyuwomenAction extends GlobalAction

{

    public $dao;

    function _initialize()

    {

        parent::_initialize();

     
	    $this->assign('moduleTitle', '关于我们');

    }

    

    /**

     * 详细信息

     *

     */

    public function index()

    {

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

	

	
}