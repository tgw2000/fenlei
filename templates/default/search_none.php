<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>济宁分类信息门户--易搜网</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="icon" href="<?php echo TPL?>/images/favicon.ico"/>
        <link href="<?php echo TPL?>/css/style.css" rel="stylesheet" type="text/css" />
        <link href="<?php echo TPL?>/css/info.css" rel="stylesheet" type="text/css" />
        <link href="<?php echo TPL?>/css/search.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
    <?php if($cid) $gourl = site_url("user/select/$cid/"); else $gourl = site_url("user/select/");?>
    <?php include template('top');?>
    <div class="blank15"></div>
    <div class="wapper cc">
        <h1 class="fl"><a href="/" title="济宁分类信息"><img width="148" alt="济宁分类信息" src="<?php echo TPL?>/images/logo.png"/></a></h1>
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
    </div>
    <div class="blank15"></div>
    <div class="wapper">
        <div class="bor cc mt5">
            <div class="type_list_top f14 borders_none">找到“<font class="fred fw"><?php echo $keyword?></font>”相关信息共<font class="fred fw">0</font>条</div>
        </div>
        <div class="blank15"></div>
        <div class="small_nav">
            <p class="fr mr10 list_head_publish"><a href="<?php echo site_url("select/")?>">免费发布信息&gt;&gt;</a></p>
            <ul class="list_head clearfix ml10"><li class="active"><a href=""><?php echo $keyword?></a></li></ul>
        </div>
        <div class="clear"></div>
        <div class="search_none f14"><p>抱歉，没有找到与"<span class="fred fw"><?php echo $keyword?></span>"相关的信息。 <br/>建议您：<br/>1.去掉可能不必要的字词，扩大搜索范围，如"的"、"什么"等。<a style="cursor:pointer;" id="research">重新搜索</a><br/>2.马上发布一条与 "<?php echo $keyword?>" 相关的信息 <a href="<?php echo site_url("select/")?>">马上发布一条</a></p></div>
       
        <?php include template("footer")?>
    </div>
    </body>
</html>
<script language="javascript" src="<?php echo TPL?>/js/jquery.js"></script>
<script language="javascript" src="<?php echo TPL?>/js/common.js"></script>