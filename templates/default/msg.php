<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>信息提示-济宁分类信息</title>
<meta name="keywords" content="<?php echo $CFG['keywords']?>"/>
<meta name="description" content="<?php echo $CFG['description']?>"/>
<link rel="icon" href="<?php echo TPL?>/images/favicon.ico"/>
</head>
<body>
<div style="width:500px; border:1px solid #CCC;  margin:50px auto; font-size:14px; font-family:'微软雅黑'; text-align:center; padding-bottom:30px">
	<br />
    <img src="<?php echo TPL?>/images/logo.png" alt="街拍客"  border="0" /><br />
	<p style="font-size:14px; color:#ff0000;"><?php echo $msg?></p>
    <?php if($goHome==1){?>
    <p>您访问的地址已更改， <span id="totalSecond" style="color:#ff0000">15</span> 秒后将返回首页！ </p>
    <a href="/" style="width:60px; background:#427DE5; height:30px; color:#fff; padding:5px 10px; text-decoration:none">返回首页</a>  
     <!--定义js变量及方法-->
    <script language="javascript" type="text/javascript">
        var second = document.getElementById('totalSecond').textContent;
        if (navigator.appName.indexOf("Explorer") > -1){
            second = document.getElementById('totalSecond').innerText;
        } else{
            second = document.getElementById('totalSecond').textContent;
        }
        setInterval("redirect()", 1000);
        
        function redirect(){
            if (second < 0){
                <!--定义倒计时后跳转页面-->
                location.href = '/';
            } else　{
                if (navigator.appName.indexOf("Explorer") > -1){
                    document.getElementById('totalSecond').innerText = second--;
                } else {
                    document.getElementById('totalSecond').textContent = second--;
                }
            }
        }
    </script>
    <?php }?>
</div>
</body>
</html>