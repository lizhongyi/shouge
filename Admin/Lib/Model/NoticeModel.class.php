<?php 

/**

 * 

 * Notice(公告)

 *

 * @package      	YIGECMS_Corp

 *

 * @license         http://www.YIGECMS.cn/license.txt

 * @version        	$Id: NoticeModel.class.php v1.0 2012-01-01 06:59:03 



 */

 

import("AdvModel");

class NoticeModel extends AdvModel 

{

    protected $_validate = array(

        array('title', 'require', '标题必填', 0, '', Model:: MODEL_BOTH),

        array('content', 'require', '内容必填', 0,'', Model:: MODEL_BOTH),

    );

    protected $_auto = array(

        array('title', 'dHtml', Model:: MODEL_BOTH, 'function'),        

        array('start_time', 'strtotime', Model:: MODEL_BOTH, 'function'),        

        array('end_time', 'strtotime', Model:: MODEL_BOTH, 'function'),        

        array('create_time', 'time', Model:: MODEL_BOTH, 'function'),        

    );

}