<?php
/** 
* cms.config.php
*
* @package      	YIGECMS_Corp
* @author   
* @copyright  Copyright (c) 2008-2010  (http://www.YIGECMS.cn)
* @license    http://www.YIGECMS.cn/license.txt
*/

if (!defined('YIGECMS')) exit();

return array(
    'site_name' => '上海代收社保网',
    'site_url' => 'shebao.com',
    'email' => '',
    'contact_name' => '',
    'company_name' => '上海代收社保网',
    'address' => '北京市海淀区',
    'telephone' => '',
    'fax' => '',
    'mobile_telephone' => '',
    'qq' => '',
    'msn' => '',
    'other_im' => '',
    'icp' => '',
    'web_status' => 0,
    'status_description' => '<script>
$(function(){
	/*
	 * 皮肤编号 lrkf_blue1 无图版，lrkf_blue2 图片版，更多皮肤敬请期待 懒人qq客服 - http://www.51xuediannao.com/qqkefu/
	 * 参数配置参考正文中的参数配置说明
	*/
	$(\'#lrkfwarp\').lrkf({
		kftop:\'140\',
		defshow:false,
		Event:\'hover\',
		qqs:[
			{\'name\':\'　客服1\',\'qq\':\'304869866\'},			//注意逗号是英文的逗号
			{\'name\':\'　客服2\',\'qq\':\'2532450507\'},
			{\'name\':\'　客服3\',\'qq\':\'304869866\'},
			{\'name\':\'　客服3\',\'qq\':\'2532450507\'}
					//注意最后一个{}不要英文逗号
		],
		tel:[
			{\'name\':\'电话\',\'tel\':\'15000266097\'},		//注意逗号是英文的逗号
			{\'name\':\'热线\',\'tel\':\'13918340537\'}
		],
					//>>更多方式		
	});
		
});
</script>',
    'header_content' => '',
    'footer_content' => '地址：上海市闵行区莘庄碧秀路98弄6号1401
交通路线：地铁一号线莘庄站北出口走路5分钟就到
电话：021-51602273；021-51088951
传真：021-51992272
客服QQ：304869866 QQ：2532450507
紧急联系：15000266097 13918340537',
    'sys_log' => 1,
    'sys_log_ext' => 'index,delete,modify,insert,update,login',
    'run_system' => 'window,linux',
    'watermark_status' => 0,
    'watermark_size' => 500,
    'global_attach_size' => 3000000,
    'global_attach_suffix' => 'jpg,gif,bmp,png,doc,docx,rar,7z,zip,png,swf,xls,pdf,',
    'global_thumb_status' => 1,
    'global_thumb_size' => '500,220',
    'seo_title' => '这是我们的关键字',
    'seo_keyword' => '上海代缴社保  上海代缴公积金  上海代交个税上海代办居住证上海补交公积金上海补交社保',
    'seo_description' => '上海社保代缴公司提供：上海代缴社保  上海代缴公积金  上海代交个税上海代办居住证上海补交公积金上海补交社保 公司等服务。',
    'robots' => '不要那啥好吧',
    'smtpserver' => 'smtp.qq.com',
    'smtpport' => 25,
    'smtpyz' => 1,
    'smtpmail' => '165256676@qq.com',
    'smtpuser' => 165256676,
    'smtppass' => 'jjj',
);