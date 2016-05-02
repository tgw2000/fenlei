<?php include template('top');?>
<div class="blank15"></div>
<div class="wapper">
    <h1 class="fl"><a href="/" title="济宁分类信息"><img width="148" alt="济宁分类信息" src="<?php echo TPL?>/images/logo.png"/></a></h1>
    <div class="fl mr10 ml10"><span class="child_site">济宁人生活指南<br/>济宁分类信息网</span></div>
    <div class="fl mt10">
        <div class="search icon">
            <form method="get" action="<?php echo site_url("search/")?>">
                <div class="search_box icon"><input type="text" value="请输入类别名称或关键字" class="input_clear" name="keyword"/></div>
                <input type="submit" value=" " class="fl icon h_search_but"/>
            </form>
        </div>
    </div>
    <div class="fr mt10">
        <a class="h_publish fl icon mr10" href="<?php echo site_url("select/")?>">免费发布信息</a>
        <a class="h_modify fl icon" href="<?php echo site_url("user/")?>">修改/删除信息</a>
    </div>
</div>
<div class="blank10"></div>