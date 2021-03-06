<?php
define('IN_SITE', true);
define('ROOT', str_replace("\\", '/', dirname(__FILE__).'/'));  //定义网站根目录

require ROOT. 'core/main.php';

$uri = load_class('uri');         //加载uri类
$rtr = load_class('router');         //加载路由类
$rtr->_set_routing();

$dir = $rtr->fetch_directory();        //目录
$mod  = $rtr->fetch_class();         //类、模块
$act = $rtr->fetch_method();         //方法、过程

if($CFG['closesystem']) showmsg($CFG['close_tips']);      //关闭系统时可以进入后台
/**
 * 参数数组params
 * 如果没有设置路由，访问index.php/news/show/1/2,则$params=array(1,2)
 * 如果设置了路由为'news/view-(:num)-(:num)' => "news/show/$1/$2", 访问index.php/news/view-1-2时，则$params=array(1,2)
 */
$params = array_slice($uri->rsegments, 2);
include(ROOT.'source/'.$dir.$mod.'.php');
?>