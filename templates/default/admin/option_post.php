<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
    	<title>添加、修改字段选项值_后台管理</title>
        <link rel="icon" href="<?php echo TPL?>/images/favicon.ico"/>
        <link rel="stylesheet" type="text/css" href="<?php echo TPL?>/css/style.css" />
        <link rel="stylesheet" type="text/css" href="<?php echo TPL?>/css/admin.css" />
    </head>
    <body>
        <iframe name="hiddenifr" width="0" height="0" frameborder="0"></iframe>
        <div class="box">
            <?php include template("admin/top")?><br />
            <form method="post" id="post_form" action="<?php echo site_url("admin/userdo/?act=option_post&oid=$oid")?>" target="hiddenifr">
            <table border="0" class="fabu_table">
            <tr>
                <td align="right">所属分类：</td>
                <td>
                    <span id="sel">
                        <select name="sel[]" id="type_1" onchange="get_type(1)">
                            <?php foreach($type as $row){?>
                            <option <?php if($f_cid==$row['cid']){?> selected="" <?php }?> value="<?php echo $row['cid']?>"><?php echo $row['title']?></option>
                            <?php } ?>
                        </select>
                    </span>
                </td>
            </tr>
            <tr>
                <td align="right">所属字段：</td>
                <td>
                    <span id="fid">
                        <select name="fid" style="height: 20px; font-size: 14px;">
                            <option value="0">-请选择字段-</option>
                            <?php foreach($fields as $row){?>
                            <option <?php if($info['fid']==$row['fid']){?> selected="" <?php }?> value="<?php echo $row['fid']?>"><?php echo $row['title']?>(<?php echo $row['field']?>)-<?php echo $row['input_type']?></option>
                            <?php }?>
                        </select>
                    </span>
                </td>
            </tr>
            <tr>
                <td align="right">选项内容：</td>
                <td>  
                  <div class="fl"><textarea name="options" cols="35" rows="5" class="textInt"><?php echo $info['options']?></textarea></div>
                  <div class="f999 f12 fl" style="line-height: 15px; padding-left: 5px;">只在项目为可选时有效，每行一个选项，等号前面为选项索引(建议用数字)，后面为内容，例如:<br/><i>1=苹果<br/>2=香蕉<br/>3=菠萝</i><br/>注意: 选项确定后请勿修改索引和内容的对应关系...调换显示顺序，可以通过移动整行的前后位置来实现</div>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="button" id="ok" value="保存设置"/>&nbsp;&nbsp;<input onclick="location.href='<?php echo site_url("admin/options/")?>';" type="button" value="返回选项列表"/>&nbsp;&nbsp;
                    <span id="msg" class="fred"></span>
                </td>
            </tr>
            </table></form>
        </div>
    </body>
</html>

<script language="javascript">
    var base = "<?php echo site_url()?>";
    var pids = "<?php echo $pids?>";
    pids = pids.split(',');
    //获取分类
    function get_type(num){
        var pid = $('#type_'+num).val();      //上级分类id
        var nownum = parseInt(num)+1;       // 级别，将字符串转换为数字
        var val = pids[num];
        if(typeof(val)=='undefined') val = "<?php echo $info['cid']?>";        
        if(!pid){
            //清空所有子节点
            $("#sel select").each(function(i){  
                if(i+1 > num) {
                    $(this).remove();
                }
            })
        } else {
             $.ajax({
                type: "get", 
                url: base+"admin/userdo",
                data: {"act":"get_type" , "pid":pid },
                async: false,
                dataType: "json",
                error: function() { alert('小类读取失败，请刷新！'); },
                success: function(result) {        
                    if ( result != 0) {    
                        var html = "<select name='sel[]' id=type_"+nownum+" onchange=get_type("+nownum+")>";
                        html += "<option value=''>-所有小类-</option>";
                        var datas = eval(result);
                        $.each(datas, function(i,item) {     //msg是二维对象，item是取一维对象
                            if(item.cid==val){
                                var sel = "selected=''";
                            } else {
                                var sel = '';
                            }
                            html += "<option "+sel+" value='" + item.cid + "'>" + item.type + "</option>";
                        });  
                        html += "</select>";
                        
                        //清空过时的选项
                        $("#sel select").each(function(i){
                            if(i+1 > num) {
                                $(this).remove();
                            }
                        })
                        $("#sel").append(html);
                    }else {
        　　　　　　　　//清空过时的选项
                        $("#sel select").each(function(i){
                            if(i+1 > num) $(this).remove();   
                        })
    　　　　　　    }
                }
            });
        }   
    }
    $(function(){    
        $("#ok").click(function(){
            $("#msg").html("<span class=fgreen>正在提交...</span>");
            $("#post_form").submit();
        })
        
        for(var i=1;i<=pids.length;i++){
            get_type(i);
        }
        
        $("#sel").find("select:last").live("change",function(){
            var cid = $(this).val();
            var fid = "<?php echo $info['fid']?>";
            if(!cid) return;
            $.ajax({
                type: "get", 
                url: base+"admin/userdo",
                data: {"act":"get_fields" , "cid":cid},
                async: false,
                dataType: "json",
                error: function() { alert('小类读取失败，请刷新！'); },
                success: function(result) {        
                    if( result != 0) {    
                        var html = "<select name=fid>";
                        html += "<option value=''>-选择字段-</option>";
                        var datas = eval(result);
                        $.each(datas, function(i,item) {     //msg是二维对象，item是取一维对象
                            if(item.fid==fid){
                                var sel = "selected=''";
                            } else {
                                var sel = '';
                            }
                            html+="<option "+sel+" value='" + item.fid + "'>" + item.title + "(" + item.field + ")-" + item.input_type + "</option>";
                        });  
                        html += "</select>";
                        $("#fid").html(html);
                    }
                }
            }); 
        });
    })
</script>