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
                        <li><a href="<?php echo site_url("user/send_msg/")?>">发送消息</a></li>
                        <li class="on"><a href="<?php echo site_url("user/blacks/")?>">黑名单</a></li>
                    </ul>
                </div>
                <div class="blank20"></div>
                <form id="blacks_form">
                    <table style="margin-left: 20px;">
                        <tbody>
                            <tr>
                                <td>
                                    <textarea style="width: 330px;height: 120px;" class="pmbox" name="blackls"><?php echo $blackls?></textarea>
                                </td>
                                <td class="f12 f333" style="line-height:20px;width: 250px;padding-left: 5px;">
                                    <b>忽略列表:</b><br />
                                    添加多个忽略人员名单时用逗号 "," 隔开(如:张三,李四,王五等)。当这些被添加的忽略用户给您发送短消息时将不予接收，如需禁止所有用户发来的短消息，请设置为 "{ALL}"
                                </td>
                            </tr>
                            <tr>
                                <td height="50">
                                    <input type="button" class="icon btn3" id="blacks_btn" value="提 交" />
                                    <span id="msg" class="fred"></span>
                                </td><td></td>
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