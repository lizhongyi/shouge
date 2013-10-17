<?php 

/**

 * 

 * AdminRole(角色组)

 *

 * @package      	YIGECMS_Corp

 *

 * @license         http://www.YIGECMS.cn/license.txt

 * @version        	$Id: AdminRoleModel.class.php v1.0 2012-01-01 06:59:03 



 */



import("AdvModel");

class AdminRoleModel extends AdvModel

{

	protected $_validate = array(

		array('role_name', 'require', '角色组名称必填', 0, '', Model:: MODEL_BOTH),

	);

	protected $_auto = array(

		array('create_time', 'time', Model:: MODEL_INSERT, 'function'),

		array('update_time', 'time', Model:: MODEL_UPDATE, 'function'),

	);

}