<?php 

/**

 * 

 * Ad(广告)

 *

 * @package      	YIGECMS_Corp

 *

 * @license         http://www.YIGECMS.cn/license.txt

 * @version        	$Id: AdModel.class.php v1.0 2012-01-01 06:59:03 



 */



import("AdvModel");

class AdModel extends AdvModel

{

    protected $_validate = array(

        array('title', 'require', '标题必填', 0, '', Model:: MODEL_BOTH),

    );

    protected $_auto = array(

        array('title', 'dHtml', Model:: MODEL_BOTH, 'function'),

        array('create_time', 'time', Model:: MODEL_INSERT, 'function'),

		array('update_time', 'time', Model:: MODEL_UPDATE, 'function'),

    );

}