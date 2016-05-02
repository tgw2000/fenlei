<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title><?php echo $data['title']?>_<?php echo $data['catname']?>_济宁分类信息</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="icon" href="<?php echo TPL?>/images/favicon.ico"/>
        <link href="<?php echo TPL?>/css/style.css" rel="stylesheet" type="text/css" />
        <link href="<?php echo TPL?>/css/info.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript">
            var base = "<?php echo site_url()?>";
            var tpl = "<?php echo TPL ?>";
            var userid = "<?php echo $_SESSION['userid']?>";
            var infoid = "<?php echo $infoid ?>";
        </script>
        <script language="javascript" src="<?php echo TPL?>/js/jquery.js"></script>
        <script language="javascript" src="<?php echo TPL?>/js/common.js"></script>
        <script data-cfg-corelib="<?php echo TPL?>/js/jquery.js"  type="text/javascript" src="<?php echo TPL?>/js/do.js"></script>
        <script language="javascript" src="<?php echo TPL?>/js/info.js"></script>
    </head>
    <body>
        <?php include template("header");?>
        <div class="blank10"></div>
        <div class="wapper" id="bread_nav"><?php echo $nav ?></div>
        <div class="blank5"></div>
        <?php if($_SESSION['userid']&& $success==1){?>
        <div class="wapper">
            <div class="cc" id="postsuccess">
                <div class="icon" id="postsuccess_msg">&nbsp;</div>
                <a class="msg_close icon">&nbsp;</a>
                <p class="fl">
                    <b>发布/修改成功！</b><br/>
                    如果您还有其他信息，你还可以：<a href="<?php echo site_url("select/")?>">再发一条</a><br/>
                    为了保证平台的真实有效性，虚假信息一经发现或举报核实将被屏蔽处理！
                </p>
            </div>
        </div>
        <?php }?>
        <div class="wapper cc">
            <div class="detail_top">
                <div class="detail_promote">
                    <span class="icon"></span>提示：①要求预付定金、加Q详聊、邮寄交易等均存在欺骗行为！②价格低廉、内容里留有电话的要谨慎！电脑知识防骗手册   钓鱼网站防骗手册
                </div>
            </div>
            <div class="detail mt10">
                <div class="detail_l">
                    <h1><?php echo $data['title']?> - <a class="f14 green report">[举报]</a></h1>
                    <div class="d_info_t fl">
                        <span>更新时间：<?php echo date('m月d日 h:i',$data['refreshtime'])?></span>
                        <span>信息编号：<?php echo $data['infoid']?></span>
                        <span>查看次数：<?php echo $data['hits']?>次 </span>
                    </div>
                    <div class="d_info_box cc">
                        <div class="d_info_m">
                            <ul class="info_l">
                                <?php foreach($extr_field as $row){
                                    if($data[$row['field']]) {   
                                ?>
                                <li><em><?php echo $row['title'] ?>：</em><span><?php echo $data[$row['field']]?></span></li>
                                <?php }}?>
                            </ul>
                            <div class="d_contact">
                                <div class="tel_l">
                                    <p class="fw f14 color_333">联系电话</p>
                                    <p><span class="pr t6"><?php echo $data['mobile']?></span></p>
                                </div>
                                <div class="blank20"></div>
                                <p class="color_333">打电话给我时，请说明是在济宁易搜网上看到的，谢谢！</p>
                                <div class="contact_people">
                                    <p><span class="fw">联系人：</span><?php echo $data['realname']?><a class="pr t6 ml10" id="lev_msg"><img src="<?php echo TPL?>/images/post_msg.png"/></a></p>
                                    <?php if($data['qq']){?><p><span class="fw">QQ:</span><?php echo $data['qq']?></p><?php }?>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="d_content">
                        <p><?php echo $data['content']?></p>
                        <ul class="big_photo">
                            <?php foreach($photos as $photo){
                                $bigphoto = str_replace('_100X75','_B',$photo['path']);    
                            ?>
                                <li><img src="<?php echo $bigphoto ?>"/></li>
                            <?php }?>
                        </ul>
                        <script language="javascript">$(".big_photo img").hide(); pre_loadimg();</script>
                        <?php if($first_cat['pinyin']=='zhaopin'){
                            $sql = "select * from {$table}company where userid=$data[userid] limit 0,1";
                            $row = $db->getRow($sql);
                            if($row){
                        ?>
                        <div style="border-top:1px solid #ccc; margin-top:15px; padding-top:15px;">
                            公司名称：<?php echo $row['mingcheng']?><br/>
                            公司地址：<?php echo $row['address']?><br/>
                            公司性质：<?php echo $row['leixing']?><br/>
                            所属行业：<?php echo $row['hangye']?><br/>
                            联系人：<?php echo $row['realname']?><br/>
                            联系电话：<?php echo $row['phone']?><br/>
                            E-mail：<?php echo $row['email']?><br/>
                            公司介绍：<?php echo $row['jieshao']?>
                        </div>
                        <?php }} ?>
                        <div class="blank15"></div>
                        <p>如果您对这个信息不满意，您可以：<a class="mr20" href="<?php echo site_url($second_cat['pinyin'].'/')?>">查看最新<?php echo $second_cat['title']?>&gt;&gt;</a><a href="<?php echo site_url("fabu/$current_cat[cid]/")?>">发布一条<?php echo $current_cat['title']?>求购信息&gt;&gt;</a></p>
                        <div class="pr f14 fl mtb10">
                            <p class="fw f14 mb5">分享让更多人看到：</p>
                                <!-- Baidu Button BEGIN -->
                                <div id="bdshare" class="bdshare_t bds_tools_32 get-codes-bdshare">
                                <a class="bds_tsina"></a>
                                <a class="bds_qzone"></a>
                                <a class="bds_renren"></a>
                                <a class="bds_t163"></a>
                                <span class="bds_more"></span>
                                <a class="shareCount"></a>
                                </div>
                                <script type="text/javascript" id="bdshare_js" data="type=tools&amp;uid=6814690" ></script>
                                <script type="text/javascript" id="bdshell_js"></script>
                                <script type="text/javascript">
                                document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + Math.ceil(new Date()/3600000)
                                </script>
                                <!-- Baidu Button END -->
                        </div>
                        <div class="mt10 cc">
                            <p class="f14 fw_c fw">更多<?php echo $current_cat['title']?></p>
                            <?php include($view_listBlock); ?>
                        </div>
                    </div>
                </div>
                <div class="detail_r">
                    <div class="detail_r_box">
                        <strong>发布人</strong>
                        <p class="f14"><a href="<?php echo site_url("user/$data[userid]/")?>">查看发帖记录</a></p>
                    </div>
                    <?php if($_SESSION['userid']==$data['userid']){?>
                    <div class="detail_r_box">
                        <strong>信息管理</strong>
                        <ul class="operate_list cc" style="width: 100px;">
                            <li><a href="<?php echo site_url("fabu/$data[cid]/?id=$infoid")?>">修改</a></li>
                            <?php if($data['status']==1){?>
                            <li><a class="del">删除</a></li>
                            <li><a class="refresh">刷新</a></li>
                            <li><a class="top">置顶</a></li>
                            <?php }?>
                        </ul>
                        <ul class="operate_list cc">
                            <li>
                                <a class="f12 green btn_shuaxin">刷新提前</a>
                                <a title="刷新有哪些好处" class="f999 f12" target="_blank" href="">刷新有哪些好处？</a>
                            </li>
                        </ul>
                    </div>
                    <?php }?>
                </div>
            </div>
        </div>
        <div class="blank20"></div>
        <?php include template("footer")?>
        <!-- 私信窗口 -->
        <div class="popup_box" style="display:none;">
			<div class="top_bar">
                <a class="fr btn_close"><img src="<?php echo TPL?>/images/close.png"/></a>
    			<span>发送站内信</span>
			</div>
			<div class="box_content">
				<dl class="cc">
					<dd>
						<label>对方：</label>
						<span><?php echo $data['realname']?></span>
					</dd>
					<dd class="d_2">
						<label>标题：</label>
                        <input type="text" name="subject" class="subject" value="<?php echo $data['title']?>" style="width: 370px;"/>
					</dd>
					<dd class="d_2">
						<label>内容：</label>
						<textarea rows="4" name="message" class="message" style="width: 370px;"></textarea>
					</dd>
					<dd class="d_2">
                        <label>&nbsp;</label>
                        <input type="button" class="btn_ok" value="确 认"/>&nbsp;
                        <input type="button" class="btn_cancel" value="取 消"/>
                        <span class="msg fred"></span>
					</dd>
				</dl>
   	            <input type="hidden" name="touid" class="touid" value="<?php echo $data['uid']?>"/>
				<input type="hidden" name="token" class="token" value="<?php echo $token?>"/>
			</div>
		</div>
        <!-- 举报窗口 -->
        <div class="report_box" style="display:none;">
			<div class="top_bar">
				<a class="fr btn_close"><img src="<?php echo TPL?>/images/close.png"/></a>
				<span>举报</span>
			</div>
			<input type="hidden" name="token" value="<?php echo $token?>"/>
            <input type="hidden" name="report[infoid]" value="<?php echo $infoid?>"/>
			<table cellpadding="0" cellspacing="0" border="0" class="jubao">
				<tbody>
					<tr>
						<th><span>*</span>举报类型：</th>
						<td>
							<label><input type="radio" value="1" name="report[type]" class="rpt_type"/>商家冒充个人</label>
							<label><input type="radio" value="2" name="report[type]" class="rpt_type"/>虚假、违规</label>
							<label><input type="radio" value="3" name="report[type]" class="rpt_type"/>重复</label>
							<label><input type="radio" value="4" name="report[type]" class="rpt_type"/>放错类别</label>
						</td>
					</tr>
					<tr>
						<th><span>*</span>事件描述：</th>
						<td><textarea name="report[content]" class="rpt_content"></textarea></td>
					</tr>
					<tr>
						<th><span>*</span>手机号码：</th>
						<td><input type="text" name="report[mobile]" class="rpt_mobile"/></td>
					</tr>
					<tr>
						<th></th>
						<td>
								1.请尽量详细反映实际情况，以便我们及时正确地处理您的举报<br/>
								2.留下您的电话号码，方便我们的客服与您联系
						</td>
					</tr>
                    <tr>
                        <th></th>
                        <td>
                            <input type="button" class="btn_ok" value="确 认"/>&nbsp;
                            <input type="button" class="btn_cancel" value="取 消"/>
                            <span class="msg fred"></span>
                        </td>
                    </tr>
				</tbody>
			</table>
		</div>
    </body>
</html>