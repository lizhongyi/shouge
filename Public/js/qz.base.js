// JavaScript Document

//判断字符串是否为空
function isNull(str) {
	if(str == null || str == "" || str.length < 1) return true;
	else return false;
}

//正则表达式验证
//0-20位字母、数字、下划线： /^[_a-zA-Z0-9]{0,20}$/
//价格：/^\d{1,9}(\.\d{1,2})?$/
//全中文：/^[\u4E00-\u9FA5]*$/
//电子邮件：/^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/
//邮政编码：/^\d{6}$/
function regex(str, expression) {
    if (expression.test(str))
        return true;
    else
        return false;
}

//获取随机数
function getRnd()
{
    var rnd = Math.floor(Math.random() * 9999) + 1;
		var mydate = new Date();
    return mydate.getHours().toString() + mydate.getMinutes().toString() + rnd;
}

//获取URL参数值
function getQueryValue(key)
{
	var result = "";
	var url = new String(document.location);
	var index = -1;
	var len = key.length;
	
	do{
		index = url.indexOf(key + "\=");
		if (index != -1){
			if ((url.charAt(index - 1) == '?') || (url.charAt(index - 1) == '&')){
				url = url.substr(index);
				break;
			}
			url = url.substr(index + len + 1);
		}
	}
	
	while (index != -1){
		if (index != -1){
			var seperator = url.indexOf("&");
			if (seperator == -1) result = url.substr(len + 1);
			else result = url.substring(len + 1, seperator);
		}
	}
	
	return result;
}

//获取不带参数的URL
function getUrl()
{
	var url = document.location.href.toLowerCase();
	var pos = url.indexOf("?");
	if(pos > 0) url = url.substring(1, pos);
	return url;
}

//获取复选框组值的方法
function getCheckGroupValue(name) {
    var vals = "";
    $("[name=" + name + "]:checkbox").each(function() {
        if ($(this).attr("checked")) vals += $(this).val() + ",";
    });
    if (vals.length > 0) vals = vals.substring(0, vals.length - 1);
    return vals;
}

//为复选框组赋值的方法
function setCheckGroupValue(name, vals) {
    if (isNull(vals)) return;
    vals = "," + vals + ",";
    $("[name=" + name + "]:checkbox").each(function() {
        if (vals.indexOf("," + $(this).attr("value") + ",") >= 0 && !$(this).attr("disabled"))
            $(this).attr("checked", true);
    });
}