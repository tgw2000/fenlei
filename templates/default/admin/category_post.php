<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
    	<title>添加、修改信息分类_后台管理</title>
        <link rel="icon" href="<?php echo TPL?>/images/favicon.ico"/>
        <link rel="stylesheet" type="text/css" href="<?php echo TPL?>/css/style.css" />
        <link rel="stylesheet" type="text/css" href="<?php echo TPL?>/css/admin.css" />
    </head>
    <body>
        <iframe name="hiddenifr" width="0" height="0" frameborder="0"></iframe>
        <div class="box">
            <?php include template("admin/top")?><br />
            <form method="post" id="post_form" action="<?php echo site_url("admin/userdo/?act=category_post&cid=$cid")?>" target="hiddenifr">
            <table border="0" class="fabu_table">
            <tr>
                <td align="right" width="115">分类名称：</td>
                <td><input type="text" class="textInt" size="30" name="title" value="<?php echo $info['title']?>"/>
                    <select name="color">
                    <option value="">默认标题颜色</option>
                    <option style="background-color:#ff0000;" value="#ff0000">#ff0000</option>
                    <option style="background-color:#006ffd;" value="#006ffd">#006ffd</option>
                    <option style="background-color:#444444;" value="#444444">#444444</option>
                    <option style="background-color:#000000;" value="#000000">#000000</option>
                    <option style="background-color:#f54100;" value="#f54100">#f54100</option>
                    <option style="background-color:#46a200;" value="#46a200">#46a200</option>
                    <option style="background-color:#ff9900;" value="#ff9900">#ff9900</option>
                    <option style="background-color:#ffffff;" value="#ffffff">#ffffff</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td align="right">栏目拼音：</td>
                <td><input type="text" class="textInt" size="20" name="pinyin" value="<?php echo $info['pinyin']?>"/></td>
            </tr>
            <tr>
                <td align="right">所属分类：</td>
                <td>
                    <span id="sel">
                        <select name="sel[]" id="type_1" onchange="get_type(1)">
                            <option value="">作为一级分类</option>
                            <?php foreach($type as $row){?>
                            <option <?php if($f_cid==$row['cid']){?> selected="" <?php }?> value="<?php echo $row['cid']?>"><?php echo $row['title']?></option>
                            <?php } ?>
                        </select>
                    </span>
                </td>
            </tr>
            <tr>
                <td align="right">排列顺序：</td>
                <td><input type="text" class="textInt" size="10" name="sort" value="<?php echo $info['sort']?>"/></td>
            </tr>          
            <tr>
                <td align="right">分类说明：</td>
                <td>  
                  <textarea name="description" cols="50" rows="5"><?php echo $info['description']?></textarea>
                </td>
            </tr>
            <tr>
                <td align="right">代码调用：</td>
                <td>
                <?php 
                $code_ids = explode(',',$info['codes']);
                foreach($codes as $k=>$row){
                ?>
                  <input name="codes[]" type="checkbox" value="<?php echo $row['id']?>" <?php if(in_array($row['id'],$code_ids)){?> checked="" <?php }?>/> <?php echo $row['title']?>&nbsp;
                <?php if($k&&$k%4==0) echo("<br/>"); ?>
                <?php }?>
                
                </td>
            </tr>
            <?php if($cid){?>
            <tr>
                <td align="right">选项：</td>
                <td><input type="checkbox" name="opt" value="1"/> 子类使用相同设置</td>
            </tr>
            <?php }?>
            <tr>
                <td align="right">应用模型：</td>
                <td>
                    <select name="mid" style="height: 20px; font-size: 14px;">
                        <option value="0">-请选择模型-</option>
                        <?php foreach($models as $row){?>
                        <option <?php if($info['mid']==$row['mid']){?> selected="" <?php }?> value="<?php echo $row['mid']?>"><?php echo $row['title']?></option>
                        <?php }?>
                    </select> &nbsp;<a target="_blank" href="<?php echo site_url("admin/models/")?>">模型管理</a>
                </td>
            </tr>
            <tr>
                <td align="right">关键字：</td>
                <td>  
                  <input name="keywords" size="40" class="textInt" value="<?php echo $info['keywords']?>"/>
                </td>
            </tr>
            <tr>
                <td align="right">列表页模板：</td>
                <td>  
                  <input name="tpl[list]" size="40" class="textInt" value="<?php echo $tpl['list']?>"/>
                </td>
            </tr>
            <tr>
                <td align="right">内容页模板：</td>
                <td>  
                  <input name="tpl[view]" size="40" class="textInt" value="<?php echo $tpl['view']?>"/> 
                </td>
            </tr>
            <tr>
                <td align="right">发布页模板：</td>
                <td>  
                  <input name="tpl[post]" size="40" class="textInt" value="<?php echo $tpl['post']?>"/> 
                </td>
            </tr>    
            <tr><td></td><td>
            <div class="f999 f12">路径相对于template/模板目录,不包含扩展名，留空则使用默认值！</div>
            <input type="button" id="ok" value="保存设置"/>&nbsp;&nbsp;<input onclick="location.href='<?php echo site_url("admin/category/")?>';" type="button" value="返回栏目列表"/>&nbsp;&nbsp;<span id="msg" class="fred"></span></td></tr>
            </table></form>
        </div>
    </body>
</html>

<script language="javascript">
    var base = "<?php echo site_url()?>";
    var cid = "<?php echo $cid?>";
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
                data: {"act":"get_type" , "pid":pid , "cid":cid },
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
    })
</script>