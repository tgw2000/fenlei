<?php
if(!defined('IN_SITE')){
	die('Access Denied');
}
/**
 * 字符替换
 */
function safe_replace($str){
	$str = str_replace('%20','',$str);
	$str = str_replace('%27','',$str);
	$str = str_replace('*','',$str);
	$str = str_replace('"','&quot;',$str);
	$str = str_replace("'",'',$str);
	$str = str_replace("\"",'',$str);
	$str = str_replace('//','',$str);
	$str = str_replace(';','',$str);
	$str = str_replace('<','&lt;',$str);
	$str = str_replace('>','&gt;',$str);
	$str = str_replace('(','',$str);
	$str = str_replace(')','',$str);
	$str = str_replace("{",'',$str);
	$str = str_replace('}','',$str);
	return $str;
}

function addslashes_deep($value){
	return is_array($value) ? array_map('addslashes_deep', $value) : addslashes($value);
}

/**
 * 跳转
 */
function redirect($uri = '', $method = 'location', $http_response_code = 302){
    switch($method){
        case 'refresh'	: header("Refresh:0;url=".$uri);
        break;
        default			: header("Location: ".$uri, TRUE, $http_response_code);
        break;
    }
    exit;
}

/**
 * 读缓存
 */
function read_cache($filename,$dir='php'){
    $result = array();
    if (!empty($result[$filename])) {
        return $result[$filename];
    }
    $filepath = ROOT . 'data/cache/';
    if($dir) $filepath.= $dir.'/';
    $filepath.= $filename . '.cache.php';
    if (file_exists($filepath)) {
        include_once($filepath);
        $result[$filename] = $data;
        return $result[$filename];
    } else {
        return false;
    }
}

/**
 * 写缓存
 */
function write_cache($filename,$val,$dir='php'){
    $filepath = ROOT . 'data/cache/';
    if($dir) $filepath.= $dir.'/';
    
    if (!is_dir($filepath)) {
        mkdirs($filepath, 0777);
    } else {
        if (!is_writeable($filepath)) @chmod($filepath, 0777);
    }
    $filepath.= $filename.'.cache.php';
    $content  = "<?php\r\n";
    $content .= "\$data = " . var_export($val, true) . ";\r\n";
    $content .= "?>";
    file_put_contents($filepath, $content, LOCK_EX);
}

/**
 * 删除缓存
 */
 function del_cache($dir='php',$filename=''){
    $filepath = ROOT . 'data/cache/';
    if($dir) $filepath.= $dir.'/';
    if($filename){      //删除指定缓存文件
        $filepath.= $filename.'.cache.php';
        if(file_exists($filepath)) unlink($filepath);
    } else {    //删除缓存目录
        delete_dir($filepath);
    }   
}

/**
 * 读取网站配置
 */
function get_config(){
	global $db,$table;
	$data = read_cache('webconfig');
    $file = ROOT.'data/cache/php/webconfig.cache.php';
    
    if ($data == false || filemtime($file)+3600<time()) {       //1小时后过期
		$sql = "select setname,value from {$table}config order by sort asc";
		$rs = $db->getAll($sql);
		foreach($rs as $row) {
			$config[$row['setname']] = $row['value'];
		}
		write_cache('webconfig', $config);
	} else {
		$config = $data;
	}
	return $config;
}

/**
 * 显示信息
 */
function showmsg($msg,$goHome=0){
    include template('msg');
	exit();
}

/**
 * 加载类
 */
function load_class($classname, $initialize = 1) {
	static $classes = array();
	$key = md5($classname);
	if (isset($classes[$key])) {
		if (!empty($classes[$key])) {
			return $classes[$key];
		} else {
			return true;
		}
	}
	if (file_exists(ROOT.'core/library'.DIRECTORY_SEPARATOR.$classname.'.class.php')) {
		include ROOT.'core/library'.DIRECTORY_SEPARATOR.$classname.'.class.php';
		$name = $classname;
		if ($initialize) {
			$classes[$key] = new $name;
		} else {
			$classes[$key] = true;
		}
		return $classes[$key];
	} else {
		return false;
	}
}

function template($file){
    global $CFG;
   	$tplfile = ROOT.'templates/'.$CFG['tplname'].'/'.$file.'.php';
    if(!file_exists($tplfile)) exit('模板'.$tplfile.'没有找到，请检查路径是否正确');
    return $tplfile;
}

/**
 * 递归创建目录
 */
function mkdirs($dir){
    if (empty($dir)) return false;
    if (!is_dir($dir)) {
        mkdirs(dirname($dir));
        mkdir($dir);
    }
}

/**
 * 删除目录及目录下面的所有文件
 */
function delete_dir($dir)
{
    $dir = str_replace('\\', '/', $dir);
    if (substr($dir, -1) != '/') $dir = $dir . '/';     //转化 \ 为 /
    
    if (!is_dir($dir)) return FALSE;
    $list = glob($dir . '*');
    foreach ($list as $v) {
        is_dir($v) ? delete_dir($v) : @unlink($v);
    }
    return @rmdir($dir);
}

/**
 * 判断是否手机访问
 */
function is_mobile()
{
    static $is_mobile;
    if (isset($is_mobile)) return $is_mobile;
    if (empty($_SERVER['HTTP_USER_AGENT'])) {
        $is_mobile = false;
    } elseif (strpos($_SERVER['HTTP_USER_AGENT'], 'Mobile') !== false // many mobile devices (all iPhone, iPad, etc.)
        || strpos($_SERVER['HTTP_USER_AGENT'], 'Android') !== false
        || strpos($_SERVER['HTTP_USER_AGENT'], 'Silk/') !== false
        || strpos($_SERVER['HTTP_USER_AGENT'], 'Kindle') !== false
        || strpos($_SERVER['HTTP_USER_AGENT'], 'BlackBerry') !== false
        || strpos($_SERVER['HTTP_USER_AGENT'], 'Opera Mini') !== false
        || strpos($_SERVER['HTTP_USER_AGENT'], 'Opera Mobi') !== false
    ) {
        $is_mobile = true;
    } else {
        $is_mobile = false;
    }
    return $is_mobile;
}


//分类的扩展路由
function route_ext(){
    global $db,$table;
    $data = read_cache('route_ext');
    if ($data == false) {
        $sql = "select pid,pinyin from {$table}category where pid=0";        //一级分类
        $rs = $db->getAll($sql);
       	foreach($rs as $row) {
            $key = "$row[pinyin]";     //本级分类的拼音
			$route[$key] = "info/list/$row[pinyin]";
		}   
        //不是一级分类
		$sql = "select a.pid as pid,a.pinyin as pinyin,b.pid as pre_pid,b.pinyin as pre_pinyin from {$table}category as a inner join {$table}category as b on a.pid=b.cid order by b.pinyin asc";
        $rs = $db->getAll($sql);
		foreach($rs as $row) {
            if($row['pre_pid']){
                $key = "$row[pre_pinyin]/$row[pinyin]";     //上级分类的拼音+本级分类的拼音
                $key1 = "$row[pre_pinyin]/(:num).html";
            } else {
                $key = "$row[pinyin]";     //本级分类的拼音
                $key1 = "$row[pinyin]/(:num).html";
            }
            
			$route[$key] = "info/list/$row[pinyin]";
            $route[$key1] = "info/show/$1";
		}
        ksort($route);
        write_cache('route_ext', $route);
	 }else {
		$route = $data;
	}
	return $route;
}
?>