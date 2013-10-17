<?php 

/**

 * 

 * Feedback(留言)

 *

 * @package      	YIGECMS

 *

 * @license         http://www.YIGECMS.cn/license.txt

 * @version        	$Id: NewsModel.class.php v1.0 2012-01-01 06:59:03 



 */

 

import("AdvModel");

class FeedbackModel extends AdvModel

{

    protected $_validate = array(

        array('title', 'require', '标题必填', 0, '', Model:: MODEL_BOTH),

        array('username', 'require', '姓名必填', 0, '', Model:: MODEL_BOTH),

        array('content', 'require', '留言内容必填', 0, '', Model:: MODEL_BOTH),

    );



    protected $_auto = array(

        array('title', 'dHtml', Model:: MODEL_BOTH, 'function'),

        array('email', 'dHtml', Model:: MODEL_BOTH, 'function'),

        array('web_url', 'cvHttp', Model:: MODEL_BOTH, 'function'),

        array('ip', 'get_client_ip', Model:: MODEL_BOTH, 'function'),

        array('create_time', 'time', Model:: MODEL_BOTH, 'function'),

        array('update_time', 'time', Model:: MODEL_UPDATE, 'function'),

    );

}

?>