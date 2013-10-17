<?php 
/**
 * 
 * 后台管理入口


 */

header("Content-type: text/html; charset=UTF-8");
if (!file_exists('./config.inc.php')) die('config.inc.php 不存在，请正常安装系统');
define('YIGECMS', './App');
define('CMS_DATA', './CmsData/');
define('UPLOAD_PATH', './Uploads/');
define('NO_CACHE_RUNTIME', true);//debug
define('THINK_PATH', './ThinkPHP/');
define('APP_NAME', 'Admin');
define('APP_PATH', './Admin/');
define('APP_DEBUG',TRUE);
require(THINK_PATH."/ThinkPHP.php");
