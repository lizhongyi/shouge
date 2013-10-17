<?php if (!defined('THINK_PATH')) exit();?>
<!doctype html>
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
                title: "required",
                content: "fckeditor",
                number: {
                    required: true,
                    number: true
                },
                end_time: {
                    required: true,
                    dateISO: true
                },
                view_count: {
                    required: true,
                    number: true
                },
                display_order: {
                    required: true,
                    number: true
                }
            },
            messages: {
                title: "招聘产品必须填写",
                content: "详细要求必须填写",
                number: {
                    required: "招聘人数必须填写",
                    number: '招聘人数必须为整数'
                },
                end_time: {
                    required: "结束时间必须填写",
                    dateISO: '结束时间格式不正确'
                },
                view_count: {
                    required: "浏览次数必须填写",
                    number: '浏览次数必须为数字'
                },
                display_order: {
                    required: "排序必须填写",
                    number: '排序必须为数字'
                }
            }
        });
        colorPicker();
    });
</script><div class="mainarea">
<div class="maininner">
<div class="block style4">
  <table cellspacing="3" cellpadding="3">
    <tr>
      <th style="width:50px; text-align:center"><a href="http://www.YIGECMS.cn/manual.php?app=shuguangCorp&module=<?php echo ($moduleName); ?>" target="_blank"><img src="__PUBLIC__/Admin/help_1.gif" alt="" align="absmiddle" /><br />
帮助</a></th>
      <td><li>招聘人数必须填写，若不限制人数，则填写数字0</li>
        <li>基本要求必须填写，简单描述此岗位 </li>
        <li>有效期限类型如果是限时招聘，则需要选择到期时间，否则默认即可</li>
        <li>如果有多个模板文件可自由选择，否则留保持默认</li></td>
    </tr>
  </table>
</div>

<form method="post" action="<?php echo U("Job/doModify");?>" enctype="multipart/form-data" id="mainFrom">
	<div class="body_content">
		<div class="top_action"><a href="__URL__">返回列表</a> | <a href="<?php echo U("Job/insert");?>">录入岗位</a> | <a href="<?php echo U("Job/resume");?>">应聘管理</a></div>
		<table cellspacing="0" cellpadding="0" id="maintable" class="formtable">
		<tr>
		  <th style="width:8em;">岗位名称</th>
		<td><input name="title" id="title" value="<?php echo ($vo["title"]); ?>" size="60"></td></tr>
		<tr>
		  <th style="width:8em;">标题样式</th>
		<td><div style=" display:block; float:left" title="点击取颜色" class="color_picker" id="color_picker" onclick="colorPicker()">&nbsp;</div>颜色<input class="input" type="hidden" value="<?php echo (styleselected($vo["title_style_serialize"],'color')); ?>" name="style_color" id="style_color" size="10"/>&nbsp;
             <input name="style_bold" type="checkbox" id="style_bold" value="bold" <?php echo (styleselected($vo["title_style_serialize"],'bold')); ?>/>
             加粗<input name="style_underline" type="checkbox" id="style_underline" value="underline" <?php echo (styleselected($vo["title_style_serialize"],'underline')); ?>/>
           下划线</td></tr>
        <tr>
		  <th style="width:8em;">招聘人数</th>
		<td><input name="number" type="text"  id="number" value="<?php echo ($vo["number"]); ?>" size="5" />
人</td></tr>
        
        <tr>
		  <th style="width:8em;">有效期限</th>
		<td><select name="time_type" id="time_type">
		  <option value="1" <?php echo (selected($vo["time_type"],1)); ?>>长期招聘</option>
		  <option value="0" <?php echo (selected($vo["time_type"],0)); ?>>限时招聘</option>
		  </select>
		  <input name="end_time" type="text" class="Wdate" id="end_time" style="width:160px"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false,readOnly:true,isShowToday:true,minDate:'<?php echo date('Y-m-d',time())?>'})" value="<?php echo (date("Y-m-d",$vo["end_time"])); ?>"/></td></tr>
        <tr>
          <th style="width:8em;">基本要求</th>
          <td><textarea name="description" cols="60" rows="8"  id="description"><?php echo ($vo["description"]); ?></textarea></td>
        </tr>
       
		  <th style="width:8em;">详细要求</th>
		<td> </td></tr>
        
        <tr>
		  <th colspan="2" >
		  <textarea name="content" cols="50" rows="4" id="content"><?php echo ($vo["content"]); ?></textarea>
<script src="__PUBLIC__/Js/FCKeditor/fckeditor.js"></script>
<script>
	var oFCKeditor = new FCKeditor('content') ;
	oFCKeditor.BasePath = '__PUBLIC__/Js/FCKeditor/';
	oFCKeditor.Width = '100%';
	oFCKeditor.Height = '400';
	oFCKeditor.ToolbarSet = 'Default';
	oFCKeditor.ReplaceTextarea();
</script></th>
		</tr>
        
         <tr>
		  <th colspan="2" style="width:8em;">以下为选填内容</th>
		</tr>
        <tr>
           <th style="width:8em;"><label for="template">模　　板</label></th>
           <td><input name="template" id="template" value="<?php echo ($vo["template"]); ?>" /></td>
         </tr>
        <tr>
           <th style="width:8em;"><label for="tags">标　　签</label></th>
           <td><input name="tags" id="tags" value="<?php echo ($vo["tags"]); ?>" size="60" />
             标签之间用 , 隔开</td>
         </tr>
         <tr>
		  <th style="width:8em;"><label for="keyword">关 键 字</label></th>
		<td><input name="keyword" class="input"id="keyword" value="<?php echo ($vo["keyword"]); ?>" size="60"></td></tr>
        
        
        
         <tr>
		  <th style="width:8em;"><label for="link_url">外链地址</label></th>
		<td><input name="link_url" id="link_url" value="<?php echo ($vo["link_url"]); ?>" size="60"></td></tr>
        
        <tr>
		  <th style="width:8em;"><label for="copy_from">来　　源</label></th>
		<td><input name="copy_from" id="copy_from" value="<?php echo ($vo["copy_from"]); ?>"></td></tr>
        <tr>
		  <th style="width:8em;"><label for="from_link">来源链接</label></th>
		<td><input name="from_link" id="from_link" value="<?php echo ($vo["from_link"]); ?>" size="60"></td></tr>
         <tr>
		  <th style="width:8em;">上传附件</th>
		<td> <input name="attach_file" type="file" id="attach_file" /></td></tr>
		<tr>
		  <th >其它参数</th>
		  <td >
		    <select name="status" id="status">
		      <option value="0" <?php echo (selected($vo["status"],0)); ?>>正常招聘</option>
		      <option value="1" <?php echo (selected($vo["status"],1)); ?>>暂不招聘</option>
		      </select><select name="istop" id="istop">
		        <option value="0" <?php echo (selected($vo["istop"],0)); ?>>默认不置顶</option>
		        <option value="1" <?php echo (selected($vo["istop"],1)); ?>>置顶</option>
		        </select>
		    浏览
		    <input name="view_count" type="text" id="view_count" value="<?php echo ($vo["view_count"]); ?>" size="5" maxlength="12"  />
		    排序
		    <input name="display_order" type="text" id="display_order" value="<?php echo ($vo["display_order"]); ?>" size="5" maxlength="12"  /></td>
		  </tr>
        
		 <tr>
		  <th style="width:8em;"><label for="create_time">录入时间</label></th>
		  <td><input name="create_time" type="text" class="Wdate" id="create_time" style="width:160px"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false,readOnly:true,isShowToday:true})" value="<?php echo (date("Y-m-d",$vo["create_time"])); ?>"/></td>
		  </tr>
		
		<td></td>
		</tr>
		
		</tbody>
		
		</table>
	</div>
	<div class="foot_action">
	<input type="submit" name="submit" value="提交更新" class="submit">
    <input type="reset" name="button" id="button" value="还原重填" class="submit"/>
	<input name="id" type="hidden" id="id" value="<?php echo ($vo["id"]); ?>" />
	<input name="old_file" type="hidden" id="old_file" value="<?php echo ($vo["attach_file"]); ?>" />
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