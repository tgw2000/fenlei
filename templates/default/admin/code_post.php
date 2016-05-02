<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
    	<title>添加、修改代码段_后台管理</title>
        <link rel="icon" href="<?php echo TPL?>/images/favicon.ico"/>
        <link rel="stylesheet" type="text/css" href="<?php echo TPL?>/css/style.css" />
        <link rel="stylesheet" type="text/css" href="<?php echo TPL?>/css/admin.css" />
        <style type="text/css">
            textarea{border:1px solid #666;resize:none;}
            #ol{position:absolute; z-index:1; padding:0px; margin:0px; border:0px; text-align:left;}
            #li{font-family: Arial;font-size: 9pt; background:#0033cc; color:white;height:300px; overflow:hidden; width:30px; border-right:0; line-height:20px; margin:0px; padding:0px;text-align:center}
            #c2{font-family: Courier New,Arial;font-size: 13px; height:300px;  margin:0px;  width:700px; padding:0 0 0 30px; line-height:20px;}

        </style>
    </head>
    <body>
        <iframe name="hiddenifr" width="0" height="0" frameborder="0"></iframe>
        <div class="box">
            <?php include template("admin/top")?><br />
            <form method="post" id="post_form" action="<?php echo site_url("admin/userdo/?act=code_post&id=$id")?>" target="hiddenifr">
            <table border="0" class="fabu_table">
            <tr>
                <td align="right" width="115">代码段名称：</td>
                <td><input type="text" class="textInt" size="30" name="title" value="<?php echo $info['title']?>"/></td>
            </tr>
            <tr>
                <td align="right">代码段标志：</td>
                <td><input type="text" class="textInt" size="30" name="flag" value="<?php echo $info['flag']?>"/>&nbsp;<span class="f12 f999">模板中调用include(标志名)，如include($listBlock);</span></td>
            </tr>
            <tr>
                <td align="right">代码内容：</td>
                <td>  
                  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="position:relative">
                      <tr>
                        <td>
                        <div id="ol"><textarea id="li" disabled=""></textarea></div>
                        <textarea name="code" wrap="off" id="c2" onkeyup="keyUp()"><?php echo $info['code']?></textarea>    
                        </td>
                      </tr>
                  </table>
                </td>
            </tr>
            
            <tr>
                <td align="right">说明：</td>
                <td>  
                  <input name="description" size="50" class="textInt" value="<?php echo $info['description']?>"/>
                </td>
            </tr>
            <tr><td></td><td>
            <input type="button" id="ok" value="保存设置"/>&nbsp;&nbsp;<input onclick="location.href='<?php echo site_url("admin/codes/")?>';" type="button" value="返回列表"/>&nbsp;&nbsp;<span id="msg" class="fred"></span></td></tr>
            </table></form>
        </div>
    </body>
</html>

<script type="text/javascript" src="<?php echo TPL?>/js/textarea.js"></script>
<script language="javascript">
    $(function(){
        keyUp();        //textarea显示行号
        set_tab_indent_for_textareas();     //textarea支持tab缩进
        $("#ok").click(function(){
            $("#msg").html("<span class=fgreen>正在提交...</span>");
            $("#post_form").submit();
        })
    })
</script>