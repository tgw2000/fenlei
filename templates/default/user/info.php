<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>用户中心_济宁分类信息网</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="icon" href="<?php echo TPL?>/images/favicon.ico"/>
        <link href="<?php echo TPL?>/css/style.css" rel="stylesheet" type="text/css" />
        <link href="<?php echo TPL?>/css/user.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <?php include template("user/header")?>
        <div class="blank5"></div>
        <div class="wapper">
            <div class="bread_nav"><a href="<?php echo site_url()?>">济宁分类信息</a> &gt; <a href="<?php echo site_url("user/")?>">用户中心</a></div>
            <div class="user_main cc">
                <!-- 左侧 -->
                <?php include template("user/left")?>
                <!-- 右侧 -->
                <div class="user_right">
                <span class="big_title">我发布的信息</span>
                    <div class="Tab_head">
                        <ul>
                            <li <?php if(!$status){?> class="on" <?php }?>><a href="<?php echo site_url("user/")?>">最新信息</a></li>
                            <li <?php if($status==1){?> class="on" <?php }?>><a href="<?php echo site_url("user/?status=1")?>">显示中的信息</a></li>
                            <li <?php if($status==2){?> class="on" <?php }?>><a href="<?php echo site_url("user/?status=2")?>">审核中的信息</a></li>
                            <li <?php if($status==3){?> class="on" <?php }?>><a href="<?php echo site_url("user/?status=3")?>">已删除的信息</a></li>
                        </ul>
                    </div>
                    <form id="info_form">
                        <ul class="info_list h65">
                            <li class="first">
                                <?php if($status==1){?><div class="ck"></div><?php }?>
                                <div class="title"><label>标题</label></div>
                                <div class="operate">管理</div>
                                <div class="expand">推广</div>
                            </li>
                            <?php foreach($info as $row){?>
                            <!-- 显示中的信息 -->
                            <?php if($row['status']==1){?>
                             <li id="info_<?php echo $row['infoid']?>">
                                <?php if($status==1){?>
                                <div class="ck"><input type="checkbox" name="infoid[]" class="chk" value="<?php echo $row['infoid']?>"/></div>
                                <?php }?>
                                <div class="title">
                                    <span class="f14"><a href="<?php echo site_url("$row[pinyin]/$row[infoid].html")?>" target="_blank"><?php echo $row['title']?></a></span>
                                    <p>更新时间:<em><?php echo date('m-d h:i',$row['refreshtime'])?></em> | 编号:<?php echo $row['infoid']?></p>
                                </div>
                                <div class="operate">
                                    <div class="mt10">
                                        <a href="<?php echo site_url("fabu/$row[cid]/?id=$row[infoid]")?>" target="_blank">修改</a>
                                        <a href="javascript:void();" rel="<?php echo $row['infoid']?>" class="del">删除</a>
                                    </div>
                                </div>
                                <div class="expand">
                                    <div class="mt10">
                                        <a href="javascript:void();" rel="<?php echo $row['infoid']?>" class="refresh">刷新</a>
                                        <a href="javascript:void();" rel="<?php echo $row['infoid']?>" class="istop">置顶</a>
                                    </div>
                                </div>
                             </li>
                             <?php }?>
                             <!-- 审核中的信息 -->
                             <?php if($row['status']==2){?>
                             <li id="info_<?php echo $row['infoid']?>">
                                <div class="title">
                                    <span class="f14"><a href="<?php echo site_url("$row[pinyin]/$row[infoid].html")?>" target="_blank"><?php echo $row['title']?><em class="fred">(审核中)</em></a></span>
                                    <p>更新时间:<em><?php echo date('m-d h:i',$row['refreshtime'])?></em> | 编号:<?php echo $row['infoid']?></p>
                                </div>
                                <div class="operate">
                                    <div class="mt10">
                                        <a href="<?php echo site_url("fabu/$row[cid]/?id=$row[infoid]")?>" target="_blank">修改</a>
                                    </div>
                                </div>
                                <div class="expand">
                                    <div class="mt10">
                                        <span class="f999" style="padding-right: 5px;">刷新</span>
                                        <span class="f999" style="padding-right: 5px;">置顶</span>
                                    </div>
                                </div>
                             </li>
                             <?php }?>
                             <!-- 已删除的信息 -->
                             <?php if($row['status']==3){?>
                             <li id="info_<?php echo $row['infoid']?>">
                                <div class="title">
                                    <span class="f14"><?php echo $row['title']?>(已删除)</span>
                                    <p>更新时间:<em><?php echo date('m-d h:i',$row['refreshtime'])?></em> | 编号:<?php echo $row['infoid']?></p>
                                </div>
                                <div class="operate">
                                    <div class="mt10">
                                        <a href="javascript:void();" rel="<?php echo $row['infoid']?>" class="recover">恢复</a>
                                    </div>
                                </div>
                                <div class="expand">
                                    <div class="mt10">
                                        <span class="f999" style="padding-right: 5px;">刷新</span>
                                        <span class="f999" style="padding-right: 5px;">置顶</span>
                                    </div>
                                </div>
                             </li>
                             <?php }?>
                             <?php }?>
                        </ul>
                        <?php if($status==1){?>
                        <div style="padding:10px 0 0 0;">
                            <input type="checkbox" id="chkall"/> 全选
                            <input type="button" id="info_del" class="icon btn2" value="删除已选" />
                            <input type="button" id="info_recover" class="icon btn2" value="恢复已选" />
                        </div>
                        <?php }?>
                        <div class="blank20"></div>
                        <div class="pages tac cc"><?php echo $pages?></div>
                    </form>
                </div>
            </div>
            <?php include template("footer")?>
        </div>
    </body>
</html>
    <!-- 删除后的单条信息模板 -->
    <div id="tpl_del" style="display: none;">
        <li id="info_{f_id}">
            <?php if($status==1){?>
            <div class="ck"><input type="checkbox" name="infoid[]" class="chk" value="{f_id}"/></div>
            <?php }?>
            <div class="title">
                <span class="f14">{f_title}(已删除)</span>
                <p>{f_time}</p>
            </div>
            <div class="operate">
                <div class="mt10">
                    <a href="javascript:void();" rel="{f_id}" class="recover">恢复</a>
                </div>
            </div>
            <div class="expand">
                <div class="mt10">
                    <span class="f999" style="padding-right: 5px;">刷新</span>
                    <span class="f999">置顶</span>
                </div>
            </div>
         </li>
    </div>
    <!-- 恢复后的单条信息模板 -->
    <div id="tpl_recover" style="display: none;">
        <li id="info_{f_id}">
            <?php if($status==1){?>
            <div class="ck"><input type="checkbox" name="infoid[]" class="chk" value="{f_id}"/></div>
            <?php }?>
            <div class="title">
                <span class="f14"><a href="{f_url}" target="_blank">{f_title}</a></span>
                <p>{f_time}</p>
            </div>
            <div class="operate">
                <div class="mt10">
                    <a href="{f_url1}" target="_blank">修改</a>
                    <a href="javascript:void();" rel="{f_id}" class="del">删除</a>
                </div>
            </div>
            <div class="expand">
                <div class="mt10">
                    <a href="javascript:void();" rel="{f_id}" class="refresh">刷新</a>
                    <a href="" >置顶</a>
                </div>
            </div>
        </li>
    </div>
<!-- 层窗口 -->
<div id="floatwin">
    <div id="floatbox">
        <div id="fw_title">
            <div class="fl title"></div>
            <div class="fr close"><img src="<?php echo TPL?>/images/close.gif"/></div>
        </div>
        <div id="fw_body"></div>
        <div id="fw_button">
            <input id="fw_submit" type="button" value="确定"/>
            <input id="fw_close" type="button" value="取消"/>
        </div>
        <div id="fw_load"><img src="<?php echo TPL?>/images/load.gif" align="absMiddle"/> 正在操作中，请稍等...</div>
    </div>
</div>
<script type="text/javascript">
    var base = "<?php echo site_url()?>";
    var tpl = "<?php echo TPL ?>";
</script>
<script type="text/javascript" src="<?php echo TPL?>/js/jquery.js"></script>
<script type="text/javascript" src="<?php echo TPL?>/js/jquery.exact.js"></script>
<script type="text/javascript" src="<?php echo TPL?>/js/user.js"></script>