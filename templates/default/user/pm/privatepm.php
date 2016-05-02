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
                <div class="pmlist" id="pmlist">
                    <?php if($pm){?>
                    <form id="pm_del_form">
                        <?php foreach($pm['list'] as $row){?>
                            <dl id="touid<?php echo $row['touid']?>" class="cc">    
                            <dt class="l"><?php echo $row['avatar']?></dt>
                            <dt class="m">
                                <div class="ck"><input type="checkbox" name="touid[]" class="chk" value="<?php echo $row['touid']?>"/></div>
                                <?php echo $row['say']?><br />
                                <a href="<?php echo $row['url']?>" <?php if($row['new']){?> class="f333 b" <?php }else{?> class="f666"<?php }?>><?php echo $row['lastsummary']?></a><br />
                                <span class="fr"> | <a href="<?php echo $row['url']?>">回复</a></span>
                                <span class="pop fr">
                                    <em class="f999">共 <?php echo $row['pmnum']?> 条</em>
                                    <a class="s"></a>
                                    <ul>
                                        <li><a href="javascript:void();" rel="<?php echo site_url("user/userdo/?act=pm_del&touid[]=$row[touid]")?>" class="pm_del">删除</a></li>
                                        <li><a href="javascript:void();" rel="<?php echo $row['tousername']?>" class="blacks">忽略</a></li>
                                    </ul>
                                </span>
                                <span class="f999"><?php echo $row['dateline']?></span>
                            </dt>
                        </dl>
                        <?php } ?>
                        <div style="padding:10px 0 0 67px;">
                            <input type="checkbox" id="chkall"/> 全选
                            <input type="button" id="pm_del" class="icon btn2" value="删除已选" />
                            <input type="button" id="pm_isread" class="icon btn2" value="标记已读" />
                        </div>
                    </form>
                    <?php }else{?>
                    <div class="mt10">你目前还没有任何短消息!</div>
                    <?php }?>
                    </div>
                    <div class="blank20"></div>
                    <div class="pages tac cc"><?php echo $pages?></div>
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