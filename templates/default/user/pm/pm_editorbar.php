<script type="text/javascript" src="<?php echo TPL?>/js/pm_editor.js"></script>
<script type="text/javascript">
lang['pm_prompt_list'] = '输入一个列表项目\n留空或者点取消完成此列表';
lang['pm_prompt_img'] = '请输入图片链接地址';
lang['pm_prompt_url'] = '请输入链接的地址';
lang['pm_prompt_email'] = '请输入电子邮箱的地址';
</script>
<div class="editor">
<a id="editor_b" href="javascript:void(0);" onclick="insertunit('[b]', '[/b]')" title=""></a>
<a id="editor_i" href="javascript:void(0);" onclick="insertunit('[i]', '[/i]')" title=""></a>
<a id="editor_u" href="javascript:void(0);" onclick="insertunit('[u]', '[/u]')" title=""></a>
<a id="editor_color" href="javascript:void(0);" onmouseover="showmenu(event, this.id)" title=""></a>
<a id="editor_alignleft" href="javascript:void(0);" onclick="insertunit('[align=left]', '[/align]')" title=""></a>
<a id="editor_aligncenter" href="javascript:void(0);" onclick="insertunit('[align=center]', '[/align]')" title=""></a>
<a id="editor_alignright" href="javascript:void(0);" onclick="insertunit('[align=right]', '[/align]')" title=""></a>
<a id="editor_url" href="javascript:void(0);" onclick="inserttag('url', 1)" title=""></a>
<a id="editor_email" href="javascript:void(0);" onclick="inserttag('email', 1)" title=""></a>
<a id="editor_img" href="javascript:void(0);" onclick="inserttag('img')" title=""></a>
<a id="editor_list1" href="javascript:void(0);" onclick="insertlist('1')" title=""></a>
<a id="editor_lista" href="javascript:void(0);" onclick="insertlist()" title=""></a>
<a id="editor_indent" href="javascript:void(0);" onclick="insertunit('[indent]', '[/indent]')" title=""></a>
<a id="editor_floatleft" href="javascript:void(0);" onclick="insertunit('[float=left]', '[/float]')" title=""></a>
<a id="editor_floatright" href="javascript:void(0);" onclick="insertunit('[float=right]', '[/float]')" title=""></a>
<a id="editor_quote" href="javascript:void(0);" onclick="insertunit('[quote]', '[/quote]')" title=""></a>
<a id="editor_code" href="javascript:void(0);" onclick="insertunit('[code]', '[/code]')" title=""></a>
</div>
<?php 
$coloroptions = array('Black', 'Sienna', 'DarkOliveGreen', 'DarkGreen', 'DarkSlateBlue', 'Navy', 'Indigo', 'DarkSlateGray', 'DarkRed', 'DarkOrange', 'Olive', 'Green', 'Teal', 'Blue', 'SlateGray', 'DimGray', 'Red', 'SandyBrown', 'YellowGreen','SeaGreen', 'MediumTurquoise', 'RoyalBlue', 'Purple', 'Gray', 'Magenta', 'Orange', 'Yellow', 'Lime', 'Cyan', 'DeepSkyBlue', 'DarkOrchid', 'Silver', 'Pink', 'Wheat', 'LemonChiffon', 'PaleGreen', 'PaleTurquoise', 'LightBlue', 'Plum', 'White')
?>
<div id="editor_color_menu" style="display: none;">
<?php foreach($coloroptions as $colorname):?>
<input type="button" style="background-color: <?php echo $colorname ?>" onclick="insertunit('[color=<?php echo $colorname ?>]', '[/color]')" />
<?php endforeach; ?>
</div>