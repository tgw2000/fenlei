<?php
    if (!defined('IN_SITE'))die('Access Denied');
    require(ROOT.'/source/include/common.php');
    require(ROOT.'/source/include/info.fun.php');
    
    switch($act){
        default:        //信息列表页
            $keyword = stripslashes(trim($_REQUEST['keyword']));
            if(!$keyword) die();
            $kw_limit.=" AND a.title like '%$keyword%'";       //关键字限制
            $order = " ORDER BY refreshtime DESC";
            $sql_count = "SELECT count(*) as count FROM {$table}info AS a LEFT JOIN {$table}category AS b ON a.cid = b.cid WHERE a.status = 1 $kw_limit";
            $sql = "SELECT a.infoid,a.cid,a.title,a.refreshtime,a.tpic,b.title as catname,b.mid FROM {$table}info AS a LEFT JOIN {$table}category AS b ON a.cid = b.cid";
            $total = $db->getOne($sql_count,1,600);
            $perpage = 20;
            $nums = ceil($total/$perpage);
            $page = intval($_GET['page']);
            if($page<1) $page = 1;

            $sql.= " WHERE a.status = 1 $kw_limit $order limit ".(($page-1)*$perpage).", $perpage";
           
            $rows =$db->getAll($sql,1,600);
            foreach($rows as $row){
                $arr['infoid'] = $row['infoid'];
                $arr['catname'] = $row['catname'];
                $arr['title'] = $row['title'];
                $arr['cid'] = $row['cid'];
                $arr['refreshtime'] = format_time($row['refreshtime'],3);
                $arr['tpic'] = $row['tpic'];
                
                //处理每条信息中的扩展字段
                $ext_arr = get_extInfo($row['infoid'],$row['mid']);
                $info[] = array_merge($arr,$ext_arr);
            }
            $tpl = ($page==1 ) ? 'search' : 'list_data';
            include template($tpl);
            break;
    }
?>