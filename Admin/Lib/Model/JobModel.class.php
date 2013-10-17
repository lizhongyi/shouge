<?php 

/**

 * 

 * Job(人才)

 *

 * @package      	YIGECMS_Corp

 *

 * @license         http://www.YIGECMS.cn/license.txt

 * @version        	$Id: JobModel.class.php v1.0 2012-01-01 06:59:03 



 */



import("AdvModel");

class JobModel extends AdvModel

{

    protected $_validate = array(

        array('title', 'require', '招聘产品必填', 0, '', Model:: MODEL_BOTH),

        array('content', 'require', '详细要求必填', 0, '', Model:: MODEL_BOTH),

    );



    protected $_auto = array(

        array('title', 'dHtml', Model:: MODEL_BOTH, 'function'),

        array('link_url', 'cvHttp', Model:: MODEL_BOTH, 'function'),

        array('tags', 'formatTags', Model:: MODEL_BOTH, 'function'),

        array('create_time', 'strtotime', Model:: MODEL_BOTH, 'function'),

        array('end_time', 'strtotime', Model:: MODEL_BOTH, 'function'),

		array('update_time', 'time', Model:: MODEL_UPDATE, 'function'),

    );

}