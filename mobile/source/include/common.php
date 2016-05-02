<?php

/**
 * 高亮显示文字
 */
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

/**
 * 字符截取 支持UTF8/GBK
 */
function strcut($string, $length, $dot = '')
{
    if (strlen($string) <= $length) return $string;
    $string = str_replace(array('&amp;', '&quot;', '&lt;', '&gt;'), array('&', '"', '<', '>'), $string);
    $strcut = '';
    $n = $tn = $noc = 0;
    while ($n < strlen($string)) {
        $t = ord($string[$n]);
        if ($t == 9 || $t == 10 || (32 <= $t && $t <= 126)) {
            $tn = 1;
            $n++;
            $noc++;
        } elseif (194 <= $t && $t <= 223) {
            $tn = 2;
            $n += 2;
            $noc += 2;
        } elseif (224 <= $t && $t <= 239) {
            $tn = 3;
            $n += 3;
            $noc += 2;
        } elseif (240 <= $t && $t <= 247) {
            $tn = 4;
            $n += 4;
            $noc += 2;
        } elseif (248 <= $t && $t <= 251) {
            $tn = 5;
            $n += 5;
            $noc += 2;
        } elseif ($t == 252 || $t == 253) {
            $tn = 6;
            $n += 6;
            $noc += 2;
        } else {
            $n++;
        }
        if ($noc >= $length) break;
    }
    if ($noc > $length) $n -= $tn;
    $strcut = substr($string, 0, $n);
    $strcut = str_replace(array('&', '"', '<', '>'), array('&amp;', '&quot;', '&lt;', '&gt;'), $strcut);
    return $strcut . $dot;
}

function str_len($str){
    return mb_strlen($str,'utf8');
}

//生成随机密码
function rand_pwd($length = 6 ) { 
    $chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';	// 密码字符集
    $password = '';
    for($i = 0; $i < $length; $i++ ) {
        // 这里提供两种字符获取方式
        // 第一种是使用 substr 截取$chars中的任意一位字符；
        // 第二种是取字符数组 $chars 的任意元素
        // $password .= substr($chars, mt_rand(0, strlen($chars) - 1), 1);
        $password .= $chars[mt_rand(0, strlen($chars) - 1)];
    }
    return $password;
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

?>