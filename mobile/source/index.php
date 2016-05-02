<?php
if (!defined('IN_SITE'))die('Access Denied');
require(ROOT.'source/include/common.php');
require(ROOT.'source/include/info.fun.php');

$v =get_category();
foreach($v as $row){
  if(!$row['pid']){
    $tem['title'] = $row['title'];
    $tem['pinyin'] = $row['pinyin'];
    $tem['children'] = $v[$row['cid']]['children'];
    $category[] = $tem;
  }
}

include template("index");
?>