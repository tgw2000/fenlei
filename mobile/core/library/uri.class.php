<?php

class uri {
    var $uri_string;
	var $segments		= array();

   	function __construct(){
	
	}
    
   	function segment($n, $no_result = FALSE){
		return ( ! isset($this->segments[$n])) ? $no_result : $this->segments[$n];
	}
    
   	function _explode_segments(){
		foreach (explode("/", preg_replace("|/*(.+?)/*$|", "\\1", $this->uri_string)) as $val){
			// Filter segments for security
			$val = trim($this->_filter_uri($val));
            if ($val != '') $this->segments[] = $val;	
		}
	}
    
   	function _filter_uri($str){
	   global $config;	   
		if ($str != '' && $config['permitted_uri_chars']!= '' && $config['enable_query_strings'] == FALSE){
			if (! preg_match("|^[".str_replace(array('\\-', '\-'), '-', preg_quote($config['permitted_uri_chars'], '-'))."]+$|i", $str)){
				$this->halt('The URI you submitted has disallowed characters.');
			}
		}

		// Convert programatic characters to entities
		$bad	= array('$',		'(',		')',		'%28',		'%29');
		$good	= array('&#36;',	'&#40;',	'&#41;',	'&#40;',	'&#41;');

		return str_replace($bad, $good, $str);
	}
    
   	function _fetch_uri_string(){
	   global $config;	   
		if (strtoupper($config['uri_protocol']) == 'AUTO'){
			// Is the request coming from the command line?
			if (defined('STDIN')){
				$this->_set_uri_string($this->_parse_cli_args());
				return;
			}

			// Let's try the REQUEST_URI first, this will work in most situations
			if ($uri = $this->_detect_uri()){  
				$this->_set_uri_string($uri);
				return;
			}

			// Is there a PATH_INFO variable?
			// Note: some servers seem to have trouble with getenv() so we'll test it two ways
			$path = (isset($_SERVER['PATH_INFO'])) ? $_SERVER['PATH_INFO'] : @getenv('PATH_INFO'); 
                     
			if (trim($path, '/') != '' && $path != "/".SELF){
				$this->_set_uri_string($path);
				return;
			}

			// No PATH_INFO?... What about QUERY_STRING?
			$path =  (isset($_SERVER['QUERY_STRING'])) ? $_SERVER['QUERY_STRING'] : @getenv('QUERY_STRING');
			if (trim($path, '/') != ''){
				$this->_set_uri_string($path);
				return;
			}

			// As a last ditch effort lets try using the $_GET array
			if (is_array($_GET) && count($_GET) == 1 && trim(key($_GET), '/') != ''){
				$this->_set_uri_string(key($_GET));
				return;
			}

			// We've exhausted all our options...
			$this->uri_string = '';
			return;
		}

		$uri = strtoupper($config['uri_protocol']);
        
		if ($uri == 'REQUEST_URI'){
			$this->_set_uri_string($this->_detect_uri());
			return;
		}elseif ($uri == 'CLI'){
			$this->_set_uri_string($this->_parse_cli_args());
			return;
		}

		$path = (isset($_SERVER[$uri])) ? $_SERVER[$uri] : @getenv($uri);
		$this->_set_uri_string($path);
	}
    
   	private function _detect_uri(){
		if ( ! isset($_SERVER['REQUEST_URI'])) return '';
		$uri = $_SERVER['REQUEST_URI'];
        
		if (strpos($uri, $_SERVER['SCRIPT_NAME']) === 0){
			$uri = substr($uri, strlen($_SERVER['SCRIPT_NAME']));
		}elseif (strpos($uri, dirname($_SERVER['SCRIPT_NAME'])) === 0){
			$uri = substr($uri, strlen(dirname($_SERVER['SCRIPT_NAME'])));
		}

		if (strncmp($uri, '?/', 2) === 0){
			$uri = substr($uri, 2);
		}
		$parts = preg_split('#\?#i', $uri, 2);
		$uri = $parts[0];
		if (isset($parts[1])){
			$_SERVER['QUERY_STRING'] = $parts[1];
			parse_str($_SERVER['QUERY_STRING'], $_GET);
		}else{
			$_SERVER['QUERY_STRING'] = '';
			$_GET = array();
		}
		
		if ($uri == '/' || empty($uri)) return '/';
					
		$uri = parse_url($uri, PHP_URL_PATH);
		return str_replace(array('//', '../'), '/', $uri);
	}
    
   	function _set_uri_string($str){
		// Filter out control characters
	   $str = $this->remove_invisible_characters($str, FALSE);
		// If the URI contains only a slash we'll kill it
	   $this->uri_string = ($str == '/') ? '' : $str;
	}
    
   	private function _parse_cli_args(){
		$args = array_slice($_SERVER['argv'], 1);
		return $args ? '/' . implode('/', $args) : '';
	}
    
    //这个函数能防止在ASCII字符之间插入空字符，如Java\0script.
	function remove_invisible_characters($str, $url_encoded = TRUE){
		$non_displayables = array();
		if ($url_encoded){
			$non_displayables[] = '/%0[0-8bcef]/';	// url encoded 00-08, 11, 12, 14, 15
			$non_displayables[] = '/%1[0-9a-f]/';	// url encoded 16-31
		}
		
		$non_displayables[] = '/[\x00-\x08\x0B\x0C\x0E-\x1F\x7F]+/S';	// 00-08, 11, 12, 14-31, 127
		do{
			$str = preg_replace($non_displayables, '', $str, -1, $count);
		}
		while ($count);
		return $str;
	}
    
   	function _remove_url_suffix(){
	   global $config;	   
	   if ($config['url_suffix']!= ""){
	       $this->uri_string = preg_replace("|".preg_quote($config['url_suffix'])."$|", "", $this->uri_string);
	   }
	}
    
   	function _reindex_segments(){
		array_unshift($this->segments, NULL);
		array_unshift($this->rsegments, NULL);
		unset($this->segments[0]);
		unset($this->rsegments[0]);
	}
    
   	function halt($msg){
		if(DEBUG_MODE){
			echo "<p style=\"font-family: Verdana, Tahoma; font-size: 11px; background: #FFFFFF;\"><b>Err info</b>:".$msg."</p>\n\n";
			exit();
		}
	}
}


?>