<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html>
<head>
<meta charset="utf-8" />
<script language="javascript" type="text/javascript" src="__PUBLIC__/Js/Jquery/jquery.js"></script>
<title><?php echo ($sysConfig["site_name"]); ?></title>
<style type="text/css">
* { margin: 0; padding: 0; }
body { text-align: center; color: #333; }
body, td, th { font: 12px/1.5em Arial; }
.loginbox { margin: 180px auto 60px; text-align: left; }
td { }
.logo { width: 296px; w\idth: 226px; padding: 90px 70px 30px 0; background: url(__PUBLIC__/Admin/login_logo.png) no-repeat 100% 50%; text-align: right; }
.logo p { margin: -40px 0 0 0; }
.loginform th, .loginform td { padding: 3px; font-size: 14px; }
.t_input { padding: 3px 2px; border: 1px solid; border-color: #666 #EEE #EEE #666; }
.submit { height: 22px; padding: 0 5px; border: 1px solid; border-color: #EEE #666 #666 #EEE; background: #DDD; font-size: 13px; cursor: pointer; }
.footer { position: absolute; bottom: 10px; left: 50%; width: 500px; margin-left: -250px; color: #999; }
a { color: #2366A8; text-decoration: none; }
a:hover { text-decoration: underline; }
</style>
<script type="text/javascript" >
$(function(){   
    $("#submit").click(function(){
	var jumpUri = $("#jumpUri").val();
       $.ajax({   
		  type:"POST",   
			  url:"<?php echo U('Public/doLogin');?>",
			  data:{
				  username: $('#username').val(), password: $('#password').val(), verifyCode: $('#verifyCode').val()
				  },   
			  beforeSend:function(){
				  	$("#msg").html('<span style="color:#FF0000"><img src="__PUBLIC__/Admin/loading.gif" align="absmiddle">正在提交登录...</span>'); 
				  },                
			  success:function(data){
				switch(data)
				{
					case 'errorVerifyCode':
						//$("#verifyImage").attr('src', "<?php echo U('Public/verify',0,0,0);?>?"+ Math.random());
						
					case 'emptyInfo':
						$("#msg").html('<span style="color:#FF0000">用户名密码必须填写</span>'); 
						break
					case 'usernameFalse':
						$("#msg").html('<span style="color:#FF0000">用户信息不存在，登录失败</span>'); 
						
						break
					case 'passwordFalse':
						$("#msg").html('<span style="color:#FF0000">密码错误</span>'); 
						
						break
					case 'roleFalse':
						$("#msg").html('<span style="color:#FF0000">当前用户被限制登录，请联系管理员</span>');
						
						break
					case 'roleLost':
						$("#msg").html('<span style="color:#FF0000">不存在的用户组，请联系管理员</span>');
						
						break
					case 'loginSuccess':
						$("#msg").html('<span style="color:#FF0000">登录成功</span>');
						if(jumpUri == ''){
							window.location.href = '<?php echo U("Index/index");?>';
						}else{
							window.location.href = jumpUri;
						}
						//window.location.href = '<?php echo U("Index/index");?>';
						return true;
						break
					default:
						$("#msg").html('<span style="color:#FF0000">'+data+'</span>');
						alert ('未知错误，请联系管理员');
				}
				return false;			
			}               
         });   
		return false;
    });  
	
}); 



</script>
</head>
<body>

<div class="mainarea">
<form method="post" action="<?php echo U('Public/doLogin');?>">
<table callspacing="0" cellpadding="0" class="loginbox">
<tr>
<td class="logo"><div id="msg"> 输入用户及密码，进入管理平台</div> </td>
<td>
<table callspacing="0" cellpadding="0" class="loginform">
<tr>
<th>用户名：</th>
<td><input name="username" type="text" class="t_input" id="username"  style="margin-right:5px;width:150px;" value="" maxlength="20" /></td>
</tr>
<tr>
<th>密　码：</th>
<td><input name="password" type="password" class="t_input" id="password"  style="margin-right:5px;width:150px;" value="" maxlength="20" /></td>
</tr>
<tr>
  <td></td>
  <td><input type="submit" name="submit" value="登录" class="submit" id="submit" />
    <input type="reset" name="reset" value="重填" class="submit" id="reset" /><input name="jumpUri" type="hidden" id="jumpUri" value="<?php echo ($jumpUri); ?>" />
  </td>
</tr>
</table>
</td>
</tr>
</table>
</form>
</div>
<p class="footer">Powered by <a href="http://www.YIGECMS.cn" target="_blank">YIGECMS</a> &copy; 2001 - 2008 <a href="http://www.YIGECMS.cn" target="_blank">YIGECMS.</a></p>
</body>
</html>