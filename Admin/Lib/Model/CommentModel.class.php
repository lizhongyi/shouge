<?php 

/**

 * 

 * Comment(评论)

 *

 * @package      	YIGECMS_Corp

 *

 * @license         http://www.YIGECMS.cn/license.txt

 * @version        	$Id: CommentModel.class.php v1.0 2012-01-01 06:59:03 



 */



import("AdvModel");

class CommentModel extends AdvModel 

{

    protected $_validate = array(

	    //array('subject','require','标题必填',0,'','all'),

	    //array('content','require','内容必填',0,'','all'),

    );



    protected $_auto = array(

	    array('create_time', 'time', Model:: MODEL_INSERT, 'function'),

        array('update_time', 'time', Model:: MODEL_UPDATE, 'function'),

    );

}