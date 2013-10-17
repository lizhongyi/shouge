<?php
/** 
* config.inc.php
*
* @package      	YIGECMS_Corp
* @author    
* @copyright  Copyright (c) 2008-2010  (http://www.YIGECMS.cn)
* @license    http://www.YIGECMS.cn/license.txt
*/

if (!defined('YIGECMS')) exit();

return array(
    'DB_TYPE' => 'mysql',
    'DB_HOST' => 'localhost',
    'DB_NAME' => 'shouge',
    'DB_USER' => 'root',
    'DB_PWD' => 'lizhongyi-009',
    'DB_PORT' => 3306,
    'DB_PREFIX' => 'yge_',
    'ADMIN_ACCESS' => 'ea095f3433b5a17ec554ae680ddfdf29',
    'URL_ROUTER_ON' => false,
    'URL_DISPATCH_ON' => true,
    'URL_MODEL' => 2,//1.带有index.php  2 不带有 index.php
    'Lang_SWITCH_NO' => true,
    'URL_PATHINFO_MODEL' => 1,
    'URL_PATHINFO_DEPR' => '/',
    'URL_HTML_SUFFIX' =>'',
    'DEFAULT_THEME' => 'default',
    'TOKEN_ON' => false,
    'TOKEN_NAME' => '__hash__',
    'TOKEN_TYPE' => 'md5',
    'APP_AUTOLOAD_PATH' => 'ORG.Util',
    'SHOW_PAGE_TRACE' =>false,
    'HTML_MODULE'=>array('Article','Product'),//生成静态的模块
    'APP_DEBUG' => true,
    'TMPL_CACHE_ON' => true,
    'TMPL_CACHE_TIME' => '',
	//'TAGLIB_PRE_LOAD' => 'Ygecms', //加载标签库
                 // Cookie路径
    'COOKIE_PREFIX'=>'THINK_',   // Cookie前缀 避免冲突

);
?>