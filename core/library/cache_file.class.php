<?php
if(!defined('IN_SITE')) die('Access Denied');

/**
 * 文件缓存
 */
	
class Cache_file {

    /**
     * 缓存目录
     */
    public $cache_dir;

    /**
     * 构造函数,初始化变量
     */
    public function __construct() {
        $this->cache_dir = ROOT.'data/cache/'; // 设置缓存目录
    }

    /**
     * 设置缓存目录
     */
    public function set_dir($dir = null) {
        $this->cache_dir = $dir ? $dir : ROOT . 'data/cache/'; // 设置缓存目录
    }

    /**
     * 分析缓存文件名
     *
     * @param 	string
     * @return 	string
     */
    private function parse_cache_file($file_name) {
        return $this->cache_dir.$file_name.'.cache.php';
    }

    /**
     * 设置缓存
     * 
     * @param string $key
     * @param string $value
     * @return boolean
     */
    public function set($key, $data ,$ttl=60) {
        if (!$key) return false;
        $cache_file = $this->parse_cache_file($key); // 分析缓存文件
		$contents = array(			// 分析缓存内容
			'time'		=> time(),
			'ttl'		=> $ttl,
			'data'		=> $data
		);
      
        // 分析缓存目录
        if (!is_dir($this->cache_dir)) {
            mkdirs($this->cache_dir, 0777);
        } else {
            if (!is_writeable($this->cache_dir)) @chmod($this->cache_dir, 0777);
        }
        return @file_put_contents($cache_file, serialize($contents), LOCK_EX) ? true : false;
    }
	
    /**
     * 获取一个已经缓存的变量
     * 
     * @param string $key
     * @return string
     */
    public function get($key) {
        if (!$key) return false;
		$data = $this->_get($key);
		return is_array($data) ? $data['data'] : FALSE;
    }
	
	/**
	 * 读缓存数据
	 */
	protected function _get($key)
	{	
		$cache_file = $this->parse_cache_file($key); // 分析缓存文件
		if (!is_file($cache_file)) return FALSE;

		$data = unserialize(file_get_contents($cache_file));
		if ($data['ttl'] > 0 && time() > $data['time'] + $data['ttl'])
		{
			unlink($cache_file);
			return FALSE;
		}
		return $data;
	}

    /**
     * 删除缓存
     * 
     * @param string $key
     * @return void
     */
    public function delete($key) {
        if (!$key) return true;
        $cache_file = $this->parse_cache_file($key);  // 分析缓存文件
        return is_file($cache_file) ? unlink($cache_file) : true;
    }

}