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
                <?php if($CFG['uc']){?>
                    <table class="tb">
                        <tr>
                            <td width="100" valign="top" align="center">当前头像：<br /><img width="60" class="avatar" src="<?php echo $user['avatar']?>"/></td>
                            <td><?php echo $avatar ?></td>
                        </tr>
                    </table>
                <?php }else{?>
                    <form id="avatar_form">
                        <table class="tb">
                            <tr>
                                <td width="100" valign="top" align="center">当前头像：
                                    <div id="uploaded">
                                        <?php if($user['avatar']){?>
                                        <img width="60" height="60" class="avatar" src="<?php echo $user['avatar']?>"/><br />
                                        <a id="avatar" rel="<?php echo $user['avatar']?>">还原默认</a>
                                        <?php }else{ ?>
                                        <img width="60" class="avatar" src="<?php echo TPL?>/images/default.png"/>
                                        <?php }?>
                                    </div>
                                </td>
                                <td>
                                    <div id="upavatar" class="mt15"></div>
                                    <div class="mt10" style="padding-left: 5px;">
                                        <input type="submit" value="完成修改" class="btn3 icon"/>
                                        <input id="uploadimgs" type="hidden" value="<?php echo $user['avatar']?>" name="avatar"/>
                                        <span id="msg" class="fred"></span>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </form>
                <?php }?>
                </div>
            </div>
            <?php include template("footer")?>
        </div>
    </body>
</html>
<script type="text/javascript">
    var base = "<?php echo site_url()?>";
    var tpl = "<?php echo TPL ?>";
    var sid = "<?php echo session_id()?>";
</script>
<script type="text/javascript" src="<?php echo TPL?>/js/jquery.js"></script>
<script data-cfg-corelib="<?php echo TPL?>/js/jquery.js"  type="text/javascript" src="<?php echo TPL?>/js/do.js"></script>
<script type="text/javascript" src="<?php echo TPL?>/js/validate.js"></script>