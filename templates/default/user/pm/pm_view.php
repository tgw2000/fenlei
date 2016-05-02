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
                <span class="big_title">私人消息</span>
                <div class="Tab_head">
                    <ul>
                        <li class="on"><a href="<?php echo site_url("user/msg/")?>">短消息</a></li>
                        <li><a href="<?php echo site_url("user/send_msg/")?>">发送消息</a></li>
                        <li><a href="<?php echo site_url("user/blacks/")?>">黑名单</a></li>
                    </ul>
                </div>
                <div class="pmlist">
                    <dl class="cc">
                        <dt class="fl"><b>共有 <em class="forange"><?php echo $total ?></em> 条与 <?php echo $data['tousername']?> 的交谈记录</b></dt>
                        <dt class="fr">
                            <div class="pop fr">
                            <a class="s"></a>
                            <ul style="width: 50px;">
                                <li><a href="javascript:void();" rel="<?php echo site_url("user/userdo/?act=pm_del&r=1&touid[]=$touid")?>" class="pm_del">全部删除</a></li>
                            </ul></div> 
                        </dt>
                    </dl>
                    <?php foreach($data['pms'] as $k=> $row){
                        if(($page ==1 && $k+1==$perpage)|| $k+1==$data['total']){ 
                    ?>
                    <a name="last"></a>
                    <?php }?>
                    <dl id="pmid<?php echo $row['pmid']?>" class="cc">
                        <dt class="l"><?php echo $row['avatar']?></dt>
                        <dt class="m" style="width: 705px; padding-left: 0;">
                            <div class="pop fr">
                                <a class="s"></a>
                                <ul><li><a href="javascript:void();" rel="<?php echo site_url("user/userdo/?act=pm_del&pmid[]=$row[pmid]")?>" class="pm_del">删除</a></li></ul>
                            </div>         
                            <?php echo $row['say']?>
                            <p><?php echo $row['message']?></p>
                            <span class="f999"><?php echo $row['dateline']?></span>
                        </dt>
                     </dl>
                    <?php }?>
                </div>
                <?php if($total>$perpage){?><div class="pages tal cc"><?php echo $pages?></div><?php }?>
                <div class="blank10"></div>
                <form id="send_form">
                    <input type="hidden" name="touid" id="touid" value="<?php echo $touid ?>" />
                    <input type="hidden" name="token" value="<?php echo $token?>" />
                    <table cellpadding="0" cellspacing="0">
                        <tbody>
                            <tr>
                                <td width="64" valign="top" style="padding: 5px 0 0 8px;"><img class="avatar" src="<?php echo UC_API ?>/avatar.php?uid=<?php echo $_SESSION['uid']?>&size=small"/></td>
                                <td valign="top">
                                    <?php include template("user/pm/pm_editorbar")?>
                                    <textarea style="width: 530px; height: 106px;" class="pmbox" name="message" id="message"><?php echo $message ?></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td height="40"><input type="button" id="send_btn" class="icon btn2" value="发 送" name="submit"/> <span id="msg" class="fred"></span></td>
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
<!-- 单条模板 -->
<div id="pm_tpl" style="display: none;">
    <dl id="pmid{f_id}" class="cc">
        <dt class="l"><img class="avatar" src="<?php echo UC_API ?>/avatar.php?uid=<?php echo $_SESSION['uid']?>&size=small"/></dt>
        <dt class="m" style="width: 705px; padding-left: 0;">
            <div class="pop fr">
                <a class="s"></a>
                <ul><li><a href="javascript:void();" rel="<?php echo site_url("user/userdo/?act=pm_del&pmid[]={f_id}")?>" class="pm_del">删除</a></li></ul>
            </div>         
            <font color="#2244dd">您</font>
            <p>{f_message}</p>
            <span class="f999">{f_time}</span>
        </dt>
    </dl>
</div>

<!-- floatwin层窗口 -->
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
        <div id="fw_load"><img src="<?php echo TPL?>/images/load.gif" align="absMiddle"/> 正在操作中，请稍等...</div>
    </div>
</div>
<script type="text/javascript">
    var base = "<?php echo site_url()?>";
    var tpl = "<?php echo TPL ?>";
</script>
<script type="text/javascript" src="<?php echo TPL?>/js/jquery.js"></script>
<script type="text/javascript" src="<?php echo TPL?>/js/jquery.exact.js"></script>
<script type="text/javascript" src="<?php echo TPL?>/js/user.js"></script>