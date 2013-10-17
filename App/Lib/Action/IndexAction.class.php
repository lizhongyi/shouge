<?php
/**
 * 
 * 首页
 *
 * @package      	YIGECMS_CORP
 *
 * @license         http://www.YIGECMS.cn/license.txt
 * @version        	$Id: IndexAction.class.php v1.0 2012-01-01 06:59:03 
 */

class IndexAction extends GlobalAction 
{
    /**
     * 系统首页
     *
     */
	  public $dao;
    function _initialize()
    {
        parent::_initialize();
      
		
		
	}
	 
	 
	public function index(){
		
		   
		   
		
		   $this->display();
	
         }	
	
	
	public function html(){
		
		
		        exit("ciowi");
		       $test=M("Article")->field("id")->select();  
			   
			   if(!$test) exit("cuowu");
			   
			          //获取信息
foreach ($test as $val)
{
ob_start();              //打开缓冲区

$url=file_get_contents("http://".$_SERVER['HTTP_HOST']."/?m=Article&a=detail&item=".$val['id']);
echo $url;

$info = ob_get_contents();
$dir="html/Article/";
if(!file_exists($dir)){
	
	//echo "cunzai";
	mkdir($dir);
	
	};
$fp = fopen($dir.$val["id"].".html", "w"); //创建一个文件，并打开，准备写入
// echo $info;  
fwrite($fp, $info); //把php页面的内容全部写入$val["region_id"].html，然后……   
fclose($fp);
ob_end_clean();	
if($fp){

	echo "生成了<br/>";
	} 
	else
	{
	exit("erro");	
    } 
}
	
	//$this->display();
		
		}
		
		
		//处理静态问题
		
		function htmllogin(){
			
          if($this->userID!=''){   	  
				  echo 'document.write("<a href='.U('User/index').'>'.$this->cuname.'</a> <a href='.U('User/logout').'>退出登陆</a>")';
                exit();
                }
			  else{ 
				  echo 'document.write("<a href='.U('User/login',array('jumpUri'=>$_GET['jump'])).'>登陆</a> | <a href='.U('User/reg').'>注册</a>")';
 exit();
				  
				  }
			
			}
}