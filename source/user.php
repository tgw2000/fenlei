<?php
    if (!defined('IN_SITE'))die('Access Denied');
    require(ROOT.'/source/include/common.php');
    require(ROOT.'/source/include/info.fun.php');
    switch($act){
        default:        //用户中心首页
            if(!$_SESSION['userid']) redirect(site_url("user/login/?forward=".urlencode(URL)));
            $status = intval($_GET['status']);
            //生成一次性令牌，防止跨站伪造攻击
            $token = md5(uniqid(rand(), TRUE));
            $_SESSION['token'] = $token;
            
           	$sql = "select count(*) as count from {$table}info as a inner join {$table}category as b on a.cid=b.cid where a.userid=$_SESSION[userid]";
            if($status) $sql.=" and a.status=$status";
	        $total = $db->getOne($sql);
            $perpage = 15;
            $nums = ceil($total/$perpage);
            $page = intval($_GET['page']);
            if($page>$nums) $page =$nums;
            if($page<1) $page =1;
            
            $sql = "select a.infoid,a.cid,a.title,a.refreshtime,a.status,b.pinyin from {$table}info as a inner join {$table}category as b on a.cid=b.cid where a.userid=$_SESSION[userid]";
            if($status) $sql.=" and a.status=$status";
            $sql.= " order by a.refreshtime desc limit ".(($page-1)*$perpage).", $perpage";
            $rows = $db->getAll($sql);
            
            $category = get_category();
            foreach($rows as $row){
                $cid = $row['cid'];
                $arr['cid'] = $cid;
                $arr['infoid'] = $row['infoid'];
                $arr['title'] = $row['title'];
                $arr['refreshtime'] = $row['refreshtime'];
                $arr['status'] = $row['status'];
                if($category[$cid]['parent'][1]){    //第二层父类
                    $arr['pinyin'] = $category[$cid]['parent'][1]['pinyin'];
                } else {
                    $arr['pinyin'] = $category[$cid]['pinyin'];
                }
                $info[] = $arr;
            }
            $pages = pages($page, $total, $perpage, 20);  //分页导航
            include template('user/info');
            break;
            
        case 'register':       //注册
            if($_SESSION['userid']) redirect(site_url("user/"));
            //生成一次性令牌，防止跨站伪造攻击
            $token = md5(uniqid(rand(), TRUE));
            $_SESSION['token'] = $token;
            include template('user/register');
            break;
            
        case 'login':       //登录
            if($_SESSION['userid']) redirect(site_url("user/"));
            $regok = intval($_GET['regok']);    //注册成功时值为1，显示提示信息
            $forward = urldecode($_GET['forward']);
            //生成一次性令牌，防止跨站伪造攻击
            $token = md5(uniqid(rand(), TRUE));
            $_SESSION['token'] = $token;
            if(!$forward) $forward = $_SERVER['HTTP_REFERER'];
            include template('user/login');
            break;
            
        case 'getpwd':
            if($_SESSION['userid']) redirect(site_url("user/"));
            $token = md5(uniqid(rand(), TRUE));
            $_SESSION['token'] = $token;
            include template('user/getpwd');
            break;
            
        case 'reset_pwd':
            //print_r($_SESSION['code_time']);exit;
            $user = trim($_GET['user']);
            $code = trim($_GET['code']);
            if(!$_SESSION['code_time']||time()>$_SESSION['code_time']) exit('验证链接已经过期，请重新验证！');
            if($_SESSION['code'] != $code) exit('验证码无效！');
            $token = md5(uniqid(rand(), TRUE));
            $_SESSION['token'] = $token;
            include template('user/reset_pwd');
            break;
            
        case 'select':     //选择分类
            if(!$_SESSION['userid']) redirect(site_url("user/login/?forward=".urlencode(URL))); 
            $infoid = intval($_GET['id']);
            $cid = intval($params[0]);
            $sql = "select cid,title from {$table}category where pid=0 order by sort asc";
            $cate = $db->getAll($sql,1,24*3600);
            
            $v = get_category();
            if($cid){
                $current_cat = $v[$cid];
                if(!$current_cat) showmsg("所选择的信息分类不存在！",1);
                if(!$current_cat['children']) redirect(site_url("fabu/$cid/"));
                $parent = $v[$cid]['parent'];
                if(is_array($parent)){      //存在父分类时
                    $fcid = $parent[0]['cid'];      //第一级父类的cid
                    foreach($parent as $row){
                        $pids.= $row['cid'].',';
                    }
                    $pids = substr($pids,0,strlen($pids)-1).','.$cid;
                } else {
                    $fcid = $pids = $cid; 
                }
            }
            include template('user/select');
            break;
            
        case 'fabu':    //发布与修改信息
            if(!$_SESSION['userid']) redirect(site_url("user/login/?forward=".urlencode(URL))); 
            $infoid = intval($_GET['id']);
            $cid = intval($params[0]);
            if($infoid){
                $sql = "select * from {$table}info where userid=$_SESSION[userid]  and infoid = $infoid";
                $info = $db->getRow($sql);
                if(!$info) showmsg("该信息不存在，或已被管理员删除！",1);
            }
            
            //处理信息中的图片
            $sql = "select path from {$table}info_photos where infoid=$infoid and userid=$_SESSION[userid] order by sort asc";
            $photos = $db->getAll($sql);

            $v = get_category();
            $current_cat = $v[$cid];     //当前分类数组
            $parent = $current_cat['parent'];       //当前分类的父类数组

            if(!$current_cat) showmsg("该信息类目不存在，无法发布信息！",1);
            if($current_cat['children']) showmsg("该类目下禁止发布信息，请重新选择分类！",1);
            $mid = $current_cat['mid'];
            if($mid){
                if($infoid){
                    $sql = "select * from {$table}info_$mid where infoid = $infoid";
                    $extr_info = $db->getRow($sql); 

                }
                $model = get_model($mid);
                foreach($model as $row){
                    $type = $row['input_type'];
                    $field = $row['field'];
                    $available = $row['available'];
                    if(!$available) continue;   //如果是不可用字段则终止当前，执行下一循环
                    $arr['field'] = $row['field'];
                    $arr['field_type'] = $row['field_type'];
                    $arr['input_type'] = $type;
                    $arr['title'] = $row['title'];
                    $arr['required'] = $row['required'];
                    $arr['units'] = $row['units'];
                    $arr['size'] = $row['size'];
                    if(($type == 'radio' || $type == 'select' || $type == 'checkbox')){	//处理信息中radio 和 select的值
                        if($row['variable']){       //选项为动态变量
                            $choices = $row['choices'][$cid];
                        } else {
                            $choices = $row['choices'];
                        }
                        $arr[$field] = $choices;
                        
                    }
                    $extr[] = $arr;   //扩展字段
                }
            }

            foreach($parent as $k=>$row){
                $nav.= $row['title']." &gt ";
            }
            $lid = $parent[$k]['cid'];      //父分类的最末级cid
            
            if($current_cat['parent'][1]){    //第二层父类
                $pinyin = $current_cat['parent'][1]['pinyin'];
            } else {
                $pinyin = $current_cat['pinyin'];
            }
            $url = $infoid ? site_url("select/$lid/?id=$infoid"): site_url("select/$lid/");
            $nav.=$current_cat['title']."&nbsp&nbsp<a href=".$url.">重选类目</a>";
            
            $sql = "select * from {$table}company where userid=$_SESSION[userid]";
            $company = $db->getRow($sql);
            $description = $db->getOne("select description from {$table}category where cid=$cid limit 1");          
            //生成一次性令牌，防止跨站伪造攻击
            $token = md5(uniqid(rand(), TRUE));
            $_SESSION['token'] = $token;
            
            include template('user/fabu');
            break;
        
        //生成验证码
        case 'imgcode':
            require(ROOT.'/source/include/imgcode.php');
            code();
            break;
            
        //私人消息
        case 'msg':
            $perpage = 15;
            $page = intval($_GET['page']);   //页数
            if($page<1) $page = 1;       
            if($CFG['uc']){
                require(ROOT.'/source/include/uc.fun.php');
                $pm = uc_privatepm($page,$perpage);
                $pages = pages($page, $pm['count'], $perpage, 20);  //分页导航
            }
            include template('user/pm/privatepm');
            break;
            
        //发送短消息
        case 'send_msg':
            if(!$_SESSION['userid']) redirect(site_url("user/login/?forward=".urlencode(URL)));
            //生成一次性令牌，防止跨站伪造攻击
            $token = md5(uniqid(rand(), TRUE));
            $_SESSION['token'] = $token;
            include template('user/pm/send_msg');
            break;
            
        //黑名单
        case 'blacks':
            if(!$_SESSION['userid']) redirect(site_url("user/login/?forward=".urlencode(URL)));
            if($CFG['uc']){
                include ROOT.'uc_client/client.php';
                if($_SESSION['uid']) $blackls = uc_pm_blackls_get($_SESSION['uid']);
            }
            include template('user/pm/blacks');
            break;
            
        //查看短消息
        case 'pm_view':
            if(!$_SESSION['userid']) redirect(site_url("user/login/?forward=".urlencode(URL)));
            $token = md5(uniqid(rand(), TRUE));
            $_SESSION['token'] = $token;
            $touid = $params[0];
            $page = intval($_GET['page']);   //页数
            $act = 'msg';
            $perpage = 15;
            if($page<1) $page = 1;       
            if($CFG['uc']){
                require(ROOT.'/source/include/uc.fun.php');
                $data = uc_pm_read($touid,$page,$perpage);
                $total = count($data['pms']);
                $pages = pages($page, $total, $perpage, 20,'',false);  //分页导航
            } else {
                echo("系统目前没有整合ucenter,无法使用短信功能");
            }
            include template('user/pm/pm_view');
            break;
            
        //个人资料
        case 'about':
            if(!$_SESSION['userid']) redirect(site_url("user/login/?forward=".urlencode(URL)));
            $t = $params[0];
            if(!in_array($t,array('about','avatar','pwd'))) $t='about';
            $sql = "select * from {$table}user where userid=$_SESSION[userid]";
            $user = $db->getRow($sql);
            if($CFG['uc']){
                include ROOT.'uc_client/client.php';
                $avatar = uc_avatar($_SESSION['uid']);
                $s =  uc_check_avatar($_SESSION['uid']);
                $uc_user = uc_get_user($_SESSION['uid'],1);
                $user['avatar'] = UC_API."/avatar.php?uid=$_SESSION[uid]&size=big";
                $user['email'] = $uc_user[2];
            }
            include template("user/$t");
            break;
        
        //公司资料
        case 'userbiz':
            if(!$_SESSION['userid']) redirect(site_url("user/login/?forward=".urlencode(URL)));
            $sql = "select * from {$table}company where userid=$_SESSION[userid]";
            $company = $db->getRow($sql);
            include template('user/userbiz');
            break;
            
        //手机认证
        case 'usermobile':
            if(!$_SESSION['userid']) redirect(site_url("user/login/?forward=".urlencode(URL)));
            $token = md5(uniqid(rand(), TRUE));     //生成一次性令牌，防止跨站伪造攻击
            $_SESSION['token'] = $token;
            include template('user/usermobile');
            break;
            
        //身份证认证
        case 'usercard':
            if(!$_SESSION['userid']) redirect(site_url("user/login/?forward=".urlencode(URL)));
            $token = md5(uniqid(rand(), TRUE));
            $_SESSION['token'] = $token;
            $sql = "select usercard from {$table}user where userid=$_SESSION[userid]";
            $usercard = $db->getOne($sql);
            include template('user/usercard');
            break;
        
        //营业执照认证
        case 'userlicense':
            if(!$_SESSION['userid']) redirect(site_url("user/login/?forward=".urlencode(URL)));
            $token = md5(uniqid(rand(), TRUE));
            $_SESSION['token'] = $token;
            $sql = "select * from {$table}company where userid=$_SESSION[userid]";
            $company = $db->getRow($sql);
            include template('user/userlicense');
            break;
            
        //查看发贴记录
        case 'record':
            $userid = intval($params[0]);
            
           	$sql = "select count(*) as count from {$table}info as a left join {$table}category as b on a.cid=b.cid where a.userid=$userid";
	        $total = $db->getOne($sql);
            $perpage = 25;
            $nums = ceil($total/$perpage);
            $page = intval($_GET['page']);
            if($page>$nums) $page =$nums;
            if($page<1) $page =1;
            
            $sql = "select a.infoid,a.cid,a.title,a.refreshtime,b.title as type from {$table}info as a left join {$table}category as b on a.cid=b.cid where a.userid=$userid order by a.refreshtime desc limit ".(($page-1)*$perpage).", $perpage";
            $rows = $db->getAll($sql);
            
            $category = get_category();
            foreach($rows as $row){
                $cid = $row['cid'];
                $arr['infoid'] = $row['infoid'];
                $arr['title'] = $row['title'];
                $arr['type'] = $row['type'];
                $arr['refreshtime'] = format_time($row['refreshtime'],2);
                if($category[$cid]['parent'][1]){    //第二层父类
                    $arr['pinyin'] = $category[$cid]['parent'][1]['pinyin'];
                } else {
                    $arr['pinyin'] = $category[$cid]['pinyin'];
                }
                $info[] = $arr;
            }
            $pages = pages($page, $total, $perpage, 10);  //分页导航
            include template('user/record');
            break;
        
        case 'userdo':
            if(other_site_post())　showmsg("禁止站外提交数据！,1");
            $act = $_GET['act'];
            //ajax获取验证码
            if($act == 'get_imgcode'){
                $imgcode = $_SESSION["verify"];
                echo($imgcode);
            }
            
            //注册时检测用户名
            if($act == 'chkuser'){
                $user = trim($_POST['user']);
                if(str_len($user)<3 || str_len($user)>10){
                    echo('error|用户名限制在3至10个字符之间'); exit();
                }
                $sql = "select userid from {$table}user where username='$user'";
                $row = $db->getOne($sql);
                if($row){
                    echo('error|该用户已经存在，请更换用户名'); exit();
                }
          		if($CFG['uc']){
      		        include ROOT.'uc_client/client.php';
                    $rs = uc_get_user($user);
                    if($rs){
                        echo('error|该用户已经存在，请更换用户名'); exit();
                    }
                }
            }
            
            //找回密码
            if($act == 'getpwd'){ 
                $user = trim($_POST['user']);
                $email = trim($_POST['email']);
                $token = trim($_POST['token']);
                
                if($token!= $_SESSION['token']){
                    out('#msg|令牌验证失败'); exit();
                }
                
                $sql = "select userid,email,email_flag from {$table}user where username='$user' limit 1";
                $row = $db->getRow($sql);
                if(!$row){      //本地表中不存在
              		if($CFG['uc']){
          		        include ROOT.'uc_client/client.php';
                        $rs = uc_get_user($user);
                        if($rs) exit('1'); 
                        
                    }
                    exit('error|用户不存在！');
                }
                //用户在本地表中存在
                if($row['email']!=$email) exit('error|用户名与注册时的电子邮箱不匹配！');
                if($row['email_flag']!=1) exit('error|此电子邮箱没有进行认证！');
                 
                $code = substr(md5(time()), 0, 16);
                $_SESSION['code'] = $code;
                $_SESSION['user'] = $user;
                $_SESSION['code_time'] = time()+30*60;      //过期时间30分钟
                
                $subject = '易搜网密码重置邮件';
                $message = "欢迎使用济宁易搜网，请点击以下链接，完成密码重置：<br/><a target='_blank' href=".$config['base_url'].site_url("user/reset_pwd/?user=$user&code=$code").">".$config['base_url'].site_url("user/reset_pwd/?user=$user&code=$code")."</a><br/>此邮件由系统发送，请勿回复！";
                
                if(send_email($email,$subject,$message)){
                    echo("邮件发送成功！<br/>请在30分钟内查收邮件并完成后续操作！"); 
                } else {
                    echo("error|邮件发送失败，请重试！"); 
                }
            }
            
            //重置密码
            if($act == 'reset_pwd'){
                if(!$_SESSION['user']){
                    out('#msg|验证超时过期,请重试!'); exit();
                }
                
                $pwd = trim($_POST['pwd']);
                $pwd_again = trim($_POST['pwd_again']);
                $token = $_POST['token'];       //令牌
                
                if($token!= $_SESSION['token']){
                    out('#msg|令牌验证失败'); exit();
                }
                
                if(str_len($pwd)<6 || str_len($pwd)>16){
                    out('#msg|密码长度限制在6至16个字符之间'); exit();
                }
                                
                if($pwd != $pwd_again){
                    out('#msg|两次输入的密码不一致'); exit();
                }
                
                $sql = "update {$table}user set userpwd='".md5($pwd)."' where username=$_SESSION[user]";
                $db->query($sql);
                if($CFG['uc']){
                    include ROOT.'uc_client/client.php';
                    uc_user_edit($_SESSION['user'],'',$pwd,'',1);
                }
                $_SESSION['code'] = '';
                $_SESSION['user'] = '';
                $_SESSION['code_time'] = '';
                out('#msg|密码重置成功，请登录！');
            }
            
            //注册处理
            if($act == 'register'){
                $user = trim($_POST['user']);
                $pwd = trim($_POST['pwd']);
                $pwd_again = trim($_POST['pwd_again']);
                $email = trim($_POST['email']);
                $token = $_POST['token'];       //令牌
                $code = $_POST['code'];   //验证码
                
                if($token!= $_SESSION['token']){
                    out('alert|令牌验证失败'); exit();
                }
                
                if(str_len($user)<3 || str_len($user)>10){
                    out('#s_user|用户名长度限制在3至10个字符之间'); exit();
                }
                
                if(str_len($pwd)<6 || str_len($pwd)>16){
                    out('#s_pwd|密码长度限制在6至16个字符之间'); exit();
                }
                                
                if($pwd != $pwd_again){
                    out('#s_pwd_again|两次输入的密码不一致'); exit();
                }
                
                if(!preg_match("/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/",$email)){
                    out('#s_email|电子邮件格式不正确'); exit();
                }
                
                if($code!= $_SESSION['verify']){
                    out('#s_code|验证码输入有误'); exit();
                }
                
                $sql = "select userid from {$table}user where username='$user'";
                $row = $db->getOne($sql);
                if($row){
                    out('#s_user|该用户已经存在，请更换用户名'); exit();
                }
                
                $sql = "select userid from {$table}user where email='$email' and email_flag=1";
                $row = $db->getOne($sql);
                if($row){
                    out('#s_email|该email已被其它用户注册，请更换'); exit();
                }
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
                out("redirect|".site_url("user/login/?regok=1"));
            }
            
            //用户登录            
            if($act == 'login'){
                $user = trim($_POST['user']);
                $pwd = trim($_POST['pwd']);
                $forward = trim($_POST['forward']);
                $token = $_POST['token'];       //令牌
                if($token!= $_SESSION['token']){
                    $arr['flag'] = 'err'; 
                    $arr['msg'] = '令牌验证失败，无法登录！';
                    echo json_encode($arr);
                    exit();
                }
                
                if($CFG['uc']){        //整合ucenter
                    require(ROOT.'/source/include/uc.fun.php');
                    uc_login($user,$pwd,$forward);
                    
                } else {       //没有整合ucenter
                    $sql = "select * from {$table}user where username='$user' and userpwd='".md5($pwd)."'";
                    $row = $db->getRow($sql);
                    if(!$row){
                         $arr['flag'] = 'err'; 
                         $arr['msg'] = '用户名或密码错误,请重输！';
                         echo json_encode($arr);
                         exit();
                    }
                    if($row['disabled']){
                        $arr['flag'] = 'err'; 
                        $arr['msg'] = '此帐号已被禁用，请联系管理员！';
                        echo json_encode($arr);
                        exit();
                    }                    
                    //更新上次登录时间和ip
                    $sql = "UPDATE {$table}user SET lastlogintime=".time().",lastloginip='".get_ip()."' WHERE userid=$row[userid]";
                    $db->query($sql);
               
                    $_SESSION['userid'] = $row['userid'];       //本地user表用户id
                    $_SESSION['user'] = $user;
                    $arr['flag'] = 'redirect';
                    $arr['forward'] = $forward; 
                    echo json_encode($arr);
                }
            }
            
            //退出登录
            if($act == 'logout'){
                $forward = $_GET['forward'];
                if(!$forward) $forward = $_SERVER['HTTP_REFERER'];
          		if($CFG['uc']){
          		    require(ROOT.'/source/include/uc.fun.php');
                    uc_logout();
                }
                $_SESSION['userid'] = '';
                $_SESSION['uid'] = '';
                $_SESSION['user'] = '';
                redirect($forward);
            }
            
            //ajax读取信息小分类
            if($act == 'get_type'){
                $pid = intval($_GET['pid']);
                $sql = "select cid,title from {$table}category where pid=$pid order by sort asc";
                $rows = $db->getAll($sql,1,24*3600);
                foreach($rows as $row){
                    $arr['cid'] = $row['cid'];
                    $arr['title'] = $row['title'];
                    $tem[] = $arr;
                }
                if(empty($tem)) $tem = 0;
                echo json_encode($tem);
            }
            
            //上传文件
            if($act=='upload'){
                $params = $_POST['params'];
 
                $params = explode('|',$params);
                $type = $params[0];          //上传图片类型
                $cicun = $params[1];       //尺寸
                $save_big = $params[2];     //1表示生成原图，0表示不生成
                $sid = $params[3];          //session_id
                
                if(!$sid){
                    $arr['type'] = 'err';
                    $arr['msg'] = "没有登录，无法上传！";
                    echo json_encode($arr);
                    exit();
                }
                
                require(ROOT.'/source/include/upload.php');
                $arr = explode(',',$cicun);
                $spath = ROOT.$CFG['uploads'].'/'.$type;
                $fpath = UPLOADS.'/'.$type;

                if($type=='info'){
                    $spath.="/".date('Ym',time());
                    $fpath.="/".date('Ym',time());
                }
                $config = array(
                    'file' => $_FILES['file'],
                    'spath' => $spath,                    
                    'fpath' => $fpath,
                    'type' => array('gif','jpeg','png','jpg'),
                    'save_big' => $save_big,
                    'limits' => $arr  //生成的缩略图尺寸
                ); 
			
                $obj = new upload($config);
                $obj->upload();
                $info = $obj->getSaveInfo();
                
                if($type=='info'){
                    $pic = str_replace('_B','_'.$arr[0],$info['fpath']);
                }elseif($type=='avatar'){
                    $pic = str_replace('_B','_'.$arr[1],$info['fpath']);
                }else{
                    $pic = $info['fpath'];
                }
                
                $arr['type'] = $type;
                $arr['pic'] = $pic;
                echo json_encode($arr); 
            }
            
            //修改个人信息
            if($act=='about'){
                if(!$_SESSION['userid']) redirect(site_url("user/login/?forward=".urlencode(URL)));
                $mobile = trim($_POST['mobile']);
                $email = trim($_POST['email']);
                $qq = trim($_POST['qq']);
                
                if(!preg_match("/(^(13|15|18)\d{9}$)/", $mobile)) exit("请输入正确的手机号");
               	if(!preg_match("/^[1-9][0-9]{4,9}$/", $qq)) exit("请输入正确的qq号");
                if(!preg_match("/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/", $email)) exit("请输入正确的email");
                $old_email = $db->getOne("select email from {$table}user where userid=$_SESSION[userid]");
                if($email == $old_email){
                    $sql = "update {$table}user set mobile='$mobile',email='$email',qq='$qq' where userid=$_SESSION[userid]";
                } else {
                    $sql = "update {$table}user set mobile='$mobile',email='$email',qq='$qq',email_flag=0 where userid=$_SESSION[userid]";
                }
                
                $db->query($sql);
                if($CFG['uc']){
                    include ROOT.'uc_client/client.php';
                    uc_user_edit($_SESSION['user'],'','',$email,1);
                }
                exit("<font color=green>个人资料修改成功！</font>");
            }
            
            //修改头像
            if($act=='avatar'){
                if(!$_SESSION['userid']) redirect(site_url("user/login/?forward=".urlencode(URL)));
                $avatar = trim($_POST['avatar']);
                $old_avatar = $db->getOne("select avatar from {$table}user where userid=$_SESSION[userid]");
                if($avatar!=$old_avatar){
                    $arr = array('48X48','60X60','120X120');
                    foreach($arr as $v){
                        $path = ROOT.str_replace('_60X60','_'.$v,$old_avatar);
                        if(file_exists($path)) unlink($path);
                    } 
                }
                $sql = "update {$table}user set avatar='$avatar' where userid=$_SESSION[userid]";
                $db->query($sql);
                echo("<font color=green>头像修改成功！</font>");
            }
            
            //修改密码
            if($act=='pwd'){
                if(!$_SESSION['userid']) redirect(site_url("user/login/?forward=".urlencode(URL)));
                $oldpwd = trim($_POST['oldpwd']);
                $newpwd = trim($_POST['newpwd']);
                
                if(!$oldpwd) exit("请输入原密码！");
               	if(!$newpwd) exit("请输入新密码！");
                $sql = "select userpwd from {$table}user where userid=$_SESSION[userid]";
                $getpwd = $db->getOne($sql);
                if($getpwd!=md5($oldpwd)) exit("原密码输入有误！");
                $sql = "update {$table}user set userpwd='".md5($newpwd)."' where userid=$_SESSION[userid]";
                $db->query($sql);
                if($CFG['uc']){
                    include ROOT.'uc_client/client.php';
                    uc_user_edit($_SESSION['user'],'',$newpwd,'',1);
                }
                exit("<font color=green>密码修改成功！</font>");
            }
            
            //修改公司信息
            if($act=='userbiz'){
                if(!$_SESSION['userid']) redirect(site_url("user/login/?forward=".urlencode(URL)));
                $data = $_POST['Company'];
                if(!$data['mingcheng']||!$data['hangye']||!$data['leixing']||!$data['guimo']||!$data['jieshao']||!$data['realname']||!$data['phone']||!$data['address']){
                    exit('请将必填项填写完整！');
                }
                $sql = "select * from {$table}company where userid=$_SESSION[userid]";
                $row = $db->getRow($sql);
                $data['userid'] = $_SESSION['userid'];
                $data['dateline'] = time();
                if(!$row){      //不存在则添加
                    $db->insert("{$table}company",$data);
                } else{
                    $db->update("{$table}company",$data,"userid=$_SESSION[userid]");
                }
                echo('<font color=green>公司资料更新成功！</font>');
            }
            
            //身份证验证
            if($act == 'usercard'){
                if(!$_SESSION['userid']) redirect(site_url("user/login/?forward=".urlencode(URL)));
                $uploadimgs = trim($_POST['uploadimgs']);
                $token = trim($_POST['token']);
                if($token!= $_SESSION['token']) exit("令牌验证失败！");
                $sql = "update {$table}user set usercard='$uploadimgs' where userid=$_SESSION[userid]";
                $db->query($sql);
                echo("<font color=green>认证资料保存成功！</font>");
            }
            
            //营业执照认证
            if($act == 'userlicense'){
                if(!$_SESSION['userid']) redirect(site_url("user/login/?forward=".urlencode(URL)));
                $uploadimgs = trim($_POST['uploadimgs']);
                $token = trim($_POST['token']);
                if($token!= $_SESSION['token']) exit("令牌验证失败！");
                $sql = "update {$table}company set userlicense='$uploadimgs' where userid=$_SESSION[userid]";
                $db->query($sql);
                echo("<font color=green>认证资料保存成功！</font>");
            }
            
            //发送认证邮件
            if($act == 'send_email'){
                if(!$_SESSION['userid']) redirect(site_url("user/login/?forward=".urlencode(URL)));
                $email = trim($_GET['email']);
               	if(!preg_match("/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/", $email)){
                    echo("请填写正确的Email地址！");
                    exit();
                }
                
                $sql = "select * from {$table}user where email='$email' and email_flag=1";
                $row = $db->getOne($sql);
                if($row){
                    echo('该email已被其它用户认证，请更换！');
                    exit();
                }
                                        
                $code = substr(md5(time()), 0, 16);
                $_SESSION['code'] = $code;
                $_SESSION['code_time'] = time()+30*60;      //过期时间30分钟
                
                $subject = '易搜网邮箱绑定邮件';
                $message = "欢迎使用济宁易搜网，请点击以下链接，完成邮箱绑定：<br/><a target='_blank' href=".$config['base_url'].site_url("user/userdo/?act=bindemail&email=$email&code=$code").">".$config['base_url'].site_url("user/userdo/?act=bindemail&email=$email&code=$code")."</a><br/>此邮件由系统发送，请勿回复！";
                
                if(send_email($email,$subject,$message)){
                    echo("邮件发送成功！请在30分钟内查收邮件并完成后续操作！"); 
                } else {
                    echo("邮件发送失败，请重试！"); 
                }
            }
            
            if($act=='send'){
                $subject = '易搜网邮箱绑定邮件';
                $message = "欢迎使用济宁易搜网，请点击以下链接，完成邮箱绑定：<br/><a target='_blank' href=".$config['base_url'].site_url("user/userdo/?act=bindemail&email=$email&code=$code").">".$config['base_url'].site_url("user/userdo/?act=bindemail&email=$email&code=$code")."</a><br/>此邮件由系统发送，请勿回复！";
               
                if(send_email('tgw2000@126.com',$subject,$message)){
                    echo("邮件发送成功！请在30分钟内查收邮件并完成后续操作！"); 
                } else {
                    echo("邮件发送失败，请重试！"); 
                }
            }
            
            //绑定操作
            if($act=='bindemail'){
                if(!$_SESSION['userid']) redirect(site_url("user/login/?forward=".urlencode(URL)));
                $email = trim($_GET['email']);
                $code = trim($_GET['code']);
                
                if(!$_SESSION['code_time']||time()>$_SESSION['code_time']) exit('验证链接已经过期，请重新验证！');
                if($_SESSION['code'] != $code) exit('验证码无效！');
                
                if(!preg_match("/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/", $email)) exit("email地址有误！");
    
                $sql = "select * from {$table}user where email='$email' and email_flag=1";
                $row = $db->getOne($sql);
                if($row) exit('该email已被其它用户验证，请更换！');
      
                $sql = "UPDATE {$table}user SET email_flag = 1,email='$email' WHERE userid=$_SESSION[userid]";
                $db->query($sql);
                if($CFG['uc']){
                    include ROOT.'uc_client/client.php';
                    uc_user_edit($_SESSION['user'],'','',$email,1);
                }
                $_SESSION['code']= '';
                $_SESSION['code_time'] = '';
                redirect(site_url("user/about/"));
            }
            
            //删除图片
            if($act == 'delpic'){
                if(!$_SESSION['userid']) redirect(site_url("user/login/?forward=".urlencode(URL)));
                $pic = trim($_POST['pic']);
                $type = trim($_POST['type']);
                if($type=='info'){      //删除信息图片
                    $path = ROOT.$pic;
                    $path1 = ROOT.str_replace('_100X75','_B',$pic);
                    $path2 = ROOT.str_replace('_100X75','_320X207',$pic);
                    if(file_exists($path)) unlink($path);
                    if(file_exists($path1)) unlink($path1);
                    if(file_exists($path2)) unlink($path2);
                    
                }elseif($type=='avatar'){        //删除头像
                    $arr = array('48X48','60X60','120X120');
                    foreach($arr as $v){
                        $path = ROOT.str_replace('_60X60','_'.$v,$pic);
                        if(file_exists($path)) unlink($path);
                    }
                    
                }elseif($type=='usercard' || $type=='userlicense'){     //删除身份证和营业执照
                    $path = ROOT.$pic;
                    if(file_exists($path)) unlink($path);
                }
            }
            
            //信息发布处理
            if($act == 'fabu'){
                if(!$_SESSION['userid']) redirect(site_url("user/login/?forward=".urlencode(URL)));
                $infoid = intval($_POST['infoid']);
                $token = $_POST['token'];       //令牌
                $imgcode = $_POST['imgcode'];   //验证码
                $data = $_POST['info'];
                $company = $_POST['company'];       //公司资料
                $upimg = $_POST['upimg'];         //上传图片
                $cid = intval($data['cid']);
                $title = trim($data['title']);
                $content = textarea_post_change(trim($data['content']));
                $realname = trim($data['realname']);
                $mobile = trim($data['mobile']);
                $qq = trim($data['qq']);
               	$createtime = time();
                $refreshtime = time();
                $postip = get_ip();

                //添加公司资料                
                if(is_array($company)){
                    if(!$company['mingcheng']||!$company['hangye']||!$company['leixing']||!$company['guimo']||!$company['jieshao']||!$company['realname']||!$company['phone']||!$company['address']){
                  		$arr['msg']="请将公司资料填写完整！";
                        echo json_encode($arr);exit();
                    }
                    $sql = "select id from {$table}company where userid=$_SESSION[userid] limit 0,1";
                    $row = $db->getRow($sql);
                    if(!$row){
                        $company['userid'] = $_SESSION['userid'];
                        $company['dateline'] = time();
                        $db->insert("{$table}company",$company);
                    }
                }
                
                if($infoid){
                    $sql = "select * from {$table}info where userid = $_SESSION[userid] and infoid=$infoid";
                    $info = $db->getRow($sql);
                    if(!$info){
                  		$arr['msg']="信息不存在或权限不足";
                        echo json_encode($arr);exit();
                    }
                }
                
               	if($cid<=0){
            		$arr['msg']="类目选择有误";
                    echo json_encode($arr);exit();
            	}
              
                if($token!= $_SESSION['token']){
                    $arr['msg']="令牌验证失败";
                     echo json_encode($arr);exit();
                }
                
                if(str_len($title)<6 || str_len($title)>30){
                    $arr['msg']="标题长度在6-30个汉字之间";
                     echo json_encode($arr);exit();
                }
                
               	if(!preg_match("/(^(0\d{2,3})?-?([2-9]\d{6,7})(-\d{1,4})?$)|(^((\(\d{3}\))|(\d{3}\-))?(13|14|15|18)\d{9}$)|(^(400|800)\d{7}(-\d{1,4})?$)|(^(95013)\d{6,8}$)/", $mobile)){
                    $arr['msg']="请输入正确的电话或手机";
                    echo json_encode($arr);exit();
                }
                
               	if($qq && !preg_match("/^[1-9][0-9]{4,9}$/", $qq)){
                    $arr['msg']="请输入5-10位qq号";
                    echo json_encode($arr);exit();
                }
                
                if($upimg){
                    $tpic = $upimg[0];      //第一张图片作为标题图
                    $imgcount = count($upimg);                    
                } else {
                    $tpic = '';
                    $imgcount = 0;
                }
                
                $category = get_category();
                $v = $category[$cid];
                $mid = $v['mid'];
                if(!$v || $v['children']){        //分类不存在，没有设置模型的分类与存在子类的分类禁止发布信息
                    $arr['msg']="分类不存在或该类目禁止发布信息";
                    echo json_encode($arr);exit();
                }
                
                //附加字段信息处理
                if($mid){
                    $model = get_model($mid);
                    foreach($model as $row){
                        $field = $row['field'];
                        $field_title = $row['title'];
                        $field_type = $row['field_type'];
                        $input_type = $row['input_type'];
                        $length = $row['length'];
                        $required = $row['required'];
                        $available = $row['available'];
              			$getValue = $data[$field];	//取附加字段的值
                        
            			if($required == 'on' && $getValue==''){
                            $arr['msg']=$field_title."不能为空";
                            echo json_encode($arr);exit();
            			}
                        
            			if($field_type=='int'&&$getValue&&!ereg("^[0-9]+$",$getValue)){
                            $arr['msg']=$field_title."只能为整数";
                            echo json_encode($arr);exit();
            			}
                        
            			if($field_type=='varchar'&&$getValue){
            				if(str_len($getValue)>$length){
                                $arr['msg']=$field_title."不能超过".$length."个字符";
                                echo json_encode($arr);exit();
            				}
                        }
       
                        if($field_type=='int'){
                            $extr[$field] = intval($getValue);
                        } else {
                            if(is_array($getValue)){
                                //提交的值如果是数组,就要做处理,把数组值连成一个字符串
                                $extr[$field] = !empty($getValue) ? implode(',',$getValue) :'';
                            } else {
                                $extr[$field] = trim($getValue);
                            }
                        } 
                    }
                }
                if(!$infoid){   //发布信息时
                    if($imgcode!= $_SESSION['verify']){
                        $arr['msg']="验证码输入有误";
                         echo json_encode($arr);exit();
                    }
                    
                    if((time() - $_SESSION['lastposttime']) < $CFG['posttimelimit']) {
                  		$arr['msg']="您发布的太快了，休息一下吧！";
                        echo json_encode($arr);exit();
                    }
                    
                    //判断是否重复发布信息
                    $sql = "select * from {$table}info where title like '%$title%' and content like '%$content%'";
                    $row = $db->getRow($sql);
                    if($row){
                        $arr['msg'] = "请不要发布重复内容的信息！";
                        echo json_encode($arr);exit();
                    }
                    
                    //写入主表数据
                    $sql = "INSERT INTO {$table}info(userid,cid,title,content,tpic,imgcount,createtime,refreshtime,realname,mobile,qq,postip)VALUES($_SESSION[userid],$cid,'$data[title]','$content','$tpic',$imgcount,$createtime,$refreshtime,'$data[realname]','$data[mobile]','$data[qq]','$postip')";
                    $db->query($sql);
                    $infoid = $db ->insert_id();
                    
                    //上传图片处理(
                    if($upimg){
                        foreach($upimg as $k=>$path){
                            $sql = "INSERT INTO {$table}info_photos(userid,infoid,path,sort,dateline)VALUES($_SESSION[userid],$infoid,'$path',$k,$createtime)";
                            $db->query($sql);
                        }
                    }
                    
                    //写入附加表数据
                    if($mid){
                        $extr['infoid'] = $infoid;
                        $db->insert("{$table}info_$mid",$extr);
                    }
                } else {    //修改信息时      
                    //修改主表数据
                    $sql = "UPDATE {$table}info SET cid=$cid,title='$data[title]',content='$content',tpic='$tpic',imgcount=$imgcount,refreshtime=$refreshtime,realname='$data[realname]',mobile='$data[mobile]',qq='$data[qq]',postip='$postip' where userid=$_SESSION[userid] and infoid=$infoid";
                    $db->query($sql);
                    
                    //上传图片处理(先删除后添加)
                    $db->query("delete from {$table}info_photos where infoid=$infoid");
                    if($upimg){
                        foreach($upimg as $k=>$path){
                            $sql = "INSERT INTO {$table}info_photos(userid,infoid,path,sort,dateline)VALUES($_SESSION[userid],$infoid,'$path',$k,$createtime)";
                            $db->query($sql);
                        }
                    }
                    
                    $old_cid = $info['cid'];
                    $old_mid = $category[$old_cid]['mid'];
                    if($mid != $old_mid){       //如果改变了分类导致应用的模型发生变化，则在新数据附表加上添加数据并删除原附加表数据  
                        if($old_mid) $db->query("delete from {$table}info_$old_mid where infoid=$infoid");
                        if($mid){
                            $extr['infoid'] = $infoid;
                            $db->insert("{$table}info_$mid",$extr);
                        }
                    } else {          //写入附加表数据
                        if($mid) $db->update("{$table}info_$mid",$extr,"infoid = $infoid");
                    }
                }
  
                //第二层父类存在时，为第二层父类的拼音，否则为当前类的拼音
                $sidspell = $v['parent'][1] ? $v['parent'][1]['pinyin'] : $v['pinyin'];
                $arr = array(
                    'msg' => 'ok',
                    'infoid' => $infoid,
                    'sidspell' => $sidspell
                );
                $_SESSION['lastposttime'] = time();     //设置最后发布时间
                echo json_encode($arr);exit();
            }
            
        //删除信息(非彻底删除)
        if($act=='del_info'){
            if(!$_SESSION['userid']) redirect(site_url("user/login/?forward=".urlencode(URL)));
            $id_arr = $_POST['infoid'];     //id数组
            foreach($id_arr as $infoid){
                $sql = "update {$table}info set status=3 where userid=$_SESSION[userid] and infoid=$infoid";
                $db->query($sql);
                if($db->affected_rows()){       //删除成功，返回受影响的行数
                    $ids.=$infoid.','; 
                }
            }
            $ids = substr($ids,0,strlen($ids)-1);
            echo("ok|$ids");
        }
            
        //恢复信息
        if($act=='recover'){
            if(!$_SESSION['userid']) redirect(site_url("user/login/?forward=".urlencode(URL)));
            $category = get_category();
            $id_arr = $_POST['infoid'];
            foreach($id_arr as $infoid){
                $sql = "select title,cid from {$table}info where userid=$_SESSION[userid] and infoid=$infoid";
                $row = $db->getRow($sql);
                $cid = $row['cid'];
                $title = $row['title'];
                if($category[$cid]['parent'][1]){    //第二层父类
                    $pinyin = $category[$cid]['parent'][1]['pinyin'];
                } else {
                    $pinyin = $category[$cid]['pinyin'];
                }
                $url = site_url("$pinyin/$infoid.html");
                $url1 = site_url("fabu/$cid/?id=$infoid");
                $sql = "update {$table}info set status=1 where userid=$_SESSION[userid] and infoid=$infoid";
                $db->query($sql);
                if($db->affected_rows()){       //返回受影响的行数
                    $ids.=$infoid.'$$'; 
                    $titles.=$title.'$$';
                    $urls.=$url.'$$';
                    $url1s.=$url1.'$$';
                }                                
            }
            $ids = substr($ids,0,strlen($ids)-2);
            $titles = substr($titles,0,strlen($titles)-2);
            $urls = substr($urls,0,strlen($urls)-2);
            $url1s = substr($url1s,0,strlen($url1s)-2);
            echo("ok|$ids|$titles|$urls|$url1s");
        }
            
        //刷新信息
        if($act=='refresh'){
            if(!$_SESSION['userid']) redirect(site_url("user/login/?forward=".urlencode(URL)));
            $infoid = intval($_POST['infoid']);
            $sql = "update {$table}info set refreshtime=".time()." where userid=$_SESSION[userid] and infoid=$infoid";
            $db->query($sql);
            $refreshtime = date("m-d h:i",time());
            echo("ok|$refreshtime");
        }
            
        //信息举报
        if($act=='report'){
            $data = $_POST['report'];
            $token = $_POST['token'];
            $infoid = intval($data['infoid']);
            $type = intval($data['type']);
            $content = trim($data['content']);
            $mobile = trim($data['mobile']);
            $data['dateline'] = time();
            $data['ip'] = get_ip();
            $data['fromname'] = !$_SESSION['user'] ? '游客' : $_SESSION['user'];
            
            if($token!= $_SESSION['token']) exit("令牌验证失败！");
            if($type<1 || $type>4) exit('请选择举报类型！');
            
            $sql = "select title from {$table}info where infoid=$infoid";
            $data['title'] = $db->getOne($sql);
            if(!$data['title']) exit('举报的信息不存在');
            if(str_len($content)<4 || str_len($content)>255) exit("举报内容限制在4-255字之间");
            if(!preg_match("/(^(13|15|18)\d{9}$)/", $mobile)) exit("请输入正确的手机号码");
            $db->insert("{$table}report",$data);
            echo("ok");           
        }
            
        //发送短信
        if($act=='send_msg'){
            if(!$_SESSION['userid']) redirect(site_url("user/login/?forward=".urlencode(URL)));
            $token = $_POST['token'];
            $touid = intval($_POST['touid']);    //收件人ucenter id
            $touser = $_POST['touser'];          //收件人用户名
            $subject = trim($_POST['subject']);     //标题
            $message = trim($_POST['message']);        //内容
            $type = intval($_POST['type']);         //1为群聊
            
            if($token!= $_SESSION['token']) exit("令牌验证失败！");
            if($subject &&(str_len($subject) > 30 || str_len($subject) < 4)) exit("短信标题在4-30个字符之间");                                   
            if(str_len($message) > 255 || str_len($message) < 1) exit("短信内容限制在255个字符之内");
            if($CFG['uc']){
                require(ROOT.'/source/include/uc.fun.php');
                uc_send_msg($touser,$touid,$subject,$message,$type);
            } else {
                echo("系统目前没有整合ucenter,无法使用短信功能");
            }
        }
            
        //删除短信
        if($act=='pm_del'){
            if(!$_SESSION['userid']) redirect(site_url("user/login/?forward=".urlencode(URL)));
            $touids = $_REQUEST['touid'];   //用户id，用于删除会话
            $pmids = $_REQUEST['pmid'];     //信息id，用于删除会话中的信息
            
            if(empty($touids) && empty($pmids)) exit("请选择要操作的短信！");
            if($CFG['uc']){
                require(ROOT.'/source/include/uc.fun.php');
                uc_del_pm($touids,$pmids);
            }else {
                echo("系统目前没有整合ucenter,无法使用短信功能");
            }
        }
            
        //更新短信黑名单
        if($act=='pm_blacks'){
            if(!$_SESSION['userid']) redirect(site_url("user/login/?forward=".urlencode(URL)));
            if($CFG['uc']){
                include ROOT.'uc_client/client.php';
                uc_pm_blackls_set($_SESSION['uid'], $_POST['blackls']);
                echo("<font color=green>黑名单设置成功！</font>");
            }else {
                echo("系统目前没有整合ucenter,无法设置黑名单");
            } 
        }
        
        //添加用户到黑名单
        if($act=='pm_add_black'){
            if(!$_SESSION['userid']) redirect(site_url("user/login/?forward=".urlencode(URL)));
            $tousername = $_REQUEST['tousername'];
            if(empty($tousername)) exit("添加用户不能为空！");
            if($CFG['uc']){
                include ROOT.'uc_client/client.php';
                $result = uc_pm_blackls_add($_SESSION['uid'],$tousername);
                if($result){
                    echo("操作成功，该用户已被添加到黑名单！");
                } else {
                     echo("操作失败,用户可能不存在！");
                }
            }else{
                echo("系统目前没有整合ucenter,无法设置黑名单");
            }
        }
        
        //标记已读
        if($act=='pm_isread'){
            if(!$_SESSION['userid']) redirect(site_url("user/login/?forward=".urlencode(URL)));
            $touids = $_REQUEST['touid'];
            if(empty($plids) && empty($touids)) exit("请选择要操作的短信！");
            if($CFG['uc']){
                include ROOT.'uc_client/client.php';
                if(!empty($touids)){
                    uc_pm_readstatus($_SESSION['uid'], $touids);
                    echo("所选短消息已标记为已读！");
                }
            }else{
                echo("系统目前没有整合ucenter,无法使用短信功能");
            }
        }
        break;    
    }
?>