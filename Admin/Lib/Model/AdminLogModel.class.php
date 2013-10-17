<?php 

/**

 * 

 * AdminLog(系统日志)

 *

 * @package      	YIGECMS_Corp

 *

 * @license         http://www.YIGECMS.cn/license.txt

 * @version        	$Id: AdminLogModel.class.php v1.0 2012-01-01 06:59:03 



 */



import("AdvModel");

class AdminLogModel extends AdvModel

{

   protected $_auto = array(

		array('create_time', 'time', Model:: MODEL_BOTH, 'function'),

	);

}