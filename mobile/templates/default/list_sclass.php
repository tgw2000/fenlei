<!doctype html>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="utf-8"/>
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta name="format-detection" content="telephone=no" />
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,maximum-scale=1" />
    <title>易搜网</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link type="text/css" rel="stylesheet" href="<?=TPL?>/css/style.css"/>
</head>

<body>
<div class="wrap_panel" >
<header>
    <div class="common_head">
        <a href="#" class="c_link"><span class="category_bg back"></span>返回</a>
        <span class="page_title"><?=$current_cat['title']?></span>
        <a href="#" class="category_bg search_ico top_search_btn"></a>
    </div>
</header>

<section>
    <div class="top_bar_tabs">
        <?php if($children){?>
            <a href="#" class="panel_toggle" data-href="cate_panel" id="cate">
                <em>小类</em><span class="category_bg panel_open"></span>
            </a>
        <?php }if($search['qy']){?>
            <a href="#" class="panel_toggle" data-href="qy_panel" id="qy">
                <em>区域</em><span class="category_bg panel_open"></span>
            </a>
        <?php }?>

                <a href="#" class="panel_toggle last"  data-href="more_panel">更多<span class="category_bg panel_open"></span></a>
            </div>
</section>

<?php include template('search_form')?>

<section>
    <div class="ui-refresh">
        <ul class="list clearfix">
            <?php include template('list_data')?>
        </ul>
        <div class="ui-refresh-down"></div>
    </div>
</section>

<?php if($children){?>
<div class="panel" id="cate_panel">
    <h3>小类</h3>
    <div class="panel_cont">
        <a href="<?php echo site_url("list/$second_cat[pinyin]/")?>" <?php if($pinyin==$second_cat['pinyin']){?> class="cur" <?php }?>>全部</a>
        <?php foreach($children as $row){ ?>
            <a href="<?php echo site_url("list/$row[pinyin]/")?>" <?php if($pinyin==$row['pinyin']){?> class="cur" <?php }?>><?php echo $row['title']?></a>
        <?php }?>
    </div>
</div>
<?php }?>

<?php if($search['qy']){?>
<div class="panel" id="qy_panel">
    <h3><?=$search['qy']['title']?></h3>
    <div class="panel_cont">
        <a href="<?=url_par("qy=")?>" <?php if($_GET['qy']==''){?> class="cur" <?php }?>>全部</a>
        <?php foreach($search['qy']['choices'] as $k=>$v){?>
        <a href="<?=url_par("qy=$k")?>" <?php if($_GET['qy']==$k){?> class="cur" <?php }?>><?=$v?></a>
        <?php }?>
    </div>
</div>
<?php }?>
<div class="panel" id="more_panel">
        <h3 class="tog_panel">价格<span class="category_bg panel_open panel_close"></span></h3>
    <div class="panel_cont ">
        <a href="?" class="cur">全部</a>
                <a href="?attr3=561" >50元以下</a>
                <a href="?attr3=562" >50-100元</a>
                <a href="?attr3=563" >100-150元</a>
                <a href="?attr3=564" >150-250元</a>
                <a href="?attr3=565" >250-500元</a>
                <a href="?attr3=566" >500-1000元</a>
                <a href="?attr3=567" >1000-2000元</a>
                <a href="?attr3=568" >2000-4000元</a>
                <a href="?attr3=569" >4000元以上</a>
            </div>
        <h3 class="tog_panel">供求<span class="category_bg panel_open "></span></h3>
    <div class="panel_cont no_show">
        <a href="?" class="cur">全部</a>
                <a href="?attr2=455" >转让</a>
                <a href="?attr2=456" >求购</a>
            </div>
    </div>
<?php include template('footer')?>
</div>
</body>
</html>
<script type="text/javascript">
    $(function(){
        qy_tit = $('#qy_panel .cur').html();
        cate_tit = $('#cate_panel .cur').html();
        if(qy_tit=='全部') qy_tit='区域';
        if(cate_tit=='全部') cate_tit='小类';
        $('#qy').find('em').html(qy_tit);
        $('#cate').find('em').html(cate_tit);
    });
</script>