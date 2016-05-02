<?php if($cid) $gourl = site_url("user/select/$cid/"); else $gourl = site_url("user/select/");?>

<?php include template('top');?>
<div class="blank15"></div>
<div class="wapper cc">
    <h1 class="fl"><a href="/" title="济宁分类信息"><img width="110" height="53" alt="济宁分类信息" src="<?php echo TPL?>/images/logo.png"/></a></h1>
    <div class="fl mr10 ml10"><span class="child_site">济宁人生活指南<br/>济宁分类信息网</span></div>
    <div class="fl mt10">
        <div class="search icon">
            <form method="post" action="<?php echo site_url("search/")?>">
                <div class="search_box icon"><input type="text" class="s1" name="keyword" value="<?php echo $keyword ?>"/></div>
                <input type="submit" value=" " class="fl icon h_search_but"/>
            </form>
        </div>
    </div>
    <div class="fr mt10">
        <a class="h_publish fl icon mr10" href="<?php echo $gourl ?>">免费发布信息</a>
        <a class="h_modify fl icon" href="<?php echo site_url("user/") ?>">修改/删除信息</a>
    </div>
    <div class="blank15"></div>
    <span class="nav_f fl icon">&nbsp;</span>
    <ul class="nav fl icon">
        <li><a <?php if($first_cat['pinyin']==''){?> class="on" <?php }?> href="<?php echo site_url()?>">首 页</a></li>
        <li><a <?php if($first_cat['pinyin']=='fangwu'){?> class="on" <?php }?> href="<?php echo site_url("fangwu/")?>">济宁房产</a></li>
        <li><a <?php if($first_cat['pinyin']=='jiaoyi'){?> class="on" <?php }?> href="<?php echo site_url("jiaoyi/")?>">跳蚤市场</a></li>
        <li><a <?php if($first_cat['pinyin']=='cheliang'){?> class="on" <?php }?> href="<?php echo site_url("cheliang/")?>">车辆信息</a></li>
        <li><a <?php if($first_cat['pinyin']=='chongwu'){?> class="on" <?php }?> href="<?php echo site_url("chongwu/")?>">宠物相关</a></li>
        <li><a <?php if($first_cat['pinyin']=='tongcheng'){?> class="on" <?php }?> href="<?php echo site_url("tongcheng/")?>">同城活动</a></li>
        <li><a <?php if($first_cat['pinyin']=='zhaopin'){?> class="on" <?php }?> href="<?php echo site_url("zhaopin/")?>">招聘求职</a></li>
        <li><a <?php if($first_cat['pinyin']=='peixun'){?> class="on" <?php }?> href="<?php echo site_url("peixun/")?>">教育培训</a></li>
        <li><a <?php if($first_cat['pinyin']=='fuwu'){?> class="on" <?php }?> href="<?php echo site_url("fuwu/")?>">生活服务</a></li>
        <li><a <?php if($first_cat['pinyin']=='business'){?> class="on" <?php }?> href="<?php echo site_url("business/")?>">商务服务</a></li>
        <li><a <?php if($first_cat['pinyin']=='jiaoyou'){?> class="on" <?php }?> href="<?php echo site_url("jiaoyou/")?>">交友征婚</a></li>
    </ul>
    <span class="nav_b fl icon">&nbsp;</span>
</div>