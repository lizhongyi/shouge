<?php 

/**

 * 

 * Page(单页)

 *

 * @package      	YIGECMS_Corp

 *

 * @license         http://www.YIGECMS.cn/license.txt

 * @version        	$Id: PageModel.class.php v1.0 2012-01-01 06:59:03 



 */



import("AdvModel");

class PageModel extends AdvModel

{

    protected $_validate = array(

        array('title', 'require', '标题必须填写', self::MODEL_BOTH),

        array('link_label', 'require', '链接标识必须填写', self::MODEL_BOTH),

        array('link_label', '', '标识必须唯一，请更换其它名称！', 0, 'unique', Model:: MODEL_INSERT), // 在新增的时候验证link_label字段是否唯一

        array('content', 'require', '内容必须', Model::MODEL_BOTH),



    );

    protected $_auto = array(

        array('title', 'dHtml', Model::MODEL_BOTH,'function'),

        array('update_time', 'time', Model:: MODEL_UPDATE, 'function'),

        array('create_time', 'time', Model:: MODEL_INSERT, 'function'),

    );

}