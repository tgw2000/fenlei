<?php
    if (!defined('IN_SITE'))die('Access Denied');
    require(ROOT.'/source/include/common.php');
    require(ROOT.'/source/include/info.fun.php');
    
    switch($act){
        case 'list':        //信息列表页
            $pinyin = trim($params[0]);
            $page = intval($_GET['page']);
            $sql = "select cid,mid,codes,template from {$table}category where pinyin='$pinyin'";
            $row = $db->getRow($sql);                
            $cid = $row['cid'];
            $mid = $row['mid'];    
            $code_ids = $row['codes'];
            $arr = utf8_unserialize($row['template']);
            $list_tpl = $arr['list'];
            $category = get_category();     //所有分类
            $current_cat = $category[$cid];     //当前分类
            
            $cids = $current_cat['cids'];        //当前分类的所有子类id
            $children = $current_cat['children'];
            $parent = $current_cat['parent'];
            $pid = $current_cat['pid'];

            if($pid){      //不是一级分类时
                $first_cat = $parent[0];
                $keyword = stripslashes($_REQUEST['keyword']);
                if($keyword) $kw_limit.=" AND a.title like '%$keyword%'";
                if($mid) $model = get_model($mid);
                foreach($model as $row){
                    $field = $row['field'];
                    $$field = $_REQUEST[$field];        //接收地址栏或表单传递的数据
                    if($$field){
                        if(strstr($$field,'_')){       //范围搜索
                            $arr = explode('_',$$field);
                            $min = intval($arr[0]);
                            $max = intval($arr[1]);
                            
                            if(!$min){
                                $ext_limit.=" AND c.$field<=$max";
                            }elseif(!$max){
                                $ext_limit.=" AND c.$field>=$min";
                            }else{
                                $ext_limit.=" AND c.$field>=$min AND c.$field<=$max";
                            }
                        }else{
                            $ext_limit.=" AND FIND_IN_SET(".$$field.",c.$field)";       //值在集合中
                        }
                    }
                    
                    $v = $row['search'];
                    $t = $row['search_type'];
                    if($v=='on' && in_array('label',$t)){
                        $tem['title'] = $row['title'];
                        $tem['field'] = $field;
                        if($row['variable']){       //动态选项
                            $tem['choices'] = $row['choices'][$cid];
                        } else {
                            $tem['choices'] = $row['choices'];
                        }
                        $search_label[] = $tem;
                    }
                    
                    if($v=='on' && in_array('nav',$t)){
                        $tem['title'] = $row['title'];
                        $tem['field'] = $field;
                        if($row['variable']){       //动态选项
                            $tem['choices'] = $row['choices'][$cid];
                        } else {
                            $tem['choices'] = $row['choices'];
                        }
                        $search_nav[] = $tem;
                    }
                }
   
                $nav = "<a href='".site_url()."'>济宁分类信息</a> &gt <a href='".site_url($parent[0]['pinyin'].'/')."'>".$parent[0]['title']."</a> &gt ";
                if($parent[1]){     //第二级父类
                    $second_cat = $parent[1];
                    $nav.= "<a href='".site_url($second_cat['pinyin'].'/')."'>".$second_cat['title']."</a>";
                    $children = $category[$pid]['children'];
                } else {
                    $second_cat = $current_cat;
                    $nav.="<a href='".site_url($second_cat['pinyin'].'/')."'>".$second_cat['title']."</a>";
                }
            } else {
                $first_cat = $current_cat;
            }
            
            if(!$cids) $cids = $cid;
            $cid_limit = " AND a.cid IN ($cids)";       //类别限制
            $limit = $cid_limit.$ext_limit.$kw_limit;
            $order = " ORDER BY refreshtime DESC";
            $sql_count = "SELECT count(*) as count FROM {$table}info AS a LEFT JOIN {$table}category AS b ON a.cid = b.cid";
            $sql = "SELECT a.*,b.title as catname";
            if($mid) $sql.= ",c.*";
            $sql.=" FROM {$table}info AS a LEFT JOIN {$table}category AS b ON a.cid = b.cid";
            if($mid){
                $sql.= " LEFT JOIN {$table}info_$mid as c ON a.infoid=c.infoid";
                $sql_count.= " LEFT JOIN {$table}info_$mid as c ON a.infoid=c.infoid";
            }
            $sql_count.=  " WHERE a.status = 1 $limit";
            $total = $db->getOne($sql_count);
            $perpage = 40;
            $nums = ceil($total/$perpage);
            $page	= intval($_GET['page']);
            if($page>$nums) $page =$nums;
            if($page<1) $page = 1;

            $sql.= " WHERE a.status = 1 $limit $order limit ".(($page-1)*$perpage).", $perpage";
            $rows =$db->getAll($sql);
            foreach($rows as $row){
                $arr['infoid'] = $row['infoid'];
                $arr['title'] = $row['title'];
                $arr['cid'] = $row['cid'];
                $arr['refreshtime'] = format_time($row['refreshtime']);
                if($category[$row['cid']]['parent'][1]){    //第二层父类
                    $arr['catname'] = $category[$row['cid']]['parent'][1]['title'];
                    $arr['pinyin'] = $category[$row['cid']]['parent'][1]['pinyin'];
                } else {
                    $arr['catname'] = $category[$row['cid']]['title'];
                    $arr['pinyin'] = $category[$row['cid']]['pinyin'];
                }
                //处理信息中的标题图片
                $photo = $row['tpic'];
                if($photo){
                    $arr['tpic'] = $photo;
                } else {
                    $arr['tpic']= TPL.'/images/none.jpg';
                }
                //处理每条信息中的扩展字段
                foreach($model as $row1){
                    $field = $row1['field'];
                    $field_type = $row1['field_type'];
                    $title = $row1['title'];
                    $type = $row1['input_type'];
                    if(($type == 'radio' || $type == 'select')&&$row[$field]!=''){	//处理信息中radio 和 select的值
                        $choices = $row1['choices'];
                        foreach($choices as $k=>$v){
                            if($row[$field]==$k) $arr[$field] = $v;
                        }
                    }
                    if(($type == 'checkbox')&&$row[$field]!=''){	//处理信息中checkbox的值
                        $choices = $row1['choices'];
                        $tem = explode(',',$row[$field]);
                        $str = '';
                        foreach($choices as $k=>$v){
                            if(in_array($k,$tem)) $str.=$v.'、';
                        }
                        $str = substr($str,0,strlen($str)-3);//去掉最后一个、号
                        $arr[$field] = $str;
                    }
                    if(($type == 'text' || $type == 'textarea')&&$row[$field]!=''){	//处理信息中text、textarea的值
                        $units = $row1['units'];
                        $val = $row[$field].$units;
                        $tem = array("0元","0万元","0元/月");
                        if (in_array($val,$tem)){
        					$arr[$field] = "面议";
        				}else {
        					$arr[$field] = ($row[$field]) ? $val : '';
        				}
                    }
                }
                $info[] = $arr;
            }
            $pages = pages($page, $total, $perpage, 20,'',false);  //分页导航
            
            if($code_ids){      //自定义的代码段
                $sql = "select * from {$table}codes where id in($code_ids)";
                $codes = $db->getAll($sql);
                foreach($codes as $row){
                    $flag = $row['flag'];
                    $code = $row['code'];
                    $$flag = get_codes($cid,$flag,$code);
                }
           }
            if($list_tpl){      //使用了自定义模板
                $tpl = $list_tpl;
            } elseif(!$pid){     //一级分类模板
                $tpl = "list_bclass";
            } else {
                $tpl = "list_sclass";       //二、三级分类模板
            }
            include template($tpl);
            break;
            
        case 'show':
            $infoid = intval($params[0]);
            $success = intval($_GET['success']);      //为1是显示发布/修改成功提示           
            $sql = "SELECT a.*,b.pid,b.mid,b.codes,b.template,b.title as catname,c.uid FROM `{$table}info` AS a LEFT JOIN `{$table}category` AS b ON a.cid = b.cid LEFT JOIN `{$table}user` AS c ON a.userid = c.userid WHERE a.infoid = $infoid";
            $data = $db->getRow($sql);      //主表中的信息
            if(!$data||$data['status']==3) showmsg("你访问的信息不存在或已被删除！",1);
            if($data['status']==2 && $_SESSION['userid']!=$data['userid'])  showmsg("此信息正在审核中，暂时无法访问！",1);
            $code_ids = $data['codes'];
            $mid = $data['mid'];
            $cid = $data['cid'];
            if($mid){
                $sql = "select * from {$table}info_$mid where infoid=$infoid";
                $extr = $db->getRow($sql);     //护展表中的信息
                $model = get_model($mid);
                foreach($model as $row){
                    $field = $row['field'];
                    $field_type = $row['field_type'];
                    $title = $row['title'];
                    $available = $row['available'];
                    if(!$available) continue;   //如果是不可用字段则终止当前，执行下一循环
                    
                    $arr['field'] = $field;     
                    $arr['title'] = $title;
                    $extr_field[] = $arr;   //扩展字段
                    $type = $row['input_type'];
                    
                    if(($type == 'radio' || $type == 'select')&&$extr[$field]!=''){	//处理信息中radio 和 select的值
                        if($row['variable']){       //选项为动态变量
                            $choices = $row['choices'][$cid];
                        } else {
                            $choices = $row['choices'];
                        }
                        foreach($choices as $k=>$v){
                            if($extr[$field]==$k) $data[$field] = $v;
                        }
                    }
                    if(($type == 'checkbox')&&$extr[$field]!=''){	//处理信息中checkbox的值
                        if($row['variable']){       //选项为动态变量
                            $choices = $row['choices'][$cid];
                        } else {
                            $choices = $row['choices'];
                        }
                        $tem = explode(',',$extr[$field]);
                        $str = '';
                        foreach($choices as $k=>$v){
                            if(in_array($k,$tem)) $str.=$v.'、';
                        }
                        $str = substr($str,0,strlen($str)-3);//去掉最后一个、号
                        $data[$field] = $str;
                    }
                    if(($type == 'text' || $type == 'textarea')&&$extr[$field]!=''){	//处理信息中text、textarea的值
                        $units = $row['units'];
                        $val = $extr[$field].$units;
                        $tem = array("0元","0万元","0元/月");
                        if (in_array($val,$tem)){
        					$data[$field] = "面议";
        				}else {
        					$data[$field] = ($extr[$field]) ? $val : '';
        				}
                    }
                }
            }

           	if(function_exists("gd_info")&&!empty($data['mobile'])){
                $str = base64_encode($data['mobile']);
                $data['mobile'] = "<img src='".site_url("info/str2img/?str=$str")."'/>";
            }
            
            //处理信息中的图片
            $sql = "select path from {$table}info_photos where infoid=$infoid order by sort asc";
            $photos = $db->getAll($sql);
            
            if($code_ids){      //自定义的代码段
                $sql = "select * from {$table}codes where id in($code_ids)";
                $codes = $db->getAll($sql);
                foreach($codes as $row){
                    $flag = $row['flag'];
                    $code = $row['code'];
                    $$flag = get_codes($cid,$flag,$code);
                }
           }
            //最新的五条信息
            $info = get_info(array('cid'=>$cid,'num'=>5,'mid'=>$mid));
            $arr = utf8_unserialize($row['template']);
            $view_tpl = $arr['view'];
            $category = get_category();     //所有分类
            $current_cat = $category[$cid];     //当前分类数组
            $parent = $current_cat['parent'];       //当前分类的父类数组
            $first_cat = $parent[0];                //第一级分类
            $nav = "<a href='".site_url()."'>济宁分类信息</a> &gt ";
            foreach($parent as $row){
                $nav.= "<a href='".site_url($row['pinyin'].'/')."'>".$row['title']."</a> &gt ";
            }
            if($parent[1]){
                $second_cat = $parent[1];
                $url = $second_cat['pinyin'].'/'.$current_cat['pinyin'].'/';
            } else {
                $second_cat = $current_cat;
                $url = $current_cat['pinyin'].'/';
            }
            $nav.= "<a href='".site_url($url)."'>".$current_cat['title']."</a>";
            //更新点击数
            $sql = "update {$table}info set hits=hits+1 where infoid=$infoid";
            $db->query($sql);
                        
            //生成一次性令牌，防止跨站伪造攻击
            $token = md5(uniqid(rand(), TRUE));
            $_SESSION['token'] = $token;     
            if(!$tpl) $tpl="view";
            include template($tpl);
            break;
            
        case 'str2img':
            $width = "142";//width
        	$height = "28";//height
        	$strings = base64_decode(trim($_GET['str']));
        	$image = imagecreatetruecolor($width,$height);
        	$black = imagecolorallocate($image,255,0,0);
        	$white = imagecolorallocate($image,255,255,255);
        	imagefill($image,0,0,$white);
        	if(function_exists("imagettftext")){
        		imagettftext($image,15,0,0,15,$black,ROOT."data/arial.ttf",$strings);
        	}else{
        		imagestring($image,5,0,5,$strings,$black);
        	}
        	header("Content-type: image/png");
        	imagepng($image);
        	imagedestroy($image);
            break;
            
        default:
            redirect(site_url("admin/category"));
            break;
    }
?>