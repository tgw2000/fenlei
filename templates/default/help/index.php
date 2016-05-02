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
            <?php foreach($type as $row){?>
            <dl class="help_list cc">
                <dt><?php echo $row['type']?></dt>
                <dd>
                    <?php
                    $sql = "select * from {$table}article where tid=$row[tid] order by id asc";
                    $info = $db->getAll($sql);
                     foreach($info as $row1){?>
                        <a href="<?php echo site_url("help/$row1[tid].html#article$row1[id]")?>"><?php echo $row1['title']?></a>
                    <?php }?>
                </dd>
            </dl>
            <?php }?>
            <div class="blank15"></div>
            <?php include template("footer")?>
        </div>
    </body>
</html>
<script language="javascript" src="<?php echo TPL?>/js/jquery.js"></script>
<script language="javascript" src="<?php echo TPL?>/js/common.js"></script>