<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
    	<title>添加、修改字段_后台管理</title>
        <link rel="icon" href="<?php echo TPL?>/images/favicon.ico"/>
        <link rel="stylesheet" type="text/css" href="<?php echo TPL?>/css/style.css" />
        <link rel="stylesheet" type="text/css" href="<?php echo TPL?>/css/admin.css" />
    </head>
    <body>
        <iframe name="hiddenifr" width="0" height="0" frameborder="0"></iframe>
        <div class="box">
            <?php include template("admin/top")?><br />
            <form method="post" id="post_form" action="<?php echo site_url("admin/userdo/?act=field_post&fid=$fid")?>" target="hiddenifr">
            <table border="0" class="fabu_table">
            <tr>
                <td align="right" width="115">字段名称：</td>
                <td><input type="text" class="textInt" size="20" name="title" value="<?php echo $info['title']?>"/></td>
            </tr>
            <tr>
                <td align="right">数据库字段：</td><td><input type="text" class="textInt" size="20" name="field" value="<?php echo $info['field']?>"/> <span class="f999 f12">数据库字段标识，唯一不能重复</span></td>
            </tr>
            <tr>
                <td align="right">数据库字段类型：</td>
                <td>
                    <select name="field_type" style="width: 200px; height: 20px; font-size: 14px;">
                        <option <?php if($info['field_type']=='varchar'){?> selected="" <?php }?> value="varchar">255个字符串之内(varchar)</option>
                        <option <?php if($info['field_type']=='int'){?> selected="" <?php }?> value="int">10位之内纯数字式(int)</option>
                        <option <?php if($info['field_type']=='mediumtext'){?> selected="" <?php }?> value="mediumtext">文本文档(mediumtext)</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td align="right">输入类型：</td>
                 <td>
                    <select name="input_type" id="input_type" style="width: 140px; height: 20px; font-size: 14px;">
                        <option <?php if($info['input_type']=='text'){?> selected="" <?php }?> value="text">文本框(text)</option>
                        <option <?php if($info['input_type']=='textarea'){?> selected="" <?php }?> value="textarea">文本域(textarea)</option>
                        <option <?php if($info['input_type']=='radio'){?> selected="" <?php }?> value="radio">单选钮(radio)</option>
                        <option <?php if($info['input_type']=='checkbox'){?> selected="" <?php }?> value="checkbox">多选框(checkbox)</option>
                        <option <?php if($info['input_type']=='select'){?> selected="" <?php }?> value="select">选择(select)</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td align="right">排列顺序：</td>
                <td><input type="text" class="textInt" size="10" name="sort" value="<?php echo $info['sort']?>"/></td>
            </tr>
            <tr>
                <td align="right">其它属性：</td>
                <td>  
                  <label for="available"><input name="available" id="available" <?php if($info['available']=='on'){?> checked="" <?php }?> type="checkbox"/>可用</label> 
                  <label for="required"><input name="required" id="required"  <?php if($info['required']=='on'){?> checked="" <?php }?> type="checkbox"/>必填</label>
                  <label for="search"><input name="search" id="search" <?php if($info['search']=='on'){?> checked="" <?php }?> type="checkbox"/>参与搜索</label>
                </td>
            </tr>
            <tbody id="s_type">
            <tr>
                <td align="right">搜索类型：</td>
                <td>
                  <input name="s_type[]" value="label" <?php if(in_array('label',$s_type)){?> checked="" <?php }?> type="checkbox"/>标签搜索 
                  <input name="s_type[]" value="nav" <?php if(in_array('nav',$s_type)){?> checked="" <?php }?> type="checkbox"/>导航搜索
                  <input name="s_type[]" value="select" <?php if(in_array('select',$s_type)){?> checked="" <?php }?> type="checkbox"/>列表搜索
                </td>
            </tr>
            </tbody>
            <tr>
                <td align="right">说明：</td>
                <td>  
                  <textarea name="description" cols="40" rows="4"><?php echo $info['description']?></textarea>
                </td>
            </tr>
            <tbody class="tbody" id="t_text" style="display: none;">
            <tr>
                <td align="right">字段长度：</td>
                <td>  
                  <input name="rules[text][length]" size="20" class="textInt" value="<?php echo $rules['length']?>"/> <span class="f999 f12">不填则默认:数字型为10,字符型为255,文本型不必填写</span>
                </td>
            </tr>
            <tr>
                <td align="right">字符宽度：</td>
                <td>  
                  <input name="rules[text][size]" size="20" class="textInt" value="<?php echo $rules['size']?>"/> <span class="f999 f12">不填则默为20</span>
                </td>
            </tr>
            <tr>
                <td align="right">默认值：</td>
                <td>  
                  <input name="rules[text][value]" size="20" class="textInt" value="<?php echo $rules['value']?>"/> <span class="f999 f12">文本框的默认值</span>
                </td>
            </tr>
            <tr>
                <td align="right">单位：</td>
                <td>  
                  <input name="rules[text][units]" size="20" class="textInt" value="<?php echo $rules['units']?>"/> <span class="f999 f12">可选，没有就不用填写</span>
                </td>
            </tr>           
            </tbody>
            <tbody class="tbody" id="t_textarea" style="display: none;">
            <tr>
                <td align="right">字段长度：</td>
                <td>  
                  <input name="rules[textarea][length]" size="20" class="textInt" value="<?php echo $rules['length']?>"/> <span class="f999 f12">不填则默认:数字型为10,字符型为255,文本型不必填写</span>
                </td>
            </tr>
            <tr>
                <td align="right">字符宽度：</td>
                <td>  
                  <input name="rules[textarea][cols]" size="20" class="textInt" value="<?php echo $rules['cols']?>"/> <span class="f999 f12">文本域的宽度</span>
                </td>
            </tr>
            <tr>
                <td align="right">行数：</td>
                <td>  
                  <input name="rules[textarea][rows]" size="20" class="textInt" value="<?php echo $rules['rows']?>"/> <span class="f999 f12">文本域的行数</span>
                </td>
            </tr>
            <tr>
                <td align="right">默认值：</td>
                <td>  
                  <textarea cols="40" rows="4" name="rules[textarea][value]"><?php echo $rules['value']?></textarea> <span class="f999 f12">文本框的默认值</span>
                </td>
            </tr>
            <tr>
                <td align="right">单位：</td>
                <td>  
                  <input name="rules[textarea][units]" size="20" class="textInt" value="<?php echo $rules['units']?>"/> <span class="f999 f12">可选，没有就不用填写</span>
                </td>
            </tr>           
            </tbody>
            <tbody class="tbody" id="t_radio" style="display: none;">
            <tr>
                <td align="right">字段长度：</td>
                <td>  
                  <input name="rules[radio][length]" size="20" class="textInt" value="<?php echo $rules['length']?>"/> <span class="f999 f12">不填则默认:数字型为10,字符型为255,文本型不必填写</span>
                </td>
            </tr>
            <tr>
                <td align="right">选项内容：</td>
                <td>  
                  <div class="fl"><textarea id="ta_radio" name="rules[radio][choices]" cols="25" rows="3" class="textInt"><?php echo $rules['choices']?></textarea></div><div class="f999 f12 fl" style="line-height: 15px; padding-left: 5px;">
                  只在项目为可选时有效，每行一个选项，等号前面为选项索引(建议用数字)，后面为内容，例如:<br/><i>1=苹果<br/>2=香蕉<br/>3=菠萝</i><br/>注意: 选项确定后请勿修改索引和内容的对应关系...调换显示顺序，可以通过移动整行的前后位置来实现</div>
                <div class="cc"><input class="var" id="ip_radio" name="rules[radio][variable]" type="checkbox" value="1" <?php if($rules['variable']==1){?> checked="" <?php }?>/> 动态选项值</div>
                </td>
            </tr>
    
            </tbody>
            <tbody class="tbody" id="t_checkbox" style="display: none;">
            <tr>
                <td align="right">字段长度：</td>
                <td>  
                  <input name="rules[checkbox][length]" size="20" class="textInt" value="<?php echo $rules['length']?>"/> <span class="f999 f12">不填则默认:数字型为10,字符型为255,文本型不必填写</span>
                </td>
            </tr>
            <tr>
                <td align="right">选项内容：</td>
                <td>  
                  <div class="fl"><textarea name="rules[checkbox][choices]" cols="25" rows="3" class="textInt" id="ta_checkbox"><?php echo $rules['choices']?></textarea></div><div class="f999 f12 fl" style="line-height: 15px; padding-left: 5px;">
                  只在项目为可选时有效，每行一个选项，等号前面为选项索引(建议用数字)，后面为内容，例如:<br/><i>1=苹果<br/>2=香蕉<br/>3=菠萝</i><br/>注意: 选项确定后请勿修改索引和内容的对应关系...调换显示顺序，可以通过移动整行的前后位置来实现</div>
                <div class="cc"><input class="var" id="ip_checkbox" name="rules[checkbox][variable]" type="checkbox" value="1" <?php if($rules['variable']==1){?> checked="" <?php }?>/> 动态选项值</div>
                </td>
            </tr>
            </tbody>
            <tbody class="tbody" id="t_select" style="display: none;">
            <tr>
                <td align="right">字段长度：</td>
                <td>  
                  <input name="rules[select][length]" size="20" class="textInt" value="<?php echo $rules['length']?>"/> <span class="f999 f12">不填则默认:数字型为10,字符型为255,文本型不必填写</span>
                </td>
            </tr>
            <tr>
                <td align="right">选项内容：</td>
                <td>  
                  <div class="fl"><textarea name="rules[select][choices]" cols="25" rows="5" class="textInt" id="ta_select"><?php echo $rules['choices']?></textarea></div><div class="f999 f12 fl" style="line-height: 15px; padding-left: 5px;">
                  只在项目为可选时有效，每行一个选项，等号前面为选项索引(建议用数字)，后面为内容，例如:<br/><i>1=苹果<br/>2=香蕉<br/>3=菠萝</i><br/>注意: 选项确定后请勿修改索引和内容的对应关系...调换显示顺序，可以通过移动整行的前后位置来实现</div>
                <div class="cc"><input class="var" id="ip_select" name="rules[select][variable]" type="checkbox" value="1" <?php if($rules['variable']==1){?> checked="" <?php }?>/> 动态选项值</div>
                </td>
            </tr>
            </tbody>
            <tr><td></td><td><input type="button" id="ok" value="保存设置"/>&nbsp;&nbsp;<input onclick="location.href='<?php echo site_url("admin/fields/")?>';" type="button" value="返回字段列表"/>&nbsp;&nbsp;<span id="msg" class="fred"></span></td></tr>
            </table></form>
        </div>
    </body>
</html>

<script language="javascript">
    $(function(){
        var v = $("#input_type").val();
        var v1 = $("#search").attr("checked");
        var v2 = $("#ip_"+v).attr("checked");
        
        $(".tbody").hide();
        $("#t_"+v).show();
        
         if(v1=='checked'){
            $("#s_type").show();
         } else {
            $("#s_type").hide();
         }
         
         if(v2=='checked'){
            $("#ta_"+v).attr("disabled",true);
         } else {
            $("#ta_"+v).attr("disabled",false);
         }  
        //参与搜索复选框点击时
        $("#search").click(function(){
            var v1 = $("#search").attr("checked");
            if(v1=='checked'){
                $("#s_type").show();
            } else {
                $("#s_type").hide();
            }
        })
        //输入类型更换时
        $("#input_type").change(function(){
            var v = $(this).val();
            $(".tbody").hide();
            $("#t_"+v).show();
        })
        //复选框点击时
        $(".var").click(function(){
            var v = $(this).attr("checked");
            var t = $("#input_type").val();
            if(v=='checked'){
                $("#ta_"+t).attr("disabled",true);
            } else {
                $("#ta_"+t).attr("disabled",false);
            }  
        })
        //提交时
        $("#ok").click(function(){
           if(!confirm("慎重操作：\n\n修改字段设置后，所有应用该字段的表中的字段将同步修改;\n如将text或mediumtext型字段修改成int型字段，则文本内容将转化成数字0;\n确定要修改吗？")){
                return;
           } else {
                $("#msg").html("<span class=fgreen>正在提交...</span>");
                $("#post_form").submit();
           }
        })
    })
</script>