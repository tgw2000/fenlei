<p class="f14 b_b">
  <span class="fl w450">标题</span>
  <span class="fl w140 text_center">价格</span>
  <span class="fl ml_time text_center">发表时间</span>
</p>
<ul class="pic_list">
<?php foreach($info as $row){?>     
      <li>
          <span class="fl pl_pic"><img width="80" height="60" src="<?php echo $row['tpic']?>"/></span>
           <div class="fl clearfix pl_title">
           <a target="_blank" href="<?php echo site_url("$second_cat[pinyin]/$row[infoid].html")?>"><?php echo cut_str($row['title'],20)?></a>
           <?php if($row['zj']=='中介'){?><em class="org ml5">中介</em><?php }?>
           <?php if($row['gongxu']=='求购'){?><em class="org ml5">求购</em><?php }?>
           <?php if($row['fbr']=='商家'){?><em class="org ml5">商家</em><?php }?>
          <em class="fl"></em><br/>
          <em>
            <?php if($row['qy']){?><?php echo $row['qy']?><?php }?>
            <?php if($first_cat['pinyin']=='jiaoyi'){?>/<?php echo $category[$row['cid']]['title']?><?php }?>
            <?php if($row['lx']){?>/<?php echo $row['lx']?><?php }?>
            <?php if($row['wylx']){?>/<?php echo $row['wylx']?><?php }?>
            <?php if($row['housearea']){?>/<?php echo $row['housearea']?><?php }?>
            <?php if($row['chengse']){?>/<?php echo $row['chengse']?><?php }?>
          </em>
     </div>
      <span class="fr ml_time"><?php echo $row['refreshtime']?></span>
      <span class="fr pl_price_redfw"><?php echo $row['price']?></span>
      </li>
<?php }?>
</ul>