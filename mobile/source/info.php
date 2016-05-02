<?php
    if (!defined('IN_SITE'))die('Access Denied');
    require(ROOT.'/source/include/common.php');
    require(ROOT.'/source/include/info.fun.php');
    
    switch($act){
        case 'list':        //信息列表页
            $pinyin = trim($params[0]);
            $sql = "select cid from {$table}category where pinyin='$pinyin'";
            $row = $db->getRow($sql); 
            if(!$row) redirect($config['base_url']);        
            $cid = $row['cid'];               
            $category = get_category();     //所有分类
            $current_cat = $category[$cid];     //当前分类
            $children = $current_cat['children'];
            $parent = $current_cat['parent'];
            $pid = $current_cat['pid'];
            $cids = $current_cat['cids'];        //当前分类的所有子类id
            
            if(!$pid){      //是一级分类时
                include template('list_bclass');
                exit();
            } else {
                $search = get_search($cid);             
                foreach($search as $row){
                    $type = $row['search_type'];
                    $fields[] = $row['field'];
                }
                if($parent[1]){     //第二级父类
                    $children = $category[$pid]['children'];
                    $second_cat = $parent[1];
                } else {
                    $second_cat = $current_cat;
                }     
            }
            
            $cids = $cids ? $cid.','.$cids : $cid;
            $cid_limit = " AND a.cid IN ($cids)";       //类别限制
            $keyword = stripslashes($_REQUEST['keyword']);
            if($keyword) $kw_limit.=" AND a.title like '%$keyword%'";       //关键字限制

            $id_limit = get_limitID($cid,$fields);
            $id_limit = ($id_limit!='') ? " AND a.infoid IN(".$id_limit.")" :"";    //infoid限制
            $limit = $cid_limit.$id_limit.$kw_limit;
            $order = " ORDER BY refreshtime DESC";
            $sql_count = "SELECT count(*) as count FROM {$table}info AS a LEFT JOIN {$table}category AS b ON a.cid = b.cid WHERE a.status = 1 $limit";
            $sql = "SELECT a.*,b.title as catname,b.mid FROM {$table}info AS a LEFT JOIN {$table}category AS b ON a.cid = b.cid";
            $total = $db->getOne($sql_count,1,600);
            $perpage = 20;
            $nums = ceil($total/$perpage);
            $page = intval($_GET['page']);
            if($page<1) $page = 1;

            $sql.= " WHERE a.status = 1 $limit $order limit ".(($page-1)*$perpage).", $perpage";
            
            $rows =$db->getAll($sql,1,600);
            foreach($rows as $row){
                $arr['infoid'] = $row['infoid'];
                $arr['title'] = $row['title'];
                $arr['cid'] = $row['cid'];
                $arr['refreshtime'] = format_time($row['refreshtime'],3);
                $arr['tpic'] = $row['tpic'];
                
                //处理每条信息中的扩展字段
                $ext_arr = get_extInfo($row['infoid'],$row['mid']);
                $info[] = array_merge($arr,$ext_arr);
            }
            $tpl = ($page==1 ) ? 'list_sclass' : 'list_data';
            include template($tpl);
            break;
            
        case 'show':
            $infoid = intval($params[0]);
            $success = intval($_GET['success']);      //为1是显示发布/修改成功提示           
            $sql = "SELECT a.*,b.pid,b.mid,b.template,b.pinyin,b.title as catname,c.uid FROM `{$table}info` AS a LEFT JOIN `{$table}category` AS b ON a.cid = b.cid LEFT JOIN `{$table}user` AS c ON a.userid = c.userid WHERE a.infoid = $infoid";
            $data = $db->getRow($sql);      //主表中的信息
            if(!$data) redirect($config['base_url']); 
               
            if($data['status']==3 ) showmsg("你访问的信息不存在或已被删除！",1);
            if($data['status']==2 )  showmsg("此信息正在审核中，暂时无法访问！",1);
            $mid = $data['mid'];
            $cid = $data['cid'];
            if($mid){
                $sql = "select * from {$table}info_$mid where infoid=$infoid";
                $extr = $db->getRow($sql);     //护展表中的信息
                $model = get_model($mid);
                foreach($model as $row){
                    $field = $row['field'];
                    $field_type = $row['field_type'];
                    $title = $row['title'];
                    $available = $row['available'];
                    if(!$available) continue;   //如果是不可用字段则终止当前，执行下一循环
                    
                    $arr['field'] = $field;     
                    $arr['title'] = $title;
                    $extr_field[] = $arr;   //扩展字段
                    $type = $row['input_type'];
                    
                    if(($type == 'radio' || $type == 'select')&&$extr[$field]!=''){	//处理信息中radio 和 select的值
                        if($row['variable']){       //选项为动态变量
                            $choices = $row['choices'][$cid];
                        } else {
                            $choices = $row['choices'];
                        }
                        foreach($choices as $k=>$v){
                            if($extr[$field]==$k) $data[$field] = $v;
                        }
                    }
                    if(($type == 'checkbox')&&$extr[$field]!=''){	//处理信息中checkbox的值
                        if($row['variable']){       //选项为动态变量
                            $choices = $row['choices'][$cid];
                        } else {
                            $choices = $row['choices'];
                        }
                        $tem = explode(',',$extr[$field]);
                        $str = '';
                        foreach($choices as $k=>$v){
                            if(in_array($k,$tem)) $str.=$v.'、';
                        }
                        $str = substr($str,0,strlen($str)-3);//去掉最后一个、号
                        $data[$field] = $str;
                    }
                    if(($type == 'text' || $type == 'textarea')&&$extr[$field]!=''){	//处理信息中text、textarea的值
                        $units = $row['units'];
                        if (in_array($units,array('元','万元','元/月'))){
                            $val = "<font color=#fc6d3b>".$extr[$field].$units."</font>";
                        } else {
                            $val = $extr[$field].$units;
                        }
                        
                        $tem = array("0元","0万元","0元/月");
                        if (in_array($val,$tem)){
        					$data[$field] = "<font color=#fc6d3b>面议</font>";
        				}else {
        					$data[$field] = ($extr[$field]) ? $val : '';
        				}
                    }
                }
            }
            
            //处理信息中的图片
            $sql = "select path from {$table}info_photos where infoid=$infoid order by sort asc";
            $photos = $db->getAll($sql);
           
            //最新的五条信息
            $info = get_info(array('cid'=>$cid,'num'=>5,'status'=>1));
            $sql = "update {$table}info set hits=hits+1 where infoid=$infoid";
            $db->query($sql);
            include template('view');
            break;
            
        case 'showpic':
            $infoid = intval($params[0]);
            $sql = "select path from {$table}info_photos where infoid=$infoid order by sort asc";
            $photos = $db->getAll($sql);
            if(!$photos) redirect($config['base_url']);
            include template('viewpic');
            break;
            
        default:
            redirect($config['base_url']);
            break;
    }
?>