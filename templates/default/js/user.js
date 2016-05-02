$(function(){
    $("input[type=text],input[type=password],textarea").focus(function(){
        $(this).addClass("input_on");
    }).blur(function(){
        $(this).removeClass("input_on");
    })
    
    //用户登录
    $("#smt").live('click',function(){ 
        var user=$("#user").val();
        var pwd = $("#pwd").val();
        var forward = $("#forward").val();
        var token = $("#token").val();
        $("#msg").show();
        if(user==""){
    		$("#msg").html("请输入您的用户名！"); 
            $("#user").focus();
    		return(false);
        }
    	if(pwd==""){
    		$("#msg").html("请输入您的密码！");
            $("#pwd").focus();
    		return(false);
        }
        $("#msg").html("正在提交，请稍等...");
        $('#smt').removeClass('btn').addClass('btn1').attr('disabled', true);
    	$.ajax({type: "post", url: base+"user/userdo/?act=login", data: {"user":user,"pwd":pwd,"forward":forward,"token":token}, dataType: "json" ,
        success: function(json){
            if(json.flag =='redirect'){
                window.location = json.forward;
            }else if(json.flag =='err'){
                $("#msg").html(json.msg);
                $('#smt').removeClass('btn1').addClass('btn').attr('disabled', false); 
            }
        }});
        
    })
    
     //检测用户名
     $("input[name=user]").focus(function(){
        $("#s_user").removeClass("clew2 clew3");
        $("#s_user").html("用户名限制在3至10个字符之间");
     });
     
     $("input[name=user]").blur(function(){
        chkuser();
     });
    
    //注册单个检测
    $(".ip1").focus(function() {
	   showmsg($(this).attr("gid"),$(this).attr("name"),0);
		
	});
	$(".ip1").blur(function() {
		t=checkvalue($(this).attr("name"));
		if (!t) showmsg($(this).attr("gid"),$(this).attr("name"),1); 
		else showmsg($(this).attr("gid"),$(this).attr("name"),-1); 

	});
    
    //注册提交处理
   	$("form[name=formreg]").submit(function() {
        var x=0;
		$(".ip1").each(function(){
			t=checkvalue($(this).attr("name"));
			if (!t){
                showmsg($(this).attr("gid"),$(this).attr("name"),1);x=1;
            }else {
                showmsg($(this).attr("gid"),$(this).attr("name"),-1);
			}
		});

        chkuser();
        if(y == 0) x=1;  //y是用来判断chkuser中ajax执行结果的变量
        if (x==1) return false;
        $("#reg_btn").val("正在注册");
        $('#reg_btn').removeClass('btn').addClass('btn1').attr('disabled', true); 
    });
    
    //重设密码提交处理
   	$("form[name=formreset]").submit(function() {
        var x=0;
		$(".ip1").each(function(){
			t=checkvalue($(this).attr("name"));
			if (!t){
                showmsg($(this).attr("gid"),$(this).attr("name"),1);x=1;
            }else {
                showmsg($(this).attr("gid"),$(this).attr("name"),-1);
			}
		});

        if (x==1) return false;
        $("#reg_btn").val("正在提交");
        $('#reg_btn').removeClass('btn').addClass('btn1').attr('disabled', true); 
    });
    
    //找回密码
    $("#getpwd").click(function(){
        var user=$("#user").val();
        var email=$("#email").val();
        var token = $("#token").val();
        $("#msg").show();
        
        if(user==""){
    		$("#msg").html("请输入您的用户名！"); 
            $("#user").focus();
    		return(false);
        }
        
        if(email==""){
    		$("#msg").html("请输入注册时填写的邮箱，并且已验证！"); 
            $("#email").focus();
    		return(false);
        }
        var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
        if (!reg.test(email)){
      		$("#msg").html("电子邮箱格式不正确！"); 
            $("#email").focus();
    		return(false);
        }
        
        $("#msg").html("正在提交，请稍等...");
        $('#getpwd').removeClass('btn').addClass('btn1').attr('disabled', true);
    	$.ajax({type: "post", url: base+"user/userdo/?act=getpwd", data: {"user":user,"email":email,"token":token}, dataType: "text" ,
        success: function(msg){
            msg = msg.split('|');
            if(msg[0] =='error'){
                $("#msg").html(msg[1]);
                $('#getpwd').removeClass('btn1').addClass('btn').attr('disabled', false); 
                
            }else {
                $('#get_pwd_ipt').remove();
                $('#get_pwd_tips').html(msg[0]).show();
                
            }
        }});
    });
    
    //关闭floatwin弹出层
    $(".close,#fw_close").click(function(){
        $("#floatwin").hide();
    })
    
    //删除信息
    $('.del,#info_del').live('click',function(){
        $("#fw_title .title").html("删除信息");
        $("#floatwin").css({width:"270px",height:"130px"});
        var v = $(this).attr("rel");       //链接删除
        var v1 = $("input[type=checkbox]:checked").val();   //按钮删除
        if(!v &&!v1){
            $("#fw_button").show();$("#fw_load").hide();
            $("#fw_submit").hide();
            $("#fw_close").show().val("关闭");
            $("#fw_body").html("请选择要操作的信息！");
        } else {
            $("#fw_button").show();$("#fw_load").hide();
            $("#fw_submit").show();
            $("#fw_close").show().val("取消");
            $("#fw_body").html("确定要删除吗？");
        }
        $("#floatwin").runfloatwin();
        
        //确定删除
        $('#fw_submit').unbind().bind('click',function(){
            $("#fw_button").hide();
            $("#fw_load").show();
            if(v>0){
                data={'infoid[]' : v };
            } else {
                data = $("#info_form").serialize();
            }
            $.ajax({
				type: 'post',
				dataType : 'text',
				url : base+"user/userdo/?act=del_info",
				data : data ,
				success: function(msg){
				    msg=msg.split("|");
                    $("#fw_button").show(); $("#fw_load").hide()
                    $("#fw_submit").hide();
                    $("#fw_close").val("关闭");
                    
				    if (msg[0]=='ok'){
                        arr = msg[1].split(",");
                        for(i in arr){
    				        var f_id = arr[i];     //infoid
                            var f_title = $("#info_"+f_id).find(".title .f14 a").html();   //标题
                            var f_time = $("#info_"+f_id).find(".title p").html();   //刷新时间和编号
    				        str=$("#tpl_del").html();
            				str=strReplace("{f_id}",f_id,str); 
            				str=strReplace("{f_title}",f_title,str);
            				str=strReplace("{f_time}",f_time,str); 
                            $("#info_"+f_id).after(str);
                            $("#info_"+f_id).eq(0).remove();
                        }
                        $("#fw_body").html("信息删除成功！");
					}else{
						$("#fw_body").html(msg[0]);
					}
				},
				error: function(){
					alert('操作失败，请刷新重试！');
				}
			})
        });
    });
    
    //恢复信息
    $('.recover,#info_recover').live('click',function(){
        $("#fw_title .title").html("恢复信息");
        $("#floatwin").css({width:"270px",height:"130px"});
        var v = $(this).attr("rel");       //链接恢复
        var v1 = $("input[type=checkbox]:checked").val();   //按钮恢复
        if(!v &&!v1){
            $("#fw_button").show();$("#fw_load").hide();
            $("#fw_submit").hide();
            $("#fw_close").show().val("关闭");
            $("#fw_body").html("请选择要操作的信息！");
            $("#floatwin").runfloatwin();
            return;
        } else {
            $("#fw_button").hide(); $("#fw_load").show();
            $("#fw_submit").hide();
            $("#fw_body").html("");
            $("#floatwin").runfloatwin();
        }
        
        if(v>0){
            data={'infoid[]' : v };
        } else {
            data = $("#info_form").serialize();
        }
        $.ajax({
			type: 'post',
			dataType : 'text',
			url : base+"user/userdo/?act=recover",
			data : data,
			success: function(msg){
                msg=msg.split("|");
                $("#fw_button").show(); $("#fw_load").hide()
                $("#fw_close").val("关闭");
				if (msg[0]=='ok'){
				    id_arr = msg[1].split("$$");
                    title_arr = msg[2].split("$$");
                    url_arr = msg[3].split("$$");
                    url1_arr = msg[4].split("$$");
                    for(i in id_arr){
                        var f_id = id_arr[i];     //infoid
                        var f_title = title_arr[i];   //标题
                        var f_time = $("#info_"+f_id).find(".title p").html();   //刷新时间和编号
                        var f_url = url_arr[i];     //信息链接
                        var f_url1 = url1_arr[i];    //修改链接
    				    str=$("#tpl_recover").html();
        				str=strReplace("{f_id}",f_id,str); 
        				str=strReplace("{f_title}",f_title,str);
        				str=strReplace("{f_time}",f_time,str);
        				str=strReplace("{f_url}",f_url,str);
        				str=strReplace("{f_url1}",f_url1,str);
                        $("#info_"+f_id).after(str);
                        $("#info_"+f_id).eq(0).remove();
                    }                       
                    $("#fw_body").html("信息恢复成功！");
				}else{
					$("#fw_body").html(msg);
				}
			},
			error: function(){
                alert('操作失败，请刷新重试！');
			}
		})
    });
    
    //刷新信息
    $('.refresh').live('click',function(){
        var infoid = $(this).attr("rel");
        $("#fw_title .title").html("刷新信息");
        $("#fw_body").html("");
        $("#fw_button").hide(); $("#fw_load").show();
        $("#fw_submit").hide();
        $("#floatwin").css({width:"270px",height:"130px"});
        $("#floatwin").runfloatwin();
        $.ajax({
			type: 'post',
			dataType : 'text',
			url : base+"user/userdo/?act=refresh",
			data : {'infoid' : infoid },
			success: function(msg){
                $("#fw_button").show(); $("#fw_load").hide()
                $("#fw_close").val("关闭");
                                			 
                msg = msg.split("|");
				if (msg[0]=='ok'){
                    var li = $("#info_"+infoid).clone();        //复制元素
                    $("#info_"+infoid).remove();
                    $(".first").after(li);
                    $("#info_"+infoid).find(".title p em").html(msg[1]);    //更改刷新时间
                    $("#fw_body").html("刷新成功，信息已排到最前！");                    
				}else{
					$("#fw_body").html(msg);
				}
			},
			error: function(){
				alert('操作失败，请刷新重试！');
			}
		})
    });
    
      //置顶信息
    $('.istop').live('click',function(){
        var infoid = $(this).attr("rel");
        $("#fw_title .title").html("置顶信息");
        $("#fw_body").html("请联系网站客服进行信息置顶！");
        $("#fw_button").show(); $("#fw_load").hide();
        $("#fw_submit").hide();
        $("#floatwin").css({width:"270px",height:"130px"});
        $("#floatwin").runfloatwin();
    });
    
    //短消息全选
    $("#chkall").click(function(){
        v =$(this).attr("checked");
        if(v=="checked"){
            $(".chk").attr("checked",true);
        }else{
            $(".chk").attr("checked",false);
        }
    })
    
    //短消息显示隐藏菜单
    $(".pop").live('mouseenter',function(){
        $(this).find("ul").show();
    }).live('mouseleave',function(){
        $(this).find("ul").hide();
    })
    
    //短信列表指向加底色
    $("#pmlist dl").live('mouseenter',function(){
        $(this).addClass("on");
    }).live('mouseleave',function(){
        $(this).removeClass("on");
    })
    
    //标记已读
    $("#pm_isread").click(function(){
        v = $("input[type=checkbox]:checked").val();
        $("#fw_title .title").html("标记已读");
        $("#floatwin").css({width:"270px",height:"130px"});
        
        if(!v){
            $("#fw_button").show();$("#fw_load").hide();
            $("#fw_submit").hide();
            $("#fw_close").show().val("关闭");
            $("#fw_body").html("请选择要操作的短信！");
            $("#floatwin").runfloatwin();
        } else {
            $("#fw_button").hide();$("#fw_load").show();
            $("#fw_body").html("");
            $("#floatwin").runfloatwin();
            $.ajax({
    			type: 'post',
    			dataType : 'text',
    			url : base+"user/userdo/?act=pm_isread",
    			data :$("#pm_del_form").serialize(),
    			success: function(msg){
                    $("#fw_button").show(); $("#fw_load").hide()
                    $("#fw_submit").hide();
                    $("#fw_close").val("关闭").show();             			 
    				$("#fw_body").html(msg);	
    			},
    			error: function(){
    				alert('操作失败，请刷新重试！');
    			}
    		}); 
        }
    })
    
    //删除短消息
    $("#pm_del,.pm_del").live('click',function(){
        $("#fw_title .title").html("删除短消息");
        $("#floatwin").css({width:"270px",height:"130px"});
        v = $("input[type=checkbox]:checked").val();   //按钮删除
        v1= $(this).attr("rel");    //链接删除

        if(!v &&!v1){
            $("#fw_button").show();$("#fw_load").hide();
            $("#fw_submit").hide();
            $("#fw_close").show().val("关闭");
            $("#fw_body").html("请选择要操作的短信！");
        } else {
            $("#fw_button").show();$("#fw_load").hide();
            $("#fw_submit").show();
            $("#fw_close").show().val("取消");
            $("#fw_body").html("删除后不可恢复，确定要删除吗？");
        }
        $("#floatwin").runfloatwin();
        
        //确定删除
        $("#fw_submit").unbind().bind('click',function(){
            $("#fw_button").hide();
            $("#fw_load").show();
            if(typeof(v1)!='undefined'){
                url= v1;
                data='';
            } else {
                url= base+"user/userdo/?act=pm_del";
                data = $("#pm_del_form").serialize();
            }
            //alert(data);return;
            $.ajax({
    			type: 'get',
    			dataType : 'text',
    			url : url,
    			data :data,
    			success: function(msg){
    			 
                    $("#fw_button").show(); $("#fw_load").hide()
                    $("#fw_submit").hide();
                    $("#fw_close").val("关闭").show();             			 
                    msg = msg.split("|");
    				if (msg[0]=='ok'){
    				    if(msg[3]==1){      //全部删除链接，删除后跳转
    				        window.location.href = base+"user/msg/";
    				    }else{
    				        $("#fw_body").html("短信删除成功！");
                            arr = msg[2].split(",");
                            for(i in arr){
                               $(msg[1]+arr[i]).slideUp(function(){
                                    $(msg[1]+arr[i]).remove();
                               });
                            }
    				    }
    				}else{
    					$("#fw_body").html(msg[0]);
    				}
    			},
    			error: function(){
    				alert('操作失败，请刷新重试！');
    			}
    		})
        })
    })
    
    //发送私信
    $('#send_btn').click(function(){
        var touid = $("#touid").val();
        var touser = $("#touser").val();
    	var message = $("#message").val();
        if(touser=='' || touid==''){
            $("#msg").html('请输入收件人用户名，多个用英文逗号分隔');
            $("#touser").focus();
            return;
        }
        if(message.length<1 || message.length>255){
            $("#msg").html('短消息内容限制在255个字符之内');
            $("#message").focus();
            return;
        }         
        $("#msg").html("<font color=green>正在发送...</font>");
        $('#send_btn').attr('disabled',true);
    	$.ajax({
    		type: 'post',
    		url: base+'user/userdo/?act=send_msg',
    		data: $('#send_form').serialize(), 
    		cache: false,
    		dataType:"text",
    		success: function(msg){
  		        msg = msg.split("|");
                if (msg[0]=='ok'){
                    $("#message").val('');
                    $('#send_btn').attr('disabled',false);
                    if(touid>0){    //回复用户短信时
                        str = $("#pm_tpl").html();
                        str=strReplace("{f_id}",msg[1],str);    //短信id
                        str=strReplace("{f_message}",msg[2],str);  //短信内容
                        str=strReplace("{f_time}",msg[3],str);  //发送时间
                        $(".pmlist").find("dl:last").after(str);
                        $("#msg").html("<font color=green>短信发送成功！</font>").delay(5000).fadeOut();
                    }else{
                        $("#msg").html("<font color=green>短信发送成功！</font>");
                        setTimeout(function(){window.location.href = base+"user/msg/"}, 2000);
                    }
    			}else{
    				$('#msg').html(msg[0]);
                    $('#send_btn').attr('disabled',false);
    			}
    		},
    		error: function(){
    			alert('操作失败，请刷新重试！');
    		}
    	});
    });
    
    //设置短信黑名单
     $('#blacks_btn').click(function(){       
        $("#msg").html("<font color=green>正在提交...</font>");
    	$.ajax({
    		type: 'post',
    		url: base+'user/userdo/?act=pm_blacks',
    		data: $('#blacks_form').serialize(), 
    		dataType:"text",
    		success: function(msg){
  				$('#msg').html(msg);
    		},
    		error: function(){
    			alert('操作失败，请刷新重试！');
    		}
    	});
    });
    
    //加入黑名单链接
    $(".blacks").click(function(){
        var v = $(this).attr("rel");    //链接删除
        $("#fw_title .title").html("加入黑名单");
        $("#floatwin").css({width:"270px",height:"130px"});
        $("#fw_button").show();$("#fw_load").hide();
        $("#fw_submit").show();
        $("#fw_body").html("是否要将此用户加入黑名单？");
        $("#floatwin").runfloatwin();
        
        //确定加入黑名单
        $("#fw_submit").unbind().bind('click',function(){
            $("#fw_button").hide();
            $("#fw_load").show();
            $.ajax({
    			type: 'post',
    			dataType : 'text',
    			url : base+"user/userdo/?act=pm_add_black",
    			data :"tousername="+v,
    			success: function(msg){
                    $("#fw_button").show(); $("#fw_load").hide()
                    $("#fw_submit").hide();
                    $("#fw_close").val("关闭").show();         			 
  					$("#fw_body").html(msg);
    			},
    			error: function(){
    				alert('操作失败，请刷新重试！');
    			}
    		});
        });
    });
})
 
function checkvalue(name) {
	if (name=='pwd') {
		v=$("input[name="+name+"]").val(); 
		if (v.length<6 || v.length>16) return false; else return true;
	}
    
    if (name=='pwd_again'){
        v=$("input[name=pwd]").val(); 
        v1=$("input[name=pwd_again]").val(); 
        if(v!=v1 || v1.length==0) return false; else return true;
    }
    
    if (name=='email'){
        v=$("input[name="+name+"]").val(); 
        var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
        if (!reg.test(v)) return false; else return true;
    }
    
    if (name=='code') {
		c = getvalue(base+'user/userdo/?act=get_imgcode');
        v = $("input[name="+name+"]").val();
		if (v.length ==0 || v != c ) return false;	else return true;
	}
}

//检测用户名
function chkuser(){
    v = $("input[name=user]").val(); 
    if (v.length<3 || v.length>10){
        $("#s_user").removeClass("clew3");
        $("#s_user").addClass("clew2");
        $("#s_user").html("用户名限制在3至10个字符之间");
        y = 0;
        return false;
    }
    
    $("#s_user").removeClass().addClass('clew').html("正在检测...");
    $.ajax({type: "post",url:base+"user/userdo/?act=chkuser", data:"user="+v, dataType: "text" , async:false,
    success: function(msg){
        msg = msg.split("|");
        if(msg[0] == 'error'){
            y = 0;
            $("#s_user").removeClass("clew3");
            $("#s_user").addClass("clew2");
            $("#s_user").html(msg[1]);
            return false;
            
        } else {    //用户名不存在
            y = 1;
            $("#s_user").removeClass("clew2");
            $("#s_user").addClass("clew3"); 
            $("#s_user").html('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
        }
    }})
}

//单个错误提示
function showmsg(d,m,ac) {
    if(d==null || d=='undefine' || d=='') d = m;
	if (ac==-1) {
		$("#s_"+d).removeClass("clew2");
		$("#s_"+d).addClass("clew3"); 
        $("#s_"+d).html('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
	}
	if (ac==0) {
		$("#s_"+d).removeClass("clew2 clew3");
		$("#s_"+d).html(clew[m+"_0"]);
		$("#s_"+d).show();
	} 
	if (ac==1){
	    $("#s_"+d).removeClass("clew3");
		$("#s_"+d).addClass("clew2");
		$("#s_"+d).html(clew[m+"_1"]!=""?clew[m+"_1"]:clew[m+"_0"]);
		$("#s_"+d).show();
	}
	return true;
}

//字符替换
function strReplace(search, replace, str) {
	var regex = new RegExp(search, "g");
	return str.replace(regex, replace);
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