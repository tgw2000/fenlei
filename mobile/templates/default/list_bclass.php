<?php include template('header')?>
<body>
<div class="wrap_panel" >
    <header>
        <div class="common_head">
            <a href="#" class="c_link"><span class="category_bg back"></span>返回</a>
            <span class="page_title"><?=$current_cat['title']?></span>
            <a href="#" class="category_bg search_ico top_search_btn"></a>
        </div>
    </header>
    
    <?php include template('search_form')?>
    
    <div class="fenlei-list clearfix mt20">
        <?php foreach($current_cat['children'] as $row){?>
            <a href="<?=site_url("list/$row[pinyin]/")?>"><?=$row['title']?></a>  
        <?php }?>
    </div>

<?php include template('footer')?>
</div>
</body>
</html>