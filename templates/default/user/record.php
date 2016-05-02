<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>用户中心_济宁分类信息网</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="icon" href="<?php echo TPL?>/images/favicon.ico"/>
        <link href="<?php echo TPL?>/css/style.css" rel="stylesheet" type="text/css" />
        <link href="<?php echo TPL?>/css/user.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <?php include template("user/header")?>
        <div class="blank5"></div>
        <div class="wapper">
            <div class="bread_nav"><a href="<?php echo site_url()?>">济宁分类信息</a> &gt; <a href="<?php echo site_url("user/")?>">用户中心</a></div>
            <div class="user_main cc">
                <!-- 左侧 -->
                <div class="user_left">
                    <h3>他发布的信息</h3>
                    <ul>
                        <li class="on"><a href="<?php echo site_url("user/$userid")?>">全部信息</a></li>
                    </ul>
                   
                    <h3>帮助中心</h3>
                    <ul>
                        <li><a href="<?php echo site_url("help/1.html")?>" target="_blank">新手入门</a></li>
                        <li><a href="<?php echo site_url("help/6.html")?>" target="_blank">防骗宝典</a></li>
                        <li><a href="<?php echo site_url("help/7.html")?>" target="_blank">认证服务</a></li>
                    </ul>
            </div>
                <!-- 右侧 -->
                <div class="user_right">
                    <span class="big_title">他发布的信息</span>
                    <div class="blank20"></div>
                    <ul class="info_list">
                        <li class="first">
                            <div class="title"><label>标题</label></div>
                            <div class="operate">更新时间</div>
                        </li>
                        <?php foreach($info as $row){?>
                         <li class="h35">
                            <div class="title">
                                <a class="f14" href="<?php echo site_url("$row[pinyin]/$row[infoid].html")?>" target="_blank"><?php echo $row['title']?></a>
                                <em><?php echo $row['type']?></em>
                            </div>
                            <div class="operate">
                                <?php echo $row['refreshtime']?>
                            </div>
                         </li>
                         <?php }?>
                    </ul>
                    <div class="blank20"></div>
                    <div class="pages tal cc"><?php echo $pages?></div>
                </div>
            </div>
            <?php include template("footer")?>
        </div>
    </body>
</html>