$(function ($) {
	$('#gotop').gotop({useHide:false});
	//增大点击区域
	$('.oper_box').on('click',function(){
		var item = $(this).parents('.cate_item');
		var realOper = $(this).find('.oper_open');
		if(!realOper.hasClass("oper_close")){
			item.css('max-height','none');
			$(this).siblings('.cate_item_opts').css('height','auto');
			$(this).siblings('.cate_ico_box').css('height',item.height() - 1);//border = 1
			realOper.addClass('oper_close');
		} else {
			item.css('max-height','100px');
			$(this).siblings('.cate_ico_box').css('height','100px');
			$(this).siblings('.cate_item_opts').css('height','100px');
			realOper.removeClass('oper_close');
		}
	});
	$(".search_btn").on('click',function(){
		if($('.search_text').val() == ''){
			alert('请输入搜索关键字');
			return false;
		}
		$('#searchForm').trigger('submit');
	});
	$('.panel').panel({
		contentWrap: $(".wrap_panel"),
		scrollMode: 'fix'
	});
	$('.panel_toggle').on('click', function (e) {
		var contId = $(this).attr("data-href");
		$('#' + contId).panel('toggle','overlay', 'right','dismissible');
		e.preventDefault();
	});
	$(".panel .tog_panel").on('click', function(){
		$(this).next(".panel_cont").toggle();
		$(this).find('span').toggleClass('panel_close');
	});
	$(".top_search_btn").on('click',function(e){
		$('.top_bar_tabs').toggle();
		$('.search_cont').toggle();
		e.preventDefault();
	});
	$('.c_link').on('click',function(e){
		history.go(-1);
		e.preventDefault();
	})
	/*$('.list li').on('touchstart',function(){
		$(this).css('background-color','#eee');
	});
	$('.list li').on('touchend touchcancel',function(){
		$(this).css('background-color','white');
	});*/

	/*$('.list li').on('tap',function(e){
		location.href = $(this).find('a').attr('href');
	});*/
	var url = window.location.href,
		page = 1;
       
	$('.ui-refresh').refresh({
		load: function (dir, type) {
			var me = this; 
			var $list = $('.list');
			page++;
			$.get(url,{page:page}, function (html) {
				$list[dir == 'up' ? 'prepend' : 'append'](html);
				me.afterDataLoading(dir);
				if($(html).length < 20){
					me.disable(dir);
				}
			});
		}
	});

}(Zepto));

