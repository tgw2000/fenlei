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
                <span class="big_title">公司资料</span>
                <div class="blank15"></div>
                <form id="userbiz_form" method="post">
                    <div class="b_c">基本信息</div>
                    <table class="tb f14">
                        <tbody>
                        <tr>
                            <th width="120" align="right"><em class="fred">*</em> 公司名称：</th>
                            <td>
                                <input type="text" name="Company[mingcheng]" validate="{validate:{required:true,  messages:{required:'请填写公司名'}}}" size="28" value="<?php echo $company['mingcheng']?>" class="txtInt1"/>
                                <span class="tip"></span>
                            </td>
                        </tr>
                        <tr>
                            <th><em class="fred">*</em> 公司行业：</th>
                            <td>
                                <select name="Company[hangye]" validate="{validate:{required:true,  messages:{required:'请选择行业'}}}" class="selInt">
                                    <option value="">请选择</option>
                                    <option <?php if($company['hangye']=='互联网/电子商务'){?> selected="" <?php }?> value="互联网/电子商务">互联网/电子商务</option>
                                    <option <?php if($company['hangye']=='计算机软件'){?> selected="" <?php }?> value="计算机软件">计算机软件</option>
                                    <option <?php if($company['hangye']=='计算机硬件'){?> selected="" <?php }?> value="计算机硬件">计算机硬件</option>
                                    <option <?php if($company['hangye']=='IT服务/系统集成'){?> selected="" <?php }?> value="IT服务/系统集成">IT服务/系统集成</option>
                                    <option <?php if($company['hangye']=='通信/电信'){?> selected="" <?php }?> value="通信/电信">通信/电信</option>
                                    <option <?php if($company['hangye']=='电子技术/半导体/集成电路'){?> selected="" <?php }?> value="电子技术/半导体/集成电路">电子技术/半导体/集成电路</option>
                                    <option <?php if($company['hangye']=='仪器仪表/工业自动化'){?> selected="" <?php }?> value="仪器仪表/工业自动化">仪器仪表/工业自动化</option>
                                    <option <?php if($company['hangye']=='财务/审计'){?> selected="" <?php }?> value="财务/审计">财务/审计</option>
                                    <option <?php if($company['hangye']=='金融/银行'){?> selected="" <?php }?> value="金融/银行">金融/银行</option>
                                    <option <?php if($company['hangye']=='保险'){?> selected="" <?php }?> value="保险">保险</option>
                                    <option <?php if($company['hangye']=='贸易/进出口'){?> selected="" <?php }?> value="贸易/进出口">贸易/进出口</option>
                                    <option <?php if($company['hangye']=='批发/零售'){?> selected="" <?php }?> value="批发/零售">批发/零售</option>
                                    <option <?php if($company['hangye']=='快速消费品(食品/饮料等)'){?> selected="" <?php }?> value="快速消费品(食品/饮料等)">快速消费品(食品/饮料等)</option>
                                    <option <?php if($company['hangye']=='耐用消费品（家具/家电等）'){?> selected="" <?php }?> value="耐用消费品（家具/家电等）">耐用消费品（家具/家电等）</option>
                                    <option <?php if($company['hangye']=='服装/纺织/皮革'){?> selected="" <?php }?> value="服装/纺织/皮革">服装/纺织/皮革</option>
                                    <option <?php if($company['hangye']=='办公用品及设备'){?> selected="" <?php }?> value="办公用品及设备">办公用品及设备</option>
                                    <option <?php if($company['hangye']=='钢铁/机械/设备/重工'){?> selected="" <?php }?> value="钢铁/机械/设备/重工">钢铁/机械/设备/重工</option>
                                    <option <?php if($company['hangye']=='汽车/摩托车'){?> selected="" <?php }?> value="汽车/摩托车">汽车/摩托车</option>
                                    <option <?php if($company['hangye']=='医疗/保健/卫生/美容'){?> selected="" <?php }?> value="医疗/保健/卫生/美容">医疗/保健/卫生/美容</option>
                                    <option <?php if($company['hangye']=='生物/制药/医疗器械'){?> selected="" <?php }?> value="生物/制药/医疗器械">生物/制药/医疗器械</option>
                                    <option <?php if($company['hangye']=='广告/创意'){?> selected="" <?php }?> value="广告/创意">广告/创意</option>
                                    <option <?php if($company['hangye']=='公关/市场推广/会展'){?> selected="" <?php }?> value="公关/市场推广/会展">公关/市场推广/会展</option>
                                    <option <?php if($company['hangye']=='文体/影视/艺术'){?> selected="" <?php }?> value="文体/影视/艺术">文体/影视/艺术</option>
                                    <option <?php if($company['hangye']=='媒体传播'){?> selected="" <?php }?> value="媒体传播">媒体传播</option>
                                    <option <?php if($company['hangye']=='出版/印刷/造纸'){?> selected="" <?php }?> value="出版/印刷/造纸">出版/印刷/造纸</option>
                                    <option <?php if($company['hangye']=='房地产/物业管理'){?> selected="" <?php }?> value="房地产/物业管理">房地产/物业管理</option>
                                    <option <?php if($company['hangye']=='建筑/建材'){?> selected="" <?php }?> value="建筑/建材">建筑/建材</option>
                                    <option <?php if($company['hangye']=='家居/室内设计/装潢'){?> selected="" <?php }?> value="家居/室内设计/装潢">家居/室内设计/装潢</option>
                                    <option <?php if($company['hangye']=='中介/专业服务'){?> selected="" <?php }?> value="中介/专业服务">中介/专业服务</option>
                                    <option <?php if($company['hangye']=='检测/认证'){?> selected="" <?php }?> value="检测/认证">检测/认证</option>
                                    <option <?php if($company['hangye']=='法律/法务'){?> selected="" <?php }?> value="法律/法务">法律/法务</option>
                                    <option <?php if($company['hangye']=='教育/科研/培训'){?> selected="" <?php }?> value="教育/科研/培训">教育/科研/培训</option>
                                    <option <?php if($company['hangye']=='旅游/酒店'){?> selected="" <?php }?> value="旅游/酒店">旅游/酒店</option>
                                    <option <?php if($company['hangye']=='娱乐休闲/餐饮/服务'){?> selected="" <?php }?> value="娱乐休闲/餐饮/服务">娱乐休闲/餐饮/服务</option>
                                    <option <?php if($company['hangye']=='交通/运输/物流'){?> selected="" <?php }?> value="交通/运输/物流">交通/运输/物流</option>
                                    <option <?php if($company['hangye']=='航天/航空'){?> selected="" <?php }?> value="航天/航空">航天/航空</option>
                                    <option <?php if($company['hangye']=='化工/采掘/冶炼'){?> selected="" <?php }?> value="化工/采掘/冶炼">化工/采掘/冶炼</option>
                                    <option <?php if($company['hangye']=='能源（电力/水利/矿产）'){?> selected="" <?php }?> value="能源（电力/水利/矿产）">能源（电力/水利/矿产）</option>
                                    <option <?php if($company['hangye']=='原材料和加工'){?> selected="" <?php }?> value="原材料和加工">原材料和加工</option>
                                    <option <?php if($company['hangye']=='政府/非盈利机构'){?> selected="" <?php }?> value="政府/非盈利机构">政府/非盈利机构</option>
                                    <option <?php if($company['hangye']=='环保'){?> selected="" <?php }?> value="环保">环保</option>
                                    <option <?php if($company['hangye']=='农林牧渔'){?> selected="" <?php }?> value="农林牧渔">农林牧渔</option>
                                    <option <?php if($company['hangye']=='多元化集团'){?> selected="" <?php }?> value="多元化集团">多元化集团</option>
                                    <option <?php if($company['hangye']=='其他行业'){?> selected="" <?php }?> value="其他行业">其他行业</option>
                                    <option <?php if($company['hangye']=='人力资源服务'){?> selected="" <?php }?> value="人力资源服务">人力资源服务</option>
                               </select>
                               <span class="tip"></span>
                            </td>
                        </tr>
                        <tr>
                           <th><em class="fred">*</em> 公司类型：</th>
                           <td>
                               <select name="Company[leixing]" validate="{validate:{required:true,  messages:{required:'请选择公司类型'}}}" class="selInt">
                                    <option value="">请选择</option>
                                    <option <?php if($company['leixing']=='私营'){?> selected="" <?php }?> value="私营">私营</option>
                                    <option <?php if($company['leixing']=='国有'){?> selected="" <?php }?> value="国有">国有</option>
                                    <option <?php if($company['leixing']=='股份制'){?> selected="" <?php }?> value="股份制">股份制</option>
                                    <option <?php if($company['leixing']=='外商独资/办事处'){?> selected="" <?php }?> value="外商独资/办事处">外商独资/办事处</option>
                                    <option <?php if($company['leixing']=='中外合资/合作'){?> selected="" <?php }?> value="中外合资/合作">中外合资/合作</option>
                                    <option <?php if($company['leixing']=='上市公司'){?> selected="" <?php }?> value="上市公司">上市公司</option>
                                    <option <?php if($company['leixing']=='事业单位'){?> selected="" <?php }?> value="事业单位">事业单位</option>
                                    <option <?php if($company['leixing']=='政府机关'){?> selected="" <?php }?> value="政府机关">政府机关</option>
                                    <option <?php if($company['leixing']=='非营利机构'){?> selected="" <?php }?> value="非营利机构">非营利机构</option>
                                    <option <?php if($company['leixing']=='个人企业'){?> selected="" <?php }?> value="个人企业">个人企业</option>
                               </select>
                               <span class="tip"></span>
                           </td>
                        </tr>
                        <tr>
                           <th><em class="fred">*</em> 公司规模：</th>
                           <td>
                                <select name="Company[guimo]" validate="{validate:{required:true,  messages:{required:'请选择公司规模'}}}" class="selInt">
                                    <option value="">公司规模</option>
                                    <option <?php if($company['guimo']=='20人以下'){?> selected="" <?php }?> value="20人以下">20人以下</option>
                                    <option <?php if($company['guimo']=='20-100人'){?> selected="" <?php }?>  value="20-100人">20-100人</option>
                                    <option <?php if($company['guimo']=='100-300人'){?> selected="" <?php }?>  value="100-300人">100-300人</option>
                                    <option <?php if($company['guimo']=='300-500人'){?> selected="" <?php }?>  value="300-500人">300-500人</option>
                                    <option <?php if($company['guimo']=='500-1000人'){?> selected="" <?php }?>  value="500-1000人">500-1000人</option>
                                    <option <?php if($company['guimo']=='1000人以上'){?> selected="" <?php }?>  value="1000人以上">1000人以上</option>
                                </select>
                                <span class="tip"></span>
                           </td>
                        </tr>
                        <tr>
                            <th width="120" align="right" valign="top"><em class="fred">*</em> 公司介绍：</th>
                            <td>
                                <textarea name="Company[jieshao]" style="width: 380px; height: 120px; border: solid 1px #999; font-size: 14px; vertical-align: top;" validate="{validate:{required:true,  messages:{required:'填写公司介绍'}}}"><?php echo $company['jieshao']?></textarea>
                                <span class="tip"></span>
                            </td>
                        </tr>
                    </tbody>
                    </table>
                    <div class="b_c">联系信息</div>
                    <table class="tb f14">
                        <tbody>
                        <tr>
                            <th width="120" align="right"><em class="fred">*</em> 联系人：</th>
                            <td>
                                <input type="text" name="Company[realname]" validate="{validate:{required:true,  messages:{required:'填写联系人'}}}" value="<?php echo $company['realname']?>" class="txtInt1 realname"/>
                                <span class="tip"></span>
                            </td>
                        </tr>
                        <tr>
                            <th><em class="fred">*</em> 电话：</th>
                            <td>
                                <input type="text" name="Company[phone]" validate="{validate:{required:true,  messages:{required:'填写电话或手机号'}}}" value="<?php echo $company['phone']?>" class="txtInt1 phone"/>
                                <span class="tip"></span>
                            </td>
                        </tr>
                        <tr>
                           <th>公司邮箱：</th>
                           <td>
                                <input type="text" name="Company[email]" validate="{validate:{required:false}}" value="<?php echo $company['email']?>" class="txtInt1 email"/>
                                <span class="tip"></span>
                           </td>
                        </tr>
                        <tr>
                           <th><em class="fred">*</em> 公司地址：</th>
                           <td>
                                <input type="text" name="Company[address]" validate="{validate:{required:true,  messages:{required:'填写公司地址'}}}" value="<?php echo $company['address']?>" class="txtInt1"/>
                                <span class="tip"></span>
                           </td>
                        </tr>
                        <tr>
                            <th valign="top">服务介绍：</th>
                            <td>
                                <textarea name="Company[service]" style="width: 380px; height: 120px; border: solid 1px #999;"> <?php echo $company['service']?></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th></th>
                            <td>
                                <input type="submit" value="完成修改" class="btn3 icon"/> <span id="msg" class="fred"></span>
                            </td>
                        </tr>
                    </tbody>
                    </table>
                </form>
                </div>
            </div>
            <?php include template("footer")?>
        </div>
    </body>
</html>
<script type="text/javascript">
    var base = "<?php echo site_url()?>";
    var tpl = "<?php echo TPL ?>";
</script>
<script type="text/javascript" src="<?php echo TPL?>/js/jquery.js"></script>
<script data-cfg-corelib="<?php echo TPL?>/js/jquery.js"  type="text/javascript" src="<?php echo TPL?>/js/do.js"></script>
<script type="text/javascript" src="<?php echo TPL?>/js/validate.js"></script>