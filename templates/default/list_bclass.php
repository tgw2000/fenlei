<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>济宁分类信息门户--搜济宁</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="icon" href="<?php echo TPL?>/images/favicon.ico"/>
        <link href="<?php echo TPL?>/css/style.css" rel="stylesheet" type="text/css" />
        <link href="<?php echo TPL?>/css/info.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <?php include template("header")?>
        <div class="wapper mt10">
        <?php
        if($class_nav){    //标志为class_nav的代码段 ?>
            <?php include($class_nav); ?>
        <?php } else { ?>
            <div class="type_list"> 
                <?php foreach($children as $row){
                     $children1 = $category[$row['cid']]['children'];
                ?>
                <ul class="type">
                    <li>
                        <?php if($children1){?>
                        <h2><a href="<?php echo site_url("$row[pinyin]/")?>"><?php echo $row['title']?>：</a></h2>
                        <span>
                            <?php
                                foreach($children1 as $k=>$row1){
                                if($k<3){
                            ?>
                            <a href="<?php echo site_url("$row[pinyin]/$row1[pinyin]/")?>"><?php echo $row1['title']?></a>
                            <?php }} ?>
                            <a href="<?php echo site_url("$row[pinyin]/")?>">更多</a>
                        </span>
                        <?php }else{?>
                        <h2><a href="<?php echo site_url("$row[pinyin]/")?>"><?php echo $row['title']?></a></h2>
                        <?php }?>
                    </li>
                </ul>
                <?php }?>
                <div class="blank5"></div>
            </div>
            <?php }?>
            
            <?php if($newlistimg!=''){ ?>
            <div class="blank10"></div>
            <div class="bor">
                <div class="title"><h4>最新更新</h4></div>
                <ul class="new_list">
                    <?php
                     foreach($newlistimg as $row){
                        if($row['price']){
                     ?>
                    <li>
                        <p><a class="newlistimg_a" href="<?php echo site_url("$row[pinyin]/$row[infoid].html")?>"><img src="<?php echo $row['tpic']?>"/><span class="img_desc"><?php echo $row['title']?></span></a></p>
                        <p><span class="fl"><em><?php echo $row['price']?></em></span><span class="fr"><?php echo $row['refreshtime']?></span></p>
                    </li>
                    <?php }}?>
                </ul>
                <div class="blank15"></div>
            </div>
            <?php }?>
            
            <div class="small_nav cc mt10">
            <?php
                if($searchTab){    //标志为searchTab的代码段 ?>
               <?php include($searchTab); 
                }else{ ?>
                <ul class="list_head cc ml10">
                    <li class="active"><a><?php echo $current_cat['title']?></a></li>
                </ul>
                <?php }?>
            </div>
            <!-- 信息列表 -->
            <ul class="mianlist wordlist">
                <?php foreach($info as $row){?>
                    <li>
                        <div class="fl">
                            <a target="_blank" href="<?php echo site_url("$row[pinyin]/$row[infoid].html")?>"><?php echo $row['title']?></a>
                            <em><?php echo $row['catname']?></em>
                        </div>
                        <span class="ml_time fr"><?php echo $row['refreshtime']?></span>
                    </li>
                <?php }?>
            </ul>
            <div class="blank15"></div>
            <div class="pages" align="center"><?php echo $pages?></div>
            <?php include template("footer")?>
        </div>
    </body>
</html>
<script language="javascript" src="<?php echo TPL?>/js/jquery.js"></script>
<script language="javascript" src="<?php echo TPL?>/js/common.js"></script>