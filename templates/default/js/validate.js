var upimgs = [];
function sapLoadMsg(data) {
    var obj=eval('('+data+')'); 
    type = obj.type;
    pic = obj.pic;
    if(type=='avatar'){ //上传头像
    	str = '<img width=60 height=60 class=avatar src="'+pic+'" align="absmiddle"><br><a id="avatar" rel="'+pic+'">还原默认</a>';
        $('#uploaded').html(str);
        $('#uploadimgs').val(pic);
    } else if(type=='usercard' || type=='userlicense') {   //上传多张信息图片
        uploadimgs = $("#uploadimgs").val();
        if(uploadimgs!='') upimgs = uploadimgs.split(',');
        upimgs.push(pic);
        $('#uploaded').append('<div><img height=80 src="'+pic+'" align="absmiddle"><br><a class="delpic" rel="'+pic+'">删除</a></div>');
        $('#uploadimgs').val(upimgs.join(','));
    } else if(type=='err') {
        alert(obj.msg);
    }
}

Do.add('metadata',{path: tpl+'/js/lib/jquery.metadata.js' , type:'js'});
Do.add('validate', {path: tpl+'/js/lib/jquery.validate.js', type: 'js'});
Do.add('flash', {path: tpl+'/js/lib/jquery.swfobject.js', type: 'js'});
Do.add('bindemail', {path: tpl+'/js/jquery.exact.js', type: 'js'});

Do(function(){
    Do('metadata', function(){
		$.metadata.setType("attr", "validate");       //更改检测属性为validate
	});
   	 
	//上传头像
	if ($('#upavatar').size() > 0) {
        Do('flash', function(){
            $("#upavatar").flash({
        		swf: tpl+"/images/upload.swf",
        		width: 450,
        		height: 30,
        		allowScriptAccess: "always",
        		flashvars: {
					fileName: "file",
            		upUrl: base+"user/userdo/?act=upload",
                    args: "params=avatar|48X48,60X60,120X120|0|"+sid,
            		maxNum: 1,
            		maxSize: 2,
            		etmsg: 1,
            		ltmsg: 1
        		}
    		});
		});
        
        //删除头像
		$('#avatar').live('click', function(){
            if(!confirm("删除后不可恢复，确定要删除此图片吗？")) return;
            var pic = $(this).attr('rel');
            $.post(base+'user/userdo/?act=delpic',{"pic":pic,"type":"avatar"},function(msg){             
                $("#uploaded").html("<img class='avatar' src='"+tpl+"/images/default.png' width=60>");
                $('#uploadimgs').val('');                    
            });          
    		return false;
	   });
	}

   	//上传身份证
	if ($('#upusercard').size() > 0) {
	   Do('flash', function(){
	       $("#upusercard").flash({
                swf: tpl+"/images/upload.swf",
        		width: 450,
        		height: 30,
        		allowScriptAccess: "always",
        		flashvars: {
					fileName: "file",
            		upUrl: base+"user/userdo/?act=upload",
                    args: "params=usercard|0|1|"+sid,
            		maxNum: 2,		//允许同时上传的图片数量
            		maxSize: 2,		//单张图片允许多大（单位M）
            		etmsg: 1,
            		ltmsg: 1
        		}
    		});
		});
        
        //删除身份证
    	$('a.delpic').live('click', function(){
    	    if(!confirm("删除后不可恢复，确定要删除此图片吗？")) return;
    		var pic = $(this).attr('rel');
            $.post(base+'user/userdo/?act=delpic',{"pic":pic,"type":"usercard"},function(msg){             
        		upimgs.splice($.inArray(pic, upimgs), 1);
        		$('#uploadimgs').val(upimgs.join(','));   
            });
            $(this).parent().remove();
    		return false;
    	});
	}
    
   	//上传营业执照
	if ($('#upuserlicense').size() > 0) {
	   Do('flash', function(){
	       $("#upuserlicense").flash({
                swf: tpl+"/images/upload.swf",
        		width: 450,
        		height: 30,
        		allowScriptAccess: "always",
        		flashvars: {
					fileName: "file",
            		upUrl: base+"user/userdo/?act=upload",
                    args: "params=userlicense|0|1|"+sid,
            		maxNum: 2,
            		maxSize: 2,
            		etmsg: 1,
            		ltmsg: 1
        		}
    		});
		});
        
        //删除营业执照
    	$('a.delpic').live('click', function(){
    	    if(!confirm("删除后不可恢复，确定要删除此图片吗？")) return;
    		var pic = $(this).attr('rel');
            $.post(base+'user/userdo/?act=delpic',{"pic":pic,"type":"userlicense"},function(msg){             
        		upimgs.splice($.inArray(pic, upimgs), 1);
        		$('#uploadimgs').val(upimgs.join(','));   
            });
            $(this).parent().remove();
    		return false;
    	});
	}
    Do('validate', function(){
  		//中文联系人
		$.validator.addMethod("realname", function(value, element) {
			if(value!='' && value.length < 2 || value.length > 4){
				return false;
			}else{
				var cnname = /^[\u4e00-\u9fa5]+$/;
				return   this .optional(element)  ||  cnname.test(value);
			}
		}, "请填写正确的联系人，2-4个汉字");
        
        //判断手机
    	$.validator.addMethod("mobile", function(value, element) {
            var filter=/^(13|15|18)\d{9}$/;
    		if(value!=''&&value!=''&&!filter.test(value)){
    			return false;
    		}else{
    			return this.optional(element)||value;
    		}
    	}, "请输入正确的手机号码");
        
        //判断电话或手机
    	$.validator.addMethod("phone", function(value, element) {
            var filter=/(^(0\d{2,3})?-?([2-9]\d{6,7})(-\d{1,4})?$)|(^((\(\d{3}\))|(\d{3}\-))?(13|15|18)\d{9}$)|(^(400|800)\d{7}(-\d{1,4})?$)|(^(95013)\d{6,8}$)/;
    		if(value!=''&&value!=''&&!filter.test(value)){
    			return false;
    		}else{
    			return this.optional(element)||value;
    		}
    	}, "请输入正确的电话或手机，区号或分机使用-进行分隔");
        
        //判断qq
    	$.validator.addMethod("qq", function(value, element) {
            var filter=/^[1-9][0-9]{4,9}$/;
    		if(value!=''&&!filter.test(value)){
    			return false;
    		}else{
    			return this.optional(element)||value;
    		}
    	}, "请输入正确的QQ号");
        
        //判断email
    	$.validator.addMethod("email", function(value, element) {
            var filter=/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
    		if(value!=''&&!filter.test(value)){
    			return false;
    		}else{
    			return this.optional(element)||value;
    		}
    	}, "请输入正确的email");
        
        //判断确认密码
       	$.validator.addMethod("pwdagain", function(value, element) {
       	    var newpwd = $("#newpwd").val();
    		if(value!= newpwd){
    			return false;
    		}else{
    			return this.optional(element)||value;
    		}
    	}, "两次输入的密码不一致");
        
        //修改个人资料、密码、公司资料表单验证
	   $("#about_form,#pwd_form,#userbiz_form,#avatar_form,#usercard_form,#userlicense_form").validate({
            meta: "validate",       //如果想使用其它插件来使用元数据验证规则，得指定相应的元数据对象
			errorPlacement: function(error, element) {
				if ( element.is(":radio") )
					error.appendTo(element.parent().parent().find('.tip')).addClass('icon error');
				else if ( element.is(":checkbox") )
					error.appendTo(element.parent().parent().find('.tip')).addClass('icon error');
				else
					error.appendTo(element.siblings('.tip')).addClass('icon error');       //siblings为遍历
			},
			success: function(label) {
				label.html("&nbsp;").removeClass('error').addClass('ok');
			},
			submitHandler: function(form) {      //验证成功提交时
                var formid = $(form).attr('id');
                if(formid=='about_form') url = base+"user/userdo/?act=about";
                if(formid=='pwd_form') url = base+"user/userdo/?act=pwd";
                if(formid=='userbiz_form') url = base+"user/userdo/?act=userbiz";
                if(formid=='avatar_form') url = base+"user/userdo/?act=avatar";
                if(formid=='usercard_form') url = base+"user/userdo/?act=usercard";
                if(formid=='userlicense_form') url = base+"user/userdo/?act=userlicense";              
				$.ajax({
					type: 'post',
					dataType : 'text',
                    url: url,
					data : $(form).serialize(),
                    beforeSend: function(){
                        $("#msg").html("<font color=green>稍等，正在提交...</font>").show();
                    },
					success: function(msg){
        				$("#msg").html(msg);
                        $("#msg").delay(5000).fadeOut();
					},
					error: function(){
                        alert('操作失败，请刷新重试！');
					}
				});
			}
        });
        return;
    });
    
    Do('bindemail',function(){
        //验证邮箱
        $('.bindemail').click(function(){
            $("#fw_title .title").html("验证邮箱");
            $("#fw_body").html("");
            $("#fw_button").hide(); $("#fw_load").hide();
            $("#floatwin").css({width:"270px",height:"130px"});
            $("#floatwin").runfloatwin();
            
            var v = $(".email").val();
            var pattern = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
        	if (!pattern.test(v)) {
        		$("#fw_body").html("请填写正确的Email地址！");
        		return false;
        	}
            $("#fw_load").show();
            $.ajax({
				type: 'get',
				dataType : 'text',
                url: base+"user/userdo/?act=send_email&email="+v,
                timeout:800000,
				success: function(msg){
    				$("#fw_body").html(msg);
                    $("#fw_load").hide();
				},
				error: function(){
                    alert('操作失败，请刷新重试！');
				}
			});  
        });
        
        //关闭窗口
        $('.close').click(function(){
            $("#floatwin").hide();
        });
    });
});