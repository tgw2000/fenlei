<?php include template('header')?>
<body>
<header><img src="<?=TPL?>/images/logo.png"/></header>
<?php include template('search_form')?>

<?php foreach($category as $row){?>
<div class="cate_item">
    <div class="cate_ico_box">
        <a href="<?=site_url("list/$row[pinyin]/")?>"><span class="category_bg  cate_ico <?=$row['pinyin']?>"></span> <?=cut_str($row['title'],2)?> </a></div>
    <div class="cate_item_opts">
        <?php foreach($row['children'] as $row1){?>
        <a href="<?=site_url("list/$row1[pinyin]/")?>"><?=$row1['title']?></a>
       <?php }?>
    </div>
	<?php if(!in_array($row['pinyin'],array('chongwu','peixun','jiaoyou'))){?>
    <div class="oper_box">
        <span class="category_bg oper_open"></span>
    </div>
	<?php }?>
</div>
<?php }?>

<?php include template('footer')?>
</body>
</html>