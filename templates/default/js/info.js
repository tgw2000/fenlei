Do.add('domwindow', {path: tpl+'/js/lib/jquery.domwindow.js', type: 'js'});
$(function(){
    //信息提示关闭按钮
    $(".msg_close").click(function(){
        $("#postsuccess").slideUp();
    })
})

Do(function(){
    //删除信息
    $('.del').live('click',function(){
        if ($('.dialog').size() == 0) $('body').append('<div class="dialog"></div>');
        else $('.dialog').html('');
        $('.dialog').html('<div id="confirm" >确定是否删除？<br/><input type="button" id="ok" value="删除"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="btn_close" value="取消"/></div>');         
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
        //确定删除
        $('#ok').bind('click',function(){
            $.ajax({
				type: 'post',
				dataType : 'text',
				url : base+"user/userdo/?act=del_info",
				data : {'infoid[]' : infoid },
				beforeSend: function(){
					if ($('.dialog').size() == 0) $('body').append('<div class="dialog"></div>');
					else $('.dialog').html('');
					$('.dialog').html('<div id="tip"><span class=fgreen>正在处理中...</span></div>');
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
				success: function(msg){
				    msg = msg.split("|");
				    if (msg[0]=='ok'){
						$('#tip').html('<span class=fgreen>信息删除成功！</span>');
                        window.location.href = base+"user/?status=3";       //转到已删除信息
					}else{
						$('#tip').html(msg[0]);
						setTimeout(function(){$.closeDOMWindow();}, 2000);
					}
				},
				error: function(){
					$('#tip').html('删除失败，请刷新重试。');
					setTimeout(function(){$.closeDOMWindow();}, 2000);
				}
			})
        });
    });
    
    //刷新信息
    $('.refresh').live('click',function(){
		if ($('.dialog').size() == 0) $('body').append('<div class="dialog"></div>');
		else $('.dialog').html('');
		$('.dialog').html('<div id="tip"><span class=fgreen>正在处理中...</span></div>');
		Do('domwindow',function(){
			$('#DOMWindow').remove();
			$.openDOMWindow({
				height: $('.dialog').height(),
				width: $('.dialog').width(),
				windowSourceID:'.dialog', 
				windowPadding:0,
				overlay:0
			});
		});
        $.ajax({
			type: 'post',
			dataType : 'text',
			url : base+"user/userdo/?act=refresh",
			data : {'infoid' : infoid },
			success: function(msg){
                msg = msg.split("|");
				if (msg[0]=='ok'){
                    $('#tip').html('<span class=fgreen>信息刷新成功！</span>');
				}else{
				    $('#tip').html(msg[0]);
				}
                setTimeout(function(){$.closeDOMWindow();}, 2000);
			},
			error: function(){
				alert('操作失败，请刷新重试！');
			}
		})
    });
    
    //关闭窗口
    $('.btn_close,.btn_cancel').live('click',function(){
        $.closeDOMWindow();
    });
    
   	//举报
	$('.report').click(function(){
		if ($('.dialog').size() == 0) $('body').append('<div class="dialog"></div>');
		else $('.dialog').html('');
        $(".msg").html('');
		var tmphtml = $('.report_box').clone();
		$('.dialog').html('<div class="report_box"><form method="post" id="reportForm">' + tmphtml.html() + '</form></div>');
		Do('domwindow',function(){
			$('#DOMWindow').remove();
			$.openDOMWindow({
				height: $('.dialog').height(),
				width: 500,
				windowSourceID:'.dialog', 
				windowPadding:0,
				overlay:0
			});
		})
		$('.btn_ok').bind('click' , function(){
            var type = $("#reportForm").find(".rpt_type:checked").val();
            var content = $("#reportForm").find(".rpt_content").val();
            var mobile = $("#reportForm").find(".rpt_mobile").val();
            if(typeof(type)=='undefined'){
                $(".msg").html('请选择举报类型');
                return;
            }
            if(content.length<4 || content.length>255){
                $(".msg").html('举报内容限制在4-255个字符');
                return;
            }

            var filter=/(^(13|15|18)\d{9}$)/;
			if(!filter.test(mobile)){
			     $(".msg").html('手机号码不正确');
				 return false;
			}
            $(".msg").html("<span class=fgreen>正在提交...</span>");
			$.ajax({
				type: 'post',
				dataType : 'text',
   	            url: base+'user/userdo/?act=report',
				data : $('#reportForm').serialize(),
				success: function(msg){
                    if (msg=='ok'){
                        if ($('.dialog').size() == 0) $('body').append('<div class="dialog"></div>');
        				else $('.dialog').html('');
        				$('.dialog').html("<div id='tip' class='fgreen'>举报成功！</div>");
        				Do('domwindow',function(){
        					$('#DOMWindow').remove();
        					$.openDOMWindow({
        						height: $('.dialog').height(),
        						width: $('.dialog').width(),
        						windowSourceID:'.dialog', 
        						windowPadding:0,
        						overlay:0
        					});
        				});
                        setTimeout(function(){$.closeDOMWindow();}, 2000);
					}else{
						$('.msg').html(msg);
					}
				},
				error: function(){
					$('#tip').html('提交失败，请刷新重试！');
					setTimeout(function(){$.closeDOMWindow();}, 2000);
				}
			})
		})
	})
    
    //发送私信
   	$('#lev_msg').click(function(){
        if(userid<=0){
            alert("请登录后再发送私信！");
            return;
        }
		if ($('.dialog').size() == 0) $('body').append('<div class="dialog"></div>');
		else $('.dialog').html('');
		$(".msg").html('');
		var tmphtml = $('.popup_box').eq(0).clone();
		$('.dialog').html('<div class="popup_box"><form id="lev_msg_form">' + tmphtml.html() + '</form></div>');
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
		$('.btn_ok').bind('click' ,function(){
            var touid = $('#lev_msg_form').find('.touid').val();
			var message = $('#lev_msg_form').find('.message').val();
            if(touid==''){
                $(".msg").html('收件人不存在');
                return;
            }
            if(message.length<1 || message.length>255){
                $(".msg").html('短消息内容限制在255个字符内！');
                $('#lev_msg_form').find('.message').focus();
                return;
            }
            $(".msg").html("<span class=fgreen>正在发送...</span>");
			$.ajax({
				type: 'post',
				url: base+'user/userdo/?act=send_msg',
				data: $('#lev_msg_form').serialize(), 
				cache: false,
				dataType:"text",
				success: function(msg){
				    msg = msg.split("|");
                    if (msg[0]=='ok'){
                        if ($('.dialog').size() == 0) $('body').append('<div class="dialog"></div>');
        				else $('.dialog').html('');
        				$('.dialog').html("<div id='tip' class=fgreen>发送成功！</div>");
        				Do('domwindow',function(){
        					$('#DOMWindow').remove();
        					$.openDOMWindow({
        						height: $('.dialog').height(),
        						width: $('.dialog').width(),
        						windowSourceID:'.dialog', 
        						windowPadding:0,
        						overlay:0
        					});
        				});
                        setTimeout(function(){$.closeDOMWindow();}, 2000);
					}else{
						$('.msg').html(msg[0]);
					}
				},
				error: function(){
					$('#tip').html('发送失败，请稍后再试。');
					setTimeout(function(){$.closeDOMWindow();}, 2000);
				}
			});
		});
	});   
})

//预加载图片
function pre_loadimg(){
    $(".big_photo img").each(function(i){
        var img = new Image();
        img.src = $(this).attr("src");       
        $(".big_photo img").eq(i).before("<div title='图片正在加载中' id=load_"+i+" class=load></div>");
        if(img.complete) { // 如果图片已经存在于浏览器缓存，直接调用回调函数 
            _show(i);
            return;            
        }
        img.onload = function () { //图片下载完毕时异步调用callback函数。
            _show(i);
        };
        $(".big_photo img").eq(i).error(function(){       //图像加载错误时
            $("#load_"+i).removeClass('load').addClass('loaderr');
            $("#load_"+i).attr('title','图片加载失败！');
        })
    })
}
            
function _show(i){
    $(".big_photo img").eq(i).fadeIn();
    $("#load_"+i).remove();
}