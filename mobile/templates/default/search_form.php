<section class="search_bg <?php if(!in_array($mod,array('index','search'))){?>search_cont<?php }?>">
	<form action="<?=site_url('search/')?>" method="get" onsubmit="return validateForm();"  id="searchForm">
    <div class="search_box">
        <input type="text" placeholder="请输入关键词" class="search_text" id="search_text" value="<?=$keyword?>"  name="keyword"/>
        <span class="category_bg search_btn"></span>
    </div>
    </form>
</section>
<script type="text/javascript">
    function validateForm(){
        if(document.getElementById('search_text').value == ''){
            alert('请输入搜索关键字');
            return false;
        }
        document.getElementById('searchForm').submit();
    }
</script>