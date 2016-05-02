<?php
//基本设置
$config = array(
    'charset'   => "utf-8",
    'base_url' => 'http://m.yiiso.cn',
    'index_page' => '',
    'enable_query_strings' => false,
    'uri_protocol' => 'AUTO',
    'url_suffix' => '',
    'permitted_uri_chars' => 'a-z 0-9~%.:_\-'
);

//数据库设置
$datebase = array(
    'dbcharset' => "utf8",
    'host'  => "localhost",
    'name'  => "yiisocn_fenlei",
    'user'  => "yiisocn_tgw2000",
    'pass'  => "tgw750203",
    'table'    => "f_"
);

//发送邮件设置
$mail = array(
    'protocol'  => 'smtp',
    'smtp_host' => 'mail.yiiso.cn',
    'smtp_user' => "admin@yiiso.cn",
    'smtp_pass' => "tgw750203",
    'from'      => 'admin@yiiso.cn',
    'smtp_port' => "587",
    'charset'   => 'utf-8', 
    'wordwrap'  => TRUE,  
    'mailtype'  => 'html'
);

//数由设置
$route = array(
    'default_controller' => 'index',
    '404_override' => '',
    'list/(:any)' => "info/list/$1",
    'view/(:num).html' => "info/show/$1",
    'viewpic/(:num)' => "info/showpic/$1"
);
?>