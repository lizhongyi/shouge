<?php
/**
 * 
 * User(用户中心)
 *
 * @package      	YIGECMS_Corp
 *
 * @license         http://www.YIGECMS.cn/license.txt
 * @version        	$Id: PublicAction.class.php v1.0 2012-01-01 06:59:03 

 */

class UserAction extends GlobalAction{
    public $dao;
    function _initialize()
    {   
         
		   parent::_initialize();
		
		 
		 
	     $this->udd=D('User');
		 //如果登录 读取数据
		 if($this->userID){
			$this->userarr=$this->udd->where('id = '.$this->userID)->find();
			$user=$this->userarr;
			if($user['face'] != "" && $user['face2'] != ''){
				//执行清理函数 并且更新数据图图片数据
				 //@unlink(sub1($user['face2']));
				 
				}
				if($user['face']==""){
					
					$user['face']="/Uploads/User/face/face.jpg";
					
					}
			  $sixin=D('sms')->where('toid='.$this->userID.' and status=0')->count();
			  $pl="10";
			  $tongzhi['sixin']=$sixin;
			  $tongzhi['pl']=$pl;
			  
			 $uid=$_GET['uid'];
		    $this->assign('tongzhi',$tongzhi);
            $this->assign('user',$user);
			 if($uid==""){
				
				$this->assign('yid',$user['id']);
				
				}
			
			
			
			$newuser=$this->udd->field('id,username,realname,face')->limit('9')->order('id desc')->select();
			foreach($newuser as $k=>$v){
				  
				  if($newuser[$k]['face1']==0){
					  $newuser[$k]['face']='/Public/img/face.jpg';
					  }
				
				}
			$this->assign('newuser',$newuser);
			
			
			}
			//加载分页类
			
		 //如果进入主页
		  
		
		
		 $uid=$_GET['uid'];
		 $act=$_GET['act'];
		 if($_GET['uid'] != ""){
		               $this->homearr= $this->udd->where('id='.$uid)->find();//	
                       $this->assign('urr',$this->homearr);
					   }
		 
		 
       }


 	
	/*
	 # 用户中心
	
	*/
	public function index(){
		
		   /*判断是否登陆*/
           if(!$this->userID){
           redirect( U('User/login',array('jumpUri'=>safe_b64encode($_SERVER['REQUEST_URI']))));
		              }
					  
			
			     global $user;
					  /*最新用户*/
					  
					  /*判断资料是否完整*/
					  
					 if($this->userarr['realname']==""){
						 
						   redirect( U('User/profile'));
						   
						 }
					  //取留言数目
					  $lynum=D("usermsg")->where("toid=".$this->userID)->count();
					  $this->assign("lynum",$lynum);
                      $this->display();
    }    
	
	
	
	    /*用户列表*/
		public function ulist(){
			    
			 	$ucount=$this->udd->count();
				$listRows = empty($listRows) ? 5 : $listRows;
                $orderd = empty($orders) ? 'id DESC' : $orders;
                $paged = new page($pageCount, $listRows);
                $uList = $this->udd->Where($condition)->Order($orderd)->Limit($paged->firstRow.','.$paged->listRows)->select();
				$pageContentBar = $paged->show();
			     echo $ucount;	
			   // $this->display();
			
			}
		
		/*用户主页*/
		public function home(){
			         $uid=intval($_GET['uid']);
					 if(!$uid){
						  redirect('/');//返回首页
						 }
						 
					 if($uid==$this->userID){
						   redirect('/User');
						  }	
						   
						  
						  
						  if($_GET['uid']!=""){
				
				$this->assign('yid',$_GET['uid']);
				
				}  
				
						  
						 
			         $this->display();
			
			}
		/*留言模块*/
		
		public function message(){
			
			
			    /*提交留言*/
				if($_GET['act']=='sendmsg'){
				
			     if(!$_POST) exit('没有提交');
                    $data= rfilter($_POST);
                    $data['uid']=$this->userID;	 
                    $data['create_time']= time();
		            $savep=D('usermsg')->add($data);	
		            if($savep){
						
		                     exit("ok"); 
					    
                            } else{
							
				             exit("出错");
				  
                         }
		 
			 
				}
				//留言列表
				if($_GET['act']=="msglist"){
					  
					  $toid=$_GET['toid']; 
					  $pageCount=D('usermsg')->where('toid='.$toid)->count();//消息数
					  
					  $listRows = empty($listRows) ? 10 : $listRows;
                      $orderd = empty($orders) ? 'id DESC' : $orders;
                      $paged = new page($pageCount, $listRows);
                     //$msglist=D('usermsg')->where('toid='.$toid)->select();//留言列表
					  
					  $msglist=D('usermsg')->where('toid='.$toid)->Order('id desc')->Limit($paged->firstRow.','.$paged->listRows)->select();
					   //加载留言回复数
					   foreach($msglist as $k=>$v){
						   
						 $msglist[$k]['hf_cont']=D('usermsg')->where('hfid='.$v['id'])->count();
						 $msglist[$k]['face']=getuname( $msglist[$k]['uid'],1);
						 $msglist[$k]['uname']=getuname( $msglist[$k]['uid'],0);
						 
						   }
					  
					  $pageContentBar = $paged->show_ajax();
					  
					  $this->assign('msglist',$msglist);
					   $this->assign('pageContentBar', $pageContentBar);
					  // print_r($msgcont);
					   $this->assign('userid',$this->userID);
					   $this->display();
					}
					
					
					
			
					
					
					
					
					
					
					
					
					
					
					 /*提交回复*/
				if($_GET['act']=='send_hf'){
					
					
			      if(!$_POST){
					  exit();
					  }
					 
					 $post= rfilter($_POST);
			     
		      		$data['uid']=$this->userID;	 
                    $data['hfid']=$_POST['hfid'];
					$data['content']= $post['content'];
					$data['create_time']= time();
		            $savep=D('usermsg')->add($data);	
		            if($savep){
						
		                     exit("ok"); 
					    
                            } else{
							
				             exit("出错");
				  
                         }
		               }
			 
				
				
					
					
					
					
					
					
					
					//回复列表
						if($_GET['act']=="hflist"){
                      $toid=$_GET['hfid']; 
					 $pageCount=D('usermsg')->where('hfid='.$toid)->count();//消息数
                      $listRows = empty($listRows) ? 5 : $listRows;
                      $orderd = empty($orders) ? 'id DESC' : $orders;
                      $paged = new page($pageCount, $listRows);
                     //$msglist=D('usermsg')->where('toid='.$toid)->select();//留言列表
					  
					  $msglist=D('usermsg')->where('hfid='.$toid)->Order('id desc')->Limit($paged->firstRow.','.$paged->listRows)->select();   
					    //加载留言回复数
					   foreach($msglist as $k=>$v){
						   
						 $msglist[$k]['hf_cont']=D('usermsg')->where('hfid='.$v['id'])->count();
						 $msglist[$k]['face']=getuname( $msglist[$k]['uid'],1);
						 $msglist[$k]['uname']=getuname( $msglist[$k]['uid'],0);
						 
						   }
					  
					   $pageContentBar = $paged->show_ajax();
					   $this->assign('msglist',$msglist);
					   $this->assign('pageContentBar', $pageContentBar);
					   $this->assign('userid',$this->userID);
					   $this->display();
					}
				 
				 
			}
		
			
		
	 /*

      注册界面

    */
		
				
		
		
		
	public function reg(){
		   
		
		  $this->display();
		
		}
		
		
		 /*

      注册处理

    */
	
	public function doreg(){
		
		 
		 $username=$_POST['username'];
		 //parent::_setMethod('post');
		//if(!isEnglist($username))  exit('isen');
		//判断用户是否存在
		
		$cunzai=$this->udd->where("username='$username'")->count();
	
		if ($cunzai > 0) exit('usered');
		
		
		if($this->uddCreate = $this->udd->create()) {
			$this->udd->regip=get_client_ip();
			$this->udd->username =$_POST['username'];
			$this->udd->password = md5(trim($_POST['password']));
			$this->uddAdd = $this->udd->add();
			if(false !== $this->uddAdd){
			
				echo('ok');
			    $condition["username"] = $username;
                $record = $this->udd->where($condition)->find();
				$this->udd->last_login_time=time();//注册IP
			    $this->udd->id=$record['id'];//用户ID
				$this->udd->login_count=$record['login_count']+1;
		        $logintime = $this->udd->save();
			    Session::set('username', $record['username']);
                Session::set('userID', $record['id']);
                Session::set('roleId', $record['role_id']);
                Cookie::set('username',$record['username'],60*60*24);
			    Cookie::set('userID', $record['id'],60*60*24);
			    Cookie::set('roleId', $record['role_id'],60*60*24);
				/*生成用户js*/
				$userlist=$this->udd->field('username,face,realname,id,motto,pinyin')->select();
				foreach($userlist as $k=>$v){
								 
								 if( $userlist[$k]['face']==""){
									 $userlist[$k]['face']="/Public/img/face.jpg";
									 
									 }
								  
								}
				$json=json_encode($userlist);
				file_put_contents("./Public/Js/user.js","var userlist=".$json);

			exit();
			}else{
			 exit('err');
			}
		}else{
			parent::_message('error', $this->dao->getError());
		}
		
	}
	
	
	
	
    /**
     * 登录页
     *
     */
    public function login()
    {   if($this->userID){
		  redirect(U('User/index'));
		}
        $jumpUri = safe_b64decode($_GET['jumpUri']);
        $this->assign('jumpUri', $jumpUri);
        $this->display();
    }


    
    /**
     * 提交登录
     *
     */
    public function doLogin()
    {    
	   
        $username = trim($_POST['username']);
        $password =$_POST['password'];
		$jizhu=$_POST['jizhu'];
		
       
        if(empty($username) || empty($password)){
            //self::_message('error', '用户名，密码必须填写', U('Public/login'));
            echo 'emptyInfo';
            exit();
        }

        $condition = array();
       
        $condition["username"] = $username;
        $record = $this->udd->where($condition)->find();
		
        //echo $this->udd->getLastSql();
        if(false == $record)
        {
            echo 'usernameFalse';
            exit();
            //self::_message('error', '用户信息不存在，登录失败');
        }else{
            if ($record['password'] != md5($password)){
                echo 'passwordFalse';
                exit();
                //self::_message('error', '密码错误', U('Public/login'));
            }
            if ($record['role_id'] == 2) {
                echo 'roleFalse';
                exit();
                //self::_message('error', '当前用户被限制登录，请联系管理员', U('Public/login'));
            }
            
            //检测用户组权限，如果是all 或者是 1 则记录SESSION ，权限检测时跳过读取数据库
            if($getRole['role_permission'] == 'all' || $record['role_id'] == 1){
                Session::set('permission', 'all');
            }
			$this->udd->last_login_time=time();
			$this->udd->id=$record['id'];
			$this->udd->login_count=$record['login_count']+1;
		    $logintime = $this->udd->save();
			
            Session::set('username', $record['username']);
			 Session::set('realname', $record['realname']);
            Session::set('userID', $record['id']);
            Session::set('roleId', $record['role_id']);
			//记住登录状态
			
			if($jizhu=='1'){
                Cookie::set('username',$record['username'],60*60*24*7);
				Cookie::set('realname',$record['realname'],60*60*24*7);
			    Cookie::set('userID', $record['id'],60*60*24*7);
			    Cookie::set('roleId', $record['role_id'],60*60*24*7);
			}
            /**
             * 记录日志
             */
            $getConfig = getCache('cms.config.php', './');
            $sysLog = $getConfig['sys_log'];
            $sysLogExt = $getConfig['sys_log_ext'];
            if(!empty($sysLog) && in_array('login', explode(',', $sysLogExt))){
                Load('extend');
                $this->udd = D('UserLog');
                $this->udd->user_id = intval($record['id']);
                $this->udd->username = $username;
                $this->udd->action = '登录系统';
                $this->udd->ip = get_client_ip();
                $this->udd->create_time = time();
                $this->uddAdd = $this->udd->add();
                $lastSql = $this->udd->getLastSql();
                if(false === $this->uddAdd) die("日志写入失败:{$lastSql}");

            }
            echo "loginSuccess";
            exit();
            //self::_message('success', '登录成功', U('Index/index'), 1);
        }
    }

    /**
     * 修改资料
     *
     */
	 
	 
	 public function profile(){
		   
			
			
		   if(!$this->userID){
           redirect( U('User/login',array('jumpUri'=>safe_b64encode($_SERVER['REQUEST_URI']))));}
          
           $this->display();
		 
		 
		 }
	 
	 /*保存修改资料*/
	
	 
	 public function psave(){
		  
		 
		   if($_GET['act'] != "profile"  && $_GET['act'] != "pass"  ){
			   
			    exit("参数错误");
			   } 
			
       
		
		  if($_GET['act']=="profile"){
		    include('includes/pinyin.php');
           $data= rfilter($_POST); 
		 
		 if($daoCreate = $this->udd->create()){
			 /*保存用户名的拼音*/
			 $data['pinyin']=Pinyin($data['realname'],'UTF-8');
              $data['id']=$this->userID;
			 
		      $savep=$this->udd->save($data);	
		       if($savep){
				   
				   if($_POST['ajax1']=='1'){
					   
                 self::_message('success', '修改成功',$_SERVER['HTTP_REFERER']);
				  
				  
				   }else{
					   
					  exit("ok"); 
					    
					  }
				  
                 } 	
			  else
			  {   if($_POST['ajax1']=='1'){
                 self::_message('error', '出错了',$_SERVER['HTTP_REFERER']);
			  }
			  else{
				  exit("err");
				  }
            }
		  }
		  }
		  
		  //保存密码
		  if($_GET['act']=="pass"){
			   $data= rfilter($_POST); 
			  
			    /*验证原密码*/
				  
				  if($data['npass'] != $data['npass1']){
					  
					    exit("密码不一致");
					  }
				  
				 $ypass=md5($data['ypass']);
				 
				  $pas=$this->udd->where('id = '.$this->userID.' and password="'.$ypass.'"')->count();
				  if($pas < 1 ){
					  exit('原密码错误');
					  }
				
				 if($daoCreate = $this->udd->create()){
		      		$data['password']=md5($data['npass']);	 
                    $data['id']=$this->userID;
		            $savep=$this->udd->save($data);	
		            if($savep){
						
		                     exit("ok"); 
					    
                            } else{
							
				             exit("您并没有修改密码");
				  
                         }
		  }
			    
			    
			  }
			  
			  
		 }
	 
	
	 /**
	 
	 上传
	 
	 */
    public function upFace(){
		    
			if(empty($_FILES)){
				  
				 exit("<script> parent.callback(3);</script>");
				 
				}
				else{
					 $uploadFile = upload($this->getActionName());
					if($uploadFile) {
						
						//exit($uploadFile);
						$fname=$uploadFile[0]['savepath']."m_".$uploadFile[0]['savename'];
						$wh=getimagesize($fname);
						if($wh[0] > 200){ 
						
							$data['face2']=sub1($fname);
							$data['face1']=0;
							
							$data['id']=$this->userID;
							$cheng=D('User')->save($data);
						 exit("<script> parent.callback(2,'".sub1($fname)."',$wh[0],$wh[1]);</script>");
						}else{
						//写数据库删除
						   
							 @unlink($this->userarr['face']);
							
							
							$data['face']=sub1($fname);
							$data['face1']=1;
							$data['face2']="";
							$data['id']=$this->userID;
							$cheng=D('User')->save($data);
							exit("<script> parent.callback(1,'".sub1($fname)."');</script>");
						}
							
							
					}
					
					
					}
			  
			 
		  
	}
	
	
	 /**
	 
	 上传
	 
	 */
    public function  cutFace(){
		    
			if(!$_POST) exit("提交失败");
			$x1=intval($_POST['x1']);
			$y1=intval($_POST['y1']);
			$x2=intval($_POST['x2']);
			$y2=intval($_POST['y2']);
			$picname=sub1($this->userarr['face2']);
			$ext=substr($picname,-3);
			$dstimg=$picname;
			$nw=intval($x2-$x1);
			$nh=intval($y2-$y1);
			
			$r = 100;
            if($x2<$x1||$y2<$y1){
              return false;
             }
			 
            $img=$picname;
             if($ext=='jpg'){
            $im=imagecreatefromjpeg($img);
			 }
			
             if($ext=='gif'){
            $im=imagecreatefromgif($img);
			 }
			 
             if($ext=='png'){
            $im=imagecreatefrompng($img);
			 }
            $percent = $r*0.01;
           
           list($width, $height) = getimagesize($img);
         $new_width = $width * $percent;
         $new_height = $height * $percent;
            $tempimg = imagecreatetruecolor($new_width,$new_height);
            imagecopyresampled($tempimg, $im,0,0,0,0, $new_width,$new_height, $width, $height);
			
			
			
             if($ext=='jpg'){
           imagejpeg($tempimg,"Uploads/User/face/temp_".$picname);
			 }
            
			if($ext=='gif'){
           imagegif($tempimg,"Uploads/User/face/temp_".$picname);
			 }
			 if($ext=='png'){
           imagepng($tempimg,"Uploads/User/face/temp_".$picname);
			 }
			
			
			
            imagedestroy ($im);

           $ims=$tempimg;
           $srcW=imagesx($ims);
           $srcH=imagesx($ims);
           $top_x = $x1;
           $top_y = $y1;
           $bottom_x = $x2;
           $bottom_y = $y2;
           $newimg = imagecreatetruecolor($bottom_x-$top_x,$bottom_y-$top_y);
           imagecopyresampled($newimg, $ims,0,0,$top_x,$top_y, $srcW,$srcH, $srcW, $srcH);    
		   $nface="Uploads/User/face/".md5($this->userarr['id']).".".$ext;
		   
		   
		   if($ext=='png'){
           imagepng($newimg,$nface);
			 }
		   
		    if($ext=='gif'){
           imagegif($newimg,$nface);
			 }
			 if($ext=='jpg'){
           imagejpeg($newimg,$nface);
			 }
		   
         
		   
           if(imagedestroy ($ims))
		   /*更新数据库删除临时图*/
		   @unlink("Uploads/User/face/temp_".$picname);
		   @unlink($picname);
		   $data['face']="/".$nface;
		   $data['face1']=1;
		   $data['face2']="";
		   $data['id']=$this->userID;
		   $sv=$this->udd->save($data);
		   if($sv){
			       
				   echo "/".$nface;
				   
			   }
		   else{
			    echo 0;
			   
			   }


			
			
			 
		  
	}
    /**
     * 输出信息
     *
     * @param unknown_type $type
     * @param unknown_type $content
     * @param unknown_type $jumpUrl
     * @param unknown_type $time
     * @param unknown_type $ajax
     */
  

    public function logout()
    {
        if(!isset($this->userID)) {
          $this->userID="";
		 // exit( $this->userID);
		     Session::set('username','');
             Session::set('userID', '');
             Session::set('roleId','');
			    Cookie::set('username','');
			    Cookie::set('userID', '');
			    Cookie::set('roleId','');
                
          
			
            self::_message('success', '登出成功');
        }else {
			
           self::_message('success', '已经退出登录','/');
			
        }
    }
	
	/*
	
	找回密码
	
	
	
	
	*/
	
	
	
	
	public  function repass(){
		
		  if($_GET['act']=='repass'){
			  
			  $toemail=$_POST['umail'];
			  if($toemail==""){
				   exit('邮箱不存在');
				  }
			  $tiao=$this->udd->where('email ="'.$toemail.'" and email <> ""')->find();
			 
			  if(!$tiao['id']){
				 exit('邮箱不存在');  
			   }
				  
				  /*生成随机验证码*/
				  $randnum=base64_encode($toemail.",".rand(1,time()));
				  //echo $randnum;
				 // exit();
				  $data['randnum']=$randnum;
				  $data['id']=$tiao['id'];
				  $uprand=$this->udd->save($data);
				/*导热邮件类*/  
				 require_cache('includes/class.phpmailer.php');
				if(!$uprand){
					 
					 exit('yichang');
					
					}
				   require_cache('includes/mailer.class.php');
				
				         $from      =    $this->sysConfig['site_name'];
				         $email     =    $this->sysConfig['smtpmail'];
						 $protocol  =    $this->sysConfig['smtpyz'];
						 $host      =    $this->sysConfig['smtpserver']; 
						 $port      =    $this->sysConfig['smtpport']; 
						 $user      =    $this->sysConfig['smtpuser']; 
						 $pass      =    $this->sysConfig['smtppass']; 
						
						
						
			            $smtp      =     new Mailer($from, $email, $protocol, $host, $port, $user, $pass);
						
						$address= $toemail;
						$subject="找回密码";
						$body="您好您的密码需要修改，请点击如下链接<a href='http://".$_SERVER['HTTP_HOST']."/User/urepass/rand/".$randnum."'>http://".$_SERVER['HTTP_HOST']."/User/uepass/rand/".$randnum."</a>";
						$is_html=true;
						$charset='utf-8';
			            $body             = eregi_replace("[\]",'',$body); //对邮件内容进行必要的过滤
					
						
						if($smtp){
						                 $fasong=$smtp->send($address,$subject,$body, $charset, $is_html, $receipt = false);
						                 if($fasong){
							
							             exit ('ok');
							
							             }else{
							             echo 0;	
							             }
										 
						     }
						  else
						{
						 
						 echo  "邮件错误";	
							
						}

			  
			  }
			  elseif($act=='urepass' && $_GET['rand'] !=""){
				  
				  
				  }
			  else{
		          
	            $this->display();
			  }
		}
		//找回密码
		public  function urepass(){
			
			              $rand=$_GET['rand'];
			          
				          if($_GET['act'] != 'uppass' && $rand !="" ){
							 
							 
					         $array = explode(',',base64_decode($rand));
						
					 
					  //查询验证码
					      $tiao=$this->udd->where('email ="'.$array[0].'" and randnum = "'.$rand.'"')->find();
					      
					   if(!$tiao['id']){
						   
						   self::_message('errorUri', '验证码作物或已经失效', U('Index/index'));
						   exit();
						   
						   }else{
							  
							    $this->assign('rand',$rand);
								$this->display();
								exit();
							   
					}  
						 }
                   if($_GET['act'] == 'uppass' ){
					   
					        $pass    =  $_POST['pass'];
					        $pass1   =  $_POST['pass1'];
	                        $rand    =  $_POST['rand'];
							
							
							
							if($pass=="" || $pass1==""){
							 
							   exit('请输入密码');	
							}
							
							if($pass != $pass1){
							 
							   exit('两次输入的不一致');	
							}
						   $array = explode(',',base64_decode($rand));
						   $tiao=$this->udd->where('email ="'.$array[0].'" and randnum = "'.$rand.'"')->find();
						  
						  
						   //更新
						   $data['password']=md5($pass);
                           $data['randnum']="";
						   $data['id']=$tiao['id'];
						   $up=$this->udd->save($data);
						   if($up){
							    
								exit('ok');
								
							   }
							  else{
								  
								  exit('修改失败');
								  
								  } 
						 
						  
					   }
					  
					  } 
					  
					  
					  
					  /*私信部分*/
            
			     public  function sms(){
					 
					      if(!$this->userID){
		                     redirect(U('User/index'));
		                 }

					     /*私信列表*/
						  if($_GET['act']==""){
							  
							  
							/*取得对话用户*/
							$smslist=D('sms')->field('faid,id,toid')->where('toid ='.$this->userID.' or faid='.$this->userID)->order('id desc')->select();
								
								foreach($smslist as $k=>$v){
									
									  if($v['faid']==$this->userID){
										  
										  $suid[]=$v['toid'];
										  }
										  
										  if($v['toid']==$this->userID){
										  
										   $suid[]=$v['faid'];
										  }
									
									
									}  
									$siin=implode(',',$suid);
									
									
									
								$suid=array_unique($suid);
								//print_r($suid);	
															foreach($suid as $k=>$v){
	                                 $silist[$k]['uid']=$v;
									$silist[$k]['sixin']=D('sms')->where('toid ='.$this->userID.' and faid='.$v.' and status = 0 or toid='.$v.' and faid='.$this->userID)->order('id desc')->limit('1')->select();        if($silist[$k]['sixin'][0]['faid']==$this->userID){
										$silist[$k]['sixin'][0]['st']="我发给";
										$silist[$k]['uname']=getuname($silist[$k]['sixin'][0]['toid']);
										$silist[$k]['tid']=$silist[$k]['sixin'][0]['toid'];
										
										}
										
										if($silist[$k]['sixin'][0]['toid']==$this->userID){
										//$silist[$k]['sixin'][0]['st']="发件人";
										$silist[$k]['uname']=getuname($silist[$k]['sixin'][0]['faid']);
										$silist[$k]['tid']=$silist[$k]['sixin'][0]['faid'];
										$silist[$k]['weidu']=D("sms")->where('faid='.$silist[$k]['sixin'][0]['faid'].' and toid='.$this->userID.' and status =0')->count();                                
										if($silist[$k]['weidu'] > 1){
										 $weidus=$silist[$k]['weidu']-1;
										 $silist[$k]['tixing']="有".$weidus."条新私信";
										 
                                          }
										 $data['status']=1;
										 $data['id']=$silist[$k]['sixin'][0]['id'];
										 $mu=D("sms")->save($data);		
										
										}
									   $silist[$k]['nums']=D('sms')->where('toid ='.$this->userID.' and faid='.$v.' or toid='.$v.' and faid='.$this->userID.' and delid <> '.$this->userID)->order('id desc')->count();
									   $silist[$k]['uface']=getuname($v,1);
									  
									}
									
									
							  
							  /*根据对话用户读私信*/
							  
							// dump($silist);
						  $jsrand=rand(0,4000);
						  $this->assign('jsrand',$jsrand);
                          $this->assign('silist',$silist);
						  $this->display();
						  }
						  
						  /*发送私信*/
						 elseif($_GET['act']=='send_sms'){
							  
							 $post=rfilter($_POST); 
							 $data['content']   = $post['content'];
							 $data['toid']      = $post['toid'];
							 $data['faid']      = $this->userID;
							 
							 $send=D('sms')->add($data);
							 if($send){
							 exit('ok');
							 }else{
							 exit('err');	  
							   }
							 }
					    /*对话列表*/
						
		
					 
					 
					 }		
					 
					 /*私信对话列表*/
					 public function smsbox(){
						         
                                 $toid=$_GET['toid'];
								 if($toid==0){
									 
								   header("Location:/404.html");
									
									}
								$dhlist=D('sms')->where('toid ='.$this->userID.' and faid='.$toid.' or faid='.$this->userID. ' and toid='.$toid.' and delid <> '.$this->userID)->order('id desc')->select();//对话列表模板
								
								foreach($dhlist as $k=>$v){
									
									      //$dhlist[$k]['uname']=getuname($dhlist[$k]['faid']);
										  $dhlist[$k]['uface']=getuname($dhlist[$k]['faid'],1);
										  if($dhlist[$k]['faid']==$this->userID){
											  
											  $dhlist[$k]['ut']="我:";
											  }
											else{
												/*发送给我新的都设置为已读*/
												
												if($dhlist[$k]['status']==0){
													$data['status']=1;
													$data['id']=$dhlist[$k]['id'];
													D('sms')->save($data);
													
													}
												
												$dhlist[$k]['ut']='<a href="'.U("User/home",array('uid'=>$dhlist[$k]['faid'])).'">'.getuname($dhlist[$k]['faid']).'</a>';
												}  
									}
								
								
								//print_r($dhlist);
								$this->assign('dhlist',$dhlist);
								$this->assign('toid',$toid);
								$this->display();
							  
							 
						 }	
						 /*删除私信*/	
						 public function delsms(){
							 
							     /*判断是否是发给自己*/ 
								  $id=$_POST['id'];
								 
								 $del=D("sms")->where('id ='.$id)->find();
								     /*如果hi自己发的就并且没有操作就是添加删除ID*/
								    if($del['faid']==$this->userID  && $del['delid'] !=0 && $del['delid'] != $t->userID  || $del['toid']==$this->userID  && $del['delid'] !=0 &&  $del['delid'] != $t->userID  ){
									   
									    $deled=D('sms')->where('id='.$id)->delete();
										if($deled){
											
											
											     exit('ok');
											  
											  }else{
											   
											   exit("err");	  
												  
												  }

									 }else{
										 /*如果是空的那就写入自己的delid*/
										  $data['delid']=$this->userID;
										  $data['id']=$id;
										  $delset=D('sms')->save($data);
										  if($delset){
											  
											  exit('ok');
											  
											  }else{
											   
											   exit("err");	  
												  
												  }
										 
										 }
							 
							 
							 }	   
					   
			    /*异步查询用户*/
				public function ajaxuser(){
					
					    // $uname=$_GET['uname'];
						//if($uname=="")exit();
						 
						  $userlist=$this->udd->field('username,face,realname,id,motto,pinyin')->where('realname like "%'.$uname.'%" or pinyin like "%'.$uname.'%" and id <>'.$this->userID)->select();
						    
							
						  //print_r($userlist);
						 $this->assign("userlist",$userlist);
                         $this->display();
					
					}
			
			  
	}
