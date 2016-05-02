var _baseUrl = "http://m.yiiso.cn";
var _user_token = "user_token";
var _user_nickname = "user_nickname";
var _tab_ = '_tab_';
var _infoid = "topic_id";
var reply_weiba_active = 'reply_weiba_active';
var reply_weiba = ""
var countnotreadtime = 300000;

function detail(infoid) {
	plus.storage.setItem('infoid', infoid);
	mui.openWindow({
		id: 'view',
		url: 'view.html',
		createNew:true
	});
	//plus.webview.getWebviewById('view').reload();
}

function viewpic(infoid) {
	mui.openWindow({
		id: 'viewpic',
		url: 'viewpic.html',
		extras: {infoid:infoid}
	});
	plus.webview.getWebviewById('viewpic').reload();
}


function trim(str) {　　
	return str.replace(/(^\s*)|(\s*$)/g, "");　　
}

function isLogin() {
	var userToken = plus.storage.getItem('user_token');
	if (userToken && userToken != "") {
		return true;
	} else {
		return false;
	}
}

//检查网络连接
function check_network(){
	if(plus.networkinfo.getCurrentType()==plus.networkinfo.CONNECTION_NONE){
		mui.openWindow({
			id: "network_none",
			url: "./html/network_none.html",
		});
	}
}

 //预加载图片
function pre_loadimg(){
    $(".pmlist img,.reply img").each(function(i){
        var img = new Image();
        img.src = $(this).attr("src");       
        $(".pmlist img,.reply img").eq(i).before("<div title='图片正在加载中' id=load_"+i+" class=load></div>");
        if(img.complete) { // 如果图片已经存在于浏览器缓存，直接调用回调函数 
            _show(i);
            return;            
        }
        img.onload = function () { //图片下载完毕时异步调用callback函数。
            _show(i);
        };
        $(".pmlist img,.reply img").eq(i).error(function(){       //图像加载错误时    
            $("#load_"+i).attr('title','图片加载失败！');
        })
    })
}
            
function _show(i){
    $(".pmlist img,.reply img").eq(i).fadeIn();
    $("#load_"+i).remove();
}

//处理逻辑：1秒内，连续两次按返回键，则退出应用；
//首次按键，提示‘再按一次退出应用’
var first = null;
function is_quit() {
	if (!first) {
		first = new Date().getTime();
		mui.toast('再按一次退出应用');
		setTimeout(function() {
			first = null;
		}, 1000);
	} else {
		if (new Date().getTime() - first < 1000) {
			plus.runtime.quit();
		}
	}
}


