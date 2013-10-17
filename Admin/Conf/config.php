<?php

$database = require ('./config.inc.php');
//后台不受模板影响
$config	= array(
        'DEFAULT_THEME' => 'default',
		'URL_MODEL' => 1,
        'URL_PATHINFO_MODEL' => 1,
        'URL_PATHINFO_DEPR' => '/',
        'URL_HTML_SUFFIX' => '.html',
        'DEFAULT_THEME' => 'default',
);
return array_merge($database, $config);