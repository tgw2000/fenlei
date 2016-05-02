<!doctype html>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="utf-8"/>
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta name="format-detection" content="telephone=no" />
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,maximum-scale=1" />
    <title><?=$data['title']?></title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link type="text/css" rel="stylesheet" href="<?=TPL?>/css/style.css"/>
</head>

<body>
<header>
    <div class="common_head">
        <a href="#" class="c_link"><span class="category_bg back"></span>返回</a>
        <span class="page_title">详细信息</span></span>
        <a href="/" class="category_bg home"></a>
    </div>
</header>

<?php if($photos){?>
    <section>
        <div class="slider ">
            <?php foreach($photos as $row){
                $img = 'http://www.yiiso.cn'.str_replace('_100X75','_320X207',$row['path']);
            ?>
                <div>
                    <a href="<?=site_url("viewpic/$data[infoid]/")?>"><img src="<?=$img?>" width="320" height="207" title="<?=$data['title']?>" alt="<?=$data['title']?>" /></a>
                    <p>共<?=count($photos)?>张</p>
                </div>
            <?php }?>
        </div>
    </section>
<?php }?>

<div class="detail_block">
    <div class="news_tag"><?php if($data['tpic']){?><em class="tu">图</em> <?php }?></div>
    <h3 class="gc3"><?=$data['title']?></h3>
    <p class="info pl35">
        <span>更新时间：<?=format_time($data['refreshtime'],3)?></span>
        <span class="times"> 浏览量：<?=$data['hits']?></span>
    </p>
     <?php foreach($extr_field as $row){
           if($data[$row['field']]) {   
     ?>
        <p><span class="sub_title"><?php echo $row['title'] ?>：</span><?php echo $data[$row['field']]?></p>
     <?php }}?>
    <h3 class="product_desc gc3">物品描述</h3>
    <div class="product_desc_cont"><?=$data['content']?></div>
</div>

<div class="detail_block list_block">
    <h3 class="gc3">最新<?=$data['catname']?></h3>
    <ul class="list clearfix">
        <?php foreach($info as $row){?>
        <li>
            <a href="<?=site_url("view/$row[infoid].html")?>">
            <?php if($row['tpic']){?><em class="tu">图</em> <?php }?>
            <div>
                <span class="gc3"><?=$row['title']?></span>
                <p class="mt10">
                    <span class="fr gc3 fs12 time"><?=$row['refreshtime']?></span>
                    <span class="org mr10 fs12 price"><?=$row['price']?></span>
                    <span class="org mr10 fs12 shopper">
                        <?php if($row['zj']) echo($row['zj']);
                            if($row['fbr']) echo($row['fbr']);
                        ?>
                    </span>
                    <span class="gc6 address"><?=$row['qy']?></span>
                </p>
            </div>
            </a>
        </li>
        <?php }?>
    </ul>
   <div class="more_info_box">
    <a href="<?=site_url("list/$data[pinyin]/")?>" class="gc_green">查看更多<?=$data['catname']?>&gt;&gt;</a>
    </div>
</div>

<div id="gotop"></div>
<div class="concat_space"></div>
<div class="concat_box" id="concat_box">
   <div class="translucent_layer"></div>
   <span class="phone_num"><?=$data['mobile']?></span>
   <p class="name"><?=$data['realname']?>
        <?php if($data['zj']){?>（<?=$data['zj']?>）<?php }?>
        <?php if($data['fbr']){?>（<?=$data['fbr']?>）<?php }?>
   </p>
   <a href="tel:<?=$data['mobile']?>"><span class="concat_r"><i class="category_bg phone"></i>电话联系</span></a>
</div>

<script type="text/javascript" src="<?=TPL?>/js/zepto.min.js"></script>
<script type="text/javascript" src="<?=TPL?>/js/gmu.min.js"></script>
<script type="text/javascript">
    $('#gotop').gotop();
    $('.slider').slider({arrow: false});
    $('.type_slider').slider({
        autoPlay: false,
        dots: false
    });
    
    $(".desc_open").on('click', function(){
        if($(this).hasClass("desc_close")){
            $(this).removeClass("desc_close");
            $(".desc").hide();
        } else {
            $(this).addClass("desc_close");
            $(".desc").show();
        }
    });	

	$('.c_link').on('click',function(e){
		history.go(-1);
		e.preventDefault();
	})
</script>
</body>
</html>