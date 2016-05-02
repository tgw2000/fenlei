<?php
if (!defined('IN_SITE'))die('Access Denied');
class mysql {
	function mysql($dbhost, $dbuser, $dbpw, $dbname = '',$dbcharset='utf8', $pconnect=0){
		if($pconnect){
			if(!$this->mlink = @mysql_pconnect($dbhost, $dbuser, $dbpw)){
				$this->halt('Can not connect to MySQL');
			}
		} 
		else{
			if(!$this->mlink = @mysql_connect($dbhost, $dbuser, $dbpw))
			{
				$this->halt('Can not connect to MySQL');
			}
		}
		if($this->version()>'4.1')
		{
			if('utf-8'==strtolower($dbcharset))
			{
				$dbcharset='utf8';
			}
			if($dbcharset)
			{
				mysql_query("SET character_set_connection=$dbcharset, character_set_results=$dbcharset, character_set_client=binary", $this->mlink);
			}
			if($this->version() > '5.0.1')
			{
				mysql_query("SET sql_mode=''", $this->mlink);
			}
		}
		if($dbname)
		{
			mysql_select_db($dbname, $this->mlink);
		}
	}

	function select_db($dbname)
	{
		return mysql_select_db($dbname, $this->mlink);
	}

	function fetch_array($query, $result_type = MYSQL_ASSOC)
	{
		return (is_resource($query))? mysql_fetch_array($query, $result_type) :false;
	}

	function result_first($sql)
	{
		$query = $this->query($sql);
		return $this->result($query, 0);
	}

	function fetch_first($sql)
	{
		$query = $this->query($sql);
		return $this->fetch_array($query);
	}
	
	function fetch_by_field($table,$field,$value,$select_fields='*')
	{
		$query=$this->query("SELECT $select_fields FROM ".DB_TABLEPRE."$table WHERE $field='$value'");
		return $this->fetch_array($query);
	}
	
	function update_field($table,$field,$value,$where)
	{
		return $this->query("UPDATE ".DB_TABLEPRE."$table SET $field='$value' WHERE $where");
	}
	
	function fetch_total($table,$where='1')
	{
		return $this->result_first("SELECT COUNT(*) num FROM ".DB_TABLEPRE."$table WHERE $where");
	}
	
	function query($sql, $type = '')
	{
		global $mquerynum; 
		$func = $type == 'UNBUFFERED' && @function_exists('mysql_unbuffered_query') ? 'mysql_unbuffered_query' : 'mysql_query';
		if(!($query = $func($sql, $this->mlink)) && $type != 'SILENT'){
			$this->halt(mysql_error());
		}
		$mquerynum++;
		return $query;
	}
    
	function affected_rows()
	{
		return mysql_affected_rows($this->mlink);
	}

	function error()
	{
		return (($this->mlink) ? mysql_error($this->mlink) : mysql_error());
	}

	function errno()
	{
		return intval(($this->mlink) ? mysql_errno($this->mlink) : mysql_errno());
	}

	function result($query, $row)
	{
		$query = @mysql_result($query, $row);
		return $query;
	}

	function num_rows($query)
	{
		$query = mysql_num_rows($query);
		return $query;
	}

	function num_fields($query)
	{
		return mysql_num_fields($query);
	}

	function free_result($query){
		return mysql_free_result($query);
	}

	function insert_id()
	{
		return ($id = mysql_insert_id($this->mlink)) >= 0 ? $id : $this->result($this->query('SELECT last_insert_id()'), 0);
	}

    function fetchRow($query)
    {
        return mysql_fetch_assoc($query);
    }

	function fetch_fields($query)
	{
		return mysql_fetch_field($query);
	}

	function version()
	{
		return mysql_get_server_info($this->mlink);
	}

	function close()
	{
		return mysql_close($this->mlink);
	}

	function halt($msg)
	{
		if(DEBUG_MODE){
			echo "<p style=\"font-family: Verdana, Tahoma; font-size: 11px; background: #FFFFFF;\"><b>Err info</b>:".$msg."</p>\n\n";
			exit();
		}
	}
    /**
     * ȡһ���ֶ�
     */
    function getOne($sql, $limited = false)
    {
        if ($limited == true)
        {
            $sql = trim($sql . ' LIMIT 1');
        }

        $res = $this->query($sql);
        if ($res !== false)
        {
            $row = mysql_fetch_row($res);

            if ($row !== false)
            {
                return $row[0];
            }
            else
            {
                return '';
            }
        }
        else
        {
            return false;
        }
    }

    /**
     * ȡ���м�¼
     */
    function getAll($sql)
    {
        $res = $this->query($sql);
        if ($res !== false)
        {
            $arr = array();
            while ($row = mysql_fetch_array($res))
            {
                $arr[] = $row;
            }

            return $arr;
        }
        else
        {
            return false;
        }
    }
    /**
     * ȡһ����¼
     */
    function getRow($sql, $limited = false)
    {
        if ($limited == true)
        {
            $sql = trim($sql . ' LIMIT 1');
        }

        $res = $this->query($sql);
        if ($res !== false)
        {
            return mysql_fetch_assoc($res);
        }
        else
        {
            return false;
        }
    }
	
 	function getCol($sql)
    {
        $res = $this->query($sql);
        if ($res !== false)
        {
            $arr = array();
            while ($row = mysql_fetch_row($res))
            {
                $arr[] = $row[0];
            }

            return $arr;
        }
        else
        {
            return false;
        }
    }
	
	function GetArray($id="me",$acctype=MYSQL_ASSOC)
	{
		if($this->result[$id]==0)
		{
			return false;
		}
		else
		{
			return mysql_fetch_array($this->result[$id],$acctype);
		}
	}

	function GetTotalRow($id="me")
	{
		if($this->result[$id]==0) return -1;
		else return mysql_num_rows($this->result[$id]);
	}
    
    function insert($tablename, $array)
	{
		$this->check_fields($tablename, $array);
		return $this->query("INSERT INTO `$tablename`(`".implode('`,`', array_keys($array))."`) VALUES('".implode("','", $array)."')");
	}

	function update($tablename, $array, $where = '')
	{
		$this->check_fields($tablename, $array);
		if($where)
		{
			$sql = '';
			foreach($array as $k=>$v)
			{
				if($v === "++"){
					$sql .= ", `$k`=`$k`+1";
				}else
				if(substr($v,0,2) === "++"){
					$sql .= ", `$k`=`$k`+".floatval(substr($v,2));
				}else
				if($v === "--"){
					$sql .= ", `$k`=`$k`-1";
				}else
				if(substr($v,0,2) === "--"){
					$sql .= ", `$k`=`$k`-".floatval(substr($v,2));
				}else{
					$sql .= ", `$k`='$v'";
				}
			}
			$sql = substr($sql, 1);
			$sql = "UPDATE `$tablename` SET $sql WHERE $where";
		}
		else{
			$sql = "REPLACE INTO `$tablename`(`".implode('`,`', array_keys($array))."`) VALUES('".implode("','", $array)."')";
		}
		return $this->query($sql);
	}
    
    function check_fields($tablename, $array){
		$fields = $this->get_fields($tablename);
		foreach($array AS $k=>$v)
		{
			if(!in_array($k,$fields))
			{
				$this->halt('MySQL Query Error', "Unknown column '$k' in field list");
				return false;
			}
		}
	}

	function get_fields($table){
		$fields = array();
		$result = $this->query("SHOW COLUMNS FROM $table");
		while($r = $this->fetch_array($result)){
			$fields[] = $r['Field'];
		}
		$this->free_result($result);
		return $fields;
	}
}
?>