<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>选择信息分类_济宁分类001</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="icon" href="<?php echo TPL?>/images/favicon.ico"/>
        <link href="<?php echo TPL?>/css/style.css" rel="stylesheet" type="text/css" />
        <link href="<?php echo TPL?>/css/fabu.css" rel="stylesheet" type="text/css" />
        <script language="javascript">var tpl = "<?php echo TPL ?>";</script>
    </head>
    <body>
        <?php include template("user/header")?>
        <div class="wapper">
            <div class="fabu_content">
                <h4>免费发布信息</h4>
                <div class="cc" id="publish_body" style="position: relative; overflow: hidden;">
                    <ul id="cate1" v=1>
                        <?php foreach($cate as $row){?>
                        <li><a href="#" v="<?php echo $row['cid']?>" <?php if($fcid==$row['cid']){?> class="on" <?php }?>><?php echo $row['title']?></a></li>
                        <?php }?> 
                    </ul>
                </div>
            </div>
        </div>
        <div class="blank20"></div>
        <?php include template("footer")?>
    </body>
    </html>
    <script type="text/javascript" src="<?php echo TPL?>/js/jquery.js"></script>
    <script data-cfg-corelib="<?php echo TPL?>/js/jquery.js"  type="text/javascript" src="<?php echo TPL?>/js/do.js"></script>
    <script language="javascript" src="<?php echo TPL?>/js/fabu.js"></script>
    <script type="text/javascript">
        var base = "<?php echo site_url()?>";
        var pids = "<?php echo $pids?>";
        var cid = "<?php echo $cid?>";
        var infoid = "<?php echo $infoid?>";
        pids = pids.split(',');
        Do(function(){
            //初始化时
            if(pids!=''){
                for(var i=1;i<=pids.length;i++){
                    get_type(i);
                }
            }

            //信息分类点击时
            $("#publish_body ul li a").live("click",function(){
                var v=$(this).parent().parent().attr("v");  //层级
                $("#cate"+v).find("li a").removeClass("on");
                $(this).addClass("on");
                get_type(v);
            })
            
            //关闭第三级窗口
            $(".close,.back").live("click",function(){
                $("#cate3").animate({left:"928px"},"slow",function(){
                    $(this).hide();
                    $("#cate1").removeClass();
                    $("#cate2").removeClass();
                });
            })
            
            //cate1指向时去除遮罩
            $("#cate1").mouseover(function(){
                $("#cate1").removeClass();
            })
        })
    </script>