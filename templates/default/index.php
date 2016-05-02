<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>易搜网_免费查询发布各类济宁分类信息</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="icon" href="<?php echo TPL?>/images/favicon.ico"/>
        <link href="<?php echo TPL?>/css/style.css" rel="stylesheet" type="text/css" />
        <link href="<?php echo TPL?>/css/index.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <?php include template("header")?>
        <div class="wapper">
            <div class="blank15"></div>
            <!-- 滚动图片 -->
            <a class="btnPre" onclick="picList('pre')" id="btnPre"></a>
            <div class="mainDiv fl" id="slide">
                <ul id="myList" style="left:0">
                    <?php
                     foreach($newlistimg as $row){
                        if($row['price']){
                     ?>     
                    <li>
                        <a title="<?php echo $row['title']?>" class="newlistimg_a" href="<?php echo site_url("$row[pinyin]/$row[infoid].html")?>"><img src="<?php echo $row['tpic']?>"/><span class="img_desc"><?php echo cut_str($row['title'],20)?></span></a>
                    </li>
                    <?php }}?>
                </ul>
            </div>
            <a class="btnNext" onclick="picList('next')" id="btnNext"></a>
            <div class="blank15"></div>
            <!-- 分类 -->
            <div class="category cc">
                <div class="col1">
                    <?php echo get_catlist(1,5,1)?>
                    <?php echo get_catlist(263,7,1)?>
                    <?php echo get_catlist(307,4,1)?>
                    <?php echo get_catlist(647,4)?>
                </div>
                <div class="col2">
                    <?php echo get_catlist(2,20,1)?>
                    <?php echo get_catlist(4,4)?>
                </div>
                <div class="col2">
                    <?php echo get_catlist(3,20)?>
                </div>
                <div class="col3">
                    <?php echo get_catlist(6,20,1)?>
                    <?php echo get_catlist(422,20,1)?>
                    <?php echo get_catlist(5,10)?>
                </div>
            </div>
            <div class="sever cc mt10">
                <div class="sever_tit">服务中心<span>客服电话：15053778060</span></div>
                <ul class="sever_list">
                    <li class="dianhua"><a href="<?php echo site_url("help/2.html#article8")?>">电话被冒用</a></li>
                    <li class="shanchu"><a href="<?php echo site_url("help/2.html#article7")?>">我要删除信息</a></li>
                    <li class="tuiguang"><a href="<?php echo site_url("help/4.html#article110")?>">我要推广信息</a></li>
                    <li class="kuaizhao"><a target="_blank" rel="nofollow" href="http://tousu.baidu.com/webmaster/add">删除百度快照</a></li>
                    <li class="buxianshi"><a href="<?php echo site_url("help/3.html#article11")?>">信息不能显示</a></li>
                    <li class="tiqian"><a href="<?php echo site_url("help/4.html#article9")?>">信息如何提前</a></li>
                    <li class="renzhen"><a href="<?php echo site_url("user/usercard/")?>">我要认证</a></li>
                    <li class="tousu"><a class="feedback">我要投诉</a></li>
                </ul>
            </div>
            <dl class="cc flink mt10">
                <dt class="fw">友情链接</dt>
                <dd><a target="_blank" href="http://www.xingfunancun.com">乌海幸福南村网</a></dd>
                <dd><a target="_blank" href="http://bbs.jyyuan.com">江阴论坛</a></dd>
                <dd><a target="_blank" href="http://www.kunming100.com">昆明论坛</a></dd>
                <dd><a target="_blank" href="http://www.huzhulu.com">互助路社区</a></dd>
                <dd><a target="_blank" href="http://bbs.luanren.com">六安人论坛</a></dd>
                <dd><a target="_blank" href="http://www.0519.com">常州网址导航</a></dd>
                <dd><a target="_blank" href="http://bbs.dazhoushan.com">舟山论坛</a></dd>
                <dd><a target="_blank" href="http://www.nbxsr.com">象山人</a></dd>
                <dd><a target="_blank" href="http://www.wuhu.cc">芜湖热线</a></dd>
                <dd><a target="_blank" href="http://bbs.jintanwang.com">金坛论坛</a></dd>
                <dd><a target="_blank" href="http://www.gaizhui.com">免费发布信息网</a></dd>
                <dd><a target="_blank" href="http://www.ak1210.com">ak1210分类信息网站</a></dd>
                <dd><a target="_blank" href="http://bbs.tmh.com.cn">天目湖论坛</a></dd>
                <dd><a target="_blank" href="http://www.wjshw.com">吴江生活网</a></dd>
                <dd><a target="_blank" href="http://sd.3158.cn">3158财富齐鲁</a></dd>
                <dd><a target="_blank" href="http://www.changzhi8.com">长治发信息网</a></dd>
                <dd><a target="_blank" href="http://www.c3618.cn">宁波生活</a></dd>
                <dd><a target="_blank" href="http://www.jsly001.com">溧阳论坛</a></dd>
                <dd><a target="_blank" href="http://www.masgq.com">马鞍山信息网</a></dd>
                <dd><a target="_blank" href="http://job.168hs.com">黄山人才网</a></dd>
                <dd><a target="_blank" href="http://www.weizhang.cn">驾驶证违章查询</a></dd>
                <dd><a target="_blank" href="http://www.yamei.com">钻石珠宝论坛</a></dd>
                <dd><a target="_blank" href="http://shanghai.qd8.com.cn">上海分类信息</a></dd>
            </dl>
            
            <p class="footer">
                
                <span>免责声明：本站只提供信息发布平台，信息的真实性由用户自行甄别！</span><br />
                &copy;2016 <a href="<?php echo site_url("")?>">济宁分类信息</a>&nbsp;&nbsp;&nbsp;<a href="http://m.yiiso.cn">触屏版</a>&nbsp;|&nbsp;<a href="http://www.yiiso.cn">电脑版</a>
            </p>
        </div>
    </body>
</html>
<script type="text/javascript" src="<?php echo TPL?>/js/jquery.js"></script>
<script type="text/javascript" src="<?php echo TPL?>/js/common.js"></script>
<script type="text/javascript" type="text/javascript">
    var sWidth = 114;//单个容器宽度(包括边距，填充),PS:每次位移距离
    var visible = 8;//显示数量
    var bWidth ;//容器宽度
    var listLength ;//列表图片个数
    var listWidth ;//列表宽度
    var listLeft ;//列表位置
    var bId; //大容器ID
    var listId;//列表ID
    var trendLeft;//变化侧栏值
    var maxMr;
    var mr = 0;
    function init(){
        bId = $("#bigDiv");
        listId = $("#myList");
        bWidth = bId.width();
        listLength = listId.find("li").length;
        listWidth = listLength*sWidth;
        listLeft =parseInt(listId.css('left'));
    }
    function picList(fx){
        init();
        maxMr = listLength - visible ;
        if(listWidth>bWidth){
            if(fx=='next'){
                if(-mr < maxMr){
                    mr=mr-8;//每次移动的个数如果我们要移动7个，则为 mr = mr-7;
                    trendLeft = mr*sWidth;
                    listId.animate({
                    left:trendLeft + "px"
                    },200);
                }
            }else if(fx=='pre'){            
                if( mr < 0){
                    mr=mr+8;
                    trendLeft = mr*sWidth;
                    listId.animate({
                    left:trendLeft + "px"
                    },200);
                }
            }
        }  
        
        if(-mr==maxMr){
            $("input#btnNext").attr("disabled","disabled");
        }else if(mr==0){
            $("input#btnPre").attr("disabled","disabled");
        }else{
            $("input#btnNext").attr("disabled","");
            $("input#btnPre").attr("disabled","");
        }
    }
    $(function(){
        picList();   //初始化
    })
</script>