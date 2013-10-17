<?php 

/**

 * 

 * Resume(简历)

 *

 * @package      	YIGECMS_Corp

 *

 * @license         http://www.YIGECMS.cn/license.txt

 * @version        	$Id: ResumeModel.class.php v1.0 2012-01-01 06:59:03 



 */

 

import("AdvModel");

class ResumeModel extends AdvModel 

{

	protected $_validate = array(

        array('realname', 'require', '姓名必填', 0, '', Model:: MODEL_BOTH),

        array('introduction', 'require', '详细介绍必填', 0, '', Model:: MODEL_BOTH),

    );



    protected $_auto = array(

        array('realname', 'dHtml', Model:: MODEL_BOTH, 'function'),

        array('brithday', 'strtotime', Model:: MODEL_BOTH, 'function'),

        array('degree', 'dHtml', Model:: MODEL_BOTH, 'function'),

        array('school', 'dHtml', Model:: MODEL_BOTH, 'function'),

        array('gradyear', 'dHtml', Model:: MODEL_BOTH, 'function'),

        array('telephone', 'dHtml', Model:: MODEL_BOTH, 'function'),

        array('ip', 'get_client_ip', Model:: MODEL_INSERT, 'function'),

        array('create_time', 'time', Model:: MODEL_INSERT, 'function'),

        array('update_time', 'time', Model:: MODEL_UPDATE, 'function'),

    );

}