<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html>
<head>
<meta charset="utf-8" />
<title><?php echo ($sysConfig["site_name"]); ?> </title>
<link id="mastercss" rel="stylesheet" href="__PUBLIC__/Admin/style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="__PUBLIC__/Js/colorpicker/colorpicker.css" type="text/css">

<script type="text/javascript">
<!--
//指定当前组模块URL地址
var URL = '__URL__';
var APP	 =	 'admin.php';
var PUBLIC = '__PUBLIC__';
var ROOT = '__ROOT__';
//-->
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
</script>
<script language="javascript" type="text/javascript" src="__PUBLIC__/Js/Jquery/jquery.js"></script>
<script language="javascript" type="text/javascript" src="__PUBLIC__/Js/Jquery/jquery.validate.js"></script>
<script language="javascript" type="text/javascript" src="__PUBLIC__/Js/Jquery/cmxforms.js"></script>
<script language="javascript" type="text/javascript" src="__PUBLIC__/Js/script_common.js"></script>
<script language="javascript" type="text/javascript" src="__PUBLIC__/Js/colorpicker/colorpicker.js"/></script>
<script language="javascript" type="text/javascript" src="__PUBLIC__/Js/My97DatePicker/WdatePicker.js"/></script>
     <script charset="utf-8" src="__PUBLIC__/Js/editor/kindeditor-min.js"></script>
<script charset="utf-8" src="__PUBLIC__/Js/editor/lang/zh_CN.js"></script>
<script charset="utf-8" src="__PUBLIC__/Js/editor/plugins.js"></script>


<script type="text/javascript">
$(document).ready(function(){
	  $("div.block>h2").click(function(){
		  
		   $(this).next().slideToggle(300);
		  
		  });
	});
</script>
<style>
.ke-container-default{ width:760px;}
</style>
</head>
<body>
<div id='loader' style='color:#ffffff;font-size:12px;background-color: #0099CC; width:140px; padding:2px 4px; height:20px; position: fixed;right:0px;top:2px; display:none'>提交中，请稍后...</div>
	<div id="wrap">
		<div id="header">
			<h2><a href="__APP__" title="YIGECMS"><img src="__PUBLIC__/Admin/logo.gif" alt="YIGECMS" /></a></h2>
			
			<div id="topmenu" class="gray">
			<span style="font-weight:bold">当前用户：<img src="__PUBLIC__/Admin/user.gif" alt="YIGECMS" align="absmiddle"/><?php echo ($username); ?></span> 　 
				<a href="<?php echo U('Admin/modify',array('id'=>$adminId, 'jumpUri'=>'run' ));?>"><img src="__PUBLIC__/Admin/user_modify.gif" alt="YIGECMS" align="absmiddle"/>我的帐户</a>&nbsp;&nbsp;&nbsp;<a href="<?php echo U('Public/logout');?>"><img src="__PUBLIC__/Admin/logout.gif" alt="YIGECMS" align="absmiddle"/>退出系统</a>&nbsp;&nbsp;&nbsp;<a href="<?php echo ($frontUrl); ?>" target="_blank"><img src="__PUBLIC__/Admin/home_25.gif" alt="YIGECMS" align="absmiddle"/>前台首页</a>
			</div>
			<ul id="menu" style="display:none">
				<li><a href="Admin.php">管理平台</a></li>
				<li><a href="Admin.php?ac=$value"><?php echo ($_TPL[menunames][$value]); ?></a></li>
			</ul><div id="later" style="position:fixed"></div>
		</div>
		<div id="content">



<script type="text/javascript">

$(document).ready(function() {

	$("#mainFrom").validate({

		rules: {

			site_name: "required",

			company_name: "required",

			run_system: "required",

			attach_size: "required",

			attach_suffix: "required",

			link_category: "required",

			global_category: "required"

		},

		messages: {

			site_name: "网站名称须填写",

			company_name: "公司名称必须填写",

			run_system: "运行平台(下载)必须填写",

			attach_size: "允许附件大小必须填写",

			attach_suffix: "允许附件类型必须指定",

			link_category: "友情链接类型必须指定，格式如：普通链接=1|合作伙伴=2|其它链接=3",

			global_category: "模型类别必须指定，格式如：文章模块=Article|产品模块=Product "

		}

	});

});





</script>

<div class="mainarea">

<div class="maininner">

	<div class="block style4">

		

		<table cellspacing="3" cellpadding="3">

		<tr>

		 <th style="width:50px; text-align:center"><a href="http://www.YIGECMS.cn/manual.php?app=shuguangCorp&module=<?php echo ($moduleName); ?>" target="_blank"><img src="__PUBLIC__/Admin/help_1.gif" alt="" align="absmiddle" /><br />

帮助</a></th>

		  <td>1.系统参数设置会影响到全局，请谨慎设置，详细解释请看官方网站相关教程<br />

	      2.内核配置会影响系统性能，不清楚请不要随意修改</td>

		  </tr>

		</table>

	</div>

	<form method="post" action="<?php echo U("Config/doModify");?>" id="mainFrom" >

	<div class="body_content">

	

	

		<div class="top_action"><a href="<?php echo U('Config/index');?>" >系统配置</a> | 	<a href="<?php echo U('Config/core');?>" >内核配置</a></div>

	



	<table id="maintable" class="formtable">

	<tr>

		<th style="width:12em;">网站名称</th>

		<td><input name="site_name" type="text" value="<?php echo ($vo["site_name"]); ?>" size="50" ></td>

	</tr>

	<tr>

		<th>网站网址</th>

		<td><input type="text" name="site_url" value="<?php echo (($vo["site_url"])?($vo["site_url"]):$frontUrl); ?>" size="50"></td>

	</tr>

	<tr>

		<th>站点联系邮箱</th>

		<td><input type="text" name="email" value="<?php echo ($vo["email"]); ?>"></td>

	</tr>

	<tr>

		<th>联 系 人</th>

		<td><input type="text" name="contact_name" value="<?php echo ($vo["contact_name"]); ?>"> </td>

	</tr>

	<tr>

		<th>公司名称</th>

		<td><input type="text" name="company_name" value="<?php echo ($vo["company_name"]); ?>" size="50"></td>

	</tr>

	<tr>

	  <th>公司地址</th>

	  <td><input name="address" type="text" id="address" value="<?php echo ($vo["address"]); ?>" size="50" /></td>

	  </tr>

	<tr>

		<th>电　　话</th>

		<td><input type="text" name="telephone" value="<?php echo ($vo["telephone"]); ?>"></td>

	</tr>

	<tr>

	  <th>传　　真</th>

	  <td><input name="fax" type="text" id="fax" value="<?php echo ($vo["fax"]); ?>" /></td>

	  </tr>

	<tr>

		<th>手　　机</th>

		<td><input type="text" name="mobile_telephone" value="<?php echo ($vo["mobile_telephone"]); ?>"></td>

	</tr>

	<tr>

		<th>qq</th>

		<td><input type="text" name="qq" value="<?php echo ($vo["qq"]); ?>">

		

		</td>

	</tr>

	<tr>

		<th>msn</th>

		<td><input type="text" name="msn" value="<?php echo ($vo["msn"]); ?>"> </td>

	</tr>

	<tr>

		<th>其它即时通讯工具</th>

		<td><input type="text" name="other_im" value="<?php echo ($vo["other_im"]); ?>"> </td>

	</tr>

	<tr>

		<th>ICP备案号</th>

		<td><input type="text" name="icp" value="<?php echo ($vo["icp"]); ?>"> </td>

	</tr>

    <tr>

      <th>网站状态</th>

      <td><select name="web_status" id="web_status">

        <option value="0" <?php echo (selected($vo["web_status"],0)); ?>>正常运行</option>

        <option value="1" <?php echo (selected($vo["web_status"],1)); ?>>暂停访问</option>

        </select> </td>

    </tr>

	<tr>

		<th>客服代码</th>

		<td><textarea name="status_description" cols="60" rows="30"  id="status_description" class="area"><?php echo ($vo["status_description"]); ?></textarea> </td>

	</tr>

	<tr>

		<th>头部附加内容</th>

		<td><textarea name="header_content" cols="50" rows="5"  id="header_content" class="area"><?php echo ($vo["header_content"]); ?></textarea></td>

	</tr>

	<tr>

		<th>联系方式</th>

		<td><textarea name="footer_content" cols="50" rows="5"  id="footer_content" class="area"><?php echo ($vo["footer_content"]); ?></textarea></td>

	</tr>

	

	</table>

    

<br />

	<div class="title" id="register">

		<a name="config" id="config"></a>	<h3>系统参数</h3>

	</div>

	<table id="maintable" class="formtable">

	<tr>
	  
	  <th style="width:12em;">系统日志</th>
	  
	  <td><select name="sys_log" id="sys_log">
	    
	    <option value="1" selected="selected">开启日志</option>
	    
	    <option value="0">关闭日志</option>
	    
	    </select>
	    
	    <input name="sys_log_ext[]" type="checkbox" id="sys_log_ext[]" value="index" <?php echo (string2checked($vo["sys_log_ext"],'index')); ?>/>
	    
	    浏览
	    
	    <input name="sys_log_ext[]" type="checkbox" id="sys_log_ext[]" value="delete" <?php echo (string2checked($vo["sys_log_ext"],'delete')); ?>/>
	    
	    删除
	    
	    <input name="sys_log_ext[]" type="checkbox" id="sys_log_ext[]" value="modify" <?php echo (string2checked($vo["sys_log_ext"],'modify')); ?>/>
	    
	    编辑
	    
	    <input name="sys_log_ext[]" type="checkbox" id="sys_log_ext[]" value="insert" <?php echo (string2checked($vo["sys_log_ext"],'insert')); ?>/>
	    
	    写入
	    
	    <input name="sys_log_ext[]" type="checkbox" id="sys_log_ext[]" value="update" <?php echo (string2checked($vo["sys_log_ext"],'update')); ?>/>
	    
	    批量操作
	    
	    <input name="sys_log_ext[]" type="checkbox" id="sys_log_ext[]" value="login" <?php echo (string2checked($vo["sys_log_ext"],'login')); ?>/>
	    
	    登录后台</td>
	  
	  </tr>

	<tr>

	  <th style="width:12em;">运行平台(下载)</th>

	  <td><input name="run_system" type="text" id="run_system" value="<?php echo ($vo["run_system"]); ?>" />

	    请用 <span style="color:#F00">，</span>隔开</td>

	  </tr>

	<tr>

	  <th style="width:12em;">水印状态</th>

	  <td><select name="watermark_status" id="watermark_status">

	    <option value="1" <?php echo (selected($vo["watermark_status"],1)); ?>>开启</option>

	    <option value="0" <?php echo (selected($vo["watermark_status"],0)); ?>>关闭</option>

	    </select>

	    <span style="width:12em;">默认为：Public/Front/watermark.png</span></td>

	  </tr>

	<tr>

	  <th style="width:12em;">图片范围</th>

	  <td><input name="watermark_size" type="text" id="watermark_size" value="<?php echo ($vo["watermark_size"]); ?>" />	    

	    大于此尺寸的图片才会被打上水印</td>

	  </tr>

	<tr>
	  
	  <th style="width:12em;">允许附件大小</th>
	  
	  <td><input name="global_attach_size" type="text" value="<?php echo ($vo["global_attach_size"]); ?>" size="20" /> 
	    
	    KB</td>
	  
	  </tr>

	<tr>

	  <th style="width:12em;">允许附件类型</th>

	  <td><input name="global_attach_suffix" type="text" value="<?php echo ($vo["global_attach_suffix"]); ?>" size="50" />

	    请用 ，隔开</td>

	  </tr>

	<tr>

	  <th style="width:12em;">全局(缩略图)</th>

	  <td><select name="global_thumb_status" id="global_thumb_status">

	    <option value="1" <?php echo (selected($vo["global_thumb_status"],1)); ?>>开启</option>

	    <option value="0" <?php echo (selected($vo["global_thumb_status"],0)); ?>>关闭</option>

	    </select>	    <input name="global_thumb_size" type="text" id="global_thumb_size" value="<?php echo ($vo["global_thumb_size"]); ?>" size="20" />

	    宽,高(像素)</td>

	  </tr>

	</table>

	<br />

	

	<div class="title" id="uch">

			<a name="seo" id="seo"></a>

			<h3>优化设置</h3>



	</div>

	<table id="maintable" class="formtable">

	<tr>
	  
	  <th width="192" height="30" style="width:12em;">标题附加字</th>
	  
	  <td width="694"><input type="text" name="seo_title" value="<?php echo ($vo["seo_title"]); ?>" size="50" ></td>
	  
	  </tr>

	<tr>

		<th style="width:12em;">seo_keyword</th>

		<td><input name="seo_keyword" type="text"  id="seo_keyword" value="<?php echo ($vo["seo_keyword"]); ?>" size="50" /></td>

	</tr>

	<tr>
	  <th style="width:12em;">seo_description</th>
	  <td><textarea name="seo_description" cols="50" rows="5" class="area"  id="seo_description"><?php echo ($vo["seo_description"]); ?></textarea></td>
	  </tr>
	<tr>

		<th style="width:12em;">编辑 robots.txt</th>

		<td><textarea name="robots" cols="50" rows="5" class="area"  id="robots"><?php echo ($vo["robots"]); ?></textarea></td>

	</tr>

	

	

	</table>

    <div class="title" id="uch">

			<a name="seo" id="seo"></a>

		  <h3>stmp发送模块设置</h3>



	</div>

    <table id="maintable2" class="formtable">

      <tr>

        <th width="192" height="30" style="width:12em;">SMPT服务器</th>

        <td width="694"><input type="text" name="smtpserver" value="<?php echo ($vo["smtpserver"]); ?>" size="50" ></td>

      </tr>

      <tr>

        <th style="width:12em;">SMPT端口</th>

        <td><input name="smtpport" type="text"  id="smtpport" value="<?php echo ($vo["smtpport"]); ?>" size="50" /></td>

      </tr>

      <tr>

        <th style="width:12em;">是否开启身份验证</th>

        <td><select name="smtpyz" id="smtpyz">

          <option value="1"<?php echo (selected($vo["smtpyz"],1)); ?>>是</option>

          <option value="0"<?php echo (selected($vo["smtpyz"],0)); ?>> 否</option>

        </select></td>

      </tr>

      <tr>

        <th style="width:12em;">发件地址</th>

        <td><input name="smtpmail" type="text"  id="smtpmail" value="<?php echo ($vo["smtpmail"]); ?>" size="50" /></td>

      </tr>

      <tr>

        <th style="width:12em;">发件用户名</th>

        <td><input name="smtpuser" type="text"  id="smtpuser" value="<?php echo ($vo["smtpuser"]); ?>" size="50" /></td>

      </tr>

      <tr>

        <th style="width:12em;">发件邮箱密码</th>

        <td><input name="smtppass" type="text"  id="smtppass" value="<?php echo ($vo["smtppass"]); ?>" size="50" /></td>

      </tr>

      <tr>

        <th style="width:12em;">&nbsp;</th>

        <td>&nbsp;</td>

      </tr>

    </table>

	</div>

	

	<div class="foot_action">

			<input type="submit" name="submit" value="提交更新" class="submit" id="submit">

        <input type="reset" name="button" id="button" value="还原重填" class="submit"/>

        <input name="id" type="hidden" id="id" value="1" />

	</div>

	

	</form>

</div>

</div>



<div class="side">

		<div class="block style1">

		<h2><div class="set">常规设置</div></h2>

		<ul class="folder">

        <li class="Index"> <a href="<?php echo U('Index/index');?>">后台首页</a></li>

		<li class="Config"><a href="<?php echo U("Config/index");?>">系统配置</a></li>

        <li class="Module"><a href="<?php echo U("Module/index");?>">系统模块</a></li>

        <li class="Theme"><a href="<?php echo U("Theme/index");?>">风格模板</a></li>

        <li class="Admin"><a href="<?php echo U("Admin/index");?>">管理员管理</a></li>

        <li class="AdminRole"><a href="<?php echo U("AdminRole/index");?>">角色管理</a></li>

		</ul>

	</div>



	<div class="block style1">

		<h2><div class="mod">模块管理</div></h2>

		<ul class="folder">

          <?php if(is_array($leftBar)): $i = 0; $__LIST__ = $leftBar;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$lb): $mod = ($i % 2 );++$i;?><li class="<?php echo ($lb['module_name']); ?>"><a href='<?php echo U($lb['module_name']."/index");?>'><?php echo ($lb["module_title"]); ?></a>

                

                </li><?php endforeach; endif; else: echo "" ;endif; ?>

		</ul>

	</div>

	



	<div class="block style1">

		<h2><div class="gaoji">高级应用</div></h2>

		<ul class="folder">

        <li class="Tools"><a href="<?php echo U("Tools/index");?>">工具箱</a></li>

        <li class="Label"><a href="<?php echo U("Label/index");?>">数据调用</a></li>

        

   <?php if($jingtai==1){ ?>

        <li class="Html"><a href="<?php echo U("Html/index");?>">生成静态</a></li>

        

        <?php } ?>

     

		<li class="Database"><a href="<?php echo U("Database/index");?>">数据库管理</a></li>

		<li class="AdminLog"><a href="<?php echo U("AdminLog/index");?>">操作日志</a></li>

        <li><a href="http://www.YIGECMS.cn/manual.php" target="_blank">帮助中心</a></li>

		</ul>

	</div>



</div>



</div>
<div id="footer">
	<p> Copyright 2008-2010 <a href="#" target="_blank"></a>
</p>
</div>
</div>
<script type="text/javascript">
$(function(){ 
    $(".<?php echo ($moduleName); ?>").addClass("active");
    $(".confirmSubmit").click(function() {
        return confirm('本操作不可恢复，确定继续？');
    });
}); 
</script>
</body>
</html>