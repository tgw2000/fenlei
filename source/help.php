<?php
    if (!defined('IN_SITE'))die('Access Denied');
    require(ROOT.'/source/include/common.php');
    require(ROOT.'/source/include/info.fun.php');
    switch($act){
        default:
            $sql = "select * from {$table}article_type order by sort asc,tid asc";
            $type = $db->getAll($sql);
            include template("help/index");
            break;
        
        case 'show':        //АяжњжааФ
            $tid = intval($params[0]);
            $type = $db->getOne("select type from {$table}article_type where tid=$tid");
            $sql = "select * from {$table}article where tid=$tid order by sort asc,id desc";
            $info = $db->getAll($sql);
            include template("help/show");
            break;
    }
?>