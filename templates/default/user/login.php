<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>注册用户登录_济宁分类信息</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="icon" href="<?php echo TPL?>/images/favicon.ico"/>
        <link href="<?php echo TPL?>/css/style.css" rel="stylesheet" type="text/css" />
        <link href="<?php echo TPL?>/css/user.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript">
            var base = "<?php echo site_url()?>";
            var tpl = "<?php echo TPL ?>";
        </script>
    </head>
    <body>
        <div class="wapper">
            <div class="head cc">
                <a href="<?php echo site_url()?>" class="logo">济宁分类信息网</a>
                <h1 class="summary">用户中心</h1>
                <ul class="logo_nav" id="login">
                    <?php 
                    session_start();
                    if($_SESSION['user']):?>
                    <a href="<?php echo site_url("user/")?>"><?php echo $_SESSION['user']?></a>，您好！&nbsp;
                    <a href="<?php echo site_url("user/userdo/?act=logout")?>">退出</a>&nbsp;|&nbsp;
                    <a href="<?php echo site_url("user/messages/")?>">短消息</a>&nbsp;|&nbsp;
                    <a href="<?php echo site_url("user/info/")?>">信息中心</a>
                    <?php else:?>
                    您好，欢迎来到济宁分类信息网 <a href="<?php echo site_url("user/login/")?>">登录</a>&nbsp;|&nbsp;<a href="<?php echo site_url("user/register/")?>">注册</a>&nbsp;|&nbsp;<a href="<?php echo site_url()?>">网站首页</a>
                    <?php endif;?>
                </ul>
            </div>
            <div class="blank5"></div>
            <div class="head_line"></div>
            <div class="bread_nav"><a href="<?php echo site_url()?>">济宁分类信息</a> &gt; <a href="<?php echo site_url("user/")?>">用户中心</a> &gt; 注册用户登录 </div>
            <div class="login">
                <h1>注册用户登录</h1>
                <form method="post" action="" onsubmit="javascript:return false;">
                <div class="l">
                    <span id="msg" style="display: none;"></span>
                    <ul>
                        <li>
                            <em>用户名：</em>
                            <input type="text" id="user" class="ipt"/>
                        </li>
                        <li>
                            <em>密码：</em>
                            <input type="password" id="pwd" class="ipt"/>&nbsp;&nbsp;<a href="<?php echo site_url("user/getpwd/")?>">忘记密码?</a>
                        </li>
                        <li>
                            <em>&nbsp;</em>
                            <input type="submit" class="icon btn" id="smt" value="登 录"/>
                        </li>
                    </ul>
                    <input type="hidden" id="token" value="<?php echo $token?>" />
                    <input type="hidden" id="forward" value="<?php echo $forward ?>"/>
                </div>
                </form>
                <div class="r">&gt;&nbsp;还没有济宁易搜网帐号？<br/>
                <span class="f12 f999">&nbsp;&nbsp;立即注册即刻享受网站各种会员功能，能更好的管理和推广您的信息，同时还能发送短信，结交好友！</span>
                <br />&nbsp;&nbsp;<a class="uline" href="<?php echo site_url("user/register/")?>" title="立即注册">新用户注册&gt;&gt;</a></div>
                <div class="cc"></div>
            </div>           
            <?php include template("footer")?>
        </div>
    </body>
    </html>
    <script type="text/javascript" src="<?php echo TPL?>/js/jquery.js"></script>
    <script type="text/javascript"  src="<?php echo TPL?>/js/user.js"></script>
    <script type="text/javascript">
        $(function(){
            var v = "<?php echo $regok ?>";
            if(v==1)$("#msg").html("帐号注册成功，请登录！").show();
        })
    </script>