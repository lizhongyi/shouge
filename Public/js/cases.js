// JavaScript Document

var ajaxkey = true;
var allHeight = [];
var pageindex = 1, colCount = 0;

//�洢��ʼ��������������λ��
var innerIndex = 0;

//�ٲ���������
//outer ����Ԫ�ء�inner �Ӽ�Ԫ�أ�style ��ʽ(1/2)
function pinterest(outer, inner, style) {
    if (innerIndex == 0) setWidthHeight(outer, inner);
    var start = 0;
    if (innerIndex > 0) start = innerIndex + 1;

    for (var i = start; i < $(inner).length; i++) {
        $(inner).eq(i).show();
        if (i < colCount) {
            allHeight[i] = $(inner).eq(i).outerHeight();
        } else {
            var minHeight = Math.min.apply({}, allHeight);
            var minIndex = getMinHeightIndex(minHeight);
            getStyle($(inner).eq(i), minHeight, minIndex * $(inner).eq(i).outerWidth(), i, style);
            allHeight[minIndex] += $(inner).eq(i).outerHeight();
        }
    }

    //�����ٲ����߶�
    var maxHeight = Math.max.apply({}, allHeight);
    $(outer).height(maxHeight);
}

//�����ٲ������
function setWidthHeight(outer, inner) {
    //�����������Ȼ����ʾ���е�����
    var innerWidth = $(inner).outerWidth();
    if (isNull(innerWidth)) {
        innerWidth = 242;
        $("div.final").css("background", "url(/images/panel.gif) no-repeat 0px -790px").show();
    }
    colCount = Math.floor($(document.body).width() / innerWidth);

    //�����ٲ������
    var outerWidth = colCount * innerWidth;
    $(outer).width(outerWidth);

    //��������������
    $(".search").width(outerWidth - 40);
    $(".search dl dd").width($(".search").width() - $(".search dl dt").outerWidth());
    $(".search dl:last").css("border", "none");
    $(".search").show();

    var height = 0;
    for (var i = 0; i < $(".search dl").length; i++) height += $(".search dl:eq(" + i + ")").outerHeight();
    $(".search").height(height);
}

//��ȡ�߶���С���е�����
function getMinHeightIndex(minHeight) {
    for (index in allHeight) {
        if (allHeight[index] == minHeight) return index;
    }
}

//��ȡĿ¼�����ķ���
function getDirParam(key) {
    var url = new String(document.location);
    var firstpageUrl = window.location.host + "/cases/";
    var index = url.indexOf("/cases/search/");

    if (index > 0 && key == "search") {
        return decodeURIComponent(url.substring(index + 8, url.length - 1));
    }
    else {
        index = url.indexOf(firstpageUrl);
        url = url.substr(index + firstpageUrl.length);

        var arr = url.split("/");
        for (i = 0; i < arr.length; i++) {
            if (arr[i].indexOf(key + "-") >= 0)
                return arr[i].substr(key.length + 1);
        }
    }

    return "";
}

//�������ݵķ���
function getData() {
    ajaxkey = false;
    $("div.loading").show();

    $.ajax({
        type: "get",
        url: "/ajax/getCaseList.ashx",
        data: { section: pageindex, keys: escape(getDirParam("search")), topic: getDirParam("topic"), date1: getDirParam("year"), color: getDirParam("color"), trade: getDirParam("trade"), rnd: getRnd() },
        dataType: "json",
        success: function(data) {
            $("div.loading").hide();
            if (data.length == 0) { $("div.final").show(); return; }

            var outer = $("div.cases ul");
            for (i in data) {
                var inner = $("<li><i></i><div><a href=\"" + data[i].url + "\" target=\"_blank\"><img src=\"" + data[i].src + "\" height=\"" + data[i].height + "\" /></a><h3><a href=\"" + data[i].url + "\" target=\"_blank\">" + data[i].title + "</a></h3><h4>" + data[i].summary + "</h4></div><u></u></li>");
                outer.append(inner);
            }

            pageindex++;
            pinterest("div.cases ul", "div.cases ul li", 1);
            ajaxkey = true;
        }
    });
}

//�ж��������ݵĿ���
function getDataCheck() {
    var inner = $("div.cases ul li");
    var lastboxHeight = $(inner[inner.length - 1]).offset().top + Math.floor($(inner[inner.length - 1]).outerHeight() / 2);
    var documentHeight = $(window).height();
    var scrollTop = $(document).scrollTop();
    return lastboxHeight < documentHeight + scrollTop ? true : false;
}

//�����������ݼ��ص���ʽ
function getStyle(inner, top, left, index, style) {
    if (innerIndex >= index) {
        return;
    }
    inner.css("position", "absolute");
    switch (style) {
        case 1:
            inner.css({
                "top": top + $(window).height(),
                "left": left
            });
            inner.stop().animate({
                "top": top,
                "left": left
            }, 999);
            break;
        case 2:
            inner.css({
                "top": top,
                "left": left,
                "opacity": "0"
            });
            inner.stop().animate({
                "opacity": "1"
            }, 999);
    }
    innerIndex = index;
}


//��󻯴���
if (window.screen) {
    var myw = screen.availWidth;
    var myh = screen.availHeight;
    window.moveTo(0, 0);
    window.resizeTo(myw, myh);
}

//��������
pinterest("div.cases ul", "div.cases ul li", 1);

$(window).scroll(function() {
    if (ajaxkey && getDataCheck()) {
        getData("div.cases ul", "div.cases ul li"); //Ajax�첽��������
    };
});