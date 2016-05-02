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
                    
                </div><div class="blank20"></div>
                <form id="pwd_form">
                    <table class="tb f14">
                        <tbody>
                        <tr>
                            <th width="100" align="right">原密码：</th>
                            <td>
                                <input type="password" name="oldpwd" size="28" validate="{validate:{required:true,messages:{required:'请输入原密码'}}}" class="txtInt1"/>
                                <span class="tip"></span>
                            </td>
                        </tr>
                        <tr>
                            <th>新密码：</th>
                            <td>
                                <input type="password" name="newpwd" size="28" validate="{validate:{required:true,messages:{required:'请输入新密码'}}}" class="txtInt1" id="newpwd"/>
                                <span class="tip"></span>
                            </td>
                        </tr>
                        <tr>
                           <th>再输一次：</th>
                           <td>
                                <input type="password" name="pwdagain" size="28" validate="{validate:{required:true,messages:{required:'请确认新密码'}}}" class="txtInt1 pwdagain"/>
                                <span class="tip"></span>
                           </td>
                        </tr>
                        <tr>
                            <td style="height: 50px;"></td>
                            <td><input type="submit" value="更改密码" id="pwd_btn" class="btn3 icon"/> <span id="msg" class="fred"></span></td>
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
<script type="text/javascript">
    var base = "<?php echo site_url()?>";
    var tpl = "<?php echo TPL ?>";
</script>
<script type="text/javascript" src="<?php echo TPL?>/js/jquery.js"></script>
<script data-cfg-corelib="<?php echo TPL?>/js/jquery.js"  type="text/javascript" src="<?php echo TPL?>/js/do.js"></script>
<script type="text/javascript" src="<?php echo TPL?>/js/validate.js"></script>