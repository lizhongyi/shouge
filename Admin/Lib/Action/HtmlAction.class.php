<?php
/**
**  生成静态
**
**
**
**
**
**/
class HtmlAction extends GlobalAction{
	
	public $dao;
	 function _initialize()
    {
        parent::_initialize();
        $getData = getCache('Category');
       
    }
     //首页
	public function index(){
        $getData = getCache('Category');
        $narr=array();//获取标识数组
		$mokuai = C ('HTML_MODULE');
		$cat_array=array();
		foreach($getData as $key=>$val){
			 if($getData[$key]['biaozhi'] != ""){
			 $narr[$getData[$key]['id']]=$getData[$key]['biaozhi'];
			 }
			
			
		}

       foreach($getData as $key=>$val){
		       
			  foreach($mokuai as $k=>$v)
			  {
				if($val['module'] == $mokuai[$k])
				{
				$ttt[$k]['md']=$val['module'];	
				$ttt[$k]['pid']=$val['id'];
				$ttt[$k]['mdname']=$val['title'];
				
				

				}	
				  
			  }
			    
		   }
 
;	 foreach($getData as $key=>$val){
		 
		   foreach($ttt as $h=>$p){
					
					if($val['parent_id']==$ttt[$h]['pid']){
						
						$bbb[]=array('md'=>$ttt[$h]['md'],'title'=>$val['title'],'id'=>$val['id'],'biaozhi'=>$val['biaozhi'],'mdname'=>$ttt[$h]['mdname']);
						
						}
					 
					}
		 
		 }
		
		
        $this->category =D('Category')->Order('display_order DESC,id DESC')->select();
        $dataList = getCategory($this->category);
		
		foreach($dataList as $key=>$val){
			
			   foreach($mokuai as $k=>$v)
			  {
				if(getmod($dataList,$val['id'])== $v)  {
				$vid[]=$val;
				
				}
			  }
			  
			
		}
		
		
		foreach($vid as $key=>$val){
			  $catlist[$key]=$val;
			  $catlist[$key]['md']=getmod($vid,$val['id']);
			  
			}
		//getCategory($category,$parentId);
		
	
        if($catlist != false)
        {
            $this->assign('dataList',$catlist);
        }
		
		//print_r($dataList);
		
		$dbmukuai=M("module")->field('id,module_title,module_name')->select();
		$mokuai = C ('HTML_MODULE');//配置文件模块
		
		foreach($dbmukuai as $key=>$val){
			foreach($mokuai as $k=>$v)
						{
		        if($val['module_name']==$mokuai[$k]){
			     $mod_array[]=array('name'=>$val['module_name'],'title'=>$val['module_title']);
                } 
		     }
			 
		}
		
		
		
		$this->assign('mod_array',$mod_array);
		$this->assign('lanmu',$uu);
		$this->display();
		
		
		} 
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		//开始成成html
		
	
	
	public function dohtml(){
		   $getData = getCache('Category');
           $narr=array();//获取标识数组
		   foreach($getData as $k=>$v){
			 if($getData[$k]['biaozhi'] != ""){
			 $narr[$getData[$k]['id']]=$getData[$k]['biaozhi'];
			 }
		}
		   $mu=explode(',',$_GET['mod']);//数组话

		//开始循环生成html
		
		    foreach($mu as $k=>$v){
		   
		  $this->dao=D($mu[$k]);
          $counts = $this->dao->count();
 
           if($counts==0){
             $data=array('content'=>'没有数据','ppage'=>intval($page),'pnums'=>$counts,'Page_cont'=>0);
             $data=json_encode($data);
	         echo($data);
	       }


           $page="";
           $Page_size=10;
           $Page_count = ceil($counts/$Page_size); 
           $init=1; 
           $page_len=7; 
           $max_p=$Page_count; 
           $pages=$Page_count; 
           $arrt="";

           if(empty($_GET['page'])||$_GET['page']<0){ 
              $page=1; 
              }else { 
              $page=$_GET['page']; 
              } 
              $offset=$Page_size*($page-1);
              $dataList = $this->dao->field('id,title,category_id,html_url,create_time')->limit($offset.','.$Page_size)->select();
     
            foreach($dataList as $v){
		  
		 ### 先判断文件是否存在  如果存在则跳过



	if($v['html_url'] != ""){ 
	
	    $wenjianjia=explode('/',$v['html_url']);
		$wen="";
	    $anum=count($wenjianjia)-1;
		foreach($wenjianjia as $ke=>$u){
			 
			   if($ke<$anum){
				   
				   $wen.=$wenjianjia[$ke]."/";
				   }
			}
		
		$dir=$wen;
	   
	   if(!file_exists($dir)){
       $tt=mkdir($dir,0777,true);
       } 
	  
      

	    }else{
			
		$dir="html/".$mu[$k]."/".$narr[$v['category_id']]."/".date('Ym',$v['create_time'])."/";
         if(!file_exists($dir)){
         $tt=mkdir($dir,0777,true);
	    }
		
		
      
		
}
$fname=$dir.$v['id'].".html";
	           //打开缓冲区

 
 $url="http://".$_SERVER['HTTP_HOST']."/index.php?m=".$mu[$k]."&a=hdetail&item=".$v['id'];	
 
 if(function_exists('curl_init')) {
    
	$ch = curl_init();
    $timeout = 1;
    curl_setopt ($ch, CURLOPT_URL,$url);
    curl_setopt ($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt ($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
    $info = curl_exec($ch);
    curl_close($ch);
    }else{
      $info= file_get_contents($url);	
	}
        $fp=file_put_contents($fname,$info);
        if($fp){
               $item=$v['id'];
		       $this->dao=D($mu[$k]);	
			   $daoCreate = $this->dao->create();
               $shujv['id']=$item;	 
			   $shujv['html_url']=$fname;
			   $daoSave=$this->dao->save($shujv);
               if(false !== $daoSave){
                    $arrt.= "更新完成"; 
	               }else{
					$arrt.= "更新失败";  
	               }
                   $arrt.= "<span style='color:#ff0000'>".$fname."</span>完毕<br/>";
                   }else{
                   $arrt.= "<span style='color:#ff0000'>".$dir."</span>生成失败<br/>";
                  }
            }
    
  }
	         $data=array('content'=>$arrt,'ppage'=>intval($page),'pnums'=>$counts,'Page_cont'=>$Page_count,'module'=>$mu[$k],'lun'=>$k,'lunnum'=>count($mu));
	$data=json_encode($data);  
	 echo($data);
	  	
  }
  
  
  
  //生成模块首页
  
  
  public function doIndex(){
	    
	    $arr=$_GET['mod'];
	    $mu=explode(',',$_GET['mod']);//数组话
		foreach($mu as $k=>$v){
        $dir="html/".$mu[$k]."/";
         if(!file_exists($dir)){
         $tt=mkdir($dir,0777,true);
	 }
    $url="http://".$_SERVER['HTTP_HOST']."/index.php?m=".$mu[$k];
	if(function_exists('curl_init')) {
    
	$ch = curl_init();
    $timeout = 1;
    curl_setopt ($ch, CURLOPT_URL,$url);
    curl_setopt ($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt ($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
    $info = curl_exec($ch);
    curl_close($ch);
    }
    else{
		$info= file_get_contents($url);	
	}
	
	if($mu[$k]!='Index'){
    $fname=$dir."index.html";
    }
    else
    {
    $fname="index.html";	
     }
     $fs=file_put_contents($fname,$info); 
     }
	  if($fs) exit('ok');
	  }

  /*生产栏目*/
  
  public function docat(){
	  
	       $p=$_GET['p'];
		   $mu=explode('|',$_GET['mod']);
		 
		   $nrr=array('title','mod','biaozhi','id');//先试试生成频道首页
		 
		  
			
			
			  //echo  "<pre>";
			  $nmu=array();
			  $ntt=array();
			  foreach($mu as $k=>$v){
				  
				     
				 foreach($hh=explode(',',$mu[$k]) as $ky=>$vi){
					  
					  $ntt[$k][$nrr[$ky]]=$hh[$ky];
					 
					 }
	
				  }
				
			foreach($ntt as $k=>$v){
				
				$dir="html/".$v['mod']."/".$v['biaozhi']."/";
				$this->dao=D($v['mod']);
            //exit($dir);
            if(!file_exists($dir)){
	
	
	        $tt=mkdir($dir,0777,true);
	
               }
				
				$fname=$dir."index.html";
				
				if(function_exists('curl_init')) {
    
	$ch = curl_init();
    $timeout = 1;
    curl_setopt ($ch, CURLOPT_URL,$url);
    curl_setopt ($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt ($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
    $info = curl_exec($ch);
    curl_close($ch);
    }
    else{
		
		$info= file_get_contents($url);	
	}
               $fs=file_put_contents($fname,$info); 
				$pageCount = $this->dao->where('category_id ='.$v['id'].'')->count();
				
				//更新分类数据
				
				$item=$v['id'];
		       $this->dao=D('Category');	
			   $daoCreate = $this->dao->create();
             
			   $shujv['id']=$item;	 
			   $shujv['html_url']=$fname;
			   $daoSave=$this->dao->save($shujv);
			 
			  if(false !== $daoSave){
				  
				   $arrt.= "更新完成"; 
	               }
                   else
				  {
					$arrt.= "更新失败";  
				  }
				  ///
				
                echo "http://".$_SERVER['HTTP_HOST']."/index.php?m=".$v['mod']."&a=htmllist&category=".$v['id']."<b>".$v['title']."</b>首页成了<br/>";
				//下面生成分页
				
				for($i=1;$i<=$pageCount;$i++){
					
					   
                $url="http://".$_SERVER['HTTP_HOST']."/index.php?m=".$v['mod']."&a=htmllist&category=".$v['id']."&p=".$i."&html=1";	
                  
				  if(function_exists('curl_init')) {
    
	$ch = curl_init();
    $timeout = 1;
    curl_setopt ($ch, CURLOPT_URL,$url);
    curl_setopt ($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt ($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
    $info = curl_exec($ch);
    curl_close($ch);
    }
    else{
		
		$info= file_get_contents($url);	
	}
              
                $fname=$dir.$i.".html";
                file_put_contents($fname,$info);//写入文件                 
					
					echo "http://".$_SERVER['HTTP_HOST']."/index.php?m=".$v['mod']."&a=htmllist&category=".$v['id']."<b>".$v['title'].$i."页</b>分页成了<br/>";
					}
				
				
				}	
				
				
	    
	  }

	                                                                             
}																	   
																				   

?>