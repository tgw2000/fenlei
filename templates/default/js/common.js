$(function(){
    //初始化
    $(".s1").css('color','#999');
    $(".s1").val("请输入类别名称或关键字");
    
    //搜索框得到焦点
    $(".s1").focus(function(){
        if($(this).val()=="请输入类别名称或关键字"){
            $(this).val("");
            $(this).css('color','black'); 
        }
    })
    
     //搜索框失去焦点
    $(".s1").blur(function(){
        if($(this).val()==""){
            $(this).val("请输入类别名称或关键字");
            $(this).css('color','#999');
        }
    })
    
    //搜本类得到焦点
    $(".child_search .input").focus(function(){
        if($(this).val()=="请输入类别名称或关键字"){
            $(this).val("");
        }
    })
    
    //搜本类失去焦点
    $(".child_search .input").blur(function(){
        if($(this).val()==""){
            $(this).val("请输入类别名称或关键字");
        }
    })
    
    $('.h_search_but').click(function(){
        var kw=$.trim($('.s1').val());
        if(kw=='请输入类别名称或关键字' || kw==''){
            alert('请输入类别名称或关键字');
            return false;
        }
    })
    
    //下载app弹出菜单
    $('#down_app').on('mouseenter',function(){
    	$(".pop").fadeIn();
    }).on('mouseleave',function(){
		$(".pop").hide();
	})
 });