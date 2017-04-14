/*原始图片上传*/
layui.use('upload', function () {
    layui.upload({
        url: '/admin/upload'
        , elem: '#img_file'
        , method: 'post'
        , success: function (res) {
            if (res.flag == 0) {
                alert("上传失败");
            } else {
                img.src = res.url;
                $(".imgPath").val(res.url);
            }
        }
    });
});
var _htm = "<img id='img' src='/static/images/default/default.png' style='border-radius: 100%'> <div class='img_btn' > <input type='file' name='file' id='img_file'><input type='hidden'  class='imgPath' name='picPath'> </div>";

$(function () {
    var picPath = $(".default-pic").attr("src");
    $(".img_upload").append(_htm);
    /*图片回显*/
    if (picPath == "") {
        $("#img").attr("src", "/static/images/default/default.png");
    } else {
        $("#img").attr("src", picPath);
        $(".imgPath").val(picPath);
    }

});





