<?php
class PushAction extends Action{
	
	
	public function index(){
		 /*获取消息通知*/
		 if($_POST['t'] !=3) exit();
		 $uid=intval(Session::get('userID'));
		 
		 //未读私信数目
		 $sixin=D('sms')->where('toid='.$uid.' and status=0')->count();
		 //评论回复数
		 $plnums="10";
		 $tarr=array('sixin'=>$sixin,'pl'=>$plnums);
		 exit(json_encode($tarr));
		 
		}
	
	}
?>