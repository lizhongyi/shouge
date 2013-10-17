<?php 

/**

 * 分类 Model

 *

 * @package       YIGECMS_Corp

 * @copyright     Copyright (c) 2008-2010  (http://www.YIGECMS.cn)

 * @license       http://www.YIGECMS.cn/license.txt

 * @version       $Id: NavigationAction.class.php v1.0 2012-01-01 06:59:03 

 * @author        

 */



import("AdvModel");

class CategoryModel extends AdvModel

{

    protected $_validate = array(

        array('title', 'require','标题必填',0,'',Model:: MODEL_BOTH),

    );

    protected $_auto = array(

        array('title', 'dHtml', Model:: MODEL_BOTH, 'function'),

        array('create_time', 'time', Model:: MODEL_INSERT, 'function'),

        array('update_time', 'time', Model:: MODEL_UPDATE, 'function'),

    );

}