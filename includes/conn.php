<?php
function upload($model='',$path = 1,$fileSize = 0,$thumbStatus = 1,$thumbSize = 0,$allowExts = 0,$attachFields = 'attach_file')
{
	

if(attachTrue($_FILES[$attachFields]['name'])){
$globalConfig = getContent('cms.config.php','.');
$globalAttachSize = intval($globalConfig['global_attach_size']);
$globalAttachSuffix = $globalConfig['global_attach_suffix'];
$dot = '/';
$setFolder = empty($model) ?'file/': $model .$dot ;
$setUserPath = empty($path) ?'': makeFolderName($path) ;
if($model=='User'){
	$finalPath = UPLOAD_PATH."User/face/";
	}else{
		$finalPath = UPLOAD_PATH.$dot.$setFolder.$setUserPath;
		}



if(!is_dir($finalPath)){
  @mkdir($finalPath);
}
 import("@.ORG.UploadFile");
 $upload = new UploadFile();



$upload->savePath = $finalPath;
        
		
		 
    $upload->thumb = true;
	
        // 设置引用图片类库包路径
        $upload->imageClassPath = '@.ORG.Image';
        //设置需要生成缩略图的文件后缀
        $upload->thumbPrefix = 'm_,s_';  //生产2张缩略图
		
			
		

		switch ($model){
case 'News':
$globalThumbStatus = intval($globalConfig['news_thumb_status']);;
$upload->thumbMaxWidth = trim($globalConfig['news_thumb_size']);
$upload->thumbMaxHeight = trim($globalConfig['news_thumb_size']);
break;
case 'Product':
$globalThumbStatus = intval($globalConfig['product_thumb_status']);;
$upload->thumbMaxWidth = trim($globalConfig['product_thumb_size']);
$upload->thumbMaxHeight = trim($globalConfig['product_thumb_size']);


break;
case 'Download':
$globalThumbStatus = intval($globalConfig['download_thumb_status']);;
$upload->thumbMaxWidth = trim($globalConfig['download_thumb_size']);
$upload->thumbMaxHeight = trim($globalConfig['download_thumb_size']);
break;

case 'User':
$imgsize=getimagesize($_FILES[$attachFields]['tmp_name']);
if($imgsize[0] > 400){
	$wh=400;
	$ht=$imgsize[0]*(400/$imgsize[0]);
	}else{
		$wh=$imgsize[0];
		$ht=$imgsize[1];
		}
$upload->thumbMaxWidth =$wh;
$upload->thumbMaxHeight =$ht;
break;

default:
$globalThumbStatus = intval($globalConfig['global_thumb_status']);;
$upload->thumbMaxWidth = trim($globalConfig['global_thumb_size']);
$upload->thumbMaxHeight = trim($globalConfig['global_thumb_size']);
break;
}
       //设置上传文件规则
        $upload->saveRule = uniqid;
        //删除原图
        $upload->thumbRemoveOrigin = true;


           if(!$upload->upload())
            {
             echo ($upload->getErrorMsg());
             }else
            {
	      $uuu=$upload->getUploadFileInfo();
		  
		  
          import("@.ORG.Image");
            //给m_缩略图添加水印, Image::water('原文件名','水印图片地址')
           // Image::water($uuu[0]['savepath'].'m_'.$uuu[0]['savename'], './Public/Common/watermark.png');
		//echo "<pre>";
//print_r($uuu);	
	
	return $upload->getUploadFileInfo();
	
}
}
}
function isEnglist($param)
{
if (!eregi("^[A-Z0-9]{1,26}$",$param)) {
return false;
}else {
return true;
}
}
function safe_b64encode($string)
{
$data = base64_encode($string);
$data = str_replace(array('+','/','='),array('-','_',''),$data);
return $data;
}
function safe_b64decode($string)
{
$data = str_replace(array('-','_'),array('+','/'),$string);
$mod4 = strlen($data) %4;
if ($mod4)
{
$data .= substr('====',$mod4);
}
return base64_decode($data);
}
function dHtml($string)
{
if(is_array($string))
{
foreach($string as $key =>$val)
{
$string[$key] = dhtml($val);
}
}else
{
$string = str_replace(array('"','\'','<','>',"\t","\r",'{','}'),array('&quot;','&#39;','&lt;','&gt;','&nbsp;&nbsp;','','&#123;','&#125;'),$string);
}
return $string;
}
function cvHttp($http)
{
if ($http == '')
{
return '';
}else
{
$link = substr($http,0,7) == "http://"?$http : 'http://'.$http;
return $link;
}
}
function htmlCv($string)
{
$pattern = array('/(javascript|jscript|js|vbscript|vbs|about):/i','/on(mouse|exit|error|click|dblclick|key|load|unload|change|move|submit|reset|cut|copy|select|start|stop)/i','/<script([^>]*)>/i','/<iframe([^>]*)>/i','/<frame([^>]*)>/i','/<link([^>]*)>/i','/@import/i');
$replace = array('','','&lt;script${1}&gt;','&lt;iframe${1}&gt;','&lt;frame${1}&gt;','&lt;link${1}&gt;','');
$string = preg_replace($pattern,$replace,$string);
$string = str_replace(array('</script>','</iframe>','&#'),array('&lt;/script&gt;','&lt;/iframe&gt;','&amp;#'),$string);
return stripslashes($string);
}
function splitThumb($attach)
{
$thumb="s_".$attach;	
return $thumb;
}

function splitbig($attach)
{
$thumb="m_".$attach;	
return $thumb;
}




function formatAttachPath($path,$find = './Uploads/',$replace ='')
{
if(!empty($path)){
return str_replace($find,$replace,$path);
}
}
function string2checked($sring,$param,$split = ',')
{
$splitParam = explode($split,$sring);
if (in_array($param,$splitParam)) $result = ' checked=checked';
return $result;
}
function array2string($data = array(),$split = ',')
{
if (is_array($data)) {
return implode($split,$data);
}else{
return $data;
}
}
function selected($string,$param =1,$type = 'select')
{
$returnString = '';
if ($string == $param)
{
$returnString = $type == 'select'?'selected="selected"': 'checked="checked"';
}
return $returnString;
}
function a2bc($a,$param =1,$b = '',$c = '')
{
$returnString = $a == $param ?$b : $c;
return $returnString;
}
function disable($param,$typeParam =1,$stringParam = array(' disabled="disabled"',''))
{
return $param == $typeParam ?$stringParam[0] : '';
}
function getMethod()
{
return  strtolower($_SERVER['REQUEST_METHOD']);
}
function getDir($dirname)
{
$files = array();
if(is_dir($dirname))
{
$fileHander = opendir($dirname);
while (($file = readdir($fileHander)) !== false)
{
$filepath = $dirname .'/'.$file;
if (strcmp($file,'.') == 0 ||strcmp($file,'..') == 0 ||is_file($filepath))
{
continue;
}
$files[] = auto_charset($file,'GBK','UTF8');;
}
closedir($fileHander);
}
else
{
$files = false;
}
return $files;
}
function getFile($dirname)
{
$files = array();
if(is_dir($dirname))
{
$fileHander = opendir($dirname);
while (($file = readdir($fileHander)) !== false)
{
$filepath = $dirname .'/'.$file;
if (strcmp($file,'.') == 0 ||strcmp($file,'..') == 0 ||is_dir($filepath) )
{
continue;
}
$files[] = auto_charset($file,'GBK','UTF8');;
}
closedir($fileHander);
}
else
{
$files = false;
}
return $files;
}
function formatQuery($string)
{
return $string;
}
function makeFolderName($type =0,$prefix=1)
{
$setPrefix = empty($prefix) ?'': '/';
switch ($type){
case 1: $result = date('Ym').$setPrefix ;break ;
case 2: $result = date('Y-m').$setPrefix ;break ;
case 3: $result = date('Ymd').$setPrefix ;break ;
case 4: $result = date('Y-m-d').$setPrefix ;break ;
case 5: $result = date('Y').$setPrefix ;break ;
default: $result = date('Ym').$setPrefix ;break ;
}
return $result;
}
function attachTrue($fields,$trueNum = 0)
{
if(is_array($fields)){
foreach ($fields as $value) {
if(!empty($value)){
$trueNum = $trueNum+1;
}
}
}else {
if(empty($fields)){
$trueNum = 0;
}else {
$trueNum = 1;
}
}
return $trueNum;
}
function statusIcon($data = 1,$status = 1,$folder = 0,$icon = 'hidden.png',$alt = '显示',$condition = 'eq'){
$strStart = '<img src="';
$strMiddle = $folder.'/Public/Admin/'.$icon;
$strEnd = '" alt="'.$alt.'" align="absmiddle" />';
if ($condition == 'eq'){
if($data == $status){
return $strStart.$strMiddle.$strEnd;
}
}elseif($condition == 'neq'){
if($data != (int)$status){
return $strStart .$strMiddle .$strEnd;
}
}
}
function attachStatus($data = 1,$status = 1,$folder = 0,$icon = 'hidden.png',$alt = '显示'){
$string = '<img src="'.$folder.'/Public/Admin/'.$icon.'" alt="'.$alt.'" align="absmiddle" />';
switch ($status){
case '1':
$returnString = !empty($data) ?$string : '';
break;
case '0':
$returnString = empty($data) ?$string : '';
break;
default:
$returnString = $data == $status ?$string : '';
break;
}
return $returnString;
}
function str2time($string,$time = 0){
if(!empty($string)){
return strtotime($string);
}
}
function createStyle($data,$style = array(),$styleArray = array())
{
$dataStyle = '';
if($data){
if(strtolower($data['style_color']) != '#ffffff'&&!empty($data['style_color'])){
$style['color'] = $data['style_color'];
$styleArray[] = 'color:'.$data['style_color'];
}
if(!empty($data['style_bold'])){
$style['bold'] = $data['style_bold'];
$styleArray[] = 'font-weight:bold';
}
if(!empty($data['style_underline'])){
$style['underline'] = $data['style_underline'];
$styleArray[] = 'TEXT-DECORATION: underline';
}
$dataStyle['title_style'] = empty($styleArray) ?'': implode(';',$styleArray);
$dataStyle['title_style_serialize'] = empty($style) ?'': serialize($style);
}
return $dataStyle;
}
function string2Checkbox($string = '',$emptyString = '未定义'){
if(empty($string)){
$resultString = $emptyString;
}else{
$stringSplit = explode(',',$string);
foreach ($stringSplit as $row){
$resultString .= '<input name="run_system[]" type="checkbox" id="run_system[]" value="'.$row.'"/>'.$row;
}
}
return $resultString;
}
function string2checkboxSelect($string = '',$param = '',$emptyString = '未定义')
{
if(empty($string)){
$resultString = $emptyString;
}else{
$stringSplit = explode(',',$string);
foreach ($stringSplit as $row){
if(in_array($row,explode(',',$param))){
$resultString.='<input name="run_system[]" type="checkbox" id="run_system[]" value="'.$row.'" checked="checked"/>'.$row;
}else{
$resultString.='<input name="run_system[]" type="checkbox" id="run_system[]" value="'.$row.'"/>'.$row;
}
}
}
return $resultString;
}
function setOrder($orderFields = 0,$selectField = 'id',$orderType = 'DESC',$join = NULL){
$orderValue = empty($join) ?'id': 'a.id';
foreach ((array)$orderFields as $value){
if(is_array($value)){
if($value[0] == $selectField){
$orderValue = $value[1];
}
}else{
if($value == $selectField){
$orderValue = $value;
}
}
}
$orderByValue = empty($orderValue) ?'id': $orderValue ;
$orderByType = empty($orderType) ?'DESC': $orderType ;
return $orderByValue.' '.$orderByType;
}
function setTime($time = 0,$time1 = 0){
$createTime = empty($time) ?0 : strtotime($time) ;
$createTime1 = strtotime($time1) ;
if(!empty($time1)){
return $createTime.','.$createTime1;
}
}
function setViewCount($count = 0,$count1 = 0)
{
$viewCount = empty($count) ?0 : $count ;
$viewCount1 = $count1 ;
if(!empty($count1)){
return $viewCount.','.$viewCount1;
}
}
function styleSelected($titelStyle = 0,$type = 'color',$returnString = 'checked="checked"')
{
$result = '';
if(!empty($titelStyle)){
$unserialize = unserialize($titelStyle);
switch ($type) {
case 'color':
$result = empty($unserialize['color']) ?'#ffffff': $unserialize['color'];
break;
case 'bold':
$result = empty($unserialize['bold']) ?'': $returnString ;
break;
case 'underline':
$result = empty($unserialize['underline']) ?'': $returnString ;
break;
default:
break;
}
}
return $result;
}
function formatTags($data)
{
if(!empty($data)){
$tagCount = 0;
$tag = explode(',',$data);
foreach ($tag as $value){
if(!empty($value)){
$tags[] = $value;
$tagCount ++;
if($tagCount >4) {
unset($tag);
break;
}
}
}
return implode(',',$tags);
}else {
return '';
}
}
function tagsGet($tags,$module = '')
{
if(!empty($tags)){
$str = '';
$format = explode(',',$tags);
foreach ((array)$format as $row){
$str .= '<a href="'.U("Tags/getList",array('module'=>$module,'name'=>urlencode($row))).'" target="_blank">'.$row.'</a> ';
}
echo $str;
}
}
function fileExit($file)
{
return file_exists($file) ?true : false ;
}
function explodeRole($permission,$inData = '',$field = 'role_permission')
{
if(!empty($permission)){
$str = '';
$pmArray = explode('|',$permission);
foreach ((array)$pmArray as $row){
$subRow = explode('=',$row);
if(in_array($subRow[1],explode(',',$inData))){
$str .= '<span style="float:left; width:20%;"><input name="'.$field.'[]" type="checkbox" id="'.$field.'[]" value="'.trim($subRow[1]).'" class="checkbox" checked="checked"/>'.trim($subRow[0]).'</span>';
}else{
$str .= '<span style="float:left; width:20%;"><input name="'.$field.'[]" type="checkbox" id="'.$field.'[]" value="'.trim($subRow[1]).'" class="checkbox"/>'.trim($subRow[0]).'</span>';
}
}
return $str;
}
}
function splitsql($sql) {
$sql = str_replace("\r","\n",$sql);
$returnSql = array();
$num = 0;
$queryArray = explode(";\n",trim($sql));
unset($sql);
foreach($queryArray as $query) {

$queries = explode("\n",trim($query));
foreach($queries as $query) {
$returnSql[$num] .= $query[0] == "#"||$query[0].$query[1] == '--'?NULL : $query;
}
$num ++;
}
return($returnSql);
}
if(!function_exists('file_put_contents')) {
function file_put_contents($filename,$data) {
if($fp = @fopen($filename,'w') === false)
{
exit($filename.'if not writeable');
}else {
$bytes = fwrite($fp,$contents);
fclose($fp);
}
}
}
function writeCache($name = NULL,$data = NULL,$order = '',$where = '',$path = './CmsData/')
{
if(empty($data)){
$dao = M($name);
$getData = $dao->where($where)->order($order)->select();
$fileName = strtolower($name);
$writeData = "<?php\n/** \n* cache.{$fileName}.php\n*\n* @package    YIGECMS\n* @author     \n* @copyright  Copyright (c) 2008-2010  (http://www.YIGECMS.cn)\n* @license    http://www.YIGECMS.cn/license.txt\n   \n*/\n\nif (!defined('YIGECMS')) exit();\n\nreturn ";
$writeData .= var_export($getData,true);
$writeData .= ';';
}else{
$writeData = $data;
}
$writeFile = 'cache.'.$fileName.'.php';
@file_put_contents($path .$writeFile,$writeData);
return $writeData;
}
function configCache($id = 1,$data = NULL,$file = NULL,$path = NULL)
{
$writePath = empty($path) ?'./': $path ;
$writeFile = empty($file) ?'cms.config.php': $file ;
$writeDataHeader = "<?php\n/*** \n* cms.config.php\n*\n* @package    YIGECMS\n* @author     \n* @copyright  Copyright (c) 2008-2010  (http://www.YIGECMS.cn)\n* @license    http://www.YIGECMS.cn/license.txt\n*/\n\nif (!defined('YIGECMS')) exit();\n\nreturn array(\r\n";
$writeDataFooter =  ');';
if(empty($data)){
$configDao = D('Config');
$getConfig = $configDao->where("id=1")->find();
foreach((array)$getConfig as $key =>$value)
{
if(strtolower($value) == "true"||strtolower($value) == "false"||is_numeric($value)){
$data .= "    '".$key."' => ".dadds($value).",\r\n";
}else{
$data .= "    '".$key."' => '".dadds($value)."',\r\n";
}
}
$writeData = $writeDataHeader .$data .$writeDataFooter;
}else {
$writeData = $writeDataHeader .$data .$writeDataFooter;
}
@file_put_contents($writePath .$writeFile,$writeData);
return $getConfig;
}
function clearCore()
{
delFile('./App/Runtime/Cache');
delFile('./App/Runtime/Data');
delFile('./App/Runtime/Logs');
delFile('./App/Runtime/Temp');
@unlink('./App/Runtime/~app.php');
@unlink('./App/Runtime/~runtime.php');
delFile('./Admin/Runtime/Cache');
delFile('./Admin/Runtime/Data');
delFile('./Admin/Runtime/Logs');
delFile('./Admin/Runtime/Temp');
@unlink('./Admin/Runtime/~app.php');
@unlink('./Admin/Runtime/~runtime.php');
}
function delDir($directory,$subdir=true)
{
if (is_dir($directory) != false)
{
$handle = opendir($directory);
while (($file = readdir($handle)) !== false)
{
if ($file != "."&&$file != "..")
{
is_dir("$directory/$file")?
delDir("$directory/$file"):
unlink("$directory/$file");
}
}
if (readdir($handle) == false)
{
closedir($handle);
rmdir($directory);
}
}
}
function delFile($directory)
{
if (is_dir($directory) != false)
{
$handle = opendir($directory);
while (($file = readdir($handle)) !== false)
{
if ($file != "."&&$file != ".."&&is_file("$directory/$file"))
{
unlink("$directory/$file");
}
}
closedir($handle);
}
}
function getCache($name = '',$root = './CmsData/',$returnData = '')
{
$formatName = strtolower($name);


$getFile = $root .'cache.'.$formatName .'.php';
if(fileExit($getFile)){
$returnData = @require($getFile);
}else{
switch ($formatName)
{
case 'adminrole': $returnData = writeCache('AdminRole') ;break;
case 'config': $returnData = configCache(1);break;
case 'category': $returnData = writeCache('Category',0,' display_order DESC,id DESC') ;break;
case 'link': $returnData = writeCache('Link',0,'display_order DESC,id DESC');break;
case 'menu': $returnData = writeCache('Menu',0,'display_order DESC,id DESC');break;
case 'module': $returnData = writeCache('Module');break;
}
}
print_r($where);
return $returnData;
}
function getContent($file = NULL,$path = NULL){
	//exit($path);
$gFile = empty($file) ?exit('error function getFile: file is LOST') : $file ;
$getPath = empty($path) ?CMS_DATA : $path ;
$getFile = $getPath.'/'.$gFile;
if(!file_exists($getFile)) die("file:$getFile is LOST");
return @require($getFile);
}
function putContent($data,$file = NULL,$path = NULL)
{
$pFile = empty($file) ?exit('error function getFile: file is LOST') : $file ;
$pPath = empty($path) ?CMS_DATA : $path ;
if ($path != '.'){
if(!is_dir($pPath)){
@mk_dir($pPath);
}
}
$putFile = $pPath.'/'.$pFile;
@file_put_contents($putFile,$data);
}
function xCopy($source,$dest,$child = 0){
if(!is_dir($source)){
echo("Error:the $source is not a direction!");
exit();
}
if(!is_dir($dest)){
@mk_dir($dest,0777);
}
$fileHander = opendir($source);
while (($file = readdir($fileHander)) !== false)
{
$filepath = $source .'/'.$file;
if (strcmp($file,'.') == 0 ||strcmp($file,'..') == 0 )
{
continue;
}
if(is_dir($filepath)){
if($child) xCopy($source."/".$file,$dest."/".$file,$child);
}else{
copy($source."/".$file,$dest."/".$file);
}
}
}
function copyDir($source,$dest,$child = 0){
if(!is_dir($source)){
echo("Error:the $source is not a direction!");
exit();
}
if(!is_dir($dest)){
@mk_dir($dest,0777);
}
$fileHander = opendir($source);
while (($file = readdir($fileHander)) !== false)
{
$filepath = $source .'/'.$file;
if (strcmp($file,'.') == 0 ||strcmp($file,'..') == 0 ) continue;
if(is_dir($filepath)){
if($child) xCopy($source."/".$file,$dest."/".$file,$child);
}
}
}
function getCategory($array,$parentid = 0,$level = 0,$add = 2,$repeat = '　') {
$str_repeat = '';
if($level) {
for($j=0;$j<$level;$j++) {
$str_repeat .= $repeat;
}
}
$newarray = array();
$temparray = array();
foreach((array)$array as $v) {
if($v['parent_id'] == $parentid) {
$newarray[] = array(
'id'=>$v['id'],
'module'=>$v['module'],

'title'=>$v['title'],
'parent_id'=>$v['parent_id'],
'biaozhi'=>$v['biaozhi'],
'html_url'=>$v['html_url'],
'menu'=>$v['menu'],
'level'=>$level,
'display_order'=>$v['display_order'],
'description'=>$v['description'],
'status'=>$v['status'],
'create_time'=>$v['create_time'],
'update_time'=>$v['create_time'],
'status'=>$v['status'],
'protected'=>$v['protected'],
'str_repeat'=>$str_repeat
);
$temparray = getCategory($array,$v['id'],($level +$add));
if($temparray) {
$newarray = array_merge($newarray,$temparray);
}
}
}
return $newarray;
}




function getCategory1($array,$parentid = 0,$level = 0,$add = 2,$repeat = 'child_') {
$str_repeat = '';
if($level) {
for($j=0;$j<$level;$j++) {
$str_repeat .= $level;
}
}
$newarray = array();
$temparray = array();
foreach((array)$array as $v) {
if($v['parent_id'] == $parentid) {
$newarray[] = array(
'id'=>$v['id'],
'module'=>$v['module'],
'title'=>$v['title'],
'parent_id'=>$v['parent_id'],
'level'=>$level,
'display_order'=>$v['display_order'],
'description'=>$v['description'],
'status'=>$v['status'],
'create_time'=>$v['create_time'],
'update_time'=>$v['create_time'],
'status'=>$v['status'],
'protected'=>$v['protected'],
'str_repeat'=>$str_repeat
);
$temparray = getCategory1($array,$v['id'],($level +$add));
if($temparray) {
$newarray = array_merge($newarray,$temparray);
}
}
}
return $newarray;
}






function bgStyle($data,$param = 1,$color = '#00F'){
if($data == $param){
return $color;
}
}
function buildSelect($data,$parentId = 0,$selected = 0,$str = '')
{
$formatArray = getCategory($data,$parentId);
foreach ((array)$formatArray as $row){
if($row['id'] == $selected){
$str .= '<option value="'.$row['id'] .'" selected="selected">'.$row['str_repeat'] .$row['title'] .'</option>';
}else{
$str .= '<option value="'.$row['id'] .'">'.$row['str_repeat'] .$row['title'] .'</option>';
}
}
return $str;
}
function moduleTitle($name = '',$file = NULL,$path = NULL){
$getData = getCache('Module');
foreach ((array)$getData as $key=>$value){
if($value['module_name'] == $name){
echo $value['module_title'];
}
}
}
function dadds($str)
{
$content = (!get_magic_quotes_gpc ()) ?addslashes($str) : $str;
return trim($content);
}
function categoryModule($data)
{
foreach ((array)$data as $row){
if(in_array($row['module_name'],array('News','Product','Download','Job','Link','Ad'))){
$datas[] = $row;
}
}
return $datas;
}
//获取分类名字
function selectCategory($slid){
$category = getCache('Category');
foreach ((array)$category as $c){
if($c['id'] == $slid){
echo $c['title'];
}
}
}
function explodeUrl($url,$img = '')
{
$str = empty($url) ?'': explode("\n",$url);
foreach ((array)$str as $key=>$row){
$key = $key+1;
$result .= "<a href='$row' target='_blank'><img src='$img' align='absmiddle'/>下载地址 $key</a><br />";
}
echo $result;
}
//获取父级分类
function get_parent_cat($arr,$cid,$jingtai,$mod)

{   
  
	foreach($arr as $k=>$v)
	{
	 if($v['id'] == $cid)
	  { $ff.=" >> ";
	    if($jingtai==1 && $v['html_url'] != "" && file_exists($v['html_url'])){
		$ff.= "<a href='/".$v['html_url']."'>".$v['title']."</a>";
		}else{
		$ff.= "<a href='".U("".$mod."/nlist",array('category'=>$v['id']))."'>".$v['title']."</a>";
			}
		 get_parent_cat($arr,$v['parent_id'],$jingtai,$mod);
	  }	
	}
	
	echo $ff;
}

//获取父级mod

function getmod($arr,$pid){
	 
	 global $uu;
	  $uu="";
	  foreach($arr as $k=>$v){
		  
		     if($v['id']==$pid){
			  
			getmod($arr,$v['parent_id'])  ;
			
			
			if($v['parent_id']==0){
				 
			
				$uu = $v['module'];
				
		      }
		  }
		  
		  }
	  
	 return $uu;
	}

/*
 *
 * 获取未知分类层级
 *  
 */

function get_cat_p($arr,$pid){
	
	global $uu;
	  $uu="";
	  foreach($arr as $k=>$v){
		  
		     if($v['id']==$pid && $v['parent_id'] == $pid){
			  
			getmod($arr,$v['parent_id'])  ;
		    
				
		     $uu.= $v['title']; 
		  }
		  
		  }
	   return $uu;
	}

/**
 * utf-8、gb2312都支持的汉字截取函数
 *
 * @param string $string
 * @param integer $sublen
 * @param integer $start
 * @param string $code
 * @return string
 */

function cut_str($string,$sublen,$start=0,$code='UTF-8')
{
 if($code=='UTF-8')
 {
  $pa="/[x01-x7f]|[xc2-xdf][x80-xbf]|xe0[xa0-xbf][x80-xbf]|[xe1-xef][x80-xbf][x80-xbf]|xf0[x90-xbf][x80-xbf][x80-xbf]|[xf1-xf7][x80-xbf][x80-xbf][x80-xbf]/";
  preg_match_all($pa,$string,$t_string);

  if(count($t_string[0])-$start>$sublen) return join('',array_slice($t_string[0],$start,$sublen))."...";
  return join('',array_slice($t_string[0],$start,$sublen));
 }
 else
 {
  $start=$start*2;
  $sublen=$sublen*2;
  $strlen=strlen($string);
  $tmpstr='';

  for($i=0;$i<$strlen;$i++)
  {
   if($i>=$start&&$i<($start+$sublen))
   {
    if(ord(substr($string,$i,1))>129)
    {
     $tmpstr.=substr($string,$i,2);
    }
    else
    {
     $tmpstr.=substr($string,$i,1);
    }
   }
   if(ord(substr($string,$i,1))>129) $i++;
  }
  if(strlen($tmpstr)<$strlen ) $tmpstr.="...";
  return $tmpstr;
 }
}

//$str="新程php培训";
//echo cut_str($str,8,0,'gb2312');
/*生成静态函数*/
function get_ip() {
  if(getenv("HTTP_CLIENT_IP")&&strcasecmp(getenv("HTTP_CLIENT_IP"), "unknown"))
    $ip =getenv("HTTP_CLIENT_IP");
  else if (getenv("HTTP_X_FORWARDED_FOR")&&strcasecmp(getenv("HTTP_X_FORWARDED_FOR"), "unknown"))
    $ip =getenv("HTTP_X_FORWARDED_FOR");
  else if (getenv("REMOTE_ADDR")&&strcasecmp(getenv("REMOTE_ADDR"), "unknown"))
    $ip =getenv("REMOTE_ADDR");
  else if (isset($_SERVER['REMOTE_ADDR'])&& $_SERVER['REMOTE_ADDR']&&strcasecmp($_SERVER['REMOTE_ADDR'], "unknown"))
    $ip =$_SERVER['REMOTE_ADDR'];
  else
    $ip ="unknown";
  return $ip;
}
//获取URL 函数

function get_url($id,$htmlurl,$model,$jingtai){
	
	   if($jingtai==0 || $htmlurl==""){
		   
		   $url=U($model.'/detail',array('item'=>$id));
		   
		 } else {
			
			$url=$htmlurl; 
			 
		 }
	   return $url;
	
	}
	//判断是否有静态页面
	function is_html($mod,$jintai){
		
		if($jingtai==1 || file_exists("html/".$mod."/index.html")){
		
		    redirect("/html/".$mod."/index.html");//跳转到静态页面
		   
	      }
		
		
		
		}
		
		/*安全过滤函数*/  
		function rfilter($str){
			
			$bt=array('<','>','\\"',"\\'",'\\\\');
			$gt=array('&lt;','&gt;','"',"'",'\\');
                     if(is_array($str)){
				        foreach ($str as $k=>$v){
                        $retuen[$k]=str_replace($bt,$gt,$str[$k]);  
                       }
				   
				 }else{
	               $retuen = str_replace($bt,$gt,$str[$k]);
                   }
			   return $retuen;
			
			}
			
			
	/*获取用户名*/
	function getuname($id,$num){
		
		if(!$id) return false;
		
		$uname=D('User')->field('username,realname,face')->where('id='.$id)->find();
		
		
		
		   if($num!=1){
		    if($uname['realname'] != ""){
			 
			 return $uname['realname'];
			
			}else{
				
				return $uname['username'];
				}
		   }
		   else{
			   
			   if($uname['face'] != ""){
			   return $uname['face'];
		   }else{
			   
			   return "/Public/img/face.jpg";
			   }
			   
			   }
		}
		  
	function sub1($str){
		   
		   return substr($str,1,strlen($str));
		
		}	
		
		/*压缩图片函数*/
		
		
		 function resize_img($filename,$destImage,$newwidth,$newheight,$pictype){
             list($width, $height) = getimagesize($filename);
             header('Content-type:image/jpeg');
             $thumb = imagecreatetruecolor($newwidth, $newheight);
              
			 if($pictype=="gif")
				  {$source = imagecreatefromgif($filename);
			      }else if($pictype=="png")
				  {$source = imagecreatefrompng($filename);
			      }else if($pictype=="bmp")
				  {$source = imagecreatefromwbmp($filename);
			      }
				  else if($pictype=="jpg")
				  {$source = imagecreatefromjpeg($filename);
			      }else{
				  exit();
			 }
             
              imagecopyresampled($thumb, $source, 0, 0, 0, 0, $newwidth, $newheight, $width, $height);
                  ob_start();
                  imagejpeg($thumb);
                  $i = ob_get_clean(); 
                  $fp = fopen ($destImage,'w');
                  fwrite ($fp, $i);
                  fclose ($fp);
             if(file_exists($destImage))
			 {return 1;}else{return 0;}
           }
	
		
?>