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
            <div class="mt10"><input onclick="location.href='<?php echo site_url("admin/field_post/")?>';" type="button" value=" 增加新字段 "/></div><br />
            <table border="0" cellspacing="1" cellpadding="2" bgcolor="#ccc" class="f12">
            <tr>
                <td bgcolor="#efefef" width="100">&nbsp;字段名称</td>
                <td bgcolor="#efefef"  width="100">&nbsp;数据库字段标识</td>
                <td bgcolor="#efefef"  width="100">&nbsp;数据库字段类型</td>
                <td bgcolor="#efefef"  width="100">&nbsp;输入类型</td>
                <td bgcolor="#efefef">&nbsp;应用模型</td>
                <td bgcolor="#efefef"  align="center" width="100">管理</td>
            </tr>
            <?php foreach($fields as $row){?>
            <tr id="row_<?=$row['fid']?>">
                <td bgcolor="white" >&nbsp;<?php echo $row['title']?></td>
                <td bgcolor="white" >&nbsp;<?php echo $row['field']?></td>
                <td bgcolor="white" >&nbsp;<?php echo $row['field_type']?></td>
                <td bgcolor="white" >&nbsp;<?php echo $row['input_type']?></td>
                <td bgcolor="white" >&nbsp;<?php echo $row['mod']?></td>
                <td bgcolor="white"  align="center"><a class="f666 uline" href="<?php echo site_url("admin/field_post/$row[fid]/")?>">修改</a>&nbsp;|&nbsp;<a class="f666 uline" href="javascript:del('<?=$row['fid']?>');">删除</a></td>
            </tr>
            <?php }?>
            </table><br />
            <input onclick="location.href='<?php echo site_url("admin/field_post/")?>';" type="button" value=" 增加新字段 "/>
        </div>
    </body>
</html>

<script type="text/javascript">
    var base = "<?php echo site_url()?>";
    $(function(){
        $("tr").mouseover(function(){
            $(this).find("td").css('background-color','#efefef');
        }).mouseout(function(){
            $(this).find("td").css('background-color','#ffffff');
        })
    })
    
    function del(id){
        if(!confirm('确定删除此字段吗？'))return false;
        $.get(base+'admin/userdo/?act=field_del&fid='+id,function(msg){
            if(msg=='ok'){
                $('#row_'+id).hide();
            } else {
                alert(msg);
            }
        });
    }
</script>