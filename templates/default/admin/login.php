<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="<?php echo TPL?>/css/style.css" />
    <link rel="stylesheet" type="text/css" href="<?php echo TPL?>/css/admin.css" />
	<title>管理员登录</title>
</head>
<body>
<iframe name="hiddenifr" width="0" height="0" frameborder="0"></iframe>
<table width="400" border="0" align="center" cellpadding="3" cellspacing="1" style="margin-top: 100px;">
<tr><td>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" class="tb">
<tr>
  <td class="header" align="center">后台管理登陆</td>
</tr>
<tr><td>
<table width="100%" border="0" cellpadding="2" cellspacing="1" style="padding: 3px 0;">
<form method="post" name="form" target="hiddenifr" action="<?php echo site_url('admin/userdo/?act=in')?>" onsubmit="return chklogin()">
<tr>
  <th width="30%"></th>
  <td width="70%"><span id="msg" class="fred"></span></td>
</tr>
<tr>
  <th height="28" align="right">用户名：</th>
  <td><input name="user" type="text" id="user" class="txt" value="" maxlength="20" style="width: 150px;"/></td>
</tr>
<tr>
  <th height="28" align="right">密码：</th>
  <td><input name="pwd" type="password" id="pwd" class="txt" value="" maxlength="20" style="width: 150px;"/></td>
</tr>
<tr>
  <th></th>
  <td>
    <input type="submit" class="logbtn" value=" 提交 "/>&nbsp;
    <input type="reset" class="logbtn" value=" 重置 "/>
  </td>
</tr>
<input type="hidden" name="ref" value="<?php echo $forward?>" />
</form>
</table></td>
</tr></table>
<div class="mt6 f12" align="center">&copy; 2012-2013 济宁分类信息版权所有</div>
</td></tr></table>
</body>
</html>
<script type="text/javascript" src="<?php echo TPL?>/js/jquery.js"></script>
<script type="text/javascript" src="<?php echo TPL?>/js/admin.js"></script>