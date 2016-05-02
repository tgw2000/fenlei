<div id="top">
    <div class="wapper">
        <ul class="web_nav fl">
            <li><a href="http://m.yiiso.cn">触屏版</a> | </li>
            <li id="down_app">
            	<img style="position: relative;top:2px;" src="<?=TPL?>/images/mob.png">
            	<a style="color: #24d;"  href="javascript:void(0);">客户端</a>
            	<div class="pop" style="display: none;">
            		<img src="<?=TPL?>/images/app.png" width="150" height="150">
            		<h4>易搜网客户端</h4>
            		<p>扫描易搜网客户端二维码<br>把易搜网放进口袋</p>
            	</div>
            </li>
            <li>合作电话：15053778060,QQ：120885811</li>
        </ul>
        <ul class="menu">
            <?php if(!$_SESSION['userid']){?>
                <li><a href="<?php echo site_url("user/register/")?>">免费注册</a> | </li>
                <li><a href="<?php echo site_url("user/login/")?>">会员登陆</a> | </li>
            <?php }else{ 
                   if($CFG['uc']){
                        require_once(ROOT.'uc_client/client.php');
                        $newpm = uc_pm_checknew($_SESSION['uid']);
                        if($newpm) $pmstr = "<b class='fred'>($newpm)</b>";
                    }
            ?>
                <li><a class="my" href="<?php echo site_url("user/")?>"><?php echo $_SESSION['user']?></a>，您好！ | </li>
                <li><a href="<?php echo site_url("user/userdo/?act=logout")?>">退出</a> | </li>
                <li><a href="<?php echo site_url("user/msg/")?>">短消息</a><?php echo $pmstr ?> | </li>
                <li><a href="<?php echo site_url("user/")?>">信息中心</a> | </li>
            <?php }?>
            <li><a href="<?php echo site_url("help/")?>" target="_blank">新手指引</a></li>
        </ul>
    </div>
</div>