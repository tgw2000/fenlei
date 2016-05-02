Do.add('domwindow', {path: tpl+'/js/lib/jquery.domwindow.js', type: 'js'});
Do.add('metadata',{path: tpl+'/js/lib/jquery.metadata.js' , type:'js'});
Do.add('validate', {path: tpl+'/js/lib/jquery.validate.js', type: 'js'});
Do.add('flash', {path: tpl+'/js/lib/jquery.swfobject.js', type: 'js'});
Do(function(){
    Do('metadata', function(){
		$.metadata.setType("attr", "validate");       //更改检测属性为validate
	});

    Do('validate', function(){
        $(".int").each(function(){
            title = $(this).parent().parent().find(".column em").html();
            cls = $(this).attr("class");
            cls = cls.replace(' int','');
            //判断整数型字段
    		$.validator.addMethod(cls, function(value, element) {
                var filter=/^[0-9]*$/; //0-9数字
    			if(!filter.test(value)){
    				return false;
    			}else{
    				return this.optional(element) || value;
    			}
    		}, title+"只能为整数");
        })

        //判断标题长度
		$.validator.addMethod("form_title", function(value, element) {
			if(value.length < 6){
				return false;
			}else if(value.length > 30){
				return false;
			}else{
				return  this.optional(element)  ||  value;
			}
		}, "标题长度在6-30个字之间"); 

		//中文联系人
		$.validator.addMethod("form_realname", function(value, element) {
			if(value.length < 2 || value.length > 4){
				return false;
			}else{
				var cnname = /^[\u4e00-\u9fa5]+$/;
				return   this .optional(element)  ||  cnname.test(value);
			}
		}, "请填写正确的联系人，2-4个汉字，如张三、欧阳先生");
        
        //判断电话或手机
		$.validator.addMethod("form_mobile", function(value, element) {
            var filter=/(^(0\d{2,3})?-?([2-9]\d{6,7})(-\d{1,4})?$)|(^((\(\d{3}\))|(\d{3}\-))?(13|14|15|18)\d{9}$)|(^(400|800)\d{7}(-\d{1,4})?$)|(^(95013)\d{6,8}$)/;
			if(!filter.test(value)){
				return false;
			}else{
				return this.optional(element)||value;
			}
		}, "请输入正确的电话或手机，区号或分机使用-进行分隔");
        
        //判断qq
		$.validator.addMethod("form_qq", function(value, element) {
            var filter=/^[1-9][0-9]{4,9}$/;
			if(value!='' && !filter.test(value)){
				return false;
			}else{
				return this.optional(element)||value;
			}
		}, "请输入正确的QQ号");
        
        //判断价格
		$.validator.addMethod("form_price", function(value, element) {
            var filter=/^[0-9]*$/; //0-9数字
			if(!filter.test(value)){
				return false;
			}else{
				return this.optional(element) || value;
			}
		}, "请输入正确的价格，价格为数字,为0表示面议");
        
        
        //判断验证码
		$.validator.addMethod("form_code", function(value, element) {
            var v=$("input[name=imgcode]").val();
            var getcode=getvalue(base+'user/userdo/?act=get_imgcode');
            if(v!=getcode){
                return false;
            } else {
                return this.optional(element)||value;
            }  
		}, "请输入正确的验证码");
        
	   $("#postForm").validate({
            meta: "validate",       //如果想使用其它插件来使用元数据验证规则，得指定相应的元数据对象
 			errorPlacement: function(error, element) {
				if (element.is(":radio") )
					error.appendTo(element.parent().parent().find('.tip')).addClass('icon error');
				else if (element.is(":checkbox"))
					error.appendTo(element.parent().parent().find('.tip')).addClass('icon error');
				else
					error.appendTo(element.siblings('.tip')).addClass('icon error');       //siblings为遍历
			},
			success: function(label) {
				label.html("&nbsp;").removeClass('error').addClass('ok');
			},
			submitHandler: function(form) {      //验证成功提交时
				$.ajax({
					type: 'post',
					dataType : 'json',
                    url:base+"user/userdo/?act=fabu",
					data : $('#postForm').serialize(),
					beforeSend: function(){
						if ($('.dialog').size() == 0) $('body').append('<div class="dialog"></div>');
						else $('.dialog').html('');
						$('.dialog').html("<div id='tip' class='fgreen'><img src='"+tpl+"/images/loading1.gif' align='absmiddle'> 正在提交...</div>");
						$('#submit_btn').removeClass('h_publish').addClass('h_modify').attr('disabled', true);
						Do('domwindow',function(){
							$('#DOMWindow').remove();
							$.openDOMWindow({
								height: $('.dialog').height(),
								width: $('.dialog').width(),
								windowSourceID:'.dialog', 
								windowPadding:0,
								overlay:0
							});
						})
					},
					success: function(data){
						if ($('.dialog').size() == 0) $('body').append('<div class="dialog"></div>');
						else $('.dialog').html('');
                        var msg = data.msg;
						if (msg=='ok'){   //发布或修改成功
							window.location.href = base + data.sidspell + '/' + data.infoid + '.html?success=1'; 
						}else{
							$('#tip').removeClass().addClass('fred').html(msg);
							setTimeout(function(){$.closeDOMWindow();}, 2000);
							$('#submit_btn').removeClass('h_modify').addClass('h_publish').attr('disabled', false);
						}
						return false;
					},
					error: function(){
						$('#tip').removeClass().addClass('fred').html('提交失败，请联系管理员。');
						setTimeout(function(){$.closeDOMWindow();}, 2000);
						$('#submit_btn').removeClass('h_modify').addClass('h_publish').attr('disabled', false);
					}
				});
				return false;
			}
        });
    });
   
   	//上传图片
	if ($('#upflash').size() > 0) {
		Do('flash', function(){
			$("#upflash").flash({
        		swf: tpl+"/images/upload.swf",
        		width: 450,
        		height: 30,
        		allowScriptAccess: "always",
        		flashvars: {
					fileName: "file",
            		upUrl: base+"user/userdo/?act=upload",
                    args: "params=info|100X75,320X207|1|"+sid,
            		maxNum: 10,
            		maxSize: 2,
            		etmsg: 1,
            		ltmsg: 1
        		}
    		});
		});
		
    	$('a.delpic').live('click', function(){
    	   if(!confirm("删除后不可恢复，确定要删除此图片吗？")) return;
    		var pic = $(this).attr('rel');
            $.post(base+'user/userdo/?act=delpic',{"pic":pic,"type":"info"},function(msg){             
        		//upimgs.splice($.inArray(pic, upimgs), 1);
        		//$('#uploadimgs').val(upimgs.join(','));   
            });
            $(this).parent().remove();
    		return false;
    	});
	}
});

function sapLoadMsg(data) {
    var obj=eval('('+data+')'); 
    type = obj.type;
    pic = obj.pic;
    if(type=='err'){
        alert(obj.msg);
    } else {
        $('#uploaded').append('<div><img width=80 height=60 src="'+pic+'" align="absmiddle"><br><a class="delpic" rel="'+pic+'">删除</a><input type=hidden name=upimg[] value="'+pic+'"/></div>');
    }
}

//获取值
function getvalue(url){
	url=url.split("?");
	$.ajax({type: "get",async:false, url:url[0], data:url[1], dataType: "text" , 
    success: function(msg){
		v = msg;
	}})
	return v ;
}

//点击更换验证码
function change(){
    var src = base+"user/imgcode/?"+Math.random();
    $("#imgcode").attr('src',src); 
}

//获取分类
function get_type(num){
    var pid = $('#cate'+num).find("li a.on").attr("v");      //上级分类id
    var nownum = parseInt(num)+1;       // 级别，将字符串转换为数字
    var val = pids[num];
    $.ajax({
        type: "get", 
        url: base+"user/userdo",
        data: {"act":"get_type" , "pid":pid },
        async: false,
        dataType: "json",
        error: function() { alert('小类读取失败，请刷新！'); },
        success: function(result) {
            var length = result.length;
            length = Math.ceil(length/10);
            width = (length*180)+'px';
            if ( result != 0){
                if(nownum==3){
                    title = $("#cate2").find("li a.on").html();
                    html = "<ul id=cate"+nownum+" style='height:425px'>";
                    html+="<div class=tit><a class=close>关闭</a>"+title+"&nbsp&nbsp<a class=back>返回&gt&gt</a></div>"
                    html+= "<div class=fl style='width:180px' v="+nownum+">";
                } else {
                    html = "<ul id=cate"+nownum+" style='width:"+width+";height:380px; display:none;'>";
                    html+= "<div class=fl style='width:180px' v="+nownum+">";
                }
                                        
                var datas = eval(result);
                $.each(datas, function(i,item) {     //msg是二维对象，item是取一维对象
                    if(item.cid==val){
                        var cls = "class='on'";
                    } else {
                        var cls = '';
                    }
                    html+= "<li><a href='#'"+cls+" v='" + item.cid + "'>" + item.title + "</a></li>";
                    if((i+1)%10==0) html+="</div><div class=fl style='width:180px' v="+nownum+">";
                });  
                html += "</div></ul>";
                                        
                //清空过时的选项
                $("#publish_body ul").each(function(i){
                    if(i+1 > num) {
                        $(this).remove();
                    }
                })
                $("#publish_body").append(html);
                if(nownum==2){      //第一级窗口左移完显示第二级窗口
                    $("#cate1").animate({marginLeft:0},"slow",function(){
                        $("#cate2").show();
                    });
                }
                if(nownum==3){      //第三级窗口左移
                    $("#cate3").animate({left:"290px"},"slow",function(){
                        $("#cate1").addClass("filteropacity");
                        $("#cate2").addClass("filteropacity");
                        $("#cate3").show();
                    });
                }
            }else {
                if(infoid>0){
                    go = base+"fabu/"+pid+"/?id="+infoid;
                } else {
                    go = base+"fabu/"+pid+"/";
                }
                window.location.href = go;
            }
        }
    });        
}