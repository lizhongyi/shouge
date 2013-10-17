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
<div class="mainarea">
  <div class="maininner">
   <?php if(isset($fileList)): ?><div class="body_content">
      <div class="top_action"> <a href="<?php echo U('Theme/index');?>">风格选择</a> | <a href="<?php echo U('Theme/template');?>">模板管理</a> </div>
      <table cellspacing="0" cellpadding="0" id="maintable" class="formtable">
        <tr>
        <th class="th-id">&nbsp;</th>
          <th style="width:25%; text-align:center">预览图片</th>
          <th>风格名称</th>
          <th style="width:10%">选择模板</th>
        </tr>
       
        <?php if(is_array($fileList)): $i = 0; $__LIST__ = $fileList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
          <td style="text-align:center">
          <?php if(($theme) == $vo["title"]): ?><img src="__PUBLIC__/Admin/home.gif" align="absmiddle" alt="当前正在使用"/><br />
            使用中<?php endif; ?>
          </td>
            <td style="text-align:center; height:130px">
            <ul>
             <li><?php if($vo['thumb'] == ''): ?><img src="__PUBLIC__/Admin/noimage.gif" align="absmiddle" / ><?php else: ?><a href="__ROOT__/<?php echo ($vo["thumb"]); ?>" target="_blank"><img src="__ROOT__/<?php echo ($vo["thumb"]); ?>" width="100" height="130" align="absmiddle" /></a><?php endif; ?> </li>
           <li style=" font-weight:bold"> <?php echo ($vo["title"]); ?></li></ul></td>
            <td>
              <ul>
                <li><span style="color:#390"><?php echo (($vo["dev"])?($vo["dev"]):'N/A'); ?></span></li>
               
            </ul></td>
            <td> <?php if(($theme) != $vo["title"]): ?><a href="<?php echo U('Theme/applyTheme', array('themeName' => $vo['title']));?>"><img src="__PUBLIC__/Admin/refresh.gif" align="absmiddle" alt="应用此风格"/></a><br>应用风格<?php endif; ?></td>
          </tr><?php endforeach; endif; else: echo "" ;endif; ?>
      </table>
      </div>
      
      <?php else: ?>
	<div class="body_content">
		<p>当前没有风格，请通过FTP上传风格后再进行选择。更多风格可通过官方网站下载:<a href="http://www.YIGECMS.cn" target="_blank">http://www.YIGECMS.cn</a></p>
	</div><?php endif; ?>

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