<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
    	<title>选项管理_后台管理</title>
        <link rel="icon" href="<?php echo TPL?>/images/favicon.ico"/>
        <link rel="stylesheet" type="text/css" href="<?php echo TPL?>/css/style.css" />
        <link rel="stylesheet" type="text/css" href="<?php echo TPL?>/css/admin.css" />
    </head>
    <body>
        <iframe name="hiddenifr" width="0" height="0" frameborder="0"></iframe>
        <div class="box">
            <?php include template("admin/top")?>
            <ul  class="mt10">
                <?php foreach($options as $row){?>
                <li>分类"<?php echo $row['cat_name']?>"的 <?php echo $row['field_name']?>&nbsp;&nbsp;&nbsp;<a class="uline f666" href="<?php echo site_url("admin/option_post/$row[oid]/")?>">修改</a>&nbsp;|&nbsp;<a class="f666 uline" href="<?php echo site_url("admin/userdo/?act=del_option&id=$row[oid]")?>">删除</a></li>
                <?php }?>
            </ul>
            &nbsp;&nbsp;
         <input onclick="location.href='<?php echo site_url("admin/option_post/")?>';" type="button" value=" 增加新选项 "/>
        </div>
    </body>
</html>