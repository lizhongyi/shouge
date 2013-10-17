<?php 

/**

 * 

 * Menu(导航)

 *

 * @package      	YIGECMS_Corp

 *

 * @license         http://www.YIGECMS.cn/license.txt

 * @version        	$Id: NavigationModel.class.php v1.0 2012-01-01 06:59:03 



 */



import("AdvModel");

class MenuModel extends AdvModel

{

    protected $_validate = array(

	    array('title', 'require', '名称必须填写', 3),

	    array('link_url', 'require', '链接地址必须填写', 3),

    );

    protected $_auto = array(

	    array('title', 'dHtml', Model:: MODEL_BOTH, 'function'),

	    array('link_url', 'cvHttp', Model:: MODEL_BOTH, 'function'),

	    array('display_order', 'intval', Model:: MODEL_BOTH, 'function'),

	    array('create_time', 'time', Model:: MODEL_INSERT, 'function'),

	    array('update_time', 'time', Model:: MODEL_UPDATE, 'function'),

    );

}