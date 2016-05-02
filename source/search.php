<?php
    if (!defined('IN_SITE'))die('Access Denied');
    require(ROOT.'/source/include/common.php');
    require(ROOT.'/source/include/info.fun.php');
    
    $pinyin = trim($act);
    $sql = "select cid,codes,template from {$table}category where pinyin='$pinyin'";
    $row = $db->getRow($sql); 
    $cid = $row['cid'];   
    $code_ids = $row['codes'];
    
    $keyword = stripslashes($_REQUEST['keyword']);
    $sql = "SELECT COUNT(a.infoid) as count,a.*,b.cid,b.title as type,b.pinyin from {$table}info as a INNER JOIN {$table}category as b on a.cid=b.cid where a.title LIKE '%$keyword%' GROUP BY b.cid ORDER BY b.cid ASC";
    $all_type = $db->getAll($sql);
    $cid = $cid ? $row['cid'] : $all_type[0]['cid'];
    if(!$cid){
         include template('search_none');
         exit();
    }
    $category = get_category();     //所有分类
    $current_cat = $category[$cid];     //当前分类
    
    $cids = $current_cat['cids'];        //当前分类的所有子类id
    $parent = $current_cat['parent'];
    $pid = $current_cat['pid'];

    if($cid) $search = get_search($cid);
    foreach($search as $row){
        $type = $row['search_type'];
        $fields[] = $row['field'];
        if(in_array('label',$type)){       
            $tem['title'] = $row['title'];
            $tem['field'] = $row['field'];
            $tem['choices'] = $row['choices'];
            $search_label[] = $tem;
        }
        if(in_array('nav',$type)){ 
            $tem['title'] = $row['title'];
            $tem['field'] = $row['field'];
            $tem['choices'] = $row['choices'];
            $search_nav[] = $tem;
        }
    }

    if($pid){      //不是一级分类时
        $first_cat = $parent[0];        
        $nav = "<a href='".site_url()."'>济宁分类信息</a> &gt <a href='".site_url($first_cat['pinyin'].'/')."'>".$first_cat['title']."</a> &gt ";
        if($parent[1]){     //第二级父类
            $second_cat = $parent[1];
            $nav.= "<a href='".site_url($second_cat['pinyin'].'/')."'>".$second_cat['title']."</a>";
        } else {
            $second_cat = $current_cat;
            $nav.="<a href='".site_url($second_cat['pinyin'].'/')."'>".$second_cat['title']."</a>";
        }
    }else {
         $first_cat = $current_cat;
         $nav = "<a href='".site_url()."'>济宁分类信息</a> &gt <a href='".site_url($first_cat['pinyin'].'/')."'>".$first_cat['title']."</a>";
    }

    $cids = $cids ? $cid.','.$cids : $cid;
    $cid_limit = " AND a.cid IN ($cids)";       //类别限制
    $id_limit = get_limitID($cid,$fields);
    $id_limit = ($id_limit!='') ? " AND a.infoid IN(".$id_limit.")" :"";    //infoid限制
    if($keyword) $kw_limit.=" AND a.title like '%$keyword%'";       //关键字限制
    $limit = $cid_limit.$id_limit.$kw_limit;
    $order = " ORDER BY refreshtime DESC";
    
    $sql_count = "SELECT count(*) as count FROM {$table}info AS a LEFT JOIN {$table}category AS b ON a.cid = b.cid WHERE a.status = 1 $limit";
    $sql = "SELECT a.*,b.title as catname,b.mid FROM {$table}info AS a LEFT JOIN {$table}category AS b ON a.cid = b.cid"; 
    $total = $db->getOne($sql_count);
    $perpage = 40;
    $nums = ceil($total/$perpage);
    $page = intval($_GET['page']);
    if($page>$nums) $page =$nums;
    if($page<1) $page = 1;

    $sql.= " WHERE a.status = 1 $limit $order limit ".(($page-1)*$perpage).", $perpage";
    $rows = $db->getAll($sql);
    foreach($rows as $row){
        $arr['infoid'] = $row['infoid'];
        $arr['title'] = $row['title'];
        $arr['cid'] = $row['cid'];
        $arr['refreshtime'] = format_time($row['refreshtime']);
        if($category[$row['cid']]['parent'][1]){    //第二层父类
            $arr['catname'] = $category[$row['cid']]['parent'][1]['title'];
            $arr['pinyin'] = $category[$row['cid']]['parent'][1]['pinyin'];
        } else {
            $arr['catname'] = $category[$row['cid']]['title'];
            $arr['pinyin'] = $category[$row['cid']]['pinyin'];
        }
        //处理信息中的标题图片
        $photo = $row['tpic'];
        if($photo){
            $arr['tpic'] = $photo;
        } else {
            $arr['tpic']= TPL.'/images/none.jpg';
        }
        //处理每条信息中的扩展字段
        $ext_arr = get_extInfo($row['infoid'],$row['mid']);
        $info[] = array_merge($arr,$ext_arr);
    }
    $urlrule = $_SERVER["QUERY_STRING"];
    $urlrule.="&keyword=".$keyword;
    $pages = pages($page, $total, $perpage, 20,trim($urlrule,'&'),false);  //分页导航
    
    if($code_ids){      //自定义的代码段
        $sql = "select * from {$table}codes where id in($code_ids)";
        $codes = $db->getAll($sql);
        foreach($codes as $row){
            $flag = $row['flag'];
            $code = $row['code'];
            $$flag = get_codes($cid,$flag,$code);
        }
   }
    include template('search');
?>