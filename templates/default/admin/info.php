<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
    	<title>后台管理</title>
        <link rel="stylesheet" type="text/css" href="<?php echo TPL?>/css/style.css" />
        <link rel="stylesheet" type="text/css" href="<?php echo TPL?>/css/admin.css" />
    </head>
    <body>
        <div class="box">
            <?php include template("admin/top")?>
            <div class="mt10" style="padding-left: 10px;">排序:
            <select name="sort" onchange="javascript:location.href = $(this).val();">
                <option <?php if($sort==0){?> selected="" <?php }?> value="<?php echo site_url("admin/info/")?>">默认排序</option>
                <option <?php if($sort==1){?> selected="" <?php }?> value="<?php echo site_url("admin/info/?sort=1")?>">点击高-&gt;低</option>
                <option <?php if($sort==2){?> selected="" <?php }?> value="<?php echo site_url("admin/info/?sort=2")?>">点击低-&gt;高</option>
                <option <?php if($sort==3){?> selected="" <?php }?> value="<?php echo site_url("admin/info/?sort=3")?>">时间近-&gt;远</option>
                <option <?php if($sort==4){?> selected="" <?php }?> value="<?php echo site_url("admin/info/?sort=4")?>">时间远-&gt;近</option>
            </select>&nbsp;&nbsp;
            搜索:
            <form method="post" action="">
                <input type="text" size="30" name="kw" value="<?=$kw?>"/>
                <input type="submit" value="确定" />
            </form>
            </div>
            <div class="status">
            状态：
            <a href="<?=site_url('admin/info/')?>" <?php if(!$status){?> class="on" <?php }?>>全部</a>
            <a href="<?=site_url('admin/info/?status=1')?>" <?php if($status==1){?> class="on" <?php }?>>正常信息</a>
            <a href="<?=site_url('admin/info/?status=2')?>" <?php if($status==2){?> class="on" <?php }?>>待审信息</a>
            <a href="<?=site_url('admin/info/?status=3')?>" <?php if($status==3){?> class="on" <?php }?>>用户已删</a>&nbsp;&nbsp;
            </div><br />
            <table border="0" cellspacing="1" cellpadding="2" bgcolor="#ccc" class="f12">
            <tr>
                <td bgcolor="#efefef" align="center" width="50">ID</td>
                <td bgcolor="#efefef" width="600">&nbsp;标题</td>
                <td bgcolor="#efefef" align="center" width="160">类目</td>
                <td bgcolor="#efefef" align="center" width="100">发布人</td>
                <td bgcolor="#efefef" align="center"  width="80">点击数</td>
                <td bgcolor="#efefef" align="center"  width="120">更新时间</td>
                <td bgcolor="#efefef" align="center" width="100">操作</td>
            </tr>
            <?php foreach($data as $row){?>
            <tr id="row_<?=$row['infoid']?>">
                <td bgcolor="white" align="center"><?php echo $row['infoid']?></td>
                <td bgcolor="white" >
                    <a href="<?php echo site_url("$row[pinyin]/$row[infoid].html")?>" target="_blank">&nbsp;<?php echo highlight($row['title'],$kw)?></a>
                    <?php if($row['status']==2){?>
                        <span class="f12 fred">(待审核)</span>
                    <?php } elseif($row['status']==3){?>
                        <span class="f12 fred">(用户删除)</span>
                    <?php }?>
                </td>
                <td bgcolor="white" align="center" ><a href="<?php echo site_url("admin/info/?cid=$row[cid]")?>"><?php echo $row['class']?></a></td>
                <td bgcolor="white" align="center"><?php echo $row['username']?></td>
                <td bgcolor="white" align="center"><?php echo $row['hits']?></td>
                <td bgcolor="white" align="center"><?php echo $row['refreshtime']?></td>
                <td bgcolor="white"  align="center"><a class="f666 uline" href="#">审核</a>&nbsp;|&nbsp;<a class="f666 uline" href="javascript:del('<?=$row['infoid']?>');">删除</a></td>
            </tr>
            <?php }?>
            </table>
            <div class="pages mt10"><?php echo $pages ?></div>
        </div>
    </body>
</html>

<script type="text/javascript">
    var base = "<?php echo site_url()?>";
    
    $(function(){
        $("tr").mouseover(function(){
            $(this).find("td").css('background-color','#efefef');
        }).mouseout(function(){
            $(this).find("td").css('background-color','#ffffff');
        })
    })
    
    function del(id){
        if(!confirm('信息与信息图片将一同被删除，确定吗？')) return false;
        $.get(base+'admin/userdo/?act=info_del&id='+id,function(msg){
            if(msg=='ok'){
                $('row_'+id).hide();
            } else {
                alert('信息删除失败，请重试！');
            }
        });
    }
</script>