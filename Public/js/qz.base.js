// JavaScript Document

//�ж��ַ����Ƿ�Ϊ��
function isNull(str) {
	if(str == null || str == "" || str.length < 1) return true;
	else return false;
}

//������ʽ��֤
//0-20λ��ĸ�����֡��»��ߣ� /^[_a-zA-Z0-9]{0,20}$/
//�۸�/^\d{1,9}(\.\d{1,2})?$/
//ȫ���ģ�/^[\u4E00-\u9FA5]*$/
//�����ʼ���/^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/
//�������룺/^\d{6}$/
function regex(str, expression) {
    if (expression.test(str))
        return true;
    else
        return false;
}

//��ȡ�����
function getRnd()
{
    var rnd = Math.floor(Math.random() * 9999) + 1;
		var mydate = new Date();
    return mydate.getHours().toString() + mydate.getMinutes().toString() + rnd;
}

//��ȡURL����ֵ
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

//��ȡ����������URL
function getUrl()
{
	var url = document.location.href.toLowerCase();
	var pos = url.indexOf("?");
	if(pos > 0) url = url.substring(1, pos);
	return url;
}

//��ȡ��ѡ����ֵ�ķ���
function getCheckGroupValue(name) {
    var vals = "";
    $("[name=" + name + "]:checkbox").each(function() {
        if ($(this).attr("checked")) vals += $(this).val() + ",";
    });
    if (vals.length > 0) vals = vals.substring(0, vals.length - 1);
    return vals;
}

//Ϊ��ѡ���鸳ֵ�ķ���
function setCheckGroupValue(name, vals) {
    if (isNull(vals)) return;
    vals = "," + vals + ",";
    $("[name=" + name + "]:checkbox").each(function() {
        if (vals.indexOf("," + $(this).attr("value") + ",") >= 0 && !$(this).attr("disabled"))
            $(this).attr("checked", true);
    });
}