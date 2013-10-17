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
  <div class="block style4">
		
		<table cellspacing="3" cellpadding="3">
		<tr>
		 <th align="center" style="width:50px"><a href="http://www.YIGECMS.cn/manual.php?app=shuguangCorp&module=<?php echo ($moduleName); ?>" target="_blank"><img src="__PUBLIC__/Admin/help_1.gif" alt="" align="absmiddle" /><br />
帮助</a></th>
		  <td valign="top">文件、目录名称只能为英文字母或数字且长度为26个字符以内，不能包含中文</td>
		  </tr>
		</table>
	</div>
  
    <div class="body_content">
      <div class="top_action"> <span style="float:left"><a href="<?php echo U('Theme/template');?>">模板管理</a><a href="<?php echo U('Theme/index');?>">风格选择</a></span><span style="float:right">
        <select name="theme" id="theme" onchange="MM_jumpMenu('parent',this,0)">
          <option value="<?php echo U('Theme/template');?>">风格列表</option>
          <?php if(is_array($themeList)): $i = 0; $__LIST__ = $themeList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value="<?php echo U('Theme/template', array('theme'=>$vo));?>"><?php echo ($vo); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
        </select>　　
        </span>
<script type="text/javascript">
	$("#theme").val('<?php echo ($theme); ?>');
</script>
      </div>
      <table cellspacing="0" cellpadding="0" id="maintable" class="formtable" style="clear:both">
        <tr>
          <th class="th-id" style="width:50px">　</th>
          <th>模块</th>
          <th style="width:20%">操作</th>
        </tr>
        <?php if(isset($fileList)): if(is_array($fileList)): $k = 0; $__LIST__ = $fileList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($k % 2 );++$k;?><tr>
              <td><img src="__PUBLIC__/Admin/folder.gif" alt="打开文件夹" align="absmiddle"/></td>
              <td><?php echo ($vo["fileName"]); ?></td>
              <td><a href="<?php echo U('Theme/templateInsert', array('folder' => base64_encode($folder.$vo['fileName'])));?>"><img src="__PUBLIC__/Admin/insert.gif" alt="创建文件" border="0" align="absmiddle"/></a>　<a href="<?php echo U('Theme/doCommand', array('operate'=>'dirDelete', 'dirPath'=>base64_encode($folder.$vo['fileName'])));?>" onclick="return confirm('确定删除吗，此操作会删除此文件夹及文件且不可恢复');"><img src="__PUBLIC__/Admin/delete.gif" alt="删除" border="0" align="absmiddle" /></a></td>
            </tr>
            <?php if(is_array($vo["subFileList"])): $subKey = 0; $__LIST__ = $vo["subFileList"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$subFile): $mod = ($subKey % 2 );++$subKey;?><tr>
                <td></td>
                <td><?php echo ($subFile); ?></td>
                <td><a href="<?php echo U('Theme/templateModify', array('file'=>base64_encode($folder.$vo['fileName'].'/'.$subFile)));?>"><img src="__PUBLIC__/Admin/modify22px.gif" alt="编辑" border="0" align="absmiddle" /></a>　<a href="<?php echo U('Theme/doCommand', array('operate'=>'deleteTemplate', 'fileName'=>base64_encode($folder.$vo['fileName'].'/'.$subFile)));?>" onclick="return confirm('确定删除吗，此操作不可恢复');"><img src="__PUBLIC__/Admin/delete_page.gif" alt="删除" border="0" align="absmiddle" /></a></td>
              </tr><?php endforeach; endif; else: echo "" ;endif; endforeach; endif; else: echo "" ;endif; ?>
          <?php else: ?>
          <tr >
            <td colspan="3" style="text-align:center; color:#F00">当前风格 <?php echo ($theme); ?> 无模板文件</td>
          </tr><?php endif; ?>
      </table>
    </div>

   <div class="body_content" style="margin-top:20px">

   <form action="<?php echo U("Theme/themeCreateFolder");?>" method="post" enctype="multipart/form-data" name="upload" id="upload" onsubmit="return checkFile()">
        <table  border="0" cellspacing="0" cellpadding="0" >
          <tr>
            <td>风格:<span style="color:#F00; font-weight:bold"><?php echo ($theme); ?></span> 创建文件夹:   </td>
            <td>
              <input name="folderName" type="text" id="folderName" size="15" maxlength="20" />
              <input name="folderPath" type="hidden" id="folderPath" value="<?php echo (base64_encode($folder)); ?>" />
<input type="submit" name="button" id="button" value="提交操作" /> 
首字母大写</td>
          </tr>
        </table>
   </form>
    </div>
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