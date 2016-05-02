<div class="user_left">
    <h3>我发布的信息</h3>
    <ul>
        <li <?php if($act=='default' && !$status){?> class="on" <?php }?>><a href="<?php echo site_url("user/")?>">最新信息</a></li>
        <li <?php if($act=='default' && $status==1){?> class="on" <?php }?>><a href="<?php echo site_url("user/?status=1")?>">显示中的信息</a></li>
        <li <?php if($act=='default' && $status==2){?> class="on" <?php }?>><a href="<?php echo site_url("user/?status=2")?>">审核中的信息</a></li>
        <li <?php if($act=='default' && $status==3){?> class="on" <?php }?>><a href="<?php echo site_url("user/?status=3")?>">已删除的信息</a></li>
    </ul>
    <h3>我的消息</h3>
    <ul>
        <li <?php if($act=='msg'){?> class="on" <?php }?>><a href="<?php echo site_url("user/msg/")?>">短消息</a></li>
        <li <?php if($act=='send_msg'){?> class="on" <?php }?>><a href="<?php echo site_url("user/send_msg/")?>">发送短消息</a></li>
        <li <?php if($act=='blacks'){?> class="on" <?php }?>><a href="<?php echo site_url("user/blacks/")?>">黑名单</a></li>
    </ul>
    <h3>我的账户</h3>
    <ul>
        <li <?php if($act=='about'){?> class="on" <?php }?>><a href="<?php echo site_url("user/about/")?>">个人资料</a></li>
        <li <?php if($act=='userbiz'){?> class="on" <?php }?>><a href="<?php echo site_url("user/userbiz/")?>">公司信息完善</a></li>
    </ul>
    <h3>我的认证</h3>
    <ul>
        <li <?php if($act=='usermobile'){?> class="on" <?php }?>><a href="<?php echo site_url("user/usermobile/")?>">个人手机认证</a></li>
        <li <?php if($act=='usercard'){?> class="on" <?php }?>><a href="<?php echo site_url("user/usercard/")?>">身份证认证</a></li>
        <li <?php if($act=='userlicense'){?> class="on" <?php }?>><a href="<?php echo site_url("user/userlicense/")?>">营业执照认证</a></li>
    </ul>
</div>