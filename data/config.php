<?php
//基本设置
$config = array(
    'charset'   => "utf-8",
    'base_url' => 'http://127.0.0.2',
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
    'name'  => "fenlei",
    'user'  => "root",
    'pass'  => "root",
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
    'select' => "user/select",
    'select/(:num)' => "user/select/$1",
    'fabu' => "user/fabu",
    'fabu/(:num)' => "user/fabu/$1",
    'help/(:num).html' => "help/show/$1",
    'user/(:num)' => "user/record/$1"
);


?>