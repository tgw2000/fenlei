<?php
    if (!defined('IN_SITE'))die('Access Denied');
    require(ROOT.'/source/include/common.php');
    require(ROOT.'/source/include/info.fun.php');
    
    //12�����¸���ͼ����Ϣ
    $newlistimg = get_info(array('num'=>40,'tpic'=>1,'status'=>1));
    include template("index");
?>