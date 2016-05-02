<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
    	<title>后台管理</title>
        <link rel="icon" href="<?php echo TPL?>/images/favicon.ico"/>
        <link rel="stylesheet" type="text/css" href="<?php echo TPL?>/css/style.css" />
        <link rel="stylesheet" type="text/css" href="<?php echo TPL?>/css/admin.css" />
    </head>
    <body>
        <iframe name="hiddenifr" width="0" height="0" frameborder="0"></iframe>
        <div class="box">
            <?php include template("admin/top")?>
            <ul class="mt10">
                <?php foreach($model as $row){?>
                <li><?php echo $row['title']?>&nbsp;&nbsp;<a class="uline f666" href="<?php echo site_url("admin/model_fields/$row[mid]/")?>">修改</a>&nbsp;|&nbsp;<a class="f666 uline" href="">删除</a></li>
                <?php }?>
            </ul>
            <br />&nbsp;&nbsp;
            <input onclick="location.href='<?php echo site_url("admin/model_fields/")?>';" type="button" value=" 增加新模型 "/>
        </div>
    </body>
</html>