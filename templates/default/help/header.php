<?php include template('top');?>
<div class="blank15"></div>
<div class="wapper border_3"><h1 class="fl"><a href="/" title="济宁分类信息"><img width="148" alt="济宁分类信息" src="<?php echo TPL?>/images/logo.png"/></a></h1>
    <div class="fl mr10"><span class="child_site">济宁人生活指南<br/>济宁分类信息网</span></div>
    <ul class="help_nav">
        <li <?php if($tid==0){?> class="current" <?php }?>><a href="<?php echo site_url("help/")?>">帮助中心首页</a></li>
        <li <?php if($tid==1){?> class="current" <?php }?>><a href="<?php echo site_url("help/1.html")?>">新手导航</a></li>
        <li <?php if($tid==2){?> class="current" <?php }?>><a href="<?php echo site_url("help/2.html")?>">自助工具</a></li>
        <li <?php if($tid==6){?> class="current" <?php }?>><a href="<?php echo site_url("help/6.html")?>">防骗常识</a></li>
        <li <?php if($tid==7){?> class="current" <?php }?>><a href="<?php echo site_url("help/7.html")?>">认证服务</a></li>
    </ul>
</div>