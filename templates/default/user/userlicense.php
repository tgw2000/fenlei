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
                <span class="big_title">认证服务</span>
                <div class="Tab_head">
                    <ul>
                        <li><a href="<?php echo site_url("user/usermobile/")?>">个人手机认证</a></li>
                        <li><a href="<?php echo site_url("user/usercard/")?>">身份证认证</a></li>
                        <li class="on"><a href="<?php echo site_url("user/userlicense/")?>">营业执照认证</a></li>
                    </ul>
                </div>
                <div class="blank20"></div>
                <?php if(!$company){?>
                    <div class="f14 b" align="center"><a href="<?php echo site_url("user/userbiz/")?>">请先完善公司信息&gt;&gt;</a></div>
                <?php }else{ ?>
                <form id="userlicense_form">
                    <table class="tb">
                        <tr>
                            <td style="padding-bottom: 0;">上传营业执照：</td>
                            <td style="padding-bottom: 0;"><div id="upuserlicense"></div></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <div id="uploaded">
                                    <?php
                                     if($company['userlicense']){
                                         $arr =explode(",",$company['userlicense']); 
                                         foreach($arr as $pic){
                                    ?>
                                        <div><img align="absmiddle" height="80" src="<?php echo $pic?>"/><br /><a class="delpic" rel="<?php echo $pic?>">删除</a></div>
                                    <?php }}?>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <input type="submit" value="完成修改" class="btn3 icon" style="margin-left: 5px;"/>
                                <input id="uploadimgs" type="hidden" value="<?php echo $userlicense ?>" name="uploadimgs"/>
                                <input type="hidden" value="<?php echo $token ?>" name="token" />
                                <span id="msg" class="fred"></span>
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