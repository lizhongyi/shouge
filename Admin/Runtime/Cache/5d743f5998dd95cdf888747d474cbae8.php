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
                title: "标题必须填写",
                content: "内容必须填写",
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
</script>
<style>.ke-icon-loadimg {
				background-image: url(/Public/Js/editor/themes/default/default.gif);
				background-position: 0px -672px;
				width: 16px;
				height: 16px;
			}
			.ke-icon-example2 {
				background-image: url(/Public/Js/editor/themes/default/default.gif);
				background-position: 0px -672px;
				width: 16px;
				height: 16px;
			}</style>
<div class="mainarea">
<div class="maininner">


<form method="post" action="<?php echo U("Article/doInsert");?>" enctype="multipart/form-data" id="mainFrom">
	<div class="body_content">
		<div class="top_action"><a href="__URL__">浏览文章</a> | <a href="<?php echo U("Category/index");?>">分类管理</a></div>
		<table cellspacing="0" cellpadding="0" id="maintable" class="formtable">
		<tr>
		  <th style="width:8em;"><label for="title">文章标题</label></th>
		<td><input name="title" id="title" size="60" ></td></tr>
		
        <tr>
		  <th style="width:8em;">标题样式</th>
		<td><div style=" display:block; float:left" title="点击取颜色" class="color_picker" id="color_picker" onclick="colorPicker()">&nbsp;</div>颜色<input class="input" type="hidden" value="#ffffff" name="style_color" id="style_color" size="10"/>&nbsp;
             <input name="style_bold" type="checkbox" id="style_bold" value="bold" />
             加粗<input name="style_underline" type="checkbox" id="style_underline" value="underline" />
           下划线</td></tr>
        
        <tr>
		  <th style="width:8em;"><label for="category_id">文章类别</label></th>
		<td><select name="category_id"  id="select"  >
                 <?php echo (buildselect($category,$parentId)); ?>
            
                </select></td></tr>
        
        <tr>
		  <th style="width:8em;"><label for="attach_file">文章图片</label></th>
		<td> <input name="attach_file" type="file" id="attach_file" /></td></tr>
          <tr>
		  <th style="width:8em;"><label for="description">内容摘要</label></th>
		<td><textarea name="description" cols="60" rows="5"  id="description"></textarea></td></tr>
        
        <tr>
		  <th style="width:8em;">文章内容</th>
		<td> <span id="msg"></span><span style="cursor:pointer" id="loadimg">远程图片保存</span></td></tr>
        
        <tr>
		  <th colspan="2" >
		   
<textarea name="content" cols="50" rows="4" id="content_1" style="width:720px; height:300px;"><?php echo ($vo["content"]); ?></textarea>


           </th>
		</tr>
        
         <tr>
		  <th colspan="2" style="width:8em;">以下为选填内容</th>
		</tr>
        
         <tr>
           <th style="width:8em;">模　　板</th>
           <td><input name="template" id="template" value="" />没定义请留空，默认为 detail 不需要填写<span style="color:#F00">.html</span></td>
         </tr>
         <tr>
           <th style="width:8em;">标　　签</th>
           <td><input name="tags" id="tags" size="50" />
            标签之间用 ，隔开</td>
         </tr>
         <tr>
		  <th style="width:8em;">关 键 字</th>
		<td><input name="keyword" class="input"id="keyword" size="60"></td></tr>
        
       
         <tr>
		  <th style="width:8em;">外链地址</th>
		<td><input name="link_url" id="link_url" size="60"></td></tr>
        
        <tr>
		  <th style="width:8em;">来　　源</th>
		<td><input name="copy_from" id="copy_from"></td></tr>
        <tr>
		  <th style="width:8em;">来源链接</th>
		<td><input name="from_link" id="from_link" size="60"></td></tr>
        
		<tr>
        <th style="width:8em;">其它参数</th>
		  <td><select name="recommend" id="recommend">
					      <option value="0" selected="selected">默认不推荐</option>
					      <option value="1">推荐</option>
				        </select><select name="status" id="status">
				          <option value="0" selected="selected">默认显示</option>
				          <option value="1">隐藏</option>
                        </select><select name="istop" id="istop">
				          <option value="0">默认不置顶</option>
				          <option value="1">置顶</option>
              </select>浏览
<input name="view_count" type="text" id="view_count" value="0" size="5" maxlength="12"  />
排序
<input name="display_order" type="text" id="display_order" value="0" size="5" maxlength="12"  /></td>
		</tr>
		<tr>
		  <th style="width:8em;">录入时间</th>
		  <td><input name="create_time" type="text" class="Wdate" id="create_time" style="width:160px"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false,readOnly:true,isShowToday:true})" value="<?php echo date('Y-m-d ')?>"/></td>
		  </tr>
		<td></td>
		</tr>
		</tbody>
		</table>
	</div>
	<div class="foot_action">
		<input type="submit" name="submit" value="提交录入" class="submit">
        <input type="reset" name="button" id="button" value="还原重填" class="submit"/>
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