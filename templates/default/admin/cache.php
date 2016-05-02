<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
    	<title>缓存清理-后台管理</title>
        <link rel="icon" href="<?php echo TPL?>/images/favicon.ico"/>
        <link rel="stylesheet" type="text/css" href="<?php echo TPL?>/css/style.css"/>
        <link rel="stylesheet" type="text/css" href="<?php echo TPL?>/css/admin.css"/>
    </head>
    <body>
    <iframe name="hiddenifr" width="0" height="0" frameborder="0"></iframe>
        <div class="box">
            <?php include template("admin/top")?>
                <table class="fabu_table">
                    <tr>
                        <td><input type="checkbox"  name="type" value="php"/> 配置缓存&nbsp;<span class="f999 f12">php配置文件,模型字段设置等文件</span>&nbsp;&nbsp;<span id="div_php"></span></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"  name="type" value="sqlcache"/> 数据缓存&nbsp;<span class="f999 f12">执行sql查询时生成的缓存</span>&nbsp;&nbsp;<span id="div_sqlcache"></span></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"  name="type" value="tplcache"/> 站点模板缓存&nbsp;<span class="f999 f12">站点模板文件缓存数据</span>&nbsp;&nbsp;<span id="div_tplcache"></span></td>
                    </tr>
                    <tr>
                        <td><input type="button" value="清理缓存" id="clear_cache"/></td>
                    </tr>
                </table>
        </div>
    </body>
</html>

<script type="text/javascript">
    var base = "<?php echo site_url()?>";
    $(function(){
        $("#clear_cache").click(function(){
            var flag = 0;
            $(":checkbox").each(function(){
                if(this.checked == true){
                    flag = 1;
                    return;
                }
            });
            
            if(!flag){
                alert('请选择要清除的缓存项!');
                return false;
            }
            
            $("#clear_cache").attr("disabled",true);
            $('input:checkbox:checked').each(function() {
                var v = $(this).val();     
                $('#div_'+v).removeClass().addClass('f12');
                $('#div_'+v).html("正在清除，请稍等...");
                $.ajax({ 
                    type : "get", 
                    url : base+"admin/userdo/?act=clear_cache&type="+v, 
    			
                    async : false,      //同步操作
                    success : function(msg){
                        if(msg=='ok'){
                            $('#div_'+v).addClass('correct');
                            $('#div_'+v).html('清除成功');
                        }
                        else if(msg=='error'){
                            $('#div_'+v).addClass('error');
                            $('#div_'+v).html('清除失败，缓存目录没有找到');
                        }
                        else {
                            alert(msg);
                        }
                    }
                }); 
            });
            $("#clear_cache").attr("disabled",false);
        });
    })
    
</script>