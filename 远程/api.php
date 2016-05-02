<?php
    if (!defined('IN_SITE'))die('Access Denied');
    require(ROOT.'/core/library/response.class.php');
    require(ROOT.'/source/include/common.php');
    require(ROOT.'/source/include/info.fun.php');
	
    switch($act){
		
		case 'category':		//获取分类
			$pid = $_GET['pid'];
            if($pid && !is_numeric($pid)){
                response::show(201,'分类pid参数类型不正确,只接收数字');
            }
            
            if($pid!='') $where='where pid='.$pid;
            $sql = "select cid,title,pinyin,pid from {$table}category $where order by sort asc";
            $rec = $db->getAll($sql,1,24*3600);     //数据缓存１天
            foreach($rec as $row){
                $tem['cid'] = $row['cid'];
                $tem['title'] = $row['title'];
                $tem['pinyin'] = $row['pinyin'];
                $tem['pid'] = $row['pid'];
                $data[] = $tem;
            }
            response::show(200,'sucess',$data);
			break;
		
		case 'info_all':
			
            $sql_count = "SELECT count(*) as count FROM {$table}info AS a LEFT JOIN {$table}category AS b ON a.cid = b.cid WHERE a.status = 1";
            $sql = "SELECT a.*,b.title as catname,b.mid FROM {$table}info AS a LEFT JOIN {$table}category AS b ON a.cid = b.cid";
            $total = $db->getOne($sql_count);
            $perpage = 20;
            $nums = ceil($total/$perpage);
            $page = intval($_GET['page']);
            if($page<1) $page = 1;

            $sql.= " WHERE a.status = 1 ORDER BY a.refreshtime DESC limit ".(($page-1)*$perpage).", $perpage";
            
            $rows =$db->getAll($sql);
            foreach($rows as $row){
                $arr['infoid'] = $row['infoid'];
                $arr['title'] = $row['title'];
                $arr['cid'] = $row['cid'];
                $arr['refreshtime'] = format_time($row['refreshtime'],3);
                $arr['tpic'] = $row['tpic'];
                
                //处理每条信息中的扩展字段
                $ext_arr = get_extInfo($row['infoid'],$row['mid']);
                $temp[] = array_merge($arr,$ext_arr);
            }
            $data['totalpage'] = $nums;
            $data['list'] = $temp;
            response::show(200,'sucess',$data);
			break;
			
		case 'view':
			$infoid = intval($_GET['infoid']);   
            $sql = "SELECT a.*,b.pid,b.mid,b.template,b.pinyin,b.title as catname FROM `{$table}info` AS a LEFT JOIN `{$table}category` AS b ON a.cid = b.cid WHERE a.infoid = $infoid limit 1";
            $row = $db->getRow($sql);      //主表中的信息
            if(!$row) response::show(202,'信息内容不存在');
            if($row['status']==3 ) response::show(203,'信息不存在或已被删除');
            if($row['status']==2 ) response::show(204,'信息正在审核中');
			
            $mid = $row['mid'];
            $cid = $row['cid'];
			
			$data = $row;
            if($mid){
                $sql = "select * from {$table}info_$mid where infoid=$infoid limit 1";
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
			
			unset($arr);
			$data['refreshtime'] = format_time($data['refreshtime'],2);
			$arr['extr_field'] = $extr_field;
			$arr['info'] = $data;
            $arr['photos'] = $photos;
			response::show(200,'sucess',$arr);
            break;
			
		case 'login':		//用户登录
		    $user = trim($_POST['user']);
            $pwd = trim($_POST['pwd']);
          
            if($CFG['uc']){        //整合ucenter
                require(ROOT.'/source/include/uc.fun.php');
                uc_login($user,$pwd);
                
            } else {       //没有整合ucenter
                $sql = "select * from {$table}user where username='$user' and userpwd='".md5($pwd)."'";
                $row = $db->getRow($sql);
                if(!$row){
                    Response::show(210,'用户名或密码错误');
                }
                if($row['disabled']){
                    Response::show(207,'此帐号已被管理员禁用');
                }                    
                //更新上次登录时间和ip
                $sql = "UPDATE {$table}user SET lastlogintime=".time().",lastloginip='".get_ip()."' WHERE userid=$row[userid]";
                $db->query($sql);
           
                $_SESSION['userid'] = $row['userid'];       //本地user表用户id
                $_SESSION['user'] = $user;
                Response::show(200,'用户登录成功');
            }
			break;
			
        default:
            response::show('301','未定义的操作类型');
            break;
            
       
            
        
    }
?>