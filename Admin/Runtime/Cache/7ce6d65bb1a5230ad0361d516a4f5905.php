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
<style>
div.lanmu { margin-top:20px;}
.kuai h3{ padding-left:10px; height:30px; line-height:30px; border-bottom:1px solid #ddd; background: -webkit-gradient(linear, 0 0, 0 100%, from(#FFFFFF), to(#F5F5F5));
background: -moz-linear-gradient(top, #FFFFFF, #F5F5F5); color:#666;}

.kuai{ float:left; width:230px; border:1px solid #ddd; margin-right:10px; padding-bottom:10px;}
.kuai table{ margin:6px;}
.cl{ clear:both;}
.bb{ line-height:24px; height:25px; border-radius:1px; width:80px; color:#666; font-size:12px; text-align:center; _background:#f7f7f7; border:1px solid #ccc;
background: -webkit-gradient(linear, 0 0, 0 100%, from(#FFFFFF), to(#F2F2F2));
background: -moz-linear-gradient(top, #FFFFFF, #F2F2F2);

}

.bb:hover{ border:1px dashed #666;}
</style>
<script type="text/javascript">

 function getItem() {
        var selectRow = Array();
        var obj = document.getElementsByName('module');
        var result = '';
        var j = 0;
        for (var i = 0; i < obj.length; i++) {
            if (obj[i].checked == true) {
                selectRow[j] = i + 1;
                result += obj[i].value + ",";
                j++;
            }
        }
        return result.substring(0, result.length - 1);
    }



 function getItem1() {
        var selectRow = Array();
        var obj = document.getElementsByName('cat');
        var result = '';
        var j = 0;
        for (var i = 0; i < obj.length; i++) {
            if (obj[i].checked == true) {
                selectRow[j] = i + 1;
                result += obj[i].value;
                j++;
            }
        }
        return result.substring(0, result.length - 1);
    }

function getItem2() {
        var selectRow = Array();
        var obj = document.getElementsByName('module2');
        var result = '';
        var j = 0;
        for (var i = 0; i < obj.length; i++) {
            if (obj[i].checked == true) {
                selectRow[j] = i + 1;
                result += obj[i].value+ ",";
                j++;
            }
        }
        return result.substring(0, result.length - 1);
    }









function shengcheng(p,mod){
	
$('#mbox').show(0);
if(p==""){p=1;}

else(p=p);

    // alert(mod);               

  $.ajax({   

     type:"GET",   

 url:"<?php echo U('Html/dohtml');?>",

 data:{page:p,mod:mod},   

 beforeSend:function(){

 $("#msg").html("正在生成"); 

 },                

 success:function(data){

$("#msg1").html(data);//调试信息
//return false;
 back_arr=eval("("+data+")");

 



 //返回json数据

//赋值给提示元素
                    $("#msg").before("正在生成"+back_arr.content+"<br/>"); 
                    $("#msg").before("正在生成第"+back_arr.ppage+"页<br/>"); 
                    $("#mbox").scrollTop(9999);
					
					
if(parseInt(back_arr.ppage)==parseInt(back_arr.Page_cont)  || back_arr.Page_cont == 0 )

{

$("#bb").attr("value","生成完毕");
setTimeout("$('#mbox').hide(0)",4000);

$("#bb").attr("disabled","");//执行中放置点击按钮
return false;
}

else

{

$("#bb").attr("disabled","disabled");//执行中防止点击按钮 

setTimeout(function(){
	
	shengcheng(parseInt(back_arr.ppage)+1,mod);
	
	},100);

}

      }

 

      });


 //document.write("执行了");

};








function shenglanmu(p,mod){
	
$('#mbox1').show(0);
if(p==""){p=1;}

else(p=p);

                   

  $.ajax({   

     type:"GET",   

 url:"<?php echo U('Html/docat');?>",

 data:{page:p,mod:getItem1()},   

 beforeSend:function(){

 $("#msg1").html("正在生成"); 

 },                

 success:function(data){

$("#msg1").html(data);//调试信息

 }
 

      });


 //document.write("执行了");

};










$(document).ready(function(){


$("#bb").click(function(){



 var selectRow = Array();
        var obj = document.getElementsByName('module');
        var result = '';
		
		for(var i=0;i<obj.length;i++){
			
			if (obj[i].checked == true) {
                
          //  alert(obj[i].value);
			
			shengcheng(1,obj[i].value);
			}
			
			
			
			}


});

$("#bb1").click(function(){

shenglanmu(1);


});

$('#quan').click(function(e) {
    if($('.lanmu input:checkbox').attr('checked') != true){
	$('.lanmu input:checkbox').attr('checked','checked');
	
	//alert(getItem1());
	}
	else
	{
	$('.lanmu input:checkbox').attr('checked',false);	
	}
	
});



$('#quan2').click(function(e) {
    if($('.jingtai .xiangxi input:checkbox').attr('checked') != true){
	$('.jingtai .xiangxi input:checkbox').attr('checked','checked');
	
	
	}
	else
	{
	$('.jingtai input:checkbox').attr('checked',false);	
	}
	
});


$('#quan3').click(function(e) {
    if($('.jingtai  .mokuai input:checkbox').attr('checked') != true){
	$('.jingtai .mokuai input:checkbox').attr('checked','checked');
	
	
	}
	else
	{
	$('.jingtai input:checkbox').attr('checked',false);	
	}
	
});

//生成栏目首页

$('#bb2').click(function(e) {
    
	$.ajax({   

     type:"GET",   

 url:"<?php echo U('Html/doIndex');?>",

 data:{mod:getItem2()},   

 beforeSend:function(){

 $("#msg2").html("正在生成..."); 

 },                

 success:function(data){
if(data=='ok'){
$("#msg2").html('首页姐模块首页生成完毕');//调试信息
}
else{
	$("#msg2").html(data);//调试信息
	
	}
 }
 });
	
});

});

</script>

<style>
.maininner{}.bb1 {line-height:24px; height:25px; border-radius:1px; width:80px; color:#666; font-size:12px; text-align:center; _background:#f7f7f7; border:1px solid #ccc;
background: -webkit-gradient(linear, 0 0, 0 100%, from(#FFFFFF), to(#F2F2F2));
background: -moz-linear-gradient(top, #FFFFFF, #F2F2F2);
}
</style>
<div class="mainarea">
	<div class="maininner">
	  <div class="body_content" style="padding:15px; padding-top:0px">
			<div class="title">
			  <h3>静态页面生成</h3></div>
			
<div class="jingtai">
<div class="kuai mokuai">
<h3>生产模块首页</h3>
<table id="mokuai">
<tr>
<td width="38" height="32" align="center"><input type="checkbox" name="module2" id="module[]"  value="Index"/></td><td width="149"><label>网站首页</label></td>
</tr>
<?php if(is_array($mod_array)): $i = 0; $__LIST__ = $mod_array;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
<td width="38" height="32" align="center"><input type="checkbox" name="module2" id="module[]"  value="<?php echo ($vo['name']); ?>"/></td><td width="149"><label><?php echo ($vo['title']); ?></label></td></tr><?php endforeach; endif; else: echo "" ;endif; ?>


</table>
<div style="height:1px; clear:both; border-top:1px solid #ddd"></div> 
<table width="156">
  <tr>
    <td width="22" align="center" valign="middle"><input type="checkbox" id="quan3" /></td>
    <td width="35">全选</td>
    <td width="83"><input class="bb1" type="button" id="bb2" value="生成模块主页"/></td>
  </tr>
</table><div id="msg2" style="padding:10px; color:#0C0"></div>
</div>

<div class="kuai xiangxi">
<h3>生产模块文章</h3>
<table id="mokuai">

<?php if(is_array($mod_array)): $i = 0; $__LIST__ = $mod_array;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
<td width="38" height="32" align="center"><input type="checkbox" name="module" id="module[]"  value="<?php echo ($vo['name']); ?>"/></td><td width="149"><label><?php echo ($vo['title']); ?></label></td></tr><?php endforeach; endif; else: echo "" ;endif; ?>


</table>
<div style="height:1px; clear:both;border-top:1px solid #ddd""></div> 
<table width="156">
  <tr>
    <td width="22" align="center" valign="middle"><input type="checkbox" id="quan2" /></td>
    <td width="35">全选</td>
    <td width="83"><input class="bb1" type="button" id="bb" value="生成详细"/></td>
  </tr>
</table>
</div>
<div class="cl"></div>
<div id='mbox' style="height:300px; overflow:auto; border:1px solid #CCC; display:none">
  <div id="msg"></div>
</div>
<div id="msg1"></div>
</div>

<div class="lanmu">






<?php if(is_array($mod_array)): $i = 0; $__LIST__ = $mod_array;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; endforeach; endif; else: echo "" ;endif; ?>
<div class="cl"></div>

<div class="mbox1">
<span id="msg1"></span>
</div>

<table cellspacing="0" cellpadding="0" id="maintable" class="formtable" style="border:1px solid #ddd; margin:0px;">
            <tr>
              <th width="30" style="width:30px">&nbsp;</th>
              <th width="336">名称</th>
             
              <th width="164" style="width:15%">录入时间</th>
              
            </tr>
            <?php if(isset($dataList)): if(is_array($dataList)): $i = 0; $__LIST__ = $dataList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr style="<?php echo (bgstyle($vo["parent_id"],0,'background:#F7F7F7; margin-left:-30px; font-weight:bold;vertical-align:middle')); ?>">
                <td align="center"><?php if($vo['parent_id'] != 0): ?><input type="checkbox" name="cat" id="cat[]"  value="<?php echo ($vo["title"]); ?>,<?php echo ($vo["md"]); ?>,<?php echo ($vo["biaozhi"]); ?>,<?php echo ($vo["id"]); ?>|"/><?php endif; ?></td>
                <td align="left"><?php echo ($vo["str_repeat"]); echo ($vo["title"]); ?> <?php echo (statusicon($vo["status"],1,$frontUrl,'hidden.gif','隐藏')); ?> <?php echo (statusicon($vo["protected"],1,$frontUrl,'lock.gif','保护中')); ?></td>
              
                <td><?php echo (date("Y-m-d",$vo["create_time"])); ?></td>
               
              </tr><?php endforeach; endif; else: echo "" ;endif; ?> 
            <?php else: ?>
            <td colspan="5" style="color:#F00; font-weight:bold">暂无数据</td><?php endif; ?>
          </table>
</div>
<div style="height:20px; clear:both;"></div> 
<table width="156">
<tr>
<td width="22" align="center" valign="middle">
<input type="checkbox" id="quan" /></td><td width="35">全选</td>
<td width="83"><input class="bb" type="button" id="bb1" value="生成栏目"/></td>
</tr>
</table>
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


<div id="haha"></div>