<?php
if(!defined('IN_SITE')) die('Access Denied');
//父窗口输出信息
function out($msg){
	echo("<SCRIPT LANGUAGE='JavaScript'>window.parent.posted('$msg')</script>");    
}

//高亮显示文字
function highlight($str, $keywords, $color = "red"){
	if (empty($keywords)) {
		return $str;
	}
	$keywords = explode("[ \t\r\n,]+", $keywords);
	foreach($keywords as $val) {
        $tvar = preg_match("/".$val."/", $str, $regs);
        $finalrep    = "<font color=". $color . "><strong>" . $regs[0] . "</strong></font>";
	}
	$str = str_ireplace($regs[0], $finalrep, $str);
	return $str;
}

function str_len($str){
    return mb_strlen($str,'utf8');
}

/**
 * 字符截取
 */
function cut_str($str, $length, $start=0){
	global $config;
    $charset = $config['charset'];
	if(function_exists("mb_substr")) {
	    if(mb_strlen($str, $charset) <= $length) return $str;
	    $slice = mb_substr($str, $start, $length, $config['charset']);
	} else {
		$re['utf-8']  = "/[\x01-\x7f]|[\xc2-\xdf][\x80-\xbf]|[\xe0-\xef][\x80-\xbf]{2}|[\xf0-\xff][\x80-\xbf]{3}/";
		$re['gb2312'] = "/[\x01-\x7f]|[\xb0-\xf7][\xa0-\xfe]/";
		$re['gbk']    = "/[\x01-\x7f]|[\x81-\xfe][\x40-\xfe]/";
		$re['big5']   = "/[\x01-\x7f]|[\x81-\xfe]([\x40-\x7e]|\xa1-\xfe])/";
		preg_match_all($re[$charset], $str, $match);
		if(count($match[0]) <= $length) return $str;
		$slice = join("",array_slice($match[0], $start, $length));
	}
	return $slice;
}

function textarea_post_change($str){
	return nl2br(str_replace(' ','&nbsp;',htmlspecialchars(trim($str))));
}

function de_textarea_post_change($str)
{
	return str_replace('<br />','',str_replace('&nbsp;',' ',trim($str)));
}

/**
 * url处理
 */
function site_url($uri = ''){
    global $config;     
    $index = $config['index_page']; 
    $suffix = $config['url_suffix'];

    if ($uri == '') return rtrim(SITE_PATH.$index,'/').'/';
    if ($config['enable_query_strings'] == FALSE){
        if (is_array($uri)) $uri = implode('/', $uri);
        if($config['url_suffix']) $uri = str_replace(array('//', '../'), '/', trim($uri, '/'));
        return rtrim(SITE_PATH.$index,'/').'/'.$uri.$suffix;       
    } else {
        if (is_array($uri)){
            $i = 0;
            $str = '';
            foreach ($uri as $key => $val){
				$prefix = ($i == 0) ? '' : '&';
				$str .= $prefix.$key.'='.$val;
				$i++;
            }
            $uri = $str;
        }
        return SITE_PATH.$index.'?'.$uri;
    }
}

/**
 * 分页函数
 * 
 * @param $num 信息总数
 * @param $curr_page 当前分页
 * @param $perpage 每页显示数
 * @param $urlrule URL规则
 * @param $type 普通分页或ajax分页
 * @return 分页
 */
function pages($page, $total, $perpage, $maxpage = 5, $urlrule='', $title=true,$type = ''){
	$maxpage = round($maxpage/2);
	$pages = ceil($total/$perpage);
    $current_page = intval($page);
    $str = ($urlrule=='') ? 'page={$page}' :$urlrule.'&page={$page}';
	$urlrule = url_par($str);
    
	if($pages >= 1){
		if($title){
			$nav_page = "<span>总共 ".$total." 条记录：</span>";
			if($current_page > 1){
			     if(!$type) $nav_page .= "<a href='". pageurl($urlrule, 1) ."' class='first'>首页</a>";
                 if($type=='ajax') $nav_page .= "<a href='javascript:goPage(1)' class='first'>首页</a>";
			}else{
				$nav_page .= "<em>首页</em>";
			}
		}
        //上一页
		if($current_page > 1){
            if(!$type) $nav_page .= "<a href='". pageurl($urlrule, $current_page - 1) ."' class='prev'>上一页</a>";
            if($type=='ajax') $nav_page .= "<a href='javascript:goPage(".($current_page-1).")' class='prev'>上一页</a>";
		}else{
			$nav_page .= "<em>上一页</em>";
		}
        //页码
		for ($i = $current_page - $maxpage; $i <= $current_page + $maxpage; $i++){
			if($i > 0 && $i < $pages + 1){
				if($i == $current_page){
					$nav_page .= "<em class='current'>".$i."</em>";
				}else {
					if(!$type) $nav_page .= "<a href='". pageurl($urlrule, $i) ."'>".$i."</a>";
                    if($type=='ajax') $nav_page .= "<a href='javascript:goPage(".$i.")'>".$i."</a>";
				}
			}
		}
        //下一页
		if($pages > $current_page){
			if(!$type) $nav_page .= "<a href='". pageurl($urlrule, $current_page + 1) ."' class='next'>下一页</a>";
            if($type=='ajax') $nav_page .= "<a href='javascript:goPage(".($current_page+1).")' class='next'>下一页</a>";
		}else{
			$nav_page .= "<em>下一页</em>";
		}

		if($title){
			if($pages > $current_page){
				if(!$type) $nav_page .= "<a href='". pageurl($urlrule, $pages) ."' class='last'>末页</a>";
                if($type=='ajax') $nav_page .= "<a href='javascript:goPage(".($pages).")' class='last'>末页</a>";
			}else{
				$nav_page .= "<em>末页</em>";
			}
		}
	}
	return $nav_page;
}

/**
 * 返回分页路径
 * @param $urlrule 分页规则
 * @param $page 当前页
 * @return 完整的URL路径
 */
function pageurl($urlrule, $page){
	if(strpos($urlrule, '|')){
		$urlrules = explode('|', $urlrule);
		$urlrule = $page < 2 ? $urlrules[0] : $urlrules[1];
	}
	eval("\$url = \"$urlrule\";");
	return $url;
}

/**
 * URL路径解析，pages 函数的辅助函数
 * @param $par 传入需要解析的变量 默认为，page={$page}
 * @param $url URL地址
 * @return URL
 */
function url_par($par, $url = ''){
	if($url == '') $url = URL;
	$pos = strpos($url, '?');
	if($pos == false){
		$url .= '?'.$par;
	}else{
		$querystring = substr(strstr($url, '?'), 1);
		parse_str($par, $pars);
		foreach($pars as $k=>$v){
            $querystring = _url_par($k, $v, $querystring);
		}
		$url = $querystring ? substr($url, 0, $pos).'?'.$querystring : substr($url, 0, $pos);
	}
	return $url;
}

function _url_par($var, $value, $querystring){
	if($querystring){
		$pattern = "/([&]?)(".preg_quote($var)."\=)([^&]+)([&]?)/";
        //$querystring = preg_match($pattern, $querystring) ? preg_replace($pattern, '${1}${2}'.$value.'${4}', $querystring) : $querystring."&$var=$value";
        if(preg_match($pattern, $querystring)){
            if($value) {
                $querystring = preg_replace($pattern, '${1}${2}'.$value.'${4}', $querystring);
            } else {
                $querystring = preg_replace($pattern, '${1}', $querystring);
                if(substr($querystring,-1)=='&'){       //如果最后一个字符是&，则去掉它
                    $querystring = substr($querystring,0,strlen($querystring)-1);
                }
            }        
        } else {
            $querystring.="&$var=$value";
        }
	}else{
		$querystring = $var.'='.$value;
    }
	return $querystring;
}

//php获取当前访问的完整url地址
function GetCurUrl(){
	$url='http://';
    if(isset($_SERVER['HTTPS'])&&$_SERVER['HTTPS']=='on'){
        $url='https://';
    }
    if($_SERVER['SERVER_PORT']!='80'){
        $url.=$_SERVER['SERVER_NAME'].':'.$_SERVER['SERVER_PORT'].$_SERVER['REQUEST_URI'];
    }else{
        $url.=$_SERVER['SERVER_NAME'].$_SERVER['REQUEST_URI'];
    }
    return $url;
}

//内容分页
function conpage($contents,$p) {          
    $con = preg_split("/<hr[^>]*>/i",$contents);    //这里我用的是kindeditor里面自带的分页
    //$con=explode('分页符',$contents);     //如果是你自己插入分隔符你可以修改上句代码或用这句代码替换
    $cons=count($con);      
    if(!$p||$p<0) $p=1;
    if($p>$cons) $p=$cons;
    $pre = $p-1;
    $next = $p+1;
    if($pre<=0) $pre=1; 
    if($next>$cons) $next=$cons; 
    $curUrl = GetCurUrl();

    $pagenav='';   
    if($cons>1){//只有一页时不显示分页     
        $pagenav="<div class=\"c_page\" id=\"c_page\">";
        if (preg_match('/_[\d]+.html/', $curUrl)) {  
           $url = preg_replace('/_[\d]+.html/','_'.$pre.'.html',$curUrl);
        } else {
            $url = str_replace('.html','_'.$pre.'.html',$curUrl);
        }
       
        $pagenav.="<a href=$url>上一页</a>";
        for($i=1;$i<=$cons;$i++){     
            if($i==$p){     
                $pagenav.='<span>'.$p.'</span>';     
            }else{
                if (preg_match('/_[\d]+.html/', $curUrl)) {  
                    $url = preg_replace('/_[\d]+.html/','_'.$i.'.html',$curUrl);
                } else {
                    $url = str_replace('.html','_'.$i.'.html',$curUrl);
                }
                $pagenav.="<a href=$url>$i</a>";     
            }     
        }
        
        if (preg_match('/_[\d]+.html/', $curUrl)) {  
           $url = preg_replace('/_[\d]+.html/','_'.$next.'.html',$curUrl);
        } else {
            $url = str_replace('.html','_'.$next.'.html',$curUrl);
        }
        $pagenav.="<a href=$url>下一页</a><a href=javascript:view_all();>查看全部</a>";
        $pagenav.="</div>";    
    }   
    return $con[$p-1].$pagenav;     
}

//提取内容中的所有图片生成数组
function getImgs($content,$order='ALL'){
	$pattern="/<img.*?src=[\'|\"](.*?(?:[\.gif|\.jpg]))[\'|\"].*?[\/]?>/";
	preg_match_all($pattern,$content,$match);
	if(isset($match[1])&&!empty($match[1])){
		if($order==='ALL'){
			return $match[1];
		}
		if(is_numeric($order)&&isset($match[1][$order])){
			return $match[1][$order];
		}
	}
	return '';
}

function RemoveXSS($val) {
   $val = preg_replace('/([\x00-\x08,\x0b-\x0c,\x0e-\x19])/', '', $val);

   $search = 'abcdefghijklmnopqrstuvwxyz';
   $search .= 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
   $search .= '1234567890!@#$%^&*()';
   $search .= '~`";:?+/={}[]-_|\'\\';
   for ($i = 0; $i < strlen($search); $i++) {
      $val = preg_replace('/(&#[xX]0{0,8}'.dechex(ord($search[$i])).';?)/i', $search[$i], $val);
      $val = preg_replace('/(&#0{0,8}'.ord($search[$i]).';?)/', $search[$i], $val);
   }

   $ra1 = array('javascript', 'vbscript', 'expression', 'applet', 'meta', 'xml', 'blink', 'link', 'style', 'script', 'embed', 'object', 'iframe', 'frame', 'frameset', 'ilayer', 'layer', 'bgsound', 'title', 'base');
   $ra2 = array('onabort', 'onactivate', 'onafterprint', 'onafterupdate', 'onbeforeactivate', 'onbeforecopy', 'onbeforecut', 'onbeforedeactivate', 'onbeforeeditfocus', 'onbeforepaste', 'onbeforeprint', 'onbeforeunload', 'onbeforeupdate', 'onblur', 'onbounce', 'oncellchange', 'onchange', 'onclick', 'oncontextmenu', 'oncontrolselect', 'oncopy', 'oncut', 'ondataavailable', 'ondatasetchanged', 'ondatasetcomplete', 'ondblclick', 'ondeactivate', 'ondrag', 'ondragend', 'ondragenter', 'ondragleave', 'ondragover', 'ondragstart', 'ondrop', 'onerror', 'onerrorupdate', 'onfilterchange', 'onfinish', 'onfocus', 'onfocusin', 'onfocusout', 'onhelp', 'onkeydown', 'onkeypress', 'onkeyup', 'onlayoutcomplete', 'onload', 'onlosecapture', 'onmousedown', 'onmouseenter', 'onmouseleave', 'onmousemove', 'onmouseout', 'onmouseover', 'onmouseup', 'onmousewheel', 'onmove', 'onmoveend', 'onmovestart', 'onpaste', 'onpropertychange', 'onreadystatechange', 'onreset', 'onresize', 'onresizeend', 'onresizestart', 'onrowenter', 'onrowexit', 'onrowsdelete', 'onrowsinserted', 'onscroll', 'onselect', 'onselectionchange', 'onselectstart', 'onstart', 'onstop', 'onsubmit', 'onunload');
   $ra = array_merge($ra1, $ra2);

   $found = true;
   while ($found == true) {
      $val_before = $val;
      for ($i = 0; $i < sizeof($ra); $i++) {
         $pattern = '/';
         for ($j = 0; $j < strlen($ra[$i]); $j++) {
            if ($j > 0) {
               $pattern .= '(';
               $pattern .= '(&#[xX]0{0,8}([9ab]);)';
               $pattern .= '|';
               $pattern .= '|(&#0{0,8}([9|10|13]);)';
               $pattern .= ')*';
            }
            $pattern .= $ra[$i][$j];
         }
         $pattern .= '/i';
         $replacement = substr($ra[$i], 0, 2).'<x>'.substr($ra[$i], 2);
         $val = preg_replace($pattern, $replacement, $val);
         if ($val_before == $val) {
            $found = false;
         }
      }
   }
   return $val;
}
?>