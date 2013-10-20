// JavaScript Document

var ajaxkey = true;
var allHeight = [];
var pageindex = 1, colCount = 0;

//存储开始请求数据条数的位置
var innerIndex = 0;

//瀑布流主方法
//outer 父级元素、inner 子级元素，style 样式(1/2)
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

    //设置瀑布流高度
    var maxHeight = Math.max.apply({}, allHeight);
    $(outer).height(maxHeight);
}

//设置瀑布流宽高
function setWidthHeight(outer, inner) {
    //根据浏览器宽度获得显示的列的数量
    var innerWidth = $(inner).outerWidth();
    if (isNull(innerWidth)) {
        innerWidth = 242;
        $("div.final").css("background", "url(/images/panel.gif) no-repeat 0px -790px").show();
    }
    colCount = Math.floor($(document.body).width() / innerWidth);

    //设置瀑布流宽度
    var outerWidth = colCount * innerWidth;
    $(outer).width(outerWidth);

    //设置搜索区域宽高
    $(".search").width(outerWidth - 40);
    $(".search dl dd").width($(".search").width() - $(".search dl dt").outerWidth());
    $(".search dl:last").css("border", "none");
    $(".search").show();

    var height = 0;
    for (var i = 0; i < $(".search dl").length; i++) height += $(".search dl:eq(" + i + ")").outerHeight();
    $(".search").height(height);
}

//获取高度最小的列的索引
function getMinHeightIndex(minHeight) {
    for (index in allHeight) {
        if (allHeight[index] == minHeight) return index;
    }
}

//获取目录参数的方法
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

//请求数据的方法
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

//判断请求数据的开关
function getDataCheck() {
    var inner = $("div.cases ul li");
    var lastboxHeight = $(inner[inner.length - 1]).offset().top + Math.floor($(inner[inner.length - 1]).outerHeight() / 2);
    var documentHeight = $(window).height();
    var scrollTop = $(document).scrollTop();
    return lastboxHeight < documentHeight + scrollTop ? true : false;
}

//设置请求数据加载的样式
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


//最大化窗口
if (window.screen) {
    var myw = screen.availWidth;
    var myh = screen.availHeight;
    window.moveTo(0, 0);
    window.resizeTo(myw, myh);
}

//加载数据
pinterest("div.cases ul", "div.cases ul li", 1);

$(window).scroll(function() {
    if (ajaxkey && getDataCheck()) {
        getData("div.cases ul", "div.cases ul li"); //Ajax异步加载数据
    };
});