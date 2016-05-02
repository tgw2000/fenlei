<ul class="shopper_list">
<?php foreach($info as $row){?>
  <li>
      <p class="fl"><a target="_blank" href="<?php echo site_url("$second_cat[pinyin]/$row[infoid].html")?>"><?php echo cut_str($row['title'],25)?></a></p>
      <p class="fr mr5"><?php echo $row['refreshtime']?></p>
  </li>
<?php }?>
</ul>