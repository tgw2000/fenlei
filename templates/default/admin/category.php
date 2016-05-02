<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
    	<title>后台管理</title>
        <link rel="icon" href="<?php echo TPL?>/images/favicon.ico"/>
        <link rel="stylesheet" type="text/css" href="<?php echo TPL?>/css/style.css" />
        <link rel="stylesheet" type="text/css" href="<?php echo TPL?>/css/admin.css" />
    </head>
    <style type="text/css">
        .s1{font-weight: bold;font-size: 14px;}
        .s2{font-weight: normal; padding-left: 15px; font-size: 12px;}
    </style>
    <?php 
        function tree($pid){
            global $table,$db;
            $sql = "select cid,title,pid from {$table}category where pid=$pid order by sort asc";
            $rows = $db->getAll($sql);
            if(!$rows) return;
            if(!$pid){
                $class="s1";
            } else {
                $class="s2";
            }
            $str="<ul class=$class>";
            foreach($rows as $row){
                $str.="<li>|_$row[title]&nbsp;&nbsp;<a class='f666 uline' href=".site_url("admin/category_post/$row[cid]/").">修改</a>&nbsp;|&nbsp;<a ref=".$row['cid']." class='del f666 uline' href='javascript:void();'>删除</a></li>";
                $child = tree($row['cid']);
                if($child) $str.=$child;
            }
            $str.="</ul>";
            return $str;
        }
    ?>
    <body>
        <iframe name="hiddenifr" width="0" height="0" frameborder="0"></iframe>
        <div class="box">
            <?php include template("admin/top")?>
            <br />&nbsp;&nbsp;
            <input onclick="location.href='<?php echo site_url("admin/category_post/")?>';" type="button" value=" 增加新分类 "/>&nbsp;
            <input onclick="location.href='<?php echo site_url("admin/category_post_more/")?>';" type="button" value=" 批量添加 "/><br />
            <?php echo tree(0);?>
            &nbsp;&nbsp;
         <input onclick="location.href='<?php echo site_url("admin/category_post/")?>';" type="button" value=" 增加新分类 "/>&nbsp;
         <input onclick="location.href='<?php echo site_url("admin/category_post_more/")?>';" type="button" value=" 批量添加 "/>
        </div>
    </body>
</html>

<script type="text/javascript">
   $(function(){
        $('.del').click(function(){
            if(!confirm('将会删除此分类及所有子类，确定吗？')) return false;
            var id = $(this).attr('ref');
            $.get('/admin/userdo/?act=del_category&id='+id,function(msg){
                if(msg=='ok'){
                    alert('删除成功！');
                    window.location.reload();
                } else {
                    alert(msg);
                }
            });
        });
    
   })
</script>