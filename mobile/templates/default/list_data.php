<?php foreach($info as $row){?>
<li><a href="<?=site_url("view/$row[infoid].html")?>">
    <?php if($row['tpic']){?><em class="tu">图</em> <?php }?>
    <div>
        <span class="gc3"><?=highlight($row['title'],$keyword)?></span>
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