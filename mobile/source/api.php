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
            response::show(200,'success',$data);
			break;
		
		case 'info_all':
			$perpage = intval($_GET['perpage']);
			if(!$perpage) Response::show('','分页参数不合法');
			
            $sql_count = "SELECT count(*) as count FROM {$table}info AS a LEFT JOIN {$table}category AS b ON a.cid = b.cid WHERE a.status = 1";
            $sql = "SELECT a.*,b.title as catname,b.mid FROM {$table}info AS a LEFT JOIN {$table}category AS b ON a.cid = b.cid";
            $total = $db->getOne($sql_count);
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
                $arr['imgcount'] = $row['imgcount'];
                //处理每条信息中的扩展字段
                $ext_arr = get_extInfo($row['infoid'],$row['mid']);
                $info[] = array_merge($arr,$ext_arr);
            }
            $data['totalpage'] = $nums;
            $data['list'] = $info;
            response::show(200,'success',$data);
			break;
			
		case 'list':
		 	$cid = intval($_GET['cid']);
			$perpage = intval($_GET['perpage']);
			if(!$cid) Response::show(301,'cid参数不合法');
			if(!$perpage) Response::show(302,'分页参数不合法');
			
            $category = get_category();     //所有分类
            $current_cat = $category[$cid];     //当前分类
            $children = $current_cat['children'];
            $parent = $current_cat['parent'];
            $pid = $current_cat['pid'];
            $cids = $current_cat['cids'];        //当前分类的所有子类id
            

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
            $total = $db->getOne($sql_count);
          
            $nums = ceil($total/$perpage);
            $page = intval($_GET['page']);
            if($page<1) $page = 1;

            $sql.= " WHERE a.status = 1 $limit $order limit ".(($page-1)*$perpage).", $perpage";
            
            $rows =$db->getAll($sql);
            foreach($rows as $row){
                $arr['infoid'] = $row['infoid'];
                $arr['title'] = $row['title'];
                $arr['cid'] = $row['cid'];
                $arr['refreshtime'] = format_time($row['refreshtime'],3);
                $arr['tpic'] = $row['tpic'];
				$arr['imgcount'] = $row['imgcount'];
                
                //处理每条信息中的扩展字段
                $ext_arr = get_extInfo($row['infoid'],$row['mid']);
                $info[] = array_merge($arr,$ext_arr);
            }
            $data['totalpage'] = $nums;
            $data['list'] = $info;
            Response::show(1,'success',$data);
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
            $rows = $db->getAll($sql);
			foreach ($rows as $row) {
				$pho_arr['path'] = 'http://www.yiiso.cn'.str_replace('_100X75','_320X207',$row['path']);
				$photos[] = $pho_arr;
			}
           
            //最新的五条信息
            $latest = get_info(array('cid'=>$cid,'num'=>5,'status'=>1));
            $sql = "update {$table}info set hits=hits+1 where infoid=$infoid";
            $db->query($sql);
			
			unset($arr);
			$data['refreshtime'] = format_time($data['refreshtime'],2);
			$arr['extr_field'] = $extr_field;
			$arr['info'] = $data;
            $arr['photos'] = $photos;
			$arr['latest'] = $latest;
			response::show(200,'success',$arr);
            break;
			
		case 'viewpic':
			$infoid = intval($_GET['infoid']);
			$sql = "select path from {$table}info_photos where infoid=$infoid order by sort asc";
            $rows = $db->getAll($sql);
			foreach ($rows as $row) {
				$pho_arr['path'] = 'http://www.yiiso.cn'.str_replace('_100X75','_B',$row['path']);
				$photos[] = $pho_arr;
			}	
			Response::show(1,'success',$photos);
			break;
				
		//搜索
		case 'search':
			$keyword = stripslashes(trim($_REQUEST['keyword']));
			$perpage = intval($_GET['perpage']);
			
            if(!$keyword) Response::show(401,'搜索关键字不能为空');
			if(!$perpage) Response::show(402,'分页参数不合法');
			
            $kw_limit.=" AND a.title like '%$keyword%'";       //关键字限制
            $order = " ORDER BY refreshtime DESC";
            $sql_count = "SELECT count(*) as count FROM {$table}info AS a LEFT JOIN {$table}category AS b ON a.cid = b.cid WHERE a.status = 1 $kw_limit";
            $sql = "SELECT a.infoid,a.cid,a.title,a.refreshtime,a.tpic,a.imgcount,b.title as catname,b.mid FROM {$table}info AS a LEFT JOIN {$table}category AS b ON a.cid = b.cid";
            $total = $db->getOne($sql_count);
            
            $nums = ceil($total/$perpage);
            $page = intval($_GET['page']);
            if($page<1) $page = 1;

            $sql.= " WHERE a.status = 1 $kw_limit $order limit ".(($page-1)*$perpage).", $perpage";
            $pages = pages($page, $total, $perpage, 4,'',FALSE,'ajax');  //分页导航
            
            $rows =$db->getAll($sql);
            foreach($rows as $row){
                $arr['infoid'] = $row['infoid'];
                $arr['catname'] = $row['catname'];
                $arr['title'] = highlight($row['title'], $keyword);
                $arr['cid'] = $row['cid'];
                $arr['refreshtime'] = format_time($row['refreshtime'],3);
                $arr['tpic'] = $row['tpic'];
                $arr['imgcount'] = $row['imgcount'];
                
                //处理每条信息中的扩展字段
                $ext_arr = get_extInfo($row['infoid'],$row['mid']);
                $info[] = array_merge($arr,$ext_arr);
            }
            $data['list'] = $info;
            $data['pages'] = $pages;
            Response::show(1,'success',$data);
			break;
		
		case 'register':		//用户注册
			$user = trim($_POST['user']);
            $pwd = trim($_POST['pwd']);
            $email = trim($_POST['email']);
            
            if(str_len($user)<3 || str_len($user)>10) Response::show(-1,'用户名长度限制在3至10个字符之间');
            if(str_len($pwd)<6 || str_len($pwd)>16) Response::show(-2,'密码长度限制在6至16个字符之间');
            if(!preg_match("/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/",$email)) Response::show(-3,'电子邮箱格式不正确');

            $sql = "select userid from {$table}user where username='$user'";
            $row = $db->getOne($sql);
            if($row) Response::show(-4,'该用户已存在！');

            $sql = "select userid from {$table}user where email='$email' and email_flag=1";
            $row = $db->getOne($sql);
            if($row) Response::show(-5,'该email已被其它用户注册！');
              
      		if($CFG['uc']){
      		    require(ROOT.'/source/include/uc.fun.php');
                uc_register($user,$pwd,$email);
            }
            //注册到本地
            $data = array(
                'username' => $user,
                'userpwd' => md5($pwd),
                'email' => $email,
                'regtime' => time(),
                'lastlogintime' => time(),
                'lastloginip' => get_ip()
            );
			
            $db->insert("{$table}user",$data);
          	Response::show(1,'注册成功，请登录！');
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
				
                Response::show(1,'用户登录成功',array(
                	'uid'=>0,
			    	'userid'=>$row['userid'],
					'username'=>$user,
					'userpwd'=>$pwd
				));
            }
			break;
		
		case 'logout':
      		if($CFG['uc']){
      		    require(ROOT.'/source/include/uc.fun.php');
                uc_logout();
            }
            $_SESSION['userid'] = '';
            $_SESSION['uid'] = '';
            $_SESSION['user'] = '';
            response::show(1,'退出登录成功');
			break;
			
		case 'getpwd':		//找回密码
			$user = trim($_GET['user']);
			$email = trim($_GET['email']);
			
			if(!$user){
				Response::show(-1,'请输入用户名！');
			}
			
			if(!$email){
				Response::show(-2,'请输入注册时填写的电子邮箱！');
			}
			
			$sql = "select * from {$table}user where username='$user' and email='$email' limit 1";
			$rs = $db->getRow($sql);
			if(!$rs){
				Response::show(-3,'用户名与电子邮箱不匹配！');
			}
			
			$pwd = rand_pwd(6);		//生成6位随机密码
			
			$sql = "update {$table}user set userpwd='".md5($pwd)."' where username='$user'";
            $db->query($sql);
            if($CFG['uc']){
                include ROOT.'uc_client/client.php';
                uc_user_edit($user,'',$pwd,'',1);
            }
			
			$subject = '易搜网密码重置邮件';
            $message = "欢迎使用济宁易搜网，你的新密码为：".$pwd."(区分大小写)，你可以进入用户中心自行修改<br/>此邮件由系统发送，请勿回复！";
                
            if(send_email($email,$subject,$message)){
                Response::show(1,'随机密码已经发到你邮箱！');
            } else {
               Response::show(-4,'找回密码失败，请重试！'); 
            }
			break;
			
		case 'about':
			
			if(!$_SESSION['user']){
				Response::show(-1,'没有登录或已超时');
			}
			$act = trim($_GET['act']);
            $user = trim($_GET['user']);
		
			if($_SESSION['user']!=$user){
				Response::show(-2,'没有操作权限');
			}
			
			if($act=='do'){
				$mobile = trim($_POST['mobile']);
                $email = trim($_POST['email']);
                $qq = trim($_POST['qq']);
                
                if(!preg_match("/(^(13|14|15|17|18)\d{9}$)/", $mobile)) Response::show(-3,'请输入正确的手机号');
               	if(!preg_match("/^[1-9][0-9]{4,9}$/", $qq)) Response::show(-4,'请输入正确的QQ号');;
                if(!preg_match("/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/", $email)) Response::show(-5,'请输入正确的email');;
                $old_email = $db->getOne("select email from {$table}user where username='$_SESSION[user]'");
                if($email == $old_email){
                    $sql = "update {$table}user set mobile='$mobile',email='$email',qq='$qq' where username='$_SESSION[user]'";
                } else {
                    $sql = "update {$table}user set mobile='$mobile',email='$email',qq='$qq',email_flag=0 where user='$_SESSION[user]'";
                }
                
                $db->query($sql);
                if($CFG['uc']){
                    include ROOT.'uc_client/client.php';
                    uc_user_edit($_SESSION['user'],'','',$email,1);
                }
				Response::show(1,'用户资料修改成功！');
				exit();
			}
			
            $sql = "select * from {$table}user where username='$_SESSION[user]'";
            $user = $db->getRow($sql);
            Response::show(1,'success',$user);
			break;
		
		case 'pwd':
			if(!$_SESSION['user']){
				Response::show(-1,'没有登录或已超时');
			}
			
            $user = trim($_POST['user']);
			if($_SESSION['user']!=$user){
				Response::show(-2,'没有操作权限');
			}
			
			$oldpwd = trim($_POST['pwd_old']);
            $newpwd = trim($_POST['pwd_new']);
            
            if(!$oldpwd) Response::show(-3,'请输入原密码！');
           	if(!$newpwd) Response::show(-4,'请输入新密码！');
           	if($newpwd==$oldpwd) Response::show(-5,'新密码不能与原密码相同！');
           	
            $sql = "select userpwd from {$table}user where username='$_SESSION[user]'";
            $getpwd = $db->getOne($sql);
            if($getpwd!=md5($oldpwd)) Response::show(-6,'原密码输入有误！');
            $sql = "update {$table}user set userpwd='".md5($newpwd)."' where username='$_SESSION[user]'";
            $db->query($sql);
            if($CFG['uc']){
                include ROOT.'uc_client/client.php';
                uc_user_edit($_SESSION['user'],'',$newpwd,'',1);
            }
            Response::show(1,'密码修改成功！');;
			break;
			
		case 'info':		//用户中心我的信息
	  		if(!$_SESSION['userid']){
				Response::show(-1,'没有登录或已超时');
			}
			
            $userid = intval($_GET['userid']);
			if($_SESSION['userid']!=$userid){
				Response::show(-2,'没有操作权限');
			}
			
            $status = intval($_GET['status']);
            $perpage = intval($_GET['perpage']);
			
           	$sql = "select count(*) as count from {$table}info as a inner join {$table}category as b on a.cid=b.cid where a.userid=$_SESSION[userid]";
            if($status) $sql.=" and a.status=$status";
	        $total = $db->getOne($sql);
            
            $nums = ceil($total/$perpage);
            $page = intval($_GET['page']);
            if($page>$nums) $page =$nums;
            if($page<1) $page =1;
            
            $sql = "select a.infoid,a.cid,a.title,a.refreshtime,a.status,b.pinyin from {$table}info as a inner join {$table}category as b on a.cid=b.cid where a.userid=$_SESSION[userid]";
            if($status) $sql.=" and a.status=$status";
            $sql.= " order by a.refreshtime desc limit ".(($page-1)*$perpage).", $perpage";
            $rows = $db->getAll($sql);
            
            foreach($rows as $row){
                $cid = $row['cid'];
                $arr['cid'] = $cid;
                $arr['infoid'] = $row['infoid'];
                $arr['title'] = strcut($row['title'],36,'...');
                $arr['refreshtime'] = $row['refreshtime'];
                $arr['pinyin'] = $row['pinyin'];
				$arr['status'] = $row['status'];
                $info[] = $arr;
            }
            $pages = pages($page, $total, $perpage, 4,'',FALSE,'ajax');  //分页导航
            $data['info'] = $info;
			$data['pages'] = $pages;
            Response::show(1,'success',$data);
            break;
            
        //用户删除
		case 'del_info':
			if(!$_SESSION['userid']){
				Response::show(-1,'没有登录或已超时');
			}
			
            $userid = intval($_GET['userid']);
			if($_SESSION['userid']!=$userid){
				Response::show(-2,'没有操作权限');
			}
			
            $infoid = intval($_GET['infoid']);
			if(!$infoid) Response::show(-3,'要删除的信息ID为空');
			
            $sql = "update {$table}info set status=3 where userid=$_SESSION[userid] and infoid=$infoid";
            $db->query($sql);
            if($db->affected_rows()){       //删除成功，返回受影响的行数
                Response::show(1,'删除成功！');
            } else {
            	Response::show(-4,'删除失败，请重试！');
            }
			break;
			
		//用户刷新信息
		case 'refresh':
			if(!$_SESSION['userid']){
				Response::show(-1,'没有登录或已超时');
			}
			
            $userid = intval($_GET['userid']);
			if($_SESSION['userid']!=$userid){
				Response::show(-2,'没有操作权限');
			}
			
            $infoid = intval($_GET['infoid']);
			if(!$infoid) Response::show(-3,'要刷新的信息ID为空');
			
			$sql = "update {$table}info set refreshtime=".time()." where userid=$_SESSION[userid] and infoid=$infoid";
            $db->query($sql);
			if($db->affected_rows()){
                Response::show(1,'刷新成功，信息已排到最前！');
            } else {
            	Response::show(-4,'刷新失败，请重试！');
            }
			break;
		
		//用户恢复信息
		case 'recover':
			if(!$_SESSION['userid']){
				Response::show(-1,'没有登录或已超时');
			}
			
            $userid = intval($_GET['userid']);
			if($_SESSION['userid']!=$userid){
				Response::show(-2,'没有操作权限');
			}
			
            $infoid = intval($_GET['infoid']);
			if(!$infoid) Response::show(-3,'要恢复的信息ID为空');
			$sql = "update {$table}info set status=1 where userid=$_SESSION[userid] and infoid=$infoid";
            $db->query($sql);
			
            if($db->affected_rows()){       //删除成功，返回受影响的行数
                Response::show(1,'恢复成功！');
            } else {
            	Response::show(-4,'恢复失败，请重试！');
            }
			break;
			
		case 'collect':		//收藏信息
			$userid = intval($_GET['userid']);
			$infoid = intval($_GET['infoid']);
			$act = trim($_GET['act']);
			
			if(!$_SESSION['userid']){
				Response::show(-1,'请登录后再收藏信息！');
			}
			
			if($userid!= $_SESSION['userid']){
				Response::show(-2,'没有权限执行此操作！');
			}
					
			if($act == 'add'){		//添加收藏
				$sql = "select * from {$table}collect where userid=$userid and infoid=$infoid limit 1";
				$rec = $db->getRow($sql);
				if($rec){
					Response::show(-3,'这条信息已经收藏过了！');
				} else {
					$db->insert("{$table}collect", array(
						'infoid' => $infoid,
						'userid' => $userid,
						'dateline' => time()
					));
					if($db->affected_rows()){
						Response::show(1,'信息收藏成功！');
					}
				}
				exit();
			}
			
			if($act == 'del'){		//删除收藏
				$sql = "delete from {$table}collect where infoid=$infoid and userid=$userid";
				$db->query($sql);
				if($db->affected_rows()){
					Response::show(1,'取消收藏成功！');
				}
				exit();
			}
			
			$perpage = intval($_GET['perpage']);
			if($perpage <=0) Response::show(-4,'分页参数不正确！');
			
			$sql = "select count(*) as total from {$table}collect as a left join {$table}info as b on a.infoid=b.infoid where a.userid = $userid";
			$total = $db->getOne($sql);
			
			$nums = ceil($total/$perpage);
            $page = intval($_GET['page']);
            if($page<1) $page = 1; 
			
			$sql = "select a.dateline,b.infoid,b.title from {$table}collect as a left join {$table}info as b on a.infoid=b.infoid where a.userid = $userid order by a.dateline desc limit ".(($page-1)*$perpage).",$perpage";
			$rows = $db->getAll($sql);
			foreach($rows as $row){
                $arr['infoid'] = $row['infoid'];
                $arr['title'] = strcut($row['title'],36,'...');
                $arr['dateline'] = $row['dateline'];
                $info[] = $arr;
            }
            $pages = pages($page, $total, $perpage, 4,'',FALSE,'ajax');  //分页导航
            $data['info'] = $info;
			$data['pages'] = $pages;
            Response::show(1,'success',$data);
			break;
			
		//短消息列表
		case 'msg':
			if(!$_SESSION['uid']){
				Response::show(-1,'没有登录或已超时');
			}
            $uid = intval($_GET['uid']);
			
			if($_SESSION['uid']!=$uid){
				Response::show(-2,'没有操作权限');
			}
		
			$perpage = intval($_GET['perpage']);
            $page = intval($_GET['page']);   //页数
            if($page<1) $page = 1;
			if(!$perpage) Response::show(-1,'分页参数不正确！');
			
            if($CFG['uc']){
                require_once(ROOT.'/source/include/uc.fun.php');
                $pm = uc_privatepm($page,$perpage);
                $pages = pages($page, $pm['count'], $perpage, 4,'',FALSE,'ajax');  //分页导航
                $data['list'] = $pm['list'];
				$data['pages'] = $pages;
				Response::show(1,'sucess',$data);
				
            } else {
            	response::show(-2,'短信功能暂停使用，请联系管理员！');
            }
			break;
			
		//查看会话短消息
		case 'view_msg':
			$uid = intval($_GET['uid']);
			$touid = intval($_GET['touid']);
			$page = intval($_GET['page']);   //页数
			$perpage = intval($_GET['perpage']);
            
			if(!$_SESSION['uid']){
				Response::show(-1,'没有登录或已超时');
			}
			
			if($_SESSION['uid']!=$uid){
				Response::show(-2,'没有操作权限');
			}
		
			if(!$perpage) Response::show(-3,'分页参数不正确！');
			
			if($page<1) $page = 1;
			
			if($CFG['uc']){
                require(ROOT.'/source/include/uc.fun.php');
                $data = uc_pm_read($touid,$page,$perpage);
                $pages = pages($page,$data['total'], $perpage, 4,'',false,'ajax');  //分页导航
                $pm['info'] = $data;
				$pm['pages'] = $pages;
				$pm['r_avatar'] = "<img class=avatar src=".UC_API."/avatar.php?uid=$_SESSION[uid]&size=small>";
				Response::show(1,'success',$pm);
            } else {
                Response::show(-4,'短信功能暂时无法使用，请联系管理员！');
            }
			
			break;
			
		//删除短消息
		case 'del_msg':
			$uid = intval($_GET['uid']);
			$touids = $_REQUEST['touid'];   //用户id，用于删除会话(接收的值是个数组)
            $pmids = $_REQUEST['pmid'];     //信息id，用于删除会话中的信息
            
			if(!$_SESSION['uid']){
				Response::show(-1,'没有登录或已超时');
			}
        
			if($_SESSION['uid']!=$uid){
				Response::show(-2,'没有操作权限');
			}

            if(empty($touids) && empty($pmids)){
            	Response::show(-3,'请选择要操作的短信！');
            }
			
            if($CFG['uc']){
                require_once(ROOT.'/source/include/uc.fun.php');
                uc_del_pm($touids,$pmids);
            }else {
                Response::show(-4,'短信息功能暂时关闭，请联系管理员！');
            }
			break;
			
		//发送短消息
		case 'send_msg':
			if(!$_SESSION['uid']){
				Response::show(-1,'没有登录或已超时');
			}
            $uid = intval($_GET['uid']);
			
			if($_SESSION['uid']!=$uid){
				Response::show(-2,'没有操作权限');
			}
			
			if($CFG['uc']){
                require(ROOT.'/source/include/uc.fun.php');
			} else {
				Response::show(-3,'短信功能暂停使用，请联系管理员！');
			}	
			
            $touid = intval($_POST['touid']);    //收件人ucenter id
            $touser = $_POST['touser'];          //收件人用户名
            $subject = trim($_POST['subject']);     //标题
            $message = trim($_POST['message']);        //内容
            $type = intval($_POST['type']);         //1为群聊
            
            if($subject &&(str_len($subject) > 30 || str_len($subject) < 4)){
            	Response::show(-1,'短信标题在4-30个字符之间');
            }
			
            if(str_len($message) > 255 || str_len($message) < 1){
            	Response::show(-2,'短信内容限制在255个字符之内');
            }
			
            uc_send_msg($touser,$touid,$subject,$message,$type);
			break;
			
		//黑名单
		case 'blacks':
			if(!$_SESSION['uid']){
				Response::show(-1,'没有登录或已超时');
			}
			$act = trim($_GET['act']);
            $uid = intval($_GET['uid']);
			
			if($_SESSION['uid']!=$uid){
				Response::show(-2,'没有操作权限');
			}
			
			if($CFG['uc']){
                require_once ROOT.'uc_client/client.php';
			} else {
				Response::show(-3,'黑名单暂停使用，请联系管理员！');
			}
			
			if($act == 'set_blacks'){	//设置黑名单
                uc_pm_blackls_set($_SESSION['uid'], $_POST['blackls']);
                Response::show(1,'黑名单设置成功！');
				exit;
			}
			
			if($act == 'add_blacks'){	//添加用户到黑名单
				$tousername = trim($_GET['tousername']);
            	if(empty($tousername)) Response::show(-4,'添加用户不能为空！');
				$result = uc_pm_blackls_add($_SESSION['uid'],$tousername);
				
                if($result){
                    Response::show(1,'操作成功，该用户已被添加到黑名单！');
                } else {
                    Response::show(-5,'添加失败，用户可能不存在！');
                }
				exit;
			}
			
            if($_SESSION['uid']) $blackls = uc_pm_blackls_get($_SESSION['uid']);
			Response::show(1,$blackls);
			break;
			
		case 'down_app':
			//文件下载
			$file_name = 'yiiso.apk';
			$file = fopen($file_name,"r"); // 打开文件
			Header("Content-type: application/octet-stream");
			Header("Accept-Ranges: bytes");
			Header("Accept-Length: ".filesize($file_name));
			Header("Content-Disposition: attachment; filename=".$file_name);
			// 输出文件内容
			echo fread($file,filesize($file_name));
			fclose($file);
			break;
			
        default:
            response::show('0','未定义的操作类型');
            break;  
    }
?>