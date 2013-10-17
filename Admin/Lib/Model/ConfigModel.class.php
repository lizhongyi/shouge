<?php 

/**

 * 

 * Config(系统配置)

 *

 * @package      	YIGECMS_Corp

 *

 * @license         http://www.YIGECMS.cn/license.txt

 * @version        	$Id: ConfigModel.class.php v1.0 2012-01-01 06:59:03 



 */



import("AdvModel");

class ConfigModel extends AdvModel

{

	protected $_validate = array(

		array('site_name', 'require', '网站名称必须填写', 0, '', Model:: MODEL_BOTH),

		array('run_system', 'require', '运行平台(下载)必须填写', 0, '', Model:: MODEL_BOTH),

		array('global_attach_size', 'require', '允许附件大小必须填写', 0, '', Model:: MODEL_BOTH),

		array('global_attach_suffix', 'require', '允许附件类型必须填写', 0, '', Model:: MODEL_BOTH),

		array('content', 'require', '内容必须', 0, '', Model:: MODEL_BOTH),

	);

	protected $_auto = array(

		array('title', 'dHtml', Model:: MODEL_BOTH, 'function'),

	);

}