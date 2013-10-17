<?php 

/**

 * 

 * Feedback(留言)

 *

 * @package      	YIGECMS_Corp

 *

 * @license         http://www.YIGECMS.cn/license.txt

 * @version        	$Id: FeedbackModel.class.php v1.0 2012-01-01 06:59:03 



 */

 

import("AdvModel");

class FeedbackModel extends AdvModel 

{

    protected $_validate = array(

        array('title', 'require', '留言主题必填', 0, '', Model:: MODEL_BOTH),

        array('content', 'require', '留言内容必填', 0, '', Model:: MODEL_BOTH),

    );

}