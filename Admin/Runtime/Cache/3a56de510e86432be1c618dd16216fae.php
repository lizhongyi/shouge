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
<script language="javascript">
    function formtypeShow(value) {
        if (value == 'text') {
            $('tb_choice').style.display = 'none';
        } else {
            $('tb_choice').style.display = '';
        }
    }
</script>
	
		<form method="post" action="<?php echo U("Module/doModify");?>" id="form" enctype="multipart/form-data">
	
	<div class="body_content">
<div class="top_action"><a href="<?php echo U("Module/index");?>">浏览模块</a> | <a href="<?php echo U("Module/install");?>">安装模块</a></div>
		<table cellspacing="0" cellpadding="0" id="maintable" class="formtable">
		<tr>
		  <th style="width:12em;">中文标识</th>
		<td><input name="module_title" id="module_title" value="<?php echo ($vo["module_title"]); ?>"></td></tr>
		<tr><th>模块名称</th>
		<td><?php echo ($vo["module_name"]); ?></td>
		</tr>
          <tr>
            <th>内置权限</th>
            <td><input name="module_permission" type="text" id="module_permission" size="60" value="<?php echo ($vo["module_permission"]); ?>"/></td>
          </tr>
		<tr>
		  <th>开发者信息</th>
		  <td><?php echo ((strip_tags($vo["developer"]))?(strip_tags($vo["developer"])):' '); ?>&nbsp;</td>
		  </tr>
       
		
		<tr>
		<th>排序</th>
		<td><input name="display_order" value="<?php echo ($vo["display_order"]); ?>" size="5" id="display_order"></td>
		</tr>
        <tr>
          <th style="width:100px">状态</th>
          <td><label>
            <select name="status" id="status">
              <option value="0" <?php echo (selected($vo["status"],0)); ?>>启用</option>
              <option value="1" <?php echo (selected($vo["status"],1)); ?>>禁用</option>
            </select>
          </label></td>
        </tr>
        <tr>
          <th style="width:100px">&nbsp;</th>
          <td><input type="submit" name="submit" value="提交更新" class="submit" id="submit">
        <input type="reset" name="button" id="button" value="还原重填" class="submit"/>
	    <input name="id" type="hidden" id="id" value="<?php echo ($vo["id"]); ?>" />
	</td>
        </tr>
        <tr>
          <th style="width:100px">&nbsp;</th>
          <th>&nbsp;</th>
        </tr>
        <tr style="background:#F5FFF7">
          <th colspan="2">其它信息</th>
          </tr>
        <tr>
          <th style="width:100px">&nbsp;</th>
          <th>此模块包含文件及安装，卸载SQL</th>
        </tr>
        <tr>
            <td style="width:100px">包含文件</td>
            <td>1.控制器 ./Admin/Lib/Action/<?php echo ($vo["module_name"]); ?>Action.class.php<br />
2.模型 ./Admin/Lib/Action/<?php echo ($vo["module_name"]); ?>Model.class.php<br />
3.视图(模板) ./Admin/Tpl/<?php echo ($vo["module_name"]); ?></td>
          </tr>
       <?php if(isset($installSql)): ?><tr>
          <td>表结构(安装)</td>
          <td ><div style="overflow-y:auto;height:100px;"><?php echo (nl2br($installSql)); ?></div></td>
        </tr><?php endif; ?>
       
        <?php if(isset($uninstallSql)): ?><tr>
          <td>表结构(卸载)</td>
          <td><div style="overflow-y:auto;height:100px;"><?php echo (nl2br($uninstallSql)); ?></div></td>
        </tr><?php endif; ?>
		</tbody>
		
		</table>
	</div>
		
	<div class="foot_action" style="display:none">
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