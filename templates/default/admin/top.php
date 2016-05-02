<script type="text/javascript" src="<?php echo TPL?>/js/jquery.js"></script>
<script type="text/javascript" src="<?php echo TPL?>/js/admin.js"></script>

<span class="f12">管理帐号：<?php echo $_SESSION['admin_user']?>&nbsp;<a href="<?php echo site_url("admin/userdo/?act=out")?>">注销登录！</a>&nbsp;<a target="_blank" href="<?php echo site_url()?>">前台首页</a></span>
<div style="font-weight: bold;" class="mt5 f14">
    <a href="<?php echo site_url("admin/category/")?>">信息分类</a> |
    <a href="<?php echo site_url("admin/models/")?>">模型管理</a> | 
    <a href="<?php echo site_url("admin/fields/")?>">字段管理</a> | 
    <a href="<?php echo site_url("admin/options/")?>">选项管理</a> | 
    <a href="<?php echo site_url("admin/info/")?>">信息管理</a> | 
    <a href="<?php echo site_url("admin/article/")?>">文章管理</a> |     
    <!--<a href="<?php echo site_url("admin/members/")?>">会员管理</a> |-->
    <a href="http://u.yiiso.cn" target="_blank">会员管理</a> |
    <a href="<?php echo site_url("admin/codes/")?>">代码段管理</a> | 
    <!--<a href="<?php echo site_url("admin/pic_clear/")?>">无用图片清理</a> | -->
    <a href="<?php echo site_url("admin/cache/")?>">缓存管理</a>
</div>