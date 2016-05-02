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
        <span class="page_title">搜索"<?=$keyword?>"</span>
        <a class="category_bg home" href="/"></a>
    </div>
</header>

<?php include template('search_form')?>

<section>
    <div class="ui-refresh">
        <ul class="list clearfix">
            <?php include template('list_data')?>
        </ul>
        <div class="ui-refresh-down"></div>
    </div>
</section>

<?php include template('footer')?>
</div>
</body>
</html>