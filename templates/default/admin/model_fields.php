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
            <form id="post_form" method="post" action="<?php echo site_url("admin/userdo/?act=model_fields&mid=$mid")?>" target="hiddenifr">
            <table border="0" class="mt10" cellpadding="1" cellspacing="1">
            <tr>
                <td colspan="5">
                    模型名称：<input type="text" class="textInt" size="15" name="title" value="<?php echo $model['title']?>"/>
                    排序：<input type="text" class="textInt" size="6" name="sort" value="<?php echo $model['sort']?>"/>
                </td>
            </tr>
            <tr>
                <td width="30">选择</td>
                <td width="100">字段名称</td>
                <td width="120">数据库字段标识</td>
                <td width="120">数据库字段类型</td>
                <td width="100">输入类型</td>
            </tr>
            <?php foreach($fields as $row){
            ?>
            <tr <?php if(in_array($row['fid'],$field_id)){?> class="bgon" <?php }?>>
                <td align="center"><input type="checkbox" name="fid[]" value="<?php echo $row['fid']?>" <?php if(in_array($row['fid'],$field_id)){?> checked="" <?php }?>/></td>
                <td><a target="_blank" href="<?php echo site_url("admin/field_post/$row[fid]/")?>"><?php echo $row['title']?></a></td>
                <td><?php echo $row['field']?></td>
                <td><?php echo $row['field_type']?></td>
                <td><?php echo $row['input_type']?></td>
            </tr>
            <?php }?>
            <tr><td colspan="6"><input type="button" id="ok" value="保存设置"/>&nbsp;&nbsp;<input onclick="location.href='<?php echo site_url("admin/models/")?>';" type="button" value="返回模型列表"/>&nbsp;&nbsp;<span id="msg" class="fred"></span></td></tr>
            </table></form>
        </div>
    </body>
</html>

<script language="javascript">
    $(function(){
        
        $("tr").mouseover(function(){
            $(this).css('background-color','#efefef');
        }).mouseout(function(){
            $(this).css('background-color','#ffffff');
        })
        
        $("input[type=checkbox]").each(function(i){
            $(this).click(function(){
                if($(this).attr("checked")){    //checkbox选中
                    $(this).parent().parent().addClass('bgon');
                } else {
                    $(this).parent().parent().removeClass('bgon');
                }
            }) 
        })
        
        $("#ok").click(function(){
            var mid = "<?php echo $mid?>";
            var pre = "<?php echo $table?>";
            if(mid!=0 && !confirm("慎重操作：\n\n修改模型后，依据此模型建立的信息附加表"+pre+"info_"+mid+"表的结构将同步改变;\n确定要修改吗？")){
                return;
           } else {
                $("#msg").html("<span class=fgreen>正在提交...</span>");
                $("#post_form").submit();
           }
        })
    })
</script>