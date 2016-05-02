<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>免费发布信息_济宁分类001</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="icon" href="<?php echo TPL?>/images/favicon.ico"/>
        <link href="<?php echo TPL?>/css/style.css" rel="stylesheet" type="text/css" />
        <link href="<?php echo TPL?>/css/fabu.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <?php include template("user/header")?>
        <div class="wapper">
            <form id="postForm" method="post">
                <div class="fabu_content">
                    <h4>免费发布信息</h4>
                    <?php if($description){?><div class="toptips"><?php echo $description ?></div><?php }?>
                    <ul class="cc">
                    <?php if($infoid){?>
                        <li>
                            <span class="column">标题：</span>
                            <span><a href="<?php echo site_url("$pinyin/$infoid.html")?>"><?php echo $info['title']?></a></span>
                        </li>
                    <?php } ?>
                        <li>
                            <span class="column">选择类目：</span>
                            <span><?php echo $nav ?></span>
                        </li>
                        <li>
                            <span class="column"><em class="fred">*</em>&nbsp;标题：</span>
                            <input type="text" validate="{validate:{required:true,  messages:{required:'请填写标题'}}}" value="<?php echo $info['title']?>" name="info[title]" class="form_title" id="title"/>
                            <label class="tip"></label>
                        </li>
                        <?php foreach($extr as $row){
                            $title = $row["title"];     //字段标题
                            $field = $row['field'];     //字段名  
                            $field_type = $row['field_type'];
                            $input_type = $row['input_type'];
                            $required = $row['required'];
                            $value = $extr_info[$field];
                            if($required=='on'){
                                $validate="{validate:{required:true,  messages:{required:'请填写".$title."'}}}";
                            } else {
                                $validate="{validate:{required:false}}";
                            }
                        ?>
                        
                             <!-- 输入框为文本框时 -->
                             <?php if($input_type=='text'){ ?>                        
                                <li><span class="column"><?php if($required=='on'){?><em class="fred">*</em>&nbsp;<?php }?><em><?php echo $title ?></em>：</span>
                                <input type="text" validate="<?php echo $validate?>" name="info[<?php echo $field?>]" size="<?php echo $row['size']?>" value="<?php echo $value ?>" class="form_<?php echo $field?>"/> <?php echo $row['units']?>
                                <label class="tip"></label></li>
                             <?php }?>
                                        
                             <!-- 输入框为单选钮时 -->
                             <?php if($input_type=='radio' && $row[$field]){ ?>
                                <li><span class="column"><?php if($required=='on'){?><em class="fred">*</em>&nbsp;<?php }?><em><?php echo $title ?></em>：</span>     
                                <?php foreach($row[$field] as $k=>$v){?>                                                            
                                    <label><input type="radio" validate="<?php echo $validate?>" name="info[<?php echo $field?>]" value="<?php echo $k?>" <?php if($value==$k){?> checked="" <?php }?>/><?php echo $v?></label>
                                <?php }?>
                                <label class="tip"></label></li>
                             <?php }?>
                             
                            <!-- 输入框为复选框时 -->
                            <?php if($input_type=='checkbox' && $row[$field]){
                                  $tem = explode(',',$value); ?>
                                <li><span class="column"><?php if($required=='on'){?><em class="fred">*</em>&nbsp;<?php }?><em><?php echo $title ?></em>：</span> 
                                <?php foreach($row[$field] as $k=>$v){?>
                                    <label><input type="checkbox" validate="<?php echo $validate?>" name="info[<?php echo $field?>][]" value="<?php echo $k?>" <?php if(in_array($k,$tem)){?> checked="" <?php }?>/><?php echo $v?></label>
                                <?php }?>
                                <label class="tip"></label></li>
                             <?php }?>
                                 
                            <!-- 输入框为列表时 -->
                            <?php if($input_type=='select' && $row[$field]){ ?>
                                <li><span class="column"><?php if($required=='on'){?><em class="fred">*</em>&nbsp;<?php }?><em><?php echo $title ?></em>：</span> 
                                <select validate="<?php echo $validate?>" name="info[<?php echo $field?>]">
                                    <option value="">请选择</option>
                                    <?php foreach($row[$field] as $k=>$v){?>
                                        <option value="<?php echo $k?>" <?php if($value==$k){?> selected="" <?php }?>><?php echo $v?></option>
                                    <?php }?>
                                </select>
                                <label class="tip"></label></li>
                            <?php }} ?>
                        <li>
                            <span class="column">补充说明：</span>
                            <textarea name="info[content]" class="content"><?php echo de_textarea_post_change($info['content'])?></textarea>
                        </li>
                        <li>
                            <span class="column">上传照片：</span>
                            <div class="infor_box attachs ">
                            <table cellspacing="0" cellpadding="0" border="0">
                                <tbody>
                                    <tr>
                                        <td id="uploaded">
                                            <?php foreach($photos as $v){?>
                                                <div>
                                                    <img width="80" height="60" src="<?=$v['path']?>" align="absmiddle"/><br/>
                                                    <a class="delpic" rel="<?=$v['path']?>">删除</a>
                                                    <input type="hidden" name="upimg[]" value="<?=$v['path']?>"/>
                                                </div>
                                            <?php }?>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="f12">
                                            <div id="upflash"></div>
                                            <p class="f666">图片必须小于2M，最多10张，允许jpg、gif、png格式。 <a target="_blank" href="<?php echo site_url('help/1.html#article6')?>">（无法上传图片？请点击！）</a></p>
                                            <p class="ff60">发布图片让信息更受关注，还有机会出现在分类首页上！</p>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            </div>
                        </li>
                        <li>
                            <span class="column"><em class="fred">*</em>&nbsp;联系人：</span>
                            <input type="text" validate="{validate:{required:true,  messages:{required:'请填写联系人'}}}" value="<?php echo $info['realname']?>" name="info[realname]" class="form_realname" id="realname"/>
                            <label class="tip"></label>
                        </li>
                        <li>
                            <span class="column"><em class="fred">*</em>&nbsp;手机或电话：</span>
                            <input type="text" validate="{validate:{required:true,  messages:{required:'请填写电话或手机，参照格式：0537-37*****或139********'}}}" value="<?php echo $info['mobile']?>" name="info[mobile]" class="form_mobile" id="mobile"/>
                            <label class="tip"></label>
                        </li>
                        <li>
                            <span class="column">&nbsp;QQ：</span>
                            <input type="text" validate="{validate:{required:false}}" value="<?php echo $info['qq']?>" name="info[qq]" class="form_qq" id="qq"/>
                            <label class="tip"></label>
                        </li>
                        
                        <!--第一级分类为招聘时-->
                        <?php if($current_cat['parent'][0]['cid']==3){?>
                        </ul>
                        <h4 class="forcomp_tit">完善公司信息<span>（<a target="_blank" href="<?php echo site_url('user/userbiz')?>">修改公司信息请点击&gt;&gt;</a>）</span></h4>
                        <ul>
                            <li>
                                <span class="column"><em class="fred">*</em>&nbsp;公司名称：</span>
                                <input type="text" validate="{validate:{required:true, minlength:4,  messages:{required:'请填写公司名', minlength:'最少4个字'}}}" value="<?php echo($company['mingcheng'])?>" name="company[mingcheng]"/>
                                <label class="tip"></label>
                            </li>
                            <li>
                                <span class="column"><em class="fred">*</em>&nbsp;公司类型：</span>
                                <select validate="{validate:{required:true,  messages:{required:'请选择公司类型'}}}" name="company[leixing]">
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
                                <label class="tip"></label>
                            </li>
                            <li>
                                <span class="column"><em class="fred">*</em>&nbsp;所属行业：</span>
                                <select name="Company[hangye]" validate="{validate:{required:true,  messages:{required:'请选择行业'}}}">
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
                               <label class="tip"></label>
                            </li>
                            <li>
                                <span class="column"><em class="fred">*</em>&nbsp;公司规模：</span>
                                <select validate="{validate:{required:true,  messages:{required:'请选择公司规模'}}}" name="Company[guimo]">
                                    <option value="">公司规模</option>
                                    <option <?php if($company['guimo']=='20人以下'){?> selected="" <?php }?> value="20人以下">20人以下</option>
                                    <option <?php if($company['guimo']=='20-100人'){?> selected="" <?php }?>  value="20-100人">20-100人</option>
                                    <option <?php if($company['guimo']=='100-300人'){?> selected="" <?php }?>  value="100-300人">100-300人</option>
                                    <option <?php if($company['guimo']=='300-500人'){?> selected="" <?php }?>  value="300-500人">300-500人</option>
                                    <option <?php if($company['guimo']=='500-1000人'){?> selected="" <?php }?>  value="500-1000人">500-1000人</option>
                                    <option <?php if($company['guimo']=='1000人以上'){?> selected="" <?php }?>  value="1000人以上">1000人以上</option>
                                </select>
                                <label class="tip"></label>
                            </li>
                            <li>
                                <span class="column"><em class="fred">*</em>&nbsp;公司地址：</span>
                                <input type="text" validate="{validate:{required:true,  messages:{required:'填写公司地址'}}}" value="<?php echo $company['address']?>" name="Company[address]"/>
                                <label class="tip"></label>
                            </li>
                            <li>
                                <span class="column"><em class="fred">*</em>&nbsp;联系人：</span>
                                <input type="text" validate="{validate:{required:true, maxlength:10, messages:{required:'填写联系人' ,maxlength:'联系人不能超过10字符'}}}" value="<?php echo $company['realname']?>" name="Company[realname]"/>
                                <label class="tip"></label>
                            </li>
                            <li>
                                <span class="column"><em class="fred">*</em>&nbsp;联系电话：</span>
                                <input type="text" validate="{validate:{required:true, maxlength:20, messages:{required:'填写联系电话' ,maxlength:'电话不能超过20字符'}}}" value="<?php echo $company['phone']?>" name="Company[phone]"/>
                                <label class="tip"></label>
                            </li>
                            <li>
                                <span class="column"><em class="fred">*</em>&nbsp;公司邮箱：</span>
                                <input type="text" validate="{validate:{required:true, maxlength:50,  messages:{required:'填写公司邮箱' ,maxlength:'邮箱不能超过50字符'}}}" value="<?php echo $company['email']?>" name="Company[email]"/>
                                <label class="tip"></label>
                            </li>
                            <li>
                                <span class="column"><em class="fred">*</em>&nbsp;公司简介：</span>
                                <textarea validate="{validate:{required:true,  messages:{required:'填写公司介绍'}}}" name="Company[jieshao]"><?php echo $company['jieshao']?></textarea>
                                <label class="tip"></label>
                            </li>
                        <?php }?>
                        
                        <?php if(!$infoid){?>
                        <li>
                            <span class="column"><em class="fred">*</em>&nbsp;验证码：</span>
                            <input type="text" validate="{validate:{required:true,  messages:{required:'请输入验证码'}}}" size="10" name="imgcode" class="form_code"/>
                            <img id="imgcode" onclick="change()" alt="单击刷新图片" style="cursor:pointer;" src="<?php echo site_url('user/imgcode/');?>"/>
                            <a class="refresh" onclick="change()">换一张</a>
                            <label class="tip"></label>
                        </li>
                        <?php }?>
                        <li>
                            <span class="column">&nbsp;</span>
                            <input type="submit" value="马上发布" id="submit_btn" class="h_publish fl icon mr10"/>
                            <p class="end">即代表您已阅读并同意 <a target="_blank" href="#">济宁分类信息版规</a></p>
                        </li>
                    </ul>
                    <div class="blank10"></div>
                </div>
                <?php if($infoid){?><input type="hidden" name="infoid" value="<?php echo $infoid ?>"/><?php }?> 
                <input type="hidden" name="info[cid]" value="<?php echo $cid?>"/>          
                <input type="hidden" name="token" value="<?php echo $token?>"/>
            </form>
        </div>
        <div class="blank20"></div>
        <?php include template("footer")?>
    </body>
    </html>
    <script type="text/javascript">
        var base = "<?php echo site_url()?>";
        var tpl = "<?php echo TPL ?>";
        var sid = "<?php echo session_id()?>";
    </script>
    <script type="text/javascript" src="<?php echo TPL?>/js/jquery.js"></script>
    <script data-cfg-corelib="<?php echo TPL?>/js/jquery.js"  type="text/javascript" src="<?php echo TPL?>/js/do.js"></script>
    <script language="javascript" src="<?php echo TPL?>/js/fabu.js"></script>
