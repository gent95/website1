var rootPath = "";

$(function () {
    rootPath = getRootPath();
    $.ajax({
        type: "post",
        url: rootPath + "/wapNavList/list",
        dataType: "json",
        success: function (data) {
            initNav(data);
            initHover();
        }
    });
});
/*获取前台路径*/
function getRootPath() {
    var curWwwPath = window.document.location.href;
    var pathName = window.document.location.pathname;
    var pos = curWwwPath.indexOf(pathName);
    var localhostPath = curWwwPath.substring(0, pos);
    if ("localhost".indexOf(localhostPath) || "192.168".indexOf(localhostPath)) {
        return localhostPath;
    }

    var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
    return (localhostPath + projectName);
}

var _htm = "";

//动态拼接导航栏
function initNav(nodes) {
    var html = initFristNav(nodes);
    _htm += html;
    $(".nav-temp").html(_htm);
    //追加显示节点
    var _html = getTowLevelHtml(nodes);
    $(".navigation-down").html(_html);

}

function getTowLevelHtml(data) {
    var _htm = "";
    for (var num in data) {
        var towNodes = data[num].child;
        _htm += "<div id='" + data[num].id + "' class='nav-down-menu menu-1' style='display: none;' _t_nav='" + data[num].id + "'>"
        for (var o in towNodes) {
            if (towNodes[o].child == null || towNodes[o].child == '') {
                _htm += "<div class='navigation-down-inner'><span><a href='" + rootPath + towNodes[o].url + "?navId=" + towNodes[o].id + "'> <p><img class='imgPath' src='" + towNodes[o].picPath + "' onmouseover='overShow(this)' onmouseout='outClose(this)'></p><p>" + towNodes[o].name + "</p> <div style='border-bottom:3px solid #f18a22; width: 26px; margin: 0 auto; margin-bottom: 15px; margin-top: 10px'></div> <p class='alias'>" + towNodes[o].alias + "</p></a> </span>";
                _htm += "<input type='hidden' class='picPath' value='" + towNodes[o].picPath + "'/><input type='hidden' class='picImg' value='" + towNodes[o].picImg + "'/>"
                _htm += " </div>"
            } else {
                var threeNodes = towNodes[o].child;
                _htm += "<div class='navigation-down-inner'><span class='thr'><p >" + towNodes[o].name + "</p>";
                for (var x in threeNodes) {
                    _htm += "<p><a hotrep='hp.header.product.compute1' href='" + rootPath + threeNodes[x].url + "?navId=" + threeNodes[x].id + "'>" + threeNodes[x].name + "</a> </p>";
                }
                _htm += "</span> </div>";
            }

        }
        _htm += "</div>";


    }
    console.log(_htm)
    return _htm;
}


function initFristNav(nodes) {
    var _htm = " <div style='margin-right: 80px; float:left;'><a href='" + rootPath + "'> <img src='" + rootPath + "/static/frontImg/homepage/logo.png'/></a></div>";
    for (var num in nodes) {
        _htm += " <li class='' _t_nav='" + nodes[num].id + "'> <h2> <a href='/'>" + nodes[num].name + "</a> </h2> </li>";
    }
    return _htm;
}

function initHover() {
    var qcloud = {};
    $('[_t_nav]').hover(function () {
        var _nav = $(this).attr('_t_nav');
        clearTimeout(qcloud[_nav + '_timer']);
        qcloud[_nav + '_timer'] = setTimeout(function () {
            $('[_t_nav]').each(function () {
                $(this)[_nav == $(this).attr('_t_nav') ? 'addClass' : 'removeClass']('nav-up-selected');
            });
            $('#' + _nav).stop(true, true).slideDown(200);
        }, 150);
    }, function () {
        var _nav = $(this).attr('_t_nav');
        clearTimeout(qcloud[_nav + '_timer']);
        qcloud[_nav + '_timer'] = setTimeout(function () {
            $('[_t_nav]').removeClass('nav-up-selected');
            $('#' + _nav).stop(true, true).slideUp(200);
        }, 150);
    });
}

function overShow(obj) {
    var en = $(obj).parent().parent().parent().nextAll('input').eq(1).val();
    $(obj).attr("src", en);

}
function outClose(obj) {
    var en = $(obj).parent().parent().parent().nextAll('input').eq(0).val();
    $(obj).attr("src", en);
}