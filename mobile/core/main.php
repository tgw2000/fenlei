<?php
if (!defined('IN_SITE')) die('Access Denied');

require ROOT . 'data/config.php';
require ROOT . 'core/global.fun.php';

error_reporting(1);
define(DEBUG_MODE,0);    //调试开关
@set_magic_quotes_runtime(0);       //关闭魔术变量
@ini_set('session.auto_start', 0);
set_time_limit(0);     //取消脚本执行时间限制
session_start();
header('Content-type: text/html; charset='.$config['charset']);

if(!get_magic_quotes_gpc()) {   //如果魔术变量关闭
	if (!empty($_GET))$_GET  = addslashes_deep($_GET);
    if (!empty($_POST))$_POST = addslashes_deep($_POST);
    $_COOKIE   = addslashes_deep($_COOKIE);
    $_REQUEST  = addslashes_deep($_REQUEST);
}

if(function_exists('date_default_timezone_set')){
    date_default_timezone_set('Asia/Shanghai');
}

require ROOT . 'core/library/mysql.class.php';
$db = new mysql($datebase['host'], $datebase['user'], $datebase['pass'], $datebase['name'],$datebase['dbcharset'] ,'1');
$table = $datebase['table'];
$CFG = get_config();    //系统配置

define('SITE_PATH', rtrim('/'.$CFG['webdir'], '/').'/');    //网站所在目录
define('TPL', SITE_PATH.'templates/'.$CFG['tplname']);    //网站模板目录
define('UPLOADS', SITE_PATH.$CFG['uploads']);    //上传文件目录
define('DATA', SITE_PATH.'data');    //数据目录
define('SCHEME', $_SERVER['SERVER_PORT'] == '443' ? 'https://' : 'http://');
define('SCRIPT_NAME', isset($_SERVER['SCRIPT_NAME']) ? $_SERVER['SCRIPT_NAME'] : preg_replace("/(.*)\.php(.*)/i", "\\1.php", $_SERVER['PHP_SELF']));
define('QUERY_STRING', safe_replace($_SERVER['QUERY_STRING']));
define('PATH_INFO', isset($_SERVER['PATH_INFO']) ? safe_replace($_SERVER['PATH_INFO']) : '');
define('RELATE_URL', isset($_SERVER['REQUEST_URI']) ? $_SERVER['REQUEST_URI'] : SCRIPT_NAME.(QUERY_STRING ? '?'.QUERY_STRING : PATH_INFO));
define('URL', SCHEME.$_SERVER['HTTP_HOST'].RELATE_URL);

?>