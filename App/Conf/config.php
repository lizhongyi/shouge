<?php
if (!defined('YIGECMS')) die('not in YIGECMS');
$database = require ('./config.inc.php');
$config = array();
return array_merge($database, $config);