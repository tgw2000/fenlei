//���뷢ѿ�������Ժ󣬺ܶ��˶����������ĵط�û���Զ�����
//һֱ��û�иģ���Ϊ�Ҿ���������������ĵط�������д����ĵط�
//����о�jQuery��д��һ��HTML����ҳ: http://www.fayaa.com/tool/try/
//Ϊ��ʹ���ϵķ��㣬����ȷʵʹ�ô���������ȽϷ���
//
//���ڷ�ѿ��������textarea�����Զ������ˣ���������ҳ��
//   ���ǵ������ط���Tab���Ľ����л���;��Ŀǰ��ѿ��ֻ��HTML����ҳ(fayaa.com/tool/try/)
//   �ػ���Tab������������textarea�򲻽��д�����
//
//����Ĵ������Ϊ��ʵ��������ܣ�ԭ��ܼ򵥣�������һ�е���������
//ֻҪ��html�в���ű�����set_tab_indent_for_textareas()�����Ϳ�����
//ע1����ҪjQuery֧�֣������ϲ��jQuery�ĳ���javascriptҲ�ܷ����
//BTW��������ļ��������⣨firefox��IE��������ķ���

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


//����ʵ���ı�����ʾ�к�
var msgA=["msg1","msg2","msg3","msg4"];
var c=["c1","c2","c3","c4"];
var slen=[50,20000,20000,60];//�����������
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
			alert("��д����,��鿴��ʾ��Ϣ��");
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