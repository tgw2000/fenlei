<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
    	<title>后台管理</title>
        <link rel="stylesheet" type="text/css" href="<?php echo TPL?>/css/style.css" />
        <link rel="stylesheet" type="text/css" href="<?php echo TPL?>/css/admin.css" />
    </head>
    <body>
        <div class="box">
            <?php include template("admin/top")?>
            <br />
            <input onclick="location.href='<?php echo site_url("admin/article_post/")?>';" type="button" value=" 增加新文章 "/>
            <ul class="mt5">
                <?php foreach($info as $row){?>
                <li>·<a href="<?php echo site_url("help/$row[tid].html#article$row[id]")?>" target="_blank"><?php echo $row['title']?></a>&nbsp;<a class="f12 f666" href="<?php echo site_url("admin/article/?tid=$row[tid]")?>">[<?php echo $row['type']?>]</a>&nbsp;-<?php echo date('Y-m-d',$row['dateline'])?>&nbsp;&nbsp;<a class="uline f666" href="<?php echo site_url("admin/article_post/$row[id]/")?>">修改</a>&nbsp;|&nbsp;<a href="javascript:del('<?=$row['id']?>');" class="f666 uline">删除</a></li>
                <?php }?>
            </ul>
            <div class="pages mt10"><?php echo $pages ?></div>
        </div>
    </body>
</html>

<script type="text/javascript">
    var base = "<?php echo site_url()?>";
    
    function del(id){
        if(!confirm('确定删除此文章吗？'))return false;
        $.get(base+'admin/userdo/?act=del_article&id='+id,function(msg){
            if(msg=='ok'){
                alert('文章删除成功!');
                window.location.reload();
            } else {
                alert('删除失败,请重试!');
            }
        });
    }
</script>