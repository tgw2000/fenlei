<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
    	<title>后台管理</title>
        <link rel="stylesheet" type="text/css" href="<?php echo TPL?>/css/style.css" />
        <link rel="stylesheet" type="text/css" href="<?php echo TPL?>/css/admin.css" />
    </head>
    <body>
        <iframe name="hiddenifr" width="0" height="0" frameborder="0"></iframe>
        <div class="box">
        <?php include template("admin/top")?>
        <form id="post_form" method="post" action="<?php echo site_url("admin/userdo/?act=article_post&id=$id")?>" target="hiddenifr">
        <table width="100%" class="fabu_table">
            <tbody>
            <tr>
                <td style="text-align:right; width: 100px;">分类：</td>
                <td><span id="sel">
                    <select name="tid">
                        <option value="">-选择分类-</option>
                        <?php foreach($type as $row){?>
                        <option <?php if($info['tid']==$row['tid']){?> selected="" <?php }?> value="<?php echo $row['tid']?>"><?php echo $row['type']?></option>
                        <?php } ?>
                    </select>
                    </span>
                </td>
            </tr>
            <tr>
                <td style="text-align:right; width: 100px;">标题：</td>
                <td>
                    <label><input type="text" size="50" id="title" class="textInt" name="title" style="width: 450px;" value="<?php echo $info['title']?>"/></label>
                </td>
            </tr>
            <tr>
                <td valign="top" style="text-align:right">内容：</td>
                <td>
                    <textarea id="editor" name="content" style="width:900px;height:500px;"><?php echo htmlspecialchars($info['content'])?></textarea>
                </td>
            </tr>
            <tr>
                <td style="text-align:right; width: 100px;"></td>
                <td>
                    <input type="checkbox" name="save_remote" value="1"/>下载内容中远程图片到本地
                </td>
            </tr>
            <tr>
                <td style="text-align:right; width: 100px;">跳转链接：</td>
                <td>
                    <input type="text" name="http" class="textInt" style="width: 250px;" value="<?php echo $info['http']?>"/>&nbsp;<span class="f999 f12">点击文章标题时将要跳转到的URL地址</span>
                </td>
            </tr>
            <tr>
                <td style="text-align:right; width: 100px;">排序：</td>
                <td>
                    <input type="text" name="sort" class="textInt" style="width: 80px;" value="<?php echo $info['sort']?>"/>&nbsp;<span class="f999 f12">数字越小排列越靠前</span>
                </td>
            </tr>
            <tr>
                <td style="text-align:right">&nbsp;</td>
                <td>
                    <input type="submit" value="确认提交"/>&nbsp;&nbsp;
                    <input type="button" onclick="location.href='<?php echo site_url("admin/article/")?>';" value="返回文章列表"/>&nbsp;<span id="msg" class="fred"></span>
                </td>
            </tr>
        </tbody></table></form>
        </div>
    </body>
</html>
<script type="text/javascript" src="<?php echo TPL ?>/images/kindeditor4.1.3/kindeditor.js"></script>
<script type="text/javascript" src="<?php echo TPL ?>/images/kindeditor4.1.3/lang/zh_CN.js"></script>
<script type="text/javascript">
    var base = "<?php echo site_url()?>";
    var editor;
    var options = {
        afterBlur:function(){   //同步kindeditor的值到textarea
            this.sync();
        },
        newlineTag:'<br/>',
        allowFileManager:true
    };
    KindEditor.ready(function(K) {
        editor = K.create('#editor',options);
    });
    
        //显示提示信息
    function posted(v){
        v=v.split("|");
        if(v[0]=='alert'){      //显示alert对话框
            alert(v[1]);
        }else if(v[0]=='post_ok'){        //添加，修改成功
            $("#msg").html("<font color=green>正在跳转...</font>");
            window.location.href = base+'admin/article/';
        }else {
            $(v[0]).show();
            $(v[0]).html(v[1]); 
        }
    }
</script>