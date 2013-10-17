<?php 
/**
*系统首页
*/
header("Content-type: text/html; charset=UTF-8");
if (!file_exists('./config.inc.php')) die('config.inc.php 不存在，请正常安装系统');
define('YIGECMS', './App');
define('CMS_DATA', './CmsData/');
define('UPLOAD_PATH', './Uploads/');
define('APP_DEBUG',1);
define('THINK_PATH', './ThinkPHP/');
define('APP_NAME', 'App');
define('APP_PATH', './App/');
require(THINK_PATH."/ThinkPHP.php");
