//JQ扩展
(function($){
//弹出层窗口
$.fn.runfloatwin=function() {
    this.hide();
    srleft = document.documentElement.scrollLeft ? document.documentElement.scrollLeft : document.body.scrollLeft;
    srtop = document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop;
    mleft=(document.documentElement.clientWidth-parseFloat (this.width()))/2+srleft;
    mtop=(document.documentElement.clientHeight -parseFloat (this.height()))/2+srtop;
    this.css({ 'left': mleft, 'top': mtop, 'cursor':'default' });
    this.show();      
};
 
 //清空表单
 $.fn.clearform=function(){
    this.find(":input").each(function(){
        switch(this.type){
            case 'text':
            case 'textarea':
            case 'password':
            case 'select-one':
            case 'select-multiple':
                $(this).val('');
            case 'checkbox':
            case 'radio':
                this.checked = false;
        }
    });
 };
})(jQuery);