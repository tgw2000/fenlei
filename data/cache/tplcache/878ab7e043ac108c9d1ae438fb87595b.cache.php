<ul class="mianlist wordlist">
<?php foreach($info as $row){?>
  <li>
    <div class="fl">
      <a target="_blank" href="<?php echo site_url("$row[pinyin]/$row[infoid].html")?>"><?php echo $row['title']?></a>
      <?php if($row['qy']){?><em><?php echo $row['qy']?></em><?php }?>
      <?php if($row['job']){?><em><?php echo $row['job']?></em><?php }?>
      <?php if($row['zj']=='中介'){?><em class="org ml5">中介</em><?php }?>
      <?php if($row['gongxu']=='求购'){?><em class="org ml5">求购</em><?php }?>
      <?php if($row['fbr']=='商家'){?><em class="org ml5">商家</em><?php }?>
    </div>
    <span class="ml_time fr"><?php echo $row['refreshtime']?></span>
    <span class="fr pl_price_redfw">
        <?php
              if($row['age']) echo $row['age'];
              elseif($row['price']) echo $row['price'];
              elseif($row['wage']) echo $row['wage'];
          ?>
    </span>
    
  </li>
<?php }?>
</ul>