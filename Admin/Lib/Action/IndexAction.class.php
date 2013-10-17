<?php 

/**

 * 

 * Index(后台首页)

 *

 * @package      	YIGECMS_Corp

 *

 * @license         http://www.YIGECMS.cn/license.txt

 * @version        	$Id: IndexAction.class.php v1.0 2012-01-01 06:59:03 



 */ // 



class IndexAction extends GlobalAction{

    function _initialize()

    {

        parent::_initialize();

        $adminId = parent::_getAdminUid();

        $username = parent::_getAdminName();

        $roleId = parent::_getRoleId();

        if (!$roleId || !$adminId) $this->redirect(U('Public/login'));

        $this->assign('adminId', $adminId);

        $this->assign('username', $username);

        $this->assign('security', $security);

		

        parent::_checkPermission();

    }



    /**

     * 后台管理首页

     *

     */

    public function index()

    {

        $data['serverSoft'] = $_SERVER['SERVER_SOFTWARE'];

        $data['serverOs'] = PHP_OS;

        $data['phpVersion'] = PHP_VERSION;

        $data['phpUploadSize'] = ini_get('file_uploads') ? ini_get('upload_max_filesize'): '禁止上传';

        $data['serverUri'] = $_SERVER['SERVER_NAME'];

        $data['maxExcuteTime'] = ini_get('max_execution_time').' 秒';

        $data['maxExcuteMemory'] = ini_get('memory_limit');

        $data['phpGpc'] = get_magic_quotes_gpc() ? '开启' : '关闭';;

        $data['excuteUseMemory'] =  function_exists('memory_get_usage') ? byte_format(memory_get_usage()) : '未知';

        $dao = new Model();

        $getMysqlVersion = $dao->query('select version()');

        $data['mysqlVersion'] = $getMysqlVersion[0]['version()'];

        $data['sys_version'] = $this->sys_version;

        $update = safe_b64encode(serialize($data));

        //获取备忘信息

        $data['notepad']= M('Admin')->Where("id=".parent::_getAdminUid())->find();

        $this->assign($data);

        $this->assign('update', $update);

        parent::_sysLog('index');

        $this->display();

    }



    /**

     * 更新备忘信息

     *

     */

    public function updateNotepad()

    {

        $notepad = substr($_POST['notepad'], 0, 2000);

        $dao = M('Admin');

        if($daoCreate = $dao->create())

        {

            $dao->notepad = $notepad;

            $dao->id = parent::_getAdminUid();

            $daoSave = $dao->save();

            if(false !== $daoSave)

            {

               die('ok');

            }else

            {

                die('更新失败');

            }

        }else

        {

           die($dao->getError());

        }

    }

	

	

	

	

	

	 public function upimg()

    {

        $content = $_POST['content'];

        

        if($content)

		

        {

			

			

			$timeout=600; 

$pattern="/<img(.*)src=\"([^\"]+)\"[^>]+>/isU"; 

/*$content='<p align="center"><span style="color:navy;font-family:楷体_GB2312;"><a href="http://news.xinhuanet.com/politics/2011-04/27/c_121351908_2.htm"><img id="{22F30079-F33F-4648-B4C0-D25A1C3E568D}" src="http://news.xinhuanet.com/politics/2011-04/27/121351908_11n.jpg" border="0" /></a></span></p>

<p class="pictext" style="color:navy;font-family:楷体_GB2312;" align="center"><span style="color:navy;font-family:楷体_GB2312;">剧毒农药"敌百虫"和色素。</span></p>'; */

      //$str=str_replace('\"','"',$content);    

	



	 $pattern="/<img(.*)src=\"([^\"]+)\"[^>]+>/isU"; 

$str=$content; 

      $str=str_replace('\"','"',$content);    

	



	  function dmkdir($dir, $mode = 0777, $makeindex = TRUE){

	if(!is_dir($dir)) {

		dmkdir(dirname($dir));

		@mkdir($dir, $mode);

	}

	return true;

}

 preg_match_all($pattern,$str,$match); 

 

 

 

for($i=0;$i<count($match[2]);$i++)

{





	$suo=$match[2][$i];





	



$ml=date("Ym")."/".date("d");

$dir="Uploads/other/".$ml;

dmkdir($dir);



$url = $suo;



$matches = parse_url($url);

$host = $matches['host'];

$path = $matches['path'] ? $matches['path'].(isset($matches['query']) ? '?'.$matches['query'] : '') : '/';

$port = !empty($matches['port']) ? $matches['port'] : 80;



$out = "GET $path HTTP/1.0\r\n";

$out .= "Host: $host\r\n";

$out .= "\r\n\r\n";



$fp = @fsockopen($host, $port, $errno, $errstr, 10);

stream_set_blocking($fp, TRUE);

stream_set_timeout($fp, $timeout);

@fwrite($fp, $out);

$status = stream_get_meta_data($fp);

while (!feof($fp)) {

 if(($header = @fgets($fp)) && ($header == "\r\n" ||  $header == "\n")) {

  break;

 }

}

$return = '';



while(!feof($fp)) {

 $data = fread($fp, 8192);

 $return .= $data;

}



$attach_ext = strtolower(substr(strrchr($url,'.'),1));  

$filename=md5(rand(100,10000)).".".$attach_ext;

$fp=fopen($dir."/".$filename,"w");

flock($fp,2); 

fwrite($fp, $return); 

$suoluetu[]="/".$filename;

@fclose($fp);



if($i==0)

{

$neirong= str_replace($match[2][$i],"/".$dir.$suoluetu[$i],$content);

}

else

 {

	 

	$neirong= str_replace($match[2][$i],"/".$dir.$suoluetu[$i],$neirong); 

 }

	}

	

	$neirong=str_replace('\"','"',$neirong);

	



        

            if(count($suoluetu)>0)

            {

               die($neirong);

            }

			else

            {

                die("上传失败");

            }

        }else

        {

           die($dao->getError());

        }

    }

	

	

	

	

	

}

