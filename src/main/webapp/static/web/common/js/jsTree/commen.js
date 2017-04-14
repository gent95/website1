var open = '<img src="' + ctx + '/images/duihao.png" style="cursor:pointer;" tag="open"/>';
var close = '<img src="' + ctx + '/images/hongdian.png" style="cursor:pointer;" tag="close"/>';
$(function () {
    $(document).on("click", "img[tag]", function () {
        $.busyOpen("操作中...");

        $this_ele = $(this);

        var tag_name = $(this).attr("tag");

        var openFlag = openFlag = (tag_name == "open") ? "0" : "1";

        var id = $(this).parents("tr:eq(0)").hdVal();

        var url = $(this).parents("td:eq(0)").attr("status_url");

        $.fxAjax({
            url: url,
            data: {"id": id, "openFlag": openFlag},
            callback: function (result) {

                if (result.tips.flag) {
                    $.fxAlert(result.tips.msg, true);
                    $this_ele.replaceWith((tag_name == "open") ? close : open);
                } else {
                    $.fxAlert(result.tips.msg, false);
                }
                $.busyClose();
            }
        });
    });
});