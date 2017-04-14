
var json =[
    {
        "id": "1",
        "icon": "icon-th",
        "name": "地球",
        "child": [
            {
                "id": "2",
                "icon": "icon-minus-sign",
                "name": "美国",
                "child": [
                    {
                        "child": [],
                        "id": "3",
                        "icon": "icon-minus-sign",
                        "name": "中国"
                    },
                    {
                        "child": [],
                        "id": "4",
                        "icon": "icon-minus-sign",
                        "name": "日本"
                    },
                    {
                        "child": [],
                        "id": "5",
                        "icon": "icon-minus-sign",
                        "name": "大阪"
                    },
                    {
                        "child": [],
                        "id": "6",
                        "icon": "icon-minus-sign",
                        "name": "山东"
                    },
                    {
                        "child": [],
                        "id": "7",
                        "icon": "icon-minus-sign",
                        "name": "菏泽"
                    }
                ]
            }
        ]
    }
];
$(function(){
    //$.ajax({
    //    type: "post",
    //    url: "/tree/data1",
    //    dataType: "json",
    //    success: function (data) {
    //        tree(data)
    //    }
    //})
    tree(json);
    $('.tree li:has(ul)').addClass('parent_li').find(' > span').attr('title', '关闭');
    $('.tree li.parent_li > span').on('click', function (e) {
        var children = $(this).parent('li.parent_li').find(' > ul > li');
        if (children.is(":visible")) {
            children.hide('fast');
            $(this).attr('title', '展开').find(' > i').addClass('icon-plus-sign').removeClass('icon-minus-sign');
        } else {
            children.show('fast');
            $(this).attr('title', '关闭').find(' > i').addClass('icon-minus-sign').removeClass('icon-plus-sign');
        }
        e.stopPropagation();
    });
})

function tree(data) {
    for (var i = 0; i < data.length; i++) {
        var data2 = data[i];
        if (data[i].icon == "icon-th") {
            $("#rootUL").append("<li data-name='" + data[i].id + "'><span><i class='" + data[i].icon + "'></i> " + data[i].name + "</span></li>");
        } else {
            var children = $("li[data-name='" + data[i].pid + "']").children("ul");
            if (children.length == 0) {
                $("li[data-name='" + data[i].pid + "']").append("<ul></ul>")
            }
            $("li[data-name='" + data[i].pid + "'] > ul").append("<li data-name='" + data[i].id + "'>" + "<span>" + "<i class='" + data[i].icon + "'></i> " + data[i].name + "</span>" + "</li>")
        }
        for (var j = 0; j < data[i].child.length; j++) {
            var child = data[i].child[j];
            var children = $("li[data-name='" + child.pid + "']").children("ul");
            if (children.length == 0) {
                $("li[data-name='" + child.pid + "']").append("<ul></ul>")
            }
            $("li[data-name='" + child.pid + "'] > ul").append("<li data-name='" + child.id + "'>" + "<span>" + "<i class='" + child.icon + "'></i> " + child.name + "</span>" + "</li>")
            var child2 = data[i].child[j].child;
            tree(child2)
        }
        tree(data[i]);
    }
}

