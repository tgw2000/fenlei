<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>注册新用户_济宁分类信息</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="icon" href="<?php echo TPL?>/images/favicon.ico"/>
        <link href="<?php echo TPL?>/css/style.css" rel="stylesheet" type="text/css" />
        <link href="<?php echo TPL?>/css/user.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div class="wapper">
            <div class="head cc">
                <a href="<?php echo site_url()?>" class="logo">济宁最大的二手房门户网站</a>
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
            <div class="bread_nav"><a href="<?php echo site_url()?>">济宁分类信息</a> &gt; <a href="<?php echo site_url("user/")?>">用户中心</a> &gt; 注册新用户 </div>
            <div class="login" style="padding-top: 20px; height: 420px;">
                <h1>注册新用户</h1>
                <div class="l">
                    <iframe width="0" height="0" frameborder="0" name="hiddenifr"></iframe>
                    <form name="formreg" method="post" action="<?php echo site_url("user/userdo/?act=register")?>" target="hiddenifr">
                        <ul>
                            <li>
                                <em>用户名：</em>
                                <input type="text" name="user" class="ipt"/>
                                <span class="clew" id="s_user">3至10个字符之间，注册后不可更改</span>
                            </li>
                            <li>
                                <em>密码：</em>
                                <input type="password" name="pwd" class="ip1 ipt"/>
                                <span class="clew" id="s_pwd">6-16个字符，建议使用字母+数字的组合密码</span>
                            </li>
                            <li>
                                <em>确认密码：</em>
                                <input type="password" name="pwd_again" class="ip1 ipt"/>
                                <span class="clew" id="s_pwd_again">请再输入一次登录密码</span>
                            </li>
                            <li>
                                <em>电子邮箱：</em>
                                <input type="text" name="email" class="ip1 ipt"/>
                                <span class="clew" id="s_email">您的真实邮箱，用于找回密码</span>
                            </li>
                            <li>
                                <em>验证码：</em>
                                <input type="text" style="width: 70px;" name="code" class="ip1 ipt"/>
                                <img id="imgcode" onclick="change()" alt="单击刷新图片" style="cursor:pointer;" src="<?php echo site_url('user/imgcode/');?>"/>
                                <a style="cursor: pointer;" onclick="change()" class="f666">看不清？</a><span class="clew" id="s_code">请输入图片中的四位字符</span>
                            </li>
                            <li>
                                <em>&nbsp;</em>
                                <input type="submit" class="icon btn" id="reg_btn" value="完成注册"/>&nbsp;&nbsp;<a target="_blank" href="<?=site_url('help/1.html#article5')?>">表示同意用户使用条款，点击查看</a>
                            </li>
                        </ul>
                        <input type="hidden" name="token" value="<?php echo $token?>" />
                    </form>
                    <input type="hidden" id="forward" value="<?php echo $forward ?>"/>
                </div>
                <div class="r">&gt;&nbsp;已经注册济宁易搜网帐号？<br/>
                &nbsp;&nbsp;<a class="uline" href="<?php echo site_url("user/login/")?>" title="立即登录">立即登录&gt;&gt;</a><br/>
                &nbsp;&nbsp;<a class="uline" href="<?php echo site_url("user/getpwd/")?>" title="找回密码">忘记密码了？&gt;&gt;</a>
                </div>
                <div class="cc"></div>
            </div>           
            <?php include template("footer")?>
        </div>
    </body>
    </html>
    <script type="text/javascript" src="<?php echo TPL?>/js/jquery.js"></script>
    <script type="text/javascript" src="<?php echo TPL?>/js/user.js"></script>
    <script type="text/javascript">
        var base = "<?php echo site_url()?>";
        var tpl = "<?php echo TPL ?>";
        var clew=new Array();
        clew['pwd_0']="6-16个字符，建议使用字母+数字的组合密码";
        clew['pwd_1']="6-16个字符，建议使用字母+数字的组合密码";
        clew['pwd_again_0']="请再输入一次登录密码";
        clew['pwd_again_1']="确认密码填写有误";
        clew['email_0']="您的真实邮箱，用于找回密码";
        clew['email_1']="您的真实邮箱，用于找回密码";
        clew['code_0']="请输入图片中的四位字符";
        clew['code_1']="请输入验证码，区分大小写";
        
        //显示提示信息
        function posted(v) {
            v=v.split("|");
            if(v[0]=='alert'){      //显示alert对话框
                alert(v[1]);
            }else if(v[0]=='redirect'){     //页面跳转
                location.href = v[1];
            }else{
                $(v[0]).show().html(v[1]);
                $(v[0]).removeClass("clew3").addClass("clew2");
                $("#reg_btn").val("完成注册");
                $('#reg_btn').removeClass('btn1').addClass('btn').attr('disabled', false);
            }
        }
    </script>