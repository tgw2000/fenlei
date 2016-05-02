<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>济宁分类信息门户--搜济宁</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="icon" href="<?php echo TPL?>/images/favicon.ico"/>
        <link href="<?php echo TPL?>/css/style.css" rel="stylesheet" type="text/css" />
        <link href="<?php echo TPL?>/css/info.css" rel="stylesheet" type="text/css" />
        <link href="<?php echo TPL?>/css/search.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <?php include template("header")?>
        <div class="wapper mt10">
            <div id="bread_nav"><?php echo $nav ?></div>
            <div class="bor cc mt5">
                <div class="blank5"></div>
                <div class="f14 cc">
                <?php if($children){?>
                <dl class="type_list_body">
                    <dt>小类：</dt>
                    <dd>
                        <ul>
                            <?php if($cid==$second_cat['cid']){?>
                                    <li class="on">全部</li>
                                <?php }else{ ?>                                                                                            
                                <li ><a href="<?php echo site_url("$second_cat[pinyin]/")?>">全部</a></li>
                            <?php } foreach($children as $row){?>
                                <?php if($cid==$row['cid']){?>
                                    <li class="on"><?php echo $row['title']?></li>
                                <?php }else{ ?>                                                                                            
                                <li ><a href="<?php echo site_url("$second_cat[pinyin]/$row[pinyin]/")?>"><?php echo $row['title']?></a></li>
                            <?php }}?>
                        
                        </ul>
                    </dd>
                </dl>
                <?php } foreach($search_label as $row){
                   
                      $field = $row['field'];
                      $$field = $_REQUEST[$field];        //接收地址栏或表单传递的数据
                      $choices = $row['choices'];
                      if($choices){
                ?>
                <dl class="type_list_body">
                    <dt><?php echo $row['title']?>：</dt>
                    <dd>
                        <ul>
                            <?php 
                            if($$field==''){
                            ?>
                            <li><a class="on">全部</a></li>
                            <?php }else{
                                $url = url_par("$field=");   
                            ?>
                                <li ><a href="<?php echo $url ?>">全部</a></li>
                            <?php }foreach($choices as $k=>$v){
                            ?>
                                 <?php if($$field==$k){?>
                                    <li class="on"><?php echo $v ?></li>
                                <?php }else{ 
                                    $url = url_par("$field=$k");    
                                ?>                                                                                            
                                <li ><a href="<?php echo $url ?>"><?php echo $v ?></a></li>
                            <?php }}?>
                        </ul>
                    </dd>
                </dl>
                <?php }} ?>
                
                <form id="headsearch" method="get">
                    <input type="hidden" name="where" value="cate" />
                    <div class="fl child_search">
                        <input type="text" value="<?php echo $keyword ?>" name="keyword" class="input input_clear"/>
                        <input type="submit" value="搜本类" class="icon pbut noinput"/>
                        <div class="blank5"></div>
                    </div>
                </form>
                </div>
            </div>
            
            <div class="small_nav mt10">
                <p class="fr mr10 list_head_publish"><a href="<?php echo site_url("select/$cid/")?>">免费发布济宁<?php echo $current_cat['title']?>信息&gt;&gt;</a></p>
                <?php
                if($searchTab){    //标志为searchTab的代码段 ?>
               <?php include($searchTab); 
                } else {  ?>
                <ul class="list_head ml10">
                <?php
                 $field = $search_nav[0]['field'];
                 $$field = $_REQUEST[$field];        //接收地址栏或表单传递的数据
                 if($$field==''){?>
                    <li class="active"><a >全部</a></li>
                <?php }else{
                    $url = url_par("$field=");   
                ?>
                <li><a href="<?php echo $url ?>">全部</a></li>
                <?php }foreach($search_nav[0]['choices'] as $k=>$v){?>
                    <?php if($$field==$k){?>
                        <li class="active"><a><?php echo $v ?></a></li>
                    <?php }else{ 
                        $url = url_par("$field=$k");    
                    ?>                                                                                            
                    <li ><a href="<?php echo $url ?>"><?php echo $v ?></a></li>
                <?php }}?>
                </ul>
                <?php }?>
            </div>
            <div class="clear"></div>
            <div class="list_view_type icon"><h2 class="fl"><?php echo $current_cat['title']?></h2></div>
            <!-- 信息列表 -->
           
            <?php
             if($listBlock){    //标志为listBlock的代码段 ?>
               <?php include($listBlock); ?>
             <?php } else{  
                foreach($info as $row){?>
             <ul class="mianlist wordlist">        
                <li>
                    <div class="fl">
                     <a target="_blank" href="<?php echo site_url("$row[pinyin]/$row[infoid].html")?>"><?php echo highlight($row['title'],$keyword)?></a>
                     <em><?php echo $category[$row['cid']]['title']?></em>
                     </div>
                     <span class="ml_time fr"><?php echo $row['refreshtime']?></span>
                </li>
                </ul>
            <?php }}?>
                
            <div class="blank15"></div>
            <div class="pages" align="center"><?php echo $pages?></div>
            <div class="blank10"></div>
            <p class="text_center f14">共 <span class="fw red"><?php echo $total?></span> 条信息，<a href="<?php echo site_url("select/$cid/")?>">马上发一条<?php echo $current_cat['title']?>信息</a></p>
            <?php include template("footer")?>
        </div>
    </body>
</html>
<script language="javascript" src="<?php echo TPL?>/js/jquery.js"></script>
<script language="javascript" src="<?php echo TPL?>/js/common.js"></script>
<script type="text/javascript">
    $(".mianlist li").hover(
        function(){
            $(this).addClass("on");
        },function(){
            $(this).removeClass("on");
        }
    )
</script>