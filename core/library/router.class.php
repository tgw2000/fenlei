<?php  if (!defined('IN_SITE')) die('Access Denied');
class router {
	var $route			= array();
	var $error_routes	= array();
	var $class			= '';
	var $method			= 'default';
	var $directory		= '';
	var $default_controller;

	function __construct(){
	    global $uri;
        $this->uri = $uri;
	}

	function _set_routing(){
	   global $config,$route;
	   $segments = array();	
	   $this->default_controller = ( ! isset($route['default_controller']) OR $route['default_controller'] == '') ? FALSE : strtolower($route['default_controller']);
        if (count($segments) > 0){
			return $this->_validate_request($segments);
		}

		$this->uri->_fetch_uri_string();
		if ($this->uri->uri_string == ''){
			return $this->_set_default_controller();
		}

		$this->uri->_remove_url_suffix();
		// Compile the segments into an array
		$this->uri->_explode_segments();
		// Parse any custom routing that may exist
		$this->_parse_routes();
		$this->uri->_reindex_segments();
	}

	function _set_default_controller(){
		if ($this->default_controller == FALSE){
			$this->halt("Unable to determine what should be displayed. A default route has not been specified in the routing file.");
		}
        
		// Is the method being specified?
		if (strpos($this->default_controller, '/')){

			$x = explode('/', $this->default_controller);
			$this->set_class($x[0]);
			$this->set_method($x[1]);
			$this->_set_request($x);
		} else {		  
			$this->set_class($this->default_controller);
			$this->set_method('default');
			$this->_set_request(array($this->default_controller, 'default'));
		}

		// re-index the routed segments array so it starts with 1 rather than 0
		$this->uri->_reindex_segments();
	}

	function _parse_routes(){
	   global $route;
		// Turn the segment array into a URI string
		$uri = implode('/', $this->uri->segments);
		// Is there a literal match?  If so we're done
		if (isset($route[$uri])){
			return $this->_set_request(explode('/', $route[$uri]));
		}

		// Loop through the route array looking for wild-cards
        
		foreach ($route as $key => $val){
		// Convert wild-cards to RegEx
		  $key = str_replace(':any', '.+', str_replace(':num', '[0-9]+', $key));
		  // Does the RegEx match?
			if (preg_match('#^'.$key.'$#', $uri)){
				// Do we have a back-reference?
				if (strpos($val, '$') != FALSE AND strpos($key, '(') != FALSE){
					$val = preg_replace('#^'.$key.'$#', $val, $uri);
				}
				return $this->_set_request(explode('/', $val));
			}
		}
		$this->_set_request($this->uri->segments);
	}
    
    //$segments为数组形式如：Array ( [0] => news [1] => show )
   	function _set_request($segments = array()){
		$segments = $this->_validate_request($segments);
		if (count($segments) == 0){
			return $this->_set_default_controller();
		}
        
		$this->set_class($segments[0]);
		if (isset($segments[1])){
			$this->set_method($segments[1]);
		} else {
			$segments[1] = 'default';
		}
		$this->uri->rsegments = $segments;  
	}
	   
    //$segments为数组形式如：Array ( [0] => news [1] => show ) 
    function _validate_request($segments ,$flag = FALSE){      //$falg 判断验证层级
        global $route;
		if (count($segments) == 0){
			return $segments;
		}
		// 如：source/news.php
		if (file_exists(ROOT.'source/'.$segments[0].'.php') && $flag === FALSE){
			return $segments;
		}

		// Is the controller in a sub-folder? 如source/home
		if (is_dir(ROOT.'source/'.$this->directory.$segments[0])){
			$this->set_directory($this->directory.$segments[0],$flag);
			$segments = array_slice($segments, 1);
			if (count($segments) > 0){
				if(is_dir(ROOT.'source/'.$this->directory.$segments[0])){	//source/home/default	
					$this->set_directory($this->directory.$segments[0],TRUE);  //
					$segments = array_slice($segments, 1);                    
					//$this->_validate_request(&$segments,TRUE);
				}
			     //Does the requested controller exist in the sub-folder?
				if ( ! file_exists(ROOT.'source/'.$this->fetch_directory().$segments[0].'.php')){
					//echo APPPATH.'controllers/'.$this->fetch_directory().$segments[0].EXT;
					$this->halt('source/'.$this->fetch_directory().$segments[0].'不存在！');
				}
			} else {
				// Is the method being specified in the route?
				if (strpos($this->default_controller, '/') !== FALSE){
					$x = explode('/', $this->default_controller);
					$this->set_class($x[0]);
					$this->set_method($x[1]);
				} else {
					$this->set_class($this->default_controller);
					$this->set_method('default');
				}

				// Does the default controller exist in the sub-folder?
				if (!file_exists(ROOT.'source/'.$this->fetch_directory().$this->default_controller.'.php')){
					$this->directory = '';
					return array();
				}
			}
			return $segments;
		} else {
			if (file_exists(ROOT.'source/'.$this->fetch_directory().$segments[0].'.php')){
				return $segments;
			}
		}

		if (!empty($route['404_override'])){
			$x = explode('/', $route['404_override']);
			$this->set_class($x[0]);
			$this->set_method(isset($x[1]) ? $x[1] : 'default');
			return $x;
		} 
        $this->halt('模块'.$segments[0].'不存在！');
	}
    
   	function set_class($class){
		$this->class = str_replace(array('/','.'),'',$class);
	}
    
    function fetch_class(){
		return $this->class;
	}
    
	function set_method($method){
		$this->method = $method;
	}
    
   	function fetch_method(){
        if ($this->method == $this->fetch_class()){
			return 'default';
		}
		return $this->method;
	}
    
	function set_directory($dir,$flag = FALSE){
	   if(!$flag)
			$this->directory = str_replace(array('/', '.'), '', $dir).'/';
		else
			$this->directory = str_replace('.','',$dir).'/';       
	}
    
	function fetch_directory(){
		return $this->directory;
	}
    
    //出错时如果打开调试开关，就输出错误，没打开就转到首页
   	function halt($msg){
		if(DEBUG_MODE){
			echo "<p style=\"font-family: Verdana, Tahoma; font-size: 12px; color:red;\"><b>Err Info</b>：".$msg."</p>\n\n";
			exit();
		} else {
            header('Location: /');
		}
	}
}