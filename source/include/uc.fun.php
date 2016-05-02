<?php
//以下为自定义过程
if(!defined('IN_SITE')) die('Access Denied');
include_once ROOT.'uc_client/client.php';

//用户注册
function uc_register($user,$pwd,$email){
    $uid = uc_user_register($user,$pwd,$email);     //注册到ucenter
    if($uid <= 0) {
        if($uid == -1) {
            out("#s_user|用户名不合法"); exit();
        } elseif($uid == -2) {
            out("#s_user|包含要允许注册的词语"); exit();
        } elseif($uid == -3) {
            out("#s_user|用户名已经存在"); exit();
        } elseif($uid == -4) {
            out("#s_email|Email格式有误"); exit();
        } elseif($uid == -5) {
            out("s_email|Email不允许注册"); exit();
        } elseif($uid == -6) {
            out("s_email|该 Email已经被注册"); exit();
        } else {
            out("alert|未定义"); exit();
        }
    }
}

//用户登录
function uc_login($user,$pwd,$forward){
    global $db,$table;
    list($uid, $username, $password, $email) = uc_user_login($user, $pwd);      //通过接口判断登录帐号的正确性，返回值为数组
    setcookie('myauth', '', -86400);
    if ($uid == -2) {
        $arr['flag'] = 'err'; 
        $arr['msg'] = '密码输入错误！';
        echo json_encode($arr);
        exit();
    }elseif($uid == -1) {           //用户在ucenter中不存在
        $sql = "select * from {$table}user where username='$user'";
        $row = $db->getRow($sql);
        if($row){       //在本地表中存在
            $userid = $row['userid'];
            if($row['userpwd']!=md5($pwd)){
                $arr['flag'] = 'err'; 
                $arr['msg'] = '密码输入错误！';
                echo json_encode($arr);
                exit();
            }
            if($row['disabled']){
                $arr['flag'] = 'err'; 
                $arr['msg'] = '此帐号已被禁用，请联系管理员！';
                echo json_encode($arr);
                exit();
            }
            $uid = uc_user_register($user,$pwd,$row['email']);     //注册到ucenter
            if($uid<=0){
                $arr['flag'] = 'err'; 
                $arr['msg'] = '注册到ucenter失败！';
                echo json_encode($arr);
                exit();
            }
    		if($uid>0) {   //注册到ucenter成功,同步uid,更新登录时间,ip
    			$db->query("update {$table}user SET uid=$uid,lastlogintime=".time().",lastloginip='".get_ip()."' WHERE userid=$row[userid] ");
    		}
        } else {
            $arr['flag'] = 'err'; 
            $arr['msg'] = '此用户名不存在！';
            echo json_encode($arr);
            exit();
        }
    }elseif($uid>0){	//用户存在于uc用户表中
        $sql = "select * from {$table}user where username='$user'";
        $row = $db->getRow($sql);
        if(!$row) {     //判断用户是否存在于应用用户表，不存在则注册到本地
            $data = array(
                'uid' => $uid,
                'username' => $user,
                'userpwd' => md5($pwd),
                'email' => $email,
                'regtime' => time(),
                'lastlogintime' => time(),
                'lastloginip' => get_ip()
            );
            $db->insert("{$table}user",$data);
            $userid = $db->insert_id();
            
        }else{	     //uc表和应用表中都存在此用户
            $userid = $row['userid'];
            if($row['disabled']){
                $arr['flag'] = 'err'; 
                $arr['msg'] = '此帐号已被禁用，请联系管理员！';
                echo json_encode($arr);
                exit();
            }
            //如果uid不相同，则更新应用表是的uid
            if($uid!=$row['uid']){
                $db->query("update {$table}user set uid=$uid where username='$user'");	
            }
            //更新上次登录时间和ip
            $sql = "update {$table}user SET lastlogintime=".time().",lastloginip='".get_ip()."' WHERE userid=$row[userid]";
            $db->query($sql);
        }
    }
    //用户登陆成功，设置 Cookie，加密直接用 uc_authcode 函数，用户使用自己的函数
    setcookie('myauth', uc_authcode($uid."\t".$user, 'ENCODE'));
    $ucsynlogin = uc_user_synlogin($uid);	//生成同步登录的代码
    $_SESSION['userid'] = $userid;      //本地user表用户id
    $_SESSION['uid'] = $uid;            //ucenter用户表用户id
    $_SESSION['user'] = $user;
    $arr['flag'] = 'redirect'; 
    $arr['forward'] = $forward;
    echo json_encode($arr);
}

//退出登录
function uc_logout(){
    uc_user_synlogout();
}

//私人消息
function uc_privatepm($page,$perpage){
    if(!$_SESSION['uid']) redirect(site_url("user/login/?forward=".urlencode(URL))); 
    $rows = uc_pm_list($_SESSION['uid'],$page,$perpage,'inbox','privatepm',80);
    $total = $rows['count'];
    $nums = ceil($total/$perpage);	//总页数
    if($page > $nums) $page = $nums;  
    foreach($rows['data'] as $row) {
        if($row['pmtype']==1){      //私人消息
            $arr['avatar'] = "<img src=".UC_API."/avatar.php?uid=$row[touid]&size=small>";
            $arr['url'] = site_url("user/pm_view/$row[touid]#last");
            if($row['lastauthorid']==$_SESSION['uid']){     
                $arr['say'] = ' <font color=#2244dd><b>您</b></font> 对 <a href=>'.$row['tousername'].'</a> 说：';
            }else{
                $arr['say'] = '<a href=><b>'.$row['tousername'].'</b></a> 对 <font color=#2244dd>您</font> 说：';
            }
        }
        if($row['pmtype']==2){      //群聊消息
            $arr['avatar'] = "<img src=".UC_API."/images/grouppm.png>";
            $arr['say'] = $row['members'].'人话题：';
            $arr['subject'] = "<a href=>".$row['subject']."</a>";
            $arr['lastauthor'] = '<a href=>'.$row['lastauthor'].'</a>：';
            
        }
        $arr['plid'] = $row['plid'];
        $arr['touid'] = $row['touid'];
        $arr['tousername'] = $row['tousername'];
        $arr['pmtype'] = $row['pmtype'];
        $arr['lastsummary'] = $row['lastsummary'];
        $arr['dateline'] = format_time($row['dateline']);
        $arr['pmnum'] = $row['pmnum'];
        $arr['new'] = $row['new'];
        $tem[] = $arr;
    }
	$data['list'] = $tem;
	$data['count'] = $total;
    return $data;
}

//查看短消息
function uc_pm_read($touid,$page,$perpage){
    if(!$_SESSION['uid']) redirect(site_url("user/login/?forward=".urlencode(URL))); 
    $total = uc_pm_view_num($_SESSION['uid'],$touid,0);
    $nums = ceil($total/$perpage);	//总页数
    if($page > $nums) $page = $nums;  
    $rows = uc_pm_view($_SESSION['uid'],'',$touid,5,$page,$perpage,0,0);    
    foreach($rows as $row){
        if($row['pmtype']==1){      //私人消息
            $arr['avatar'] = "<img src=".UC_API."/avatar.php?uid=$row[touid]&size=small>";
            if($row['authorid']==$_SESSION['uid']){     
                $arr['say'] = ' <font color=#2244dd>您</font>';
            }else{
                $arr['say'] = '<a href=>'.$row['author'].'</a>';
            }
    
            $arr['pmid'] = $row['pmid'];
            $arr['message'] = $row['message'];
            $arr['dateline'] = format_time($row['dateline']);
        }
        $pms[] = $arr;
    }
    $touser = uc_get_user($touid,1);
    $data['touserid'] = $touser[0];
    $data['tousername'] = "<a href=>".$touser[1]."</a>";
    $data['nums'] = $nums;
    $data['pms'] = $pms;
    return $data;
}

//发短信
function uc_send_msg($touser,$touid,$subject,$message,$type){
    if(!$_SESSION['uid']) redirect(site_url("user/login/?forward=".urlencode(URL)));
    if($touid){
        $result = uc_pm_send($_SESSION['uid'],$touid,$subject,$message,1,0,0,$type);     //收件人为id
    } else {
        $result = uc_pm_send($_SESSION['uid'],$touser,$subject,$message,1,0,1,$type);   //收件人为用户名
    }
   
    if($result>0){
 	 	require_once UC_ROOT.'lib/uccode.class.php';
		$uccode = new uccode();
        $message = $uccode->complie($message);
        echo("ok|$result|$message|".date('h:i',time()));
    } else {
        if ($result==0) echo("短消息发送失败，可能原因：发件人或消息内容不存在");
        if ($result==-1) echo("超过两人会话的最大上限");
        if ($result==-2) echo("短消息发送过于频繁");
        if ($result==-3) echo("不能给非好友批量发送短消息");
        if ($result==-4) echo("目前还不能使用发送短消息功能");
        if ($result==-5) echo("超过群聊会话的最大上限");
        if ($result==-6) echo("你被对方列入黑名单，无法发送短消息");
        if ($result==-7) echo("超过群聊人数上限");
        if ($result==-8) echo("不能给自己发送短消息");
        if ($result==-9) echo("收件人不存在或你已被对方列入黑名单");
        if ($result==-10) echo("发起群聊人数必须大于两人");
    }
}

//删除短信
function uc_del_pm($touids,$pmids){
    if(!$_SESSION['uid']) redirect(site_url("user/login/?forward=".urlencode(URL)));
    if(!empty($touids)){       //删除和 uid 对话的 touids 中的所有短消息
        $result = uc_pm_deleteuser($_SESSION['uid'],$touids);
        if($result){
            $r = intval($_GET['r']);
            $str = implode(',',$touids);
            echo("ok|#touid|$str|$r");
        } else {
            echo("短信删除失败！");
        }
    }
    
    if(!empty($pmids)){     //删除会话中的信息
        $result = uc_pm_delete($_SESSION['uid'],'inbox',$pmids);
        if($result){
            $str = implode(',',$pmids);
   	        echo("ok|#pmid|".$str);
        } else {
            echo("短信删除失败！");
   	    }
    }
}

?>