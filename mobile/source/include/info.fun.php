<?php
if(!defined('IN_SITE')) die('Access Denied');

function get_category(){
    $info = read_cache('category');
    $file = ROOT.'data/cache/php/category.cache.php';
    if(!is_array($info) || filemtime($file)+3600<time()){
        global $db,$table;
        $sql = "SELECT * FROM `{$table}category` order by sort asc,cid asc";
        $rows = $db->getAll($sql);
        foreach($rows as $row){
            $arr['cid'] = $row['cid'];
            $arr['cids'] = get_cids($row['cid']);   //分类下所有子类id(包含子类中的子类)
            $arr['pinyin'] = $row['pinyin'];
            $arr['title'] = $row['title'];
            $arr['pid'] = $row['pid'];
            $arr['mid'] = $row['mid'];
            $arr['color'] = $row['color'];
            $arr['icon'] = $row['icon'];
            $arr['children'] = get_children($row['cid']); //获取分类下的子类
            $v = get_parent($row['cid']);
            if(is_array($v)){
                $arr['parent'] = array_reverse($v);        //数组反序
            } else {
                $arr['parent'] = $v;
            }
            $cache[$row['cid']] = $arr;
        }
        write_cache('category',$cache);
        $info = $cache;
    }
    return $info;
}

//递归获取小类的所有父类
function get_parent($cid){
	global $db,$table;    
	$sql="select * from `{$table}category` where cid=".$cid;
    $row=$db->getRow($sql);
    $pid=$row['pid'];
    if($pid==0){
        return $pid;
    }else{
        $arr['cid'] = $row['pid'];
        $row1 = $db->getRow("select title,pinyin from `{$table}category` where cid=".$row['pid']);
        $arr['pinyin'] = $row1['pinyin'];
        $arr['title'] = $row1['title'];
        $new_arr[] = $arr;
        $tem = get_parent($pid);
        if(is_array($tem)) $new_arr = array_merge($new_arr, $tem);  //合并数组
        return $new_arr;
    }
}

//获取分类下的子类
function get_children($cid){
    global $db,$table;    
	$sql = "SELECT cid,pinyin,title,color,icon FROM `{$table}category` WHERE pid = $cid order by sort asc,cid asc";
    $rows = $db->getAll($sql);
    if($rows){
        foreach($rows as $row){
            $tem['cid']= $row['cid'];
            $tem['title']= $row['title'];
            $tem['pinyin']= $row['pinyin'];
            $tem['color'] = $row['color'];
            $tem['icon'] = $row['icon'];
            $arr[] = $tem;
        }
        return $arr;
    } else {
        return 0;
    }
}

//递归获取大类中的所有小类id
function get_cids($cid){
	global $db,$table;    
	if($row = $db->getAll("SELECT cid FROM `{$table}category` WHERE pid = $cid")){
	   foreach ($row as $k => $v){
	        $str.= $v['cid'].',';
            $tem = get_cids($v['cid']);
            if($tem && $tem!=$v['cid'])$str.= $tem.',';
	   }
        $str = substr($str,0,strlen($str)-1);
        return $str;
	}else{
		return 0;
	}
}

//反序列化
function utf8_unserialize ($serial_str) { 
	$out = preg_replace('!s:(\d+):"(.*?)";!se', "'s:'.strlen('$2').':\"$2\";'", $serial_str ); 
	return unserialize ($out); 
}

//把radio、checkbox、select的值转成数组
function str2arr($str){
	$tem = explode("\r\n",$str);
	$arr = array();
	foreach($tem as $t) { 
		$t = explode('=', $t);
		if(!isset($arr[$t[0]])){
 			$arr[$t[0]] = $t[1];
		}
	}
    return $arr;
}

//获取选项值
function get_choices($fid,$cid=0){
    global $db,$table;
    $sql = "select cid,options from {$table}options where fid=$fid";
    if($cid) $sql.=" and cid=$cid";
    $rows = $db->getAll($sql);
    foreach($rows as $row){
        $cid = $row['cid'];
        $arr[$cid] = str2arr($row['options']);
    }
    return $arr;
}


//根据模型id获取模型
function get_model($mid){
    $file = 'model_'.$mid;
    $path = ROOT.'data/cache/php/'.$file.'.cache.php';
    $info = read_cache($file);
    if(!is_array($info)|| filemtime($path)+3600<time()){
   	    global $db,$table;
        $sql = "select fields from {$table}models where mid=$mid";
        $fields = $db->getOne($sql);
        $sql = "select * from {$table}fields where fid in($fields) order by sort asc";
        $rows = $db->getAll($sql);
        foreach($rows as $row){
            $tem=array();
            $tem['title']= $row['title'];
            $tem['field']= $row['field'];
            $tem['field_type']= $row['field_type'];
            $tem['input_type']= $row['input_type'];
            $v= $row['rules'];
            $rules = utf8_unserialize($v);
            foreach($rules as $k=>$row1){
                if($k=='variable' && $row1==1){      //选项内容是动态值
                    $tem['choices'] = get_choices($row['fid']);
                    $tem['variable'] = 1;
                }elseif($k=='choices'){       //是radio\checkbox\select的值
                    $tem[$k] = str2arr($row1);
                } else {
                    $tem[$k] = $row1;
                }
            }
            $tem['available']= $row['available'];
            $tem['required']= $row['required'];
            $tem['search']= $row['search'];
            $s_type = $row['search_type'];
            $tem['search_type']= $s_type ? explode(',',$s_type) : '';
            $cache[] = $tem;
        }
        write_cache($file,$cache);
        $info = $cache;
    }
    return $info;
}

//根据分类id获取modid,返回模型id数组
function get_modID($cid){
	global $db,$table;
	$modID= array();
	$cids = get_cids($cid);
    $cids = $cids ? $cid.','.$cids : $cid;
	if($cids){
		$catArr = explode(',',$cids);
		foreach($catArr as $k => $row){
			$modID = $db -> getOne("select mid from `{$table}category` where cid='$row'");
			if($modID) $tem[] = $modID;
		}
		$modID=array_unique($tem);	//去除数组中重复的元素
	}else{
		$modID = $db->getOne("select mid from `{$table}category` where cid = '$cid'");
        if($modID) $modID[] = $modID;
	}
 return $modID;
}

/**
 * 作用判断字段field是表$table中是否存在
 * 若存在则返回1，不存在则返回0
 * 如果$field为空，则返回表$table的所有字段
 */
function table_field($table,$field=''){
	global $db;
    if($field) $field = strtolower($field);     //转成小写
	$query=$db->query(" SELECT * FROM $table limit 1");
	$num=mysql_num_fields($query);
	for($i=0;$i<$num;$i++){
		$f_db = mysql_fetch_field($query,$i);
		$showdb[] = strtolower($f_db->name);  //转成小写
	}
	if($field){
		if(in_array($field,$showdb) ){
			return 1;
		}else{
			return 0;
		}
	}else{
		return $showdb;
	}
}

//在扩展表中查询符合条件的记录
function get_limitID($cid,$fields){
	global $db,$table;
    if(is_array($fields)){
    	foreach($fields as $field){
            $$field = $_REQUEST[$field];        //接收地址栏或表单传递的数据
            if($$field){
          		if(strstr($$field,'_')){       //范围搜索
        			$arr = explode('_',$$field);
        			$min =$arr[0]; $max = $arr[1];
        			if($max){
        				$where.=" AND $field >= $min AND $field <= $max ";
        			}else{
        				$where.=" AND $field >= $min ";
        			}
        		}else{
        			$where.=" AND $field=".$$field;
        		} 
            }
    	}
    }

	$where = substr($where,4);     //去除第一个AND
	if(!$where) return;
	$where = "WHERE".$where;
	$modArr=get_modID($cid);
	foreach($modArr as $key => $mid){
	   if(!$mid) continue;
    		$tem1=0;$tem2=0;
    		foreach($fields as $field){
    			if(table_field("{$table}info_$mid",$field)) $tem1=0; else $tem2=1;
    		}
    		if($tem1==0 && $tem2==0){
    			$rs = $db -> getAll("SELECT infoid FROM `{$table}info_$mid` $where");
    			if (is_array($rs)){
    				foreach($rs as $k => $v) $id_limit .= ','.$v['infoid'];
    			}
    		}
        
	}
	$id_limit = ($id_limit!='')?substr($id_limit,1):'0';
	return $id_limit;
}

//获取搜索字段
function get_search($cid){
    $arr = get_modID($cid);
    $mids = implode(',',$arr);
    global $db,$table; 
    foreach($arr as $mid){
        $sql = "select fields from {$table}models where mid=$mid";
        $fid= $db->getOne($sql);
        $fids.=$fid.',';
    }
    $fids = substr($fids,0,str_len($fids)-1);
    $fid_arr=array_unique(explode(',',$fids));
    $fids = implode(',',$fid_arr);
    //标签搜索
    if($fids){
        $sql = "select fid,title,field,rules,search_type from {$table}fields where search='on' and fid IN($fids) order by sort asc";
        $rows = $db->getAll($sql);
        foreach($rows as $row){
            $tem['title'] = $row['title'];
            $tem['field'] = $row['field'];
            $tem['search_type']= $row['search_type'] ? explode(',',$row['search_type']) : '';
            $rules = utf8_unserialize($row['rules']);           
            if($rules['variable']){       //动态选项
                $choices = get_choices($row['fid'],$cid);
                $tem['choices'] = $choices[$cid];
            } else {
                $tem['choices'] = str2arr($rules['choices']);
            }
            $data[$row['field']] = $tem;
        }
    }
    return $data;
}

//时间处理
function format_time($time,$t=1){
    $limit = time() - $time;
    if($limit < 60){
        return $limit . '秒钟之前';
    }elseif($limit >= 60 && $limit < 3600){
        return floor($limit/60) . '分钟之前';
    }elseif($limit >= 3600 && $limit < 86400){
        return floor($limit/3600) . '小时之前';
    }elseif($limit >= 86400){
        if($t==1) return date('Y-m-d h:i',$time);
        if($t==2) return date('Y-m-d', $time);
        if($t==3) return date('m-d', $time);
        if($t==4) return date('h:i', $time);
    }
}

//获取扩展信息
function get_extinfo($infoid,$mid){
    global $db,$table;
    $arr = array();
    if(!$mid) return $arr;
    $fids = $db->getOne("select fields from {$table}models where mid=$mid limit 0,1");
   	$ext_field = $db-> getAll("SELECT fid,title,field,field_type,input_type,rules FROM {$table}fields WHERE fid IN($fids) order by sort asc");
    $ext_info = $db-> getRow("select * from {$table}info_{$mid} where infoid=$infoid limit 0,1");
    foreach($ext_field as $row1){
        $field = $row1['field'];
        $field_type = $row1['field_type'];
        $title = $row1['title'];
        $type = $row1['input_type'];
        $rules = utf8_unserialize($row1['rules']);
        
        if($rules['variable']){       //动态选项
            $choices = get_choices($row1['fid'],$row['cid']);
        } else {
            $choices = str2arr($rules['choices']);
        }
        
        if(($type == 'radio' || $type == 'select')&&$ext_info[$field]!=''){	//处理信息中radio 和 select的值
            foreach($choices as $k=>$v){
                if($ext_info[$field]==$k) $arr[$field] = $v;
            }
        }
        if(($type == 'checkbox')&&$ext_info[$field]!=''){	//处理信息中checkbox的值
            $tem = explode(',',$ext_info[$field]);
            $str = '';
            foreach($choices as $k=>$v){
                if(in_array($k,$tem)) $str.=$v.'、';
            }
            $str = substr($str,0,strlen($str)-3);//去掉最后一个、号
            $arr[$field] = $str;
        }
        if(($type == 'text' || $type == 'textarea')&&$ext_info[$field]!=''){	//处理信息中text、textarea的值
            $units = $rules['units'];
            $val = $ext_info[$field].$units;
            $tem = array("0元","0万元","0元/月");
            if (in_array($val,$tem)){
				$arr[$field] = "面议";
			}else {
				$arr[$field] = ($ext_info[$field]) ? $val : '';
			}
        }
    }
    return $arr;
}

//获取信息
function get_info($params=array(),$flag=1,$ttl=600){
    if(!$params) return;
    extract($params);
    
    global $db,$table,$category;
    if($order){
        $order = " order by a.$order desc";
    } else {
        $order = ' order by a.refreshtime desc';
    }
    $where = " where 1=1";
    if($status) $where .= " AND a.status IN ($status)";
    if($cid) $where .= " AND a.cid IN ($cid)";
    if($tpic==1) $where.= " and a.tpic!=''";
    if(!$category) $category = get_category();     //所有分类)
    
    $sql = "SELECT a.*,b.title as catname,b.mid from {$table}info as a inner join {$table}category as b on a.cid=b.cid $where $order limit 0,$num";
	
    $rows = $db->getAll($sql,$flag,$ttl);
	
    if(is_array($rows)){
        foreach($rows as $row){
           $arr['infoid'] = $row['infoid'];
           $arr['title'] = $row['title'];
           $arr['cid'] = $row['cid'];
		   $arr['imgcount'] = $row['imgcount'];
           $arr['refreshtime'] = format_time($row['refreshtime'],3);
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
    }
    return $info;
}

//获取ip地址
function get_ip(){
	if(!empty($_SERVER["HTTP_CLIENT_IP"])){
		$cip = $_SERVER["HTTP_CLIENT_IP"];
	}elseif(!empty($_SERVER["HTTP_X_FORWARDED_FOR"])){
		$cip = $_SERVER["HTTP_X_FORWARDED_FOR"];
	}elseif(!empty($_SERVER["REMOTE_ADDR"])){
		$cip = $_SERVER["REMOTE_ADDR"];
	}else{
		$cip = '';
	}
	preg_match("/[\d\.]{7,15}/", $cip, $cips);
	$cip = isset($cips[0]) ? $cips[0] : 'unknown';
	unset($cips);
	return $cip;
}

//发邮件
function send_email($tomail,$subject,$message){
    global $mail;
    require(ROOT.'/core/library/email.class.php');
    //以下设置Email参数    
    $obj = new email($mail);           //实例化email类              
    //以下设置Email内容  
    $obj->from($mail['from'], '易搜网');  
    $obj->to($tomail);  
    $obj->subject($subject);  
    $obj->message($message); 
    //$obj->attach('application\controllers\1.jpeg');       //相对于index.php的路径  
    if($obj->send())return true;
    return false;   
}
?>