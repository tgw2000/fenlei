<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>济宁分类信息网_免费查询发布各类济宁分类信息</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="icon" href="<?php echo TPL?>/images/favicon.ico"/>
        <link href="<?php echo TPL?>/css/style.css" rel="stylesheet" type="text/css" />
        <link href="<?php echo TPL?>/css/help.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <?php include template('help/header');?>
        <div class="wapper">
            <div class="tb_border" id="bread_nav"><a href="<?php echo site_url()?>">济宁分类信息</a> &gt; <a href="<?php echo site_url("help/")?>">帮助中心</a> &gt; <?php echo $type?></div>
            <div class="blank20"></div>
            <ul class="other_link">
                <?php foreach($info as $row){?>
                    <li><a href="#article<?php echo $row['id']?>"><?php echo $row['title']?></a></li>
                <?php }?>
            </ul>
            <div class="blank20"></div>
            <?php foreach($info as $row){?>
                <a name="article<?php echo $row['id']?>"></a>
                <div class="title_bg"><em class="left_bg"></em><h4><?php echo $row['title']?>：</h4></div>
                <div class="text_content"><?php echo $row['content']?></div>
            <?php }?>
            
            <?php include template("footer")?>
        </div>
    </body>
</html>
<script language="javascript" src="<?php echo TPL?>/js/jquery.js"></script>
<script language="javascript" src="<?php echo TPL?>/js/common.js"></script>