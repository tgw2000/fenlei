//代码发芽网做好以后，很多人都提出贴代码的地方没有自动缩进
//一直都没有改，因为我觉得这里是贴代码的地方，不是写代码的地方
//最近研究jQuery，写了一个HTML测试页: http://www.fayaa.com/tool/try/
//为了使用上的方便，觉得确实使用代码缩进会比较方便
//
//现在发芽网的所有textarea都有自动缩进了，包括反馈页面
//   考虑到其他地方对Tab键的焦点切换用途，目前发芽网只在HTML测试页(fayaa.com/tool/try/)
//   截获了Tab按键，其他的textarea框不进行此配置
//
//下面的代码就是为了实现这个功能，原理很简单，采用上一行的缩进就行
//只要在html中插入脚本调用set_tab_indent_for_textareas()函数就可以了
//注1：需要jQuery支持，如果不喜欢jQuery改成裸javascript也很方便的
//BTW：浏览器的兼容性问题（firefox和IE）真他妈的烦！

/*------selection operations-------*/
function insertAtCursor(obj, txt) {
  obj.focus();
  //IE support
  if (document.selection) {
    sel = document.selection.createRange();
    sel.text = txt;
  }
  //MOZILLA/NETSCAPE support
  else {
    var startPos = obj.selectionStart;
    var scrollTop = obj.scrollTop;
    var endPos = obj.selectionEnd;
    obj.value = obj.value.substring(0, startPos) + txt + obj.value.substring(endPos, obj.value.length);
    startPos += txt.length;
    obj.setSelectionRange(startPos, startPos);
    obj.scrollTop = scrollTop;
  }
}
function getCaretPos(ctrl) {
	var caretPos = 0;
	if (document.selection) {
    // IE Support
    var range = document.selection.createRange();
    // We'll use this as a 'dummy'
    var stored_range = range.duplicate();
    // Select all text
    stored_range.moveToElementText( ctrl );
    // Now move 'dummy' end point to end point of original range
    stored_range.setEndPoint( 'EndToEnd', range );
    // Now we can calculate start and end points
    ctrl.selectionStart = stored_range.text.length - range.text.length;
    ctrl.selectionEnd = ctrl.selectionStart + range.text.length;
    caretPos = ctrl.selectionStart;
	} else if (ctrl.selectionStart || ctrl.selectionStart == '0')
    // Firefox support
		caretPos = ctrl.selectionStart;
	return (caretPos);
}

function getCurrentLineBlanks(obj) {
  var pos = getCaretPos(obj);
  var str = obj.value;
  var i = pos-1;
  while (i>=0) {
    if (str.charAt(i) == '\n')
      break;
    i--;
  }
  i++;
  var blanks = "";
  while (i < str.length) {
    var c = str.charAt(i);
    if (c == ' ' || c == '\t')
      blanks += c;
    else
      break;
    i++;
  }
  return blanks;
}

function set_tab_indent_for_textareas() {
  /* set all the tab indent for all the text areas */
  $("textarea").each(function() {
    $(this).keydown(function(eve){
      if (eve.target != this) return;
      if (eve.keyCode == 13)
        last_blanks = getCurrentLineBlanks(this);
      else if (eve.keyCode == 9) {
        eve.preventDefault();
        insertAtCursor(this, "  ");
        this.returnValue = false;
      }
    }).keyup(function(eve){
      if (eve.target == this && eve.keyCode == 13)
          insertAtCursor(this, last_blanks);
    });
  });
}


//以下实现文本框显示行号
var msgA=["msg1","msg2","msg3","msg4"];
var c=["c1","c2","c3","c4"];
var slen=[50,20000,20000,60];//允许最大字数
var num="";
var isfirst=[0,0,0,0,0,0];

String.prototype.trim2 = function()
{
    return this.replace(/(^\s*)|(\s*$)/g, "");
}
function F(objid){
	return document.getElementById(objid).value;
}
function G(objid){
	return document.getElementById(objid);
}

function isEmpty(strVal){
	if( strVal == "" )
		return true;
	else
		return false;
}
function isBlank(testVal){		
    var regVal=/^\s*$/;
    return (regVal.test(testVal))
}
function chLen(strVal){
	strVal=strVal.trim2();
	var cArr = strVal.match(/[^\x00-\xff]/ig);
    return strVal.length + (cArr == null ? 0 : cArr.length);   	
}
function check(i){
	var iValue=F("c"+i);
	var iObj=G("msg"+i);
	var n=(chLen(iValue)>slen[i-1]);
	if((isBlank(iValue)==true)||(isEmpty(iValue)==true)||n==true){		
		iObj.style.display ="block";
	}else{		
		iObj.style.display ="none";
	}
}
function checkAll(){
	for(var i=0;i<msgA.length; i++){
		check(i+1);		
		if(G(msgA[i]).style.display=="none"){
			continue;
		}else{
			alert("填写错误,请查看提示信息！");
			return;
		}
	}
	G("form1").submit();	
}
function clearValue(i){
	G(c[i-1]).style.color="#000";
	keyUp();	
	if(isfirst[i]==0){
		G(c[i-1]).value="";
	}
	isfirst[i]=1;
}
function keyUp(){
	var obj=G("c2");
	var str=obj.value;	
	str=str.replace(/\r/gi,"");
	str=str.split("\n");
	n=str.length;
	line(n);
}
function line(n){
	var lineobj=G("li");
	for(var i=1;i<=n;i++){
		if(document.all){
			num+=i+"\r\n";
		}else{
			num+=i+"\n";
		}
	}
	lineobj.value=num;
	num="";
}
function autoScroll(){
	var nV = 0;
	if(!document.all){
		nV=G("c2").scrollTop;
		G("li").scrollTop=nV;
		setTimeout("autoScroll()",20);
	}	
}
if(!document.all){
window.addEventListener("load",autoScroll,false);
}