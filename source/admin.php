<?php
    if (!defined('IN_SITE'))die('Access Denied');
    require(ROOT.'/source/include/common.php');
    require(ROOT.'/source/include/info.fun.php');

    switch($act){
        case 'login':       //登录
            $forward = urldecode($_GET['forward']);
            if(!$forward) $forward = site_url("admin/");
            include template('admin/login');
            break;
            
        case 'category':       //行业分类
            if(!$_SESSION['admin_uid']) redirect(site_url("admin/login/?forward=".urlencode(URL)));
            include template('admin/category');
            break;
            
        case 'info':        //信息管理
            if(!$_SESSION['admin_uid']) redirect(site_url("admin/login/?forward=".urlencode(URL)));
            $cid = intval($_GET['cid']);
            $sort = intval($_GET['sort']);
            $status = intval($_GET['status']);
            $kw = trim($_REQUEST['kw']);
            if($sort==1){
                $order = "order by a.hits desc";
            } elseif($sort==2){
                $order = "order by a.hits asc";
            } elseif($sort==3){
                $order = "order by a.refreshtime desc";
            } elseif($sort==4){
                $order = "order by a.refreshtime asc";
            } else {
                $order = "order by a.infoid desc";
            }
            $where = 'where 1=1';
            if($cid) $where .= " and a.cid = $cid";
            if($status) $where .= " and a.status = $status";     
            if($kw) $where .= " and a.title like '%$kw%'";
              
            $sql = "SELECT count(*) as count FROM {$table}info as a inner join {$table}category as b on a.cid=b.cid inner join {$table}user as c on a.userid=c.userid $where";
	        $total = $db->getOne($sql);
            $perpage = 50;
            $nums = ceil($total/$perpage);
            $page	= intval($_GET['page']);
            if($page<1) $page = 1;
            if($page>$nums) $page = $nums;
            $sql = "select a.*,b.title as class,b.pinyin,c.username from {$table}info as a inner join {$table}category as b on a.cid=b.cid inner join {$table}user as c on a.userid=c.userid $where $order limit ".(($page-1)*$perpage).", $perpage";
            
            $info = $db->getAll($sql);
            $category = get_category();     //所有分类
            foreach($info as $row){
                $arr['infoid'] = $row['infoid'];
                $arr['cid'] = $row['cid'];
                $arr['title'] = $row['title'];
                $arr['class'] = $row['class'];
                $arr['username'] = $row['username'];
                $arr['hits'] = $row['hits'];
                $arr['status'] = $row['status'];
                $arr['refreshtime'] = date('Y-m-d',$row['refreshtime']);
                
                $arr['pinyin'] = $category[$row['cid']]['parent'][1] ? $category[$row['cid']]['parent'][1]['pinyin']:$category[$row['cid']]['pinyin'];
                $data[] = $arr;
                
            }
            $urlrule = $_SERVER['querystring'];
            if($kw) $urlrule.="&kw=$kw";
            $pages = pages($page, $total, $perpage, 20,trim($urlrule,'&'));  //分页导航
            include template('admin/info');
            break;
            
        case 'members':     //会员管理
            if(!$_SESSION['admin_uid']) redirect(site_url("admin/login/?forward=".urlencode(URL)));
            include template('admin/members');
            break;
        case 'models':       //模型管理
            if(!$_SESSION['admin_uid']) redirect(site_url("admin/login/?forward=".urlencode(URL)));
            $sql = "select * from {$table}models order by sort asc";
            $model = $db->getAll($sql);
            include template('admin/model');
            break; 
            
        case 'fields':       //字段管理
            if(!$_SESSION['admin_uid']) redirect(site_url("admin/login/?forward=".urlencode(URL)));
            $sql = "select * from {$table}fields order by field asc,title asc";
            $rows = $db->getAll($sql);
            foreach($rows as $row){
                $arr['fid'] = $row['fid'];
                $arr['title'] = $row['title'];
                $arr['field'] = $row['field'];
                $arr['field_type'] = $row['field_type'];
                $arr['input_type'] = $row['input_type'];
                $sql = "select title from {$table}models where FIND_IN_SET($row[fid],fields)";
                $rs = $db->getAll($sql);
                $mod = array();
                foreach($rs as $row1){
                    $mod[] = $row1['title'];
                }
                if(is_array($mod)){
                    $arr['mod'] = implode(',',$mod);
                } else {
                    $arr['mod']= '';
                }
                $fields[] = $arr;
            }
            include template('admin/field');
            break;
            
        case 'article':     //文章列表
            if(!$_SESSION['admin_uid']) redirect(site_url("admin/login/?forward=".urlencode(URL)));
            $tid = intval($_GET['tid']);
            if($tid) $where = "where a.tid = $tid";
            $sql = "SELECT count(*) as count FROM {$table}article as a inner join {$table}article_type as b on a.tid=b.tid $where";
	        $total = $db->getOne($sql);
            $perpage = 50;
            $nums = ceil($total/$perpage);
            $page	= intval($_GET['page']);
            if($page>$nums) $page = $nums;
            if($page<1) $page = 1;
            $sql = "select a.*,b.type from {$table}article as a inner join {$table}article_type as b on a.tid=b.tid $where order by b.tid asc, a.sort asc,a.dateline desc limit ".(($page-1)*$perpage).", $perpage";
            $info = $db->getAll($sql);
            $pages = pages($page, $total, $perpage, 20);  //分页导航
            include template('admin/article');
            break;
            
         case 'article_post':        //发布文章
            if(!$_SESSION['admin_uid']) redirect(site_url("admin/login/?forward=".urlencode(URL)));
            $id = intval($params[0]);
            $sql = "select tid,type from {$table}article_type order by sort asc";
            $type = $db->getAll($sql);
            $sql = "select a.*,b.type from {$table}article as a inner join {$table}article_type as b on a.tid=b.tid where a.id=$id";
            $info = $db->getRow($sql);
            include template('admin/article_post');
            break;
                   
        case 'options':       //选项管理
            if(!$_SESSION['admin_uid']) redirect(site_url("admin/login/?forward=".urlencode(URL)));
            $sql = "select a.*,b.title as field_name,b.field,c.title as cat_name from {$table}options as a inner join {$table}fields as b on a.fid=b.fid inner join {$table}category as c on a.cid=c.cid order by a.oid desc";
            $options = $db->getAll($sql);
            include template('admin/options');
            break;
            
        case 'option_post':      //修改选项值
            if(!$_SESSION['admin_uid']) redirect(site_url("admin/login/?forward=".urlencode(URL)));
            $oid = intval($params[0]);
            $sql = "select a.*,c.fields from {$table}options as a inner join {$table}category as b on a.cid=b.cid inner join {$table}models as c on b.mid=c.mid  where a.oid=$oid";
            $info = $db->getRow($sql);
            
            $sql = "select cid,pid,title from {$table}category where pid=0 order by sort asc";
            $type = $db->getAll($sql);
            
            $sql = "select fid,field,title,input_type from {$table}fields where fid IN($info[fields]) order by field asc";        //字段
            $fields = $db->getAll($sql);
            
            $v = get_category();
            $parent = $v[$info['cid']]['parent'];
            if(is_array($parent)){
                $f_cid = $parent[0]['cid'];
                foreach($parent as $row){
                    $pids.= $row['cid'].',';
                }
                $pids = substr($pids,0,strlen($pids)-1);
            }
            include template('admin/option_post');
            break;        
        
        case 'model_fields':    //模型字段
            if(!$_SESSION['admin_uid']) redirect(site_url("admin/login/?forward=".urlencode(URL)));
            $mid = intval($params[0]);
            if($mid){
                $sql = "select title,sort,fields from {$table}models where mid=$mid";
                $model = $db->getRow($sql);
                $field_id = explode(',',$model['fields']);
            }
   
            $sql = "select * from {$table}fields order by field asc,title asc";
            $fields = $db->getAll($sql);
            include template('admin/model_fields');
            break;
            
        case 'category_post':      //修改信息分类
            if(!$_SESSION['admin_uid']) redirect(site_url("admin/login/?forward=".urlencode(URL)));
            $cid = intval($params[0]);
            $sql = "select cid,pid,title from {$table}category where pid=0 and cid!=$cid order by sort asc";
            $type = $db->getAll($sql);
            
            $sql = "select * from {$table}category where cid=$cid";
            $info = $db->getRow($sql);
            $tpl = utf8_unserialize($info['template']);
            
            $sql = "select mid,title from {$table}models order by sort asc";        //模型
            $models = $db->getAll($sql);
            
            $sql = "select id,title from {$table}codes order by id asc";        //代码段
            $codes = $db->getAll($sql);
            
            $v = get_category();
            $parent = $v[$cid]['parent'];
            if(is_array($parent)){
                $f_cid = $parent[0]['cid'];
                foreach($parent as $row){
                    $pids.= $row['cid'].',';
                }
                $pids = substr($pids,0,strlen($pids)-1);
            }
            include template('admin/category_post');
            break;

        case 'category_post_more':      //批量添加信息分类
            if(!$_SESSION['admin_uid']) redirect(site_url("admin/login/?forward=".urlencode(URL)));
            $sql = "select cid,pid,title from {$table}category where pid=0 order by sort asc";
            $type = $db->getAll($sql);
                   
            $sql = "select mid,title from {$table}models order by sort asc";        //模型
            $models = $db->getAll($sql);
            
            $sql = "select id,title from {$table}codes order by id asc";        //代码段
            $codes = $db->getAll($sql);
            
            include template('admin/category_post_more');
            break;
            
        case 'field_post':      //修改字段
            if(!$_SESSION['admin_uid']) redirect(site_url("admin/login/?forward=".urlencode(URL)));
            $fid = intval($params[0]);
            $sql = "select * from {$table}fields where fid=$fid";
            $info = $db->getRow($sql);
 			if($info['rules']){
				$rules=utf8_unserialize($info['rules']);
			}
            if($info['search_type']){
                $s_type = explode(',',$info['search_type']);
            }
            
            include template('admin/field_post');
            break;
        
        case 'codes':      //代码段管理
            if(!$_SESSION['admin_uid']) redirect(site_url("admin/login/?forward=".urlencode(URL)));
            $sql = "select * from {$table}codes order by id desc";
            $info = $db->getAll($sql);
            include template('admin/codes');
            break;
            
        case 'code_post':      //修改代码段
            if(!$_SESSION['admin_uid']) redirect(site_url("admin/login/?forward=".urlencode(URL)));
            $id = intval($params[0]);
            $sql = "select * from {$table}codes where id=$id";
            $info = $db->getRow($sql);
            include template('admin/code_post');
            break;
            
        case 'cache':       //缓存管理
            if(!$_SESSION['admin_uid']) redirect(site_url("admin/login/?forward=".urlencode(URL)));
            include template('admin/cache');
            break;
            
        case 'userdo':      //操作执行
            $act = $_GET['act'];
            if($act=='in'){     //登录
                $user = trim($_POST['user']);
                $pwd = trim($_POST['pwd']);
                $ref = trim($_POST['ref']);
                if($user==''){
                    out("#msg|请输入管理员帐号！");
                    exit();
                }
                if($pwd==''){
                    out("#msg|请输入管理员密码！");
                    exit();
                }
                $sql = "select * from {$table}admin where user='$user' and pwd='".md5($pwd)."'";
                $row = $db->getRow($sql);
                if(!$row){
                    out("#msg|用户名或密码输入有误!");
                    exit();
                }else{
                    $_SESSION['admin_uid'] = $row['uid'];
                    $_SESSION['admin_user'] = $row['user'];
                    out("login_ok|$ref");
                }
            }
            
            if($act=='out'){        //退出登录
                $_SESSION['admin_uid'] = '';
                $_SESSION['admin_user'] = '';
                redirect(site_url("admin/login/"));
            }
            
            if($act == 'model_fields'){     //增加、修改模型
                if(!$_SESSION['admin_uid']) redirect(site_url("admin/login/?forward=".urlencode(URL)));
                $title = trim($_POST['title']);
                $sort = intval($_POST['sort']);
                $mid = intval($_GET['mid']);
                $new_fid_arr = $_POST['fid'];
                $fids = implode(',',$new_fid_arr);
                
                if($title==''){
                    out("#msg|请填写模型名称！");
                    exit();
                }
                if($fids==''){
                    out("#msg|请选择模型字段");
                    exit();
                }
                $sql = " select title from {$table}models where (fields='$fids' or title='$title')";
                if($mid) $sql.=" and mid!=$mid";
                $m_title=$db->getOne($sql);
                if($m_title){
                    out("#msg|新建模型与 $m_title 具有相同的名称或字段，无法创建！");
                    exit();
                }
                
                //判断所选字段中是否有重复的元素BEGIN
                foreach($new_fid_arr as $new_fid){
                    $sql = "select field from {$table}fields where fid=$new_fid and available='on'";
                    $field = $db->getOne($sql);
                    if($field) $new_fields[] = $field;     //新字段数组
                }
                $tem = array_unique($new_fields);       //去除重复元素
                if(count($tem)!= count($new_fields)){
                    out("#msg|所选字段中包含重复的数据库字段！"); 
                    exit();
                }
              
                //判断所选字段中是否有重复的元素END
                $old_fids =$db->getOne("select fields from {$table}models where mid=$mid");
                
                if($mid){
                    $sql = "UPDATE {$table}models SET title='$title',sort=$sort,fields='$fids' WHERE mid=$mid";
                    $db->query($sql);
                } else {
                    $sql = "INSERT {$table}models(title,sort,fields) VALUES ('$title',$sort,'$fids')";
                    $db->query($sql);
                    $mid = $db->insert_id();
                }

                //修改使用该模型的信息附加表结构
                $tb = "{$table}info_$mid";
                $sql = "SHOW TABLES WHERE Tables_in_$datebase[name]='$tb'";  //判断$tb表是否在数据库$datebase[name]中存在
                $rs = $db->getRow($sql);
                if($rs){        //存在信息附加表，则修改
                    $old_fid_arr = explode(',',$old_fids);
                    //print_r($new_fid_arr);exit();
                    foreach($old_fid_arr as $old_fid){
                        if(!in_array($old_fid,$new_fid_arr)){
                            $field = $db->getOne("select field from {$table}fields where fid=$old_fid and available='on'");
                            if($field) $db->query("ALTER TABLE $tb DROP $field");      //删除在新信息表中不存在的字段
                        }
                    }
                    
                    foreach($new_fid_arr as $new_fid){
                        if(!in_array($new_fid,$old_fid_arr)){
                            $sql = "select field,field_type,rules from {$table}fields where fid=$new_fid and available='on'";
                            $row = $db->getRow($sql);
                            if($row){
                                $rules = utf8_unserialize($row['rules']);
                                $field = strtolower($row['field']);
                                $field_type = $row['field_type'];
                                $length = ($field_type=='mediumtext')? '' : '('.$rules['length'].')';
                                $db->query("ALTER TABLE $tb ADD $field $field_type $length NULL");      //增加在原信息表中不存在的字段
                            }
                        }
                    }
                } else {        //不存在信息附加表，则创建
              		//创建表begin
            		$sql = "CREATE TABLE `{$table}info_$mid`(
            		`id` int(8) NOT NULL auto_increment,
            		`infoid` int(8) NOT NULL default '0',
            		PRIMARY KEY  (`id`),
            		KEY `infoid` (`infoid`)
            		) engine=innodb default charset=utf8 auto_increment=1;";
            		$db->query($sql);         //创建固定字段
                    
                    $sql = "select field,field_type,rules from {$table}fields where fid in($fids)";
                    $rows = $db->getAll($sql);
                    foreach($rows as $row){
                        $rules = utf8_unserialize($row['rules']);
                        $field = strtolower($row['field']);
                        $field_type = $row['field_type'];
                        $length = ($field_type=='mediumtext')? '' : '('.$rules['length'].')';
                        $db->query("ALTER TABLE $tb ADD $field $field_type $length NULL");      //增加附加字段
                    }
	                //创建表end
                }
                del_cache('php','model_'.$mid);     //删除模型缓存
                out("#msg|<font color=green>设置保存成功</font>");
                exit();
			}
            
            if($act=='field_post'){  //添加、修改字段设置
                if(!$_SESSION['admin_uid']) redirect(site_url("admin/login/?forward=".urlencode(URL)));
                $fid = intval($_GET['fid']);
                $title = trim($_POST['title']);
                $field = trim($_POST['field']);	//数据库存放字段
			    $field_type = trim($_POST['field_type']);
				$input_type = trim($_POST['input_type']);
                $sort = intval($_POST['sort']);
                $available = trim($_POST['available']);     //是否可用
                $required = trim($_POST['required']);       //是否必填
                $search = trim($_POST['search']);           //是否参与搜索
                $description = trim($_POST['description']);
                $rules = $_POST['rules'];
                $length = $rules[$input_type]['length'];       //字段长度
                $search_type = $_POST['s_type'];
                $search_type = implode(',',$search_type);
                if(!$search) $search_type='';
               
                if($field_type=='int' &&($length<1||$length>10||$length=='')) $length=10;
                if($field_type=='varchar' &&($length<1||$length>255||$length=='')) $length=255;
                if($field_type=='mediumtext') $length='';
                $rules[$input_type]['length'] = $length;
                $field_rules = serialize(str_replace(" ","",$rules[$input_type]));      //数组序列化成字符串
                if(empty($title)||empty($field)||empty($field_type)||empty($input_type)){
                    out("#msg|字段名称、数据库字段、字段类型、输入类型必填！");
                    exit();
                }
                
               	if(!ereg("^([a-zA-Z])([a-zA-Z0-9_]{1,})$",$field)){
                    out("#msg|数据库字段不符合规则,字段由二个或二个以上字母和数字组成,不能以数字开头!");
                    exit();
                }
                
                if($search && !$search_type){
                    out("#msg|请选择搜索类型!");
                    exit();
                }

                if(table_field("{$table}info",$field)){        //判断$field字段在表info中是否存在
                    out("#msg|该字段在主表{$table}info已经存在!");
                    exit();
                }
                
                if($fid){       //修改字段时
                    $sql = "select field from {$table}fields where fid=$fid";
                    $old_field = $db->getOne($sql);
                    $sql = "UPDATE {$table}fields SET title='$title',field='$field',field_type='$field_type',input_type='$input_type',sort='$sort',description='$description',rules ='$field_rules',available='$available',required='$required',search='$search',search_type='$search_type' WHERE fid=$fid";
                    $db->query($sql);
                    $sql = "select mid from {$table}models where FIND_IN_SET($fid,fields)";
                    $rows = $db->getAll($sql);
                    
              		//********************此处修改表的字段begin***********************
            	   $field_length = ($field_type=='mediumtext')? '' : '('.$length.')';
                   foreach($rows as $row){
                        $tb = "{$table}info_$row[mid]";
                        $sql = "SHOW TABLES WHERE Tables_in_$datebase[name]='$tb'";  //判断$tb表是否在数据库$datebase[name]中存在
                        $rs = $db->getRow($sql);
                        if($rs && table_field($tb,$old_field)){
                            $sql = "ALTER TABLE `$tb` CHANGE `{$old_field}` `{$field}` $field_type $field_length NULL";
                            $db->query($sql);
                        }
                    }	
                   //********************此处修改表的字段end***********************
               } else {
                    $sql = "INSERT {$table}fields(title,field,field_type,input_type,sort,description,rules,available,required,search,search_type) VALUES ('$title','$field','$field_type','$input_type','$sort','$description','$field_rules','$available','$required','$search','$search_type')";
                    $db->query($sql);
                    $fid = $db->insert_id();
               }
               
                $sql = "select mid from {$table}models where FIND_IN_SET($fid,fields)";
                $rs = $db->getAll($sql);
                foreach($rs as $row){       //删除应用到此字段的模型缓存
                    del_cache('php','model_'.$row['mid']);
                }
                out("#msg|<span class=fgreen>字段设置保存成功</span>");
                exit();
            }
            
            if($act=='field_del'){          //删除字段
                if(!$_SESSION['admin_uid']) redirect(site_url("admin/login/?forward=".urlencode(URL)));
                $fid = intval($_GET['fid']);
                
                $sql = "select mid from {$table}models where FIND_IN_SET($fid,fields)";
                $rs = $db->getAll($sql);
                if($rs){
                    echo('此字段被模型使用中，无法删除！');
                    exit;
                }
                $sql = "delete from {$table}fields where fid=$fid";
                $db->query($sql);
                if($db->affected_rows()){
                    exit('ok');
                } else {
                    exit('删除失败！');
                }               
            }
            
            if($act=='category_post'){      //添加、修改栏目分类
                if(!$_SESSION['admin_uid']) redirect(site_url("admin/login/?forward=".urlencode(URL)));
                $cid = intval($_GET['cid']);
                $title = trim($_POST['title']);
                $color = trim($_POST['color']);       //标题颜色
                $pinyin = trim($_POST['pinyin']);
                $sort = intval($_POST['sort']);
                $description = trim($_POST['description']);
                $mid = intval($_POST['mid']);
                $keywords = trim($_POST['keywords']);
                $codes = $_POST['codes'];
                $code_ids = implode(',',$codes);
                $tpl = $_POST['tpl'];
                $template = serialize(str_replace(" ","",$tpl));      //数组序列化成字符串
                $opt = intval($_POST['opt']);           //子类是否使用相同设置
                $sel = $_POST['sel'];
                $count = count($sel);
                if($count>1){
                    for($k = $count-1;$k>=0;$k--){
                        if($sel[$k]>0){
                            $pid = intval($sel[$k]);
                            break;
                        }
                    }
                } else {
                    $pid = 0;
                }

                if($title==''){
                    out("#msg|请填写分类名称！");
                    exit();
                }
                if($pinyin==''){
                    out("#msg|请填写栏目拼音！");
                    exit();
                }

                $sql = "select cid from {$table}category where pinyin='$pinyin'";
                if($cid) $sql.=" and cid!=$cid";
                $row=$db->getRow($sql);
                if($row){
                    out("#msg|分类栏目拼音已存在，请更换！");
                    exit();
                }
                if($cid){
                    $sql = "UPDATE {$table}category SET title='$title',color='$color',pinyin='$pinyin',sort=$sort,pid=$pid,codes='$code_ids',description='$description',mid =$mid,keywords='$keywords',template='$template' WHERE cid=$cid";
                } else {
                    $sql = "INSERT {$table}category(title,color,pinyin,sort,pid,description,mid,keywords,codes,template) VALUES ('$title','$color','$pinyin',$sort,$pid,'$description',$mid,'$keywords','$code_ids','$template')";
                }
                $db->query($sql);
                if($cid && $opt){
                    $sql = "select cid from {$table}category where pid=$cid";
                    $rows = $db->getAll($sql);
                    if($rows){
                        foreach($rows as $row){
                            $sql = "UPDATE {$table}category SET codes='$code_ids',mid =$mid,template='$template' WHERE cid=$row[cid]";
                            $db->query($sql);
                        }
                    }
                }
                del_cache('php','category');
                del_cache('php','route_ext');
                out("#msg|<font color=green>设置保存成功！</font>");
                exit();
            }
            
            if($act=='category_post_more'){      //批量添加栏目分类
                if(!$_SESSION['admin_uid']) redirect(site_url("admin/login/?forward=".urlencode(URL)));
                require(ROOT.'/source/include/pinyin.fun.php');     //生成拼音的函数
                $title = trim($_POST['title']);
                $pid = intval($_POST['pid']);
                $mid = intval($_POST['mid']);
                $codes = $_POST['codes'];
                $code_ids = implode(',',$codes);
                $tpl = $_POST['tpl'];
                $template = serialize(str_replace(" ","",$tpl));      //数组序列化成字符串
                $arr = explode("\r\n",$title);
                
                if($title=='') {
                    out("#msg|<font color=red>请输入分类名称！</font>");
                    exit();
                }
                
                foreach($arr as $str){
                    $tem = explode('|',$str);
                    $title = trim($tem[0]);
                    $pinyin = trim($tem[1]);
                    if(!$pinyin) $pinyin = str2py($title);
                    if(!$title || !$pinyin) continue;
                    $sql = "select cid from {$table}category where pinyin='$pinyin'";
                    $row=$db->getRow($sql);
                    if($row) continue;
                    $sql = "INSERT {$table}category(title,pinyin,pid,mid,codes,template) VALUES ('$title','$pinyin',$pid,$mid,'$code_ids','$template')";
                    $db->query($sql);
                }
                del_cache('php','category');
                out("#msg|<font color=green>设置保存成功！</font>");
                exit();
            }
            
            if($act=='del_category'){       //删除分类
                if(!$_SESSION['admin_uid']) redirect(site_url("admin/login/?forward=".urlencode(URL)));
                $cid = intval($_GET['id']);
                $cids = get_cids($cid);
                if(!$cids) $cids = $cid;
                $cidarr = explode(',', $cids);
                
                foreach ($cidarr as $cid) {
                    $db->query("delete from {$table}category where cid=$cid");
                    $db->query("delete from {$table}info where cid=$cid");      //删除主表数据
                    $row = $db->getOne("select mid from {$table}category where cid=$cid");
                    if($row['mid']) $db->query("delete from {$table}info_$row[mid] where cid=$cid");      //删除附表数据
                }
                del_cache('php','category');
                exit('ok');
            }
            
            if($act=='info_del'){       //删除信息
                if(!$_SESSION['admin_uid']) redirect(site_url("admin/login/?forward=".urlencode(URL)));
                $id = intval($_GET['id']);
                $sql = "select b.mid from {$table}info as a left join {$table}category as b on a.cid=b.cid where a.infoid=$id";
                $mid = $db->getOne($sql);
                //echo($mid);
                $db->query("delete from {$table}info where infoid=$id");
                $db->query("delete from {$table}info_$mid where infoid=$id");

                $sql = "select path from {$table}info_photo where infoid=$id";      //删除信息图片
                $rows = $db->getAll($sql);
                foreach($rows as $row){
                    $path = ROOT.$row['path'];
                    $path1 = ROOT.str_replace('_100X75','_B',$row['path']);
                    if(file_exists($path)) unlink($path);
                    if(file_exists($path1)) unlink($path1);
                }
                exit('ok');    
            }
            
            if($act == 'article_post'){       //发布文章
                if(!$_SESSION['admin_uid']) redirect(site_url("admin/login/?forward=".urlencode(URL))); 
                $id = intval($_GET['id']);
                $tid = intval($_POST['tid']);
                $title = trim($_POST['title']);
                $content = trim($_POST['content']);
                $http = trim($_POST['http']);
                $sort = intval($_POST['sort']);
                $save_remote = intval($_POST['save_remote']);
                
                if(!$tid){
                    out("#msg|请选择文章小类！");
                    exit();
                }
                
                if($title==''){
                    out("#msg|请输入标题！");
                    exit();
                }
                
                if(!$id){
                    $sql = "select id from {$table}article where title like '%$title%'";
                    $rs = $db->getOne($sql);
                    if($rs){
                        out("#msg|此文章已存在，请不要重复添加！");
                        exit();
                    }
                }
                if($save_remote){   //保存远程图片
                  $content= save_remoteFile($content);
                }
                if($id){
                    $sql = "UPDATE {$table}article SET tid=$tid,title='$title',content='$content',http='$http',sort=$sort WHERE id=$id";
                    $db->query($sql);
                    out("post_ok|$id|$tid");
                } else {
                    $sql = "INSERT INTO {$table}article (tid,title,content,http,sort,dateline) values ($tid,'$title','$content','$http',$sort,".time().")";
                    $db->query($sql);
                    $id =$db->insert_id();
                    out("post_ok|$id|$tid");
                }
            }
            
            if($act == 'del_article'){      //删除文章
                $id = intval($_GET['id']);
                $sql = "delete from {$table}article where id=$id";
                $db->query($sql);
                if($db->affected_rows()) exit('ok');
                
            }
            
            if($act == 'get_type'){    //ajax读取文章小分类
                if(!$_SESSION['admin_uid']) redirect(site_url("admin/login/?forward=".urlencode(URL)));
                $pid = intval($_GET['pid']);
                $cid = intval($_GET['cid']);
                $sql = "select cid,title from {$table}category where pid=$pid and cid!=$cid order by sort asc";
                $rows = $db->getAll($sql);
                foreach($rows as $row){
                    $arr['cid'] = $row['cid'];
                    $arr['type'] = $row['title'];
                    $tem[] = $arr;
                }
                if(empty($tem)) $tem = 0;
                echo json_encode($tem);
            }
            
            if($act == 'get_fields'){       //ajax读取字段
                if(!$_SESSION['admin_uid']) redirect(site_url("admin/login/?forward=".urlencode(URL)));
                $cid = intval($_GET['cid']);
                $sql = "select b.fields from {$table}category as a inner join {$table}models as b on a.mid=b.mid where a.cid=$cid";
                $info = $db->getRow($sql);
                $sql = "select fid,field,title,input_type from {$table}fields where fid IN($info[fields]) order by field asc";        //字段
                $fields = $db->getAll($sql);
                foreach($fields as $row){
                    $arr['fid'] = $row['fid'];
                    $arr['title'] = $row['title'];
                    $arr['field'] = $row['field'];
                    $arr['input_type'] = $row['input_type'];
                    $tem[] = $arr;
                }
                if(empty($tem)) $tem = 0;
                echo json_encode($tem);
            }
            
            if($act=='option_post'){        //字段选项修改与添加
                if(!$_SESSION['admin_uid']) redirect(site_url("admin/login/?forward=".urlencode(URL)));
                $oid = intval($_GET['oid']);
                $fid = intval($_POST['fid']);
                $options = trim($_POST['options']);
                $sel = $_POST['sel'];
                $cid = $sel[count($sel)-1];
                if(!$cid){
                    out("#msg|请选择末级分类！");
                    exit();
                }
                if(!$fid){
                    out("#msg|请选择所属字段！");
                    exit();
                }
                if($options==''){
                    out("#msg|请填写选项内容！");
                    exit();
                }
                if($oid){
                    $sql = "UPDATE {$table}options SET fid=$fid,cid=$cid,options='$options' WHERE oid=$oid";
                } else {
                    $sql = "INSERT {$table}options(fid,cid,options) VALUES ($fid,$cid,'$options')";
                }
                $db->query($sql);
                
                $sql = "select mid from {$table}models where FIND_IN_SET($fid,fields)";
                $rs = $db->getAll($sql);
                foreach($rs as $row){       //删除应用到此字段的模型缓存
                    del_cache('php','model_'.$row['mid']);
                }
               
                $db->query($sql);
                out("#msg|<font color=green>设置保存成功！</font>");
                exit();
            }
            
            if($act=='code_post'){
                if(!$_SESSION['admin_uid']) redirect(site_url("admin/login/?forward=".urlencode(URL)));
                $id = intval($_GET['id']);
                $title = trim($_POST['title']);
                $flag = trim($_POST['flag']);
                $code = $_POST['code'];
                $description = trim($_POST['description']);
                
                if($title==''){
                    out("#msg|请填写代码段名称！");
                    exit();
                }
                if($flag==''){
                    out("#msg|请填写代码段标志！");
                    exit();
                }
                if($code==''){
                    out("#msg|请填写代码内容");
                    exit();
                }
                if($id){
                    $sql = "UPDATE {$table}codes SET title='$title',flag='$flag',code='$code',description='$description' WHERE id=$id";
                } else {
                    $sql = "INSERT {$table}codes(title,flag,code,description) VALUES ('$title','$flag','$code','$description')";
                }
                $db->query($sql);
                out("#msg|<font color=green>设置保存成功！</font>");
            }
            
            if($act=='clear_cache'){    //清除缓存
                if(!$_SESSION['admin_uid']) redirect(site_url("admin/login/?forward=".urlencode(URL)));
                $t = trim($_GET['type']);
                $dir = ROOT.'/data/cache/'.$t;
				
                if(delete_dir($dir)){
                    echo('ok');
                } else {
                    echo('error');
                }       
            }
            break;
            
        default:
            redirect(site_url("admin/category"));
            break;     
   }    
?>