<?php
/*
 * @(#)upload.php
 * 
 * 可同时处理用户多个上传文件。效验文件有效性后存储至指定目录。
 * 可返回上传文件的相关有用信息供其它程序使用。（如文件名、类型、大小、保存路径）
 * 使用方法请见本类底部（UploadFile类使用注释）信息。
 *
 */
class upload { 
 var $file = array();  //用户上传的文件
 var $spath;     //存放用户上传文件的物理路径
 var $fpath;    //上传文件的网站路径
 var $size =2048;     //文件最大尺寸
 var $last_error;     //记录最后一次出错信息
 var $type = array('gif', 'jpg', 'png', 'zip', 'rar', 'txt', 'doc', 'pdf');      //默认允许用户上传的文件类型
 var $save_info = array(); //返回一组有用信息，用于提示用户。
 var $save_big;         // 是否生成原始图片
 var $limits;           //生成缩略图尺寸，为0表示不生成

public function __construct($params = array()){
    if (count($params) > 0){
         foreach ($params as $key => $val){     
            $this->$key = $val;  
        }
    }
}

 /**
  * 存储用户上传文件，检验合法性通过后，存储至指定位置。
  * @access public
  * @return int    值为0时上传失败，非0表示上传成功的个数。
  */
 function upload() {

   //如果当前文件上传功能，则执行下一步。
   if ($this->file['error'] == 1){
        $this->last_error = "上传的文件超过了 php.ini 中 upload_max_filesize 选项限制的值";
        $this->halt($this->last_error);
   }
   
   if ($this->file['error'] == 2){
        $this->last_error = "上传文件的大小超过了 HTML 表单中 MAX_FILE_SIZE 选项指定的值";
        $this->halt($this->last_error);
   }
   
   if ($this->file['error'] == 3){
        $this->last_error = "文件只有部分被上传";
        $this->halt($this->last_error);
   }
   
   if ($this->file['error'] == 4){
        $this->last_error = "没有文件被上传";
        $this->halt($this->last_error);
   }
   
   if ($this->file['error'] == 6){
        $this->last_error = "找不到临时文件夹";
        $this->halt($this->last_error);
   }
   
   if ($this->file['error'] == 7){
        $this->last_error = "文件写入失败";
        $this->halt($this->last_error);
   }
   
   if ($this->file['error'] == 0) {
    //取当前文件名、临时文件名、大小、扩展名，后面将用到。
    $name = $this->file['name'];
    $tmpname = $this->file['tmp_name'];
   
    $size = $this->file['size'];
    $mime_type = $this->file['type'];
    $type = $this->getFileExt($this->file['name']);

    //检测当前上传文件大小是否合法。
    if (!$this->checkSize($size)) {
     $this->last_error = "上传文件超过限制大小：".$this->size.'K';
     $this->halt($this->last_error);
     continue;
    }
    //检测当前上传文件扩展名是否合法。
    if (!$this->checkType($type)) {
     $this->last_error = "不允许上传的文件类型： ".$type;
     $this->halt($this->last_error);
     continue;
    }
         
    //检测当前上传文件是否非法提交。
    if(!is_uploaded_file($tmpname)) {
       $this->last_error = "文件非法提交，文件名：".$name;
       $this->halt($this->last_error);
       continue;
    }

    //移动文件后，重命名文件用。
    session_start();
    if($_SESSION['userid']){
        $base = $_SESSION['userid'].'_'.time().rand();
    } else {
        $base = time().rand();
    }
    
    //移动后的文件名
    $img = $base."_B.".$type;      //原图文件名
    if (!file_exists($this->spath)){
		mkdir($this->spath, 0777);
	}
    $spath = $this->spath."/".$img;      //文件物理路径
    $fpath = $this->fpath."/".$img;       //网站路径
    
     if(!move_uploaded_file($tmpname, $spath)) {
      $this->last_error = $this->file['error'];
      $this->halt($this->last_error);
      continue;
     }
    
    if(is_array($this->limits)){
        foreach($this->limits as $row){
        $limit = explode('X',$row);
        $this->limit_width = $limit[0];
        $this->limit_height = $limit[1];
    
        $img_s = $base.'_'.$this->limit_width.'X'.$this->limit_height.'.'.$type;       //图片文件名
       	$path_s = $this->spath."/".$img_s;
        $this->img2thumb($spath,$path_s,$this->limit_width,$this->limit_height,1,0);
        }
    }

    if(!$this->save_big) @unlink($spath);
    
    //存储当前文件的有关信息，以便其它程序调用。
    $this->save_info =  array(
        "name" => $name,
        "type" => $type,
        "mime_type" => $mime_type,
        "size" => $size,
        "img" => $img,
        "fpath" => $fpath
    );
   }

  return count($this->save_info); //返回上传成功的文件数目
 }
 
 /**
  * 返回一些有用的信息，以便用于其它地方。
  * @access public
  * @return Array 返回最终保存的路径
  */
 function getSaveInfo() {
  return $this->save_info;
 }

 /**
  * 检测用户提交文件大小是否合法
  * @param Integer $size 用户上传文件的大小
  * @access private
  * @return boolean 如果为true说明大小合法，反之不合法
  */
 function checkSize($size) {
  if ($size > ($this->size)*1024) {
   return false;
  }
  else {
   return true;
  }
 }

 /**
  * 检测用户提交文件类型是否合法
  * @access private
  * @return boolean 如果为true说明类型合法，反之不合法
  */
 function checkType($extension) {
  foreach ($this->type as $type) {
   if (strcasecmp($extension , $type) == 0)
    return true;
  }
  return false;
 }
 
 /**
  * 显示出错信息
  * @param  $msg    要显示的出错信息     
  * @access private
  */
 function halt($msg) {
    $arr['type'] = 'err';
    $arr['msg'] = $msg;
    echo json_encode($arr);
    exit();
 }

 /**
  * 取文件扩展名
  * @param  String $filename 给定要取扩展名的文件
  * @access private
  * @return String      返回给定文件扩展名
  */
 function getFileExt($filename) {
  $stuff = pathinfo($filename);
  return $stuff['extension'];
 }
 
 
 /**
 * 生成缩略图
 * @author yangzhiguo0903@163.com
 * @param string     源图绝对完整地址{带文件名及后缀名}
 * @param string     目标图绝对完整地址{带文件名及后缀名}
 * @param int        缩略图宽{0:此时目标高度不能为0，目标宽度为源图宽*(目标高度/源图高)}
 * @param int        缩略图高{0:此时目标宽度不能为0，目标高度为源图高*(目标宽度/源图宽)}
 * @param int        是否裁切{宽,高必须非0}
 * @param int/float  缩放{0:不缩放, 0<this<1:缩放到相应比例(此时宽高限制和裁切均失效)}
 * @return boolean
 */

function img2thumb($src_img, $dst_img, $width = 75, $height = 75, $cut = 0, $proportion = 0){
    if(!is_file($src_img)){
        return false;
    }
    
    $ot =$this->fileext($dst_img);
    $otfunc = 'image' . ($ot == 'jpg' ? 'jpeg' : $ot);
    $srcinfo = getimagesize($src_img);
    $src_w = $srcinfo[0];
    $src_h = $srcinfo[1];
    $type  = strtolower(substr(image_type_to_extension($srcinfo[2]), 1));
    $createfun = 'imagecreatefrom' . ($type == 'jpg' ? 'jpeg' : $type);
 
    $dst_h = $height;
    $dst_w = $width;
 
    /**
     * 缩略图不超过源图尺寸（前提是宽或高只有一个）
     */
    if(($width> $src_w && $height> $src_h) || ($height> $src_h && $width == 0) || ($width> $src_w && $height == 0)){
        $proportion = 1;
    }

    if($width> $src_w){
        $dst_w = $width = $src_w;
    }
    
    if($height> $src_h){
        $dst_h = $height = $src_h;
    }
 
    if(!$width && !$height && !$proportion){
        return false;
    }

    if(!$proportion){
        if($cut == 0){
            if($dst_w && $dst_h){
                if($dst_w/$src_w> $dst_h/$src_h){
                    $dst_w = $src_w * ($dst_h / $src_h);
                } else {
                    $dst_h = $src_h * ($dst_w / $src_w);
                }
            }else if($dst_w xor $dst_h){
                if($dst_w && !$dst_h){  //有宽无高
                    $propor = $dst_w / $src_w;
                    $height = $dst_h  = $src_h * $propor;
                } else if(!$dst_w && $dst_h){  //有高无宽
                    $propor = $dst_h / $src_h;
                    $width  = $dst_w = $src_w * $propor;
                }
            }
        }else{
            if(!$dst_h){  //裁剪时无高
                $height = $dst_h = $dst_w;
            }
                    
            if(!$dst_w){  //裁剪时无宽
                $width = $dst_w = $dst_h;
            }
            
            $propor = min(max($dst_w / $src_w, $dst_h / $src_h), 1);
            $dst_w = (int)round($src_w * $propor);
            $dst_h = (int)round($src_h * $propor);
        }
    } else {
        $proportion = min($proportion, 1);
        $height = $dst_h = $src_h * $proportion;
        $width  = $dst_w = $src_w * $proportion;
    }
 
    $src = $createfun($src_img);
    $dst = imagecreatetruecolor($width ? $width : $dst_w, $height ? $height : $dst_h);
    $white = imagecolorallocate($dst, 255, 255, 255);
    imagefill($dst, 0, 0, $white);

    $src_x = ($dst_w > $dst_h) ? ($dst_w-$width)/2 : 0 ;
    if(function_exists('imagecopyresampled')){
        imagecopyresampled($dst, $src, 0, 0, $src_x, 0, $dst_w, $dst_h, $src_w, $src_h);
    }else{
        imagecopyresized($dst, $src, 0, 0, $src_x, 0, $dst_w, $dst_h, $src_w, $src_h);
    }
    $otfunc($dst, $dst_img);
    imagedestroy($dst);
    imagedestroy($src);
    return true;
}

function fileext($file){
    return pathinfo($file, PATHINFO_EXTENSION);
}

 
}


/******************** UploadFile类使用注释
//注意，上传组件name属性不管是一个还是多个都要使用数组形式，如：
<input type="file" name="user_upload_file[]"> 
<input type="file" name="user_upload_file[]"> 

//如果用户点击了上传按钮。
if ($_POST['action'] == "上传") {
 //设置允许用户上传的文件类型。
 $type = array('gif', 'jpg', 'png', 'zip', 'rar');
 //实例化上传类，第一个参数为用户上传的文件组、第二个参数为存储路径、
 //第三个参数为文件最大大小。如果不填则默认为2M
 //第四个参数为充许用户上传的类型数组。如果不填则默认为gif, jpg, png, zip, rar, txt, doc, pdf
 $upload = new UploadFile($_FILES['user_upload_file'], 'j:/tmp', 100000, $type);
 //上传用户文件，返回int值，为上传成功的文件个数。
 $num = $upload->upload();
 if ($num != 0) {
  echo "上传成功<br>";
  //取得文件的有关信息，文件名、类型、大小、路径。用print_r()打印出来。
  print_r($upload->getSaveInfo());
  //格式为：  Array
  //   (
  //    [0] => Array(
  //        [name] => example.txt
  //        [type] => txt
  //        [size] => 526
  //        [path] => j:/tmp/example-1108898806.txt
  //        )
  //   )
  echo $num."个文件上传成功";
 }
 else {
  echo "上传失败<br>";
 }
}

*/