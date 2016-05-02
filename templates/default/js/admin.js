$(function(){
    $(".box li").mouseover(function(){
        $(this).css('background-color','#efefef');
    }).mouseout(function(){
        $(this).css('background-color','#ffffff');
    })
})

//显示提示信息
function posted(v) {
    v=v.split("|");
    if(v[0]=='alert'){      //显示alert对话框
        alert(v[1]);
    }else if(v[0]=='login_ok'){      //显示alert对话框
        $("#msg").html("<font color=green>登录成功，正在跳转...</font>");
        window.location.href = v[1];
    }else if(v[0]=='redirect'){     //页面跳转
        location.href = v[1];
    }else{
        $(v[0]).show().html(v[1]);
    }
}

function chklogin(){
	if($("#user").val()==""){
		$("#msg").html('<font color=red>请输入管理员帐号！</font>');
		$("#user").focus();
		return false;
	}

	if($("#pwd").val()==""){
		$("#msg").html('<font color=red>请输入管理密码！</font>');
		$("#pwd").focus();
		return false;
    }
    $("#msg").html('<font color=green>稍等，正在提交...</font>');
}