<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>用户中心_济宁分类信息网</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="icon" href="<?php echo TPL?>/images/favicon.ico"/>
        <link href="<?php echo TPL?>/css/style.css" rel="stylesheet" type="text/css" />
        <link href="<?php echo TPL?>/css/user.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <?php include template("user/header")?>
        <div class="blank5"></div>
        <div class="wapper">
            <div class="bread_nav"><a href="<?php echo site_url()?>">济宁分类信息</a> &gt; <a href="<?php echo site_url("user/")?>">用户中心</a></div>
            <div class="user_main cc">
                <!-- 左侧 -->
                <?php include template("user/left")?>
                <!-- 右侧 -->
                <div class="user_right">
                <span class="big_title">个人资料</span>
                <div class="Tab_head">
                    <ul>
                        <li <?php if($t=='about'){?> class="on" <?php }?>><a href="<?php echo site_url("user/about/")?>">基本信息</a></li>
                        <li <?php if($t=='avatar'){?> class="on" <?php }?>><a href="<?php echo site_url("user/about/avatar/")?>">修改头像</a></li>
                        <li <?php if($t=='pwd'){?> class="on" <?php }?>><a href="<?php echo site_url("user/about/pwd/")?>">修改密码</a></li>
                    </ul>
                </div>
                <div class="blank20"></div>
                <form id="about_form">
                    <table class="tb f14">
                        <tbody>
                        <tr>
                            <th width="100" align="right">头像：</th>
                            <td>
                                 <?php if($user['avatar']){?>
                                    <img width="60" height="60" class="avatar fl" src="<?php echo $user['avatar']?>"/>
                                 <?php }else{ ?>
                                    <img width="60" height="60" class="avatar fl" src="<?php echo TPL?>/images/default.png"/>
                                 <?php }?>
                                <a href="<?php echo site_url("user/about/avatar/")?>" style="margin: 28px 0 0 10px;" class="fl f12">更换头像</a>
                            </td>
                        </tr>
                        <tr>
                            <th>用户名：</th>
                            <td><span class="f14"><?php echo $_SESSION['user']?></span></td>
                        </tr>
                        <tr>
                           <th>手机：</th>
                           <td>
                                <input type="text" name="mobile" size="25" validate="{validate:{required:true,messages:{required:'请输入手机号'}}}" value="<?php echo $user['mobile']?>" class="txtInt1 mobile"/>
                                <span class="tip"></span>
                           </td>
                        </tr>
                        <tr>
                           <th>电子信箱：</th>
                           <td>
                               <input type="text" name="email" size="25" validate="{validate:{required:true,messages:{required:'请输入电子邮箱'}}}" value="<?php echo $user['email']?>" class="txtInt1 email"/>&nbsp;
                               <?php if(!$user['email_flag']){?><a href="javascript:void();" class="f12 bindemail">验证邮箱</a><?php }else{?><span class="fgreen">已验证</span><?php }?>
                               <span class="tip"></span>
                           </td>
                        </tr>
                        <tr>
                           <th align="right">QQ：</th>
                           <td>
                                <input type="text" name="qq" size="25" validate="{validate:{required:true,messages:{required:'请输入QQ号'}}}" value="<?php echo $user['qq']?>" class="txtInt1 qq"/>
                                <span class="tip"></span>
                           </td>
                        </tr>
                        <tr>
                           <td></td>
                           <td><span class="f999">注：通过验证的邮箱，修改后需要重新验证！</span></td>
                        </tr>
                        <tr>
                            <td style="height: 50px;"></td>
                            <td><input type="submit" value="更改资料" id="about_btn" class="btn3 icon"/> <span id="msg" class="fred"></span></td>
                        </tr>
                    </tbody>
                    </table>
                </form>
                </div>
            </div>
            <?php include template("footer")?>
        </div>
    </body>
</html>
<!-- 层窗口 -->
<div id="floatwin">
    <div id="floatbox">
        <div id="fw_title">
            <div class="fl title"></div>
            <div class="fr close"><img src="<?php echo TPL?>/images/close.gif"/></div>
        </div>
        <div id="fw_body"></div>
        <div id="fw_button">
            <input id="fw_submit" type="button" value="确定"/>
            <input id="fw_close" type="button" value="取消"/>
        </div>
        <div id="fw_load"><img src="<?php echo TPL?>/images/load.gif" align="absMiddle"/> 正在发送邮件，请稍等...</div>
    </div>
</div>
<script type="text/javascript">
    var base = "<?php echo site_url()?>";
    var tpl = "<?php echo TPL ?>";
</script>
<script type="text/javascript" src="<?php echo TPL?>/js/jquery.js"></script>
<script data-cfg-corelib="<?php echo TPL?>/js/jquery.js"  type="text/javascript" src="<?php echo TPL?>/js/do.js"></script>
<script type="text/javascript" src="<?php echo TPL?>/js/validate.js"></script>