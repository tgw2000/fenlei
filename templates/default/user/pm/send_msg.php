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
                <span class="big_title">发送短消息</span>
                <div class="Tab_head">
                    <ul>
                        <li><a href="<?php echo site_url("user/msg/")?>">短消息</a></li>
                        <li class="on"><a href="<?php echo site_url("user/send_msg/")?>">发送消息</a></li>
                        <li><a href="<?php echo site_url("user/blacks/")?>">黑名单</a></li>
                    </ul>
                </div>
                <div class="blank20"></div>
                <form id="send_form">
                    <input name="token" type="hidden" value="<?php echo $token?>" />
                    <table class="tb">
                        <tbody>
                            <tr>
                                <th style="width: 100px;" id="name">收件人：</th>
                                <td style="height: 20px;">
                                    <input type="text" class="txtInt1" size="50" name="touser" id="touser"/>
                                </td>
                            </tr>
                            <tr>
                                <th style="width: 100px;padding-top: 10px; vertical-align: top;">标题：</th>
                                <td>
                                    <input type="text" class="txtInt1" size="50" name="subject" id="subject"/>
                                    <div class="f666 mt5">收件人用户名 ，多个用逗号分割</div>
                                </td>
                            </tr>
                            <tr>
                                <th>内容：</th>
                                <td valign="top">
                                    <?php include template("user/pm/pm_editorbar")?>
                                    <textarea style="width: 482px; height: 145px;" class="pmbox" name="message" id="message"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td><input type="button" value="发送短信" class="icon btn3" id="send_btn"/> <span class="fred" id="msg"></span></td>
                            </tr>
                        </tbody>
                    </table>
                </form>
                <div class="blank20"></div>
                <div class="pages tac cc"><?php echo $pages?></div>
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
<script type="text/javascript" src="<?php echo TPL?>/js/jquery.exact.js"></script>
<script type="text/javascript" src="<?php echo TPL?>/js/user.js"></script>