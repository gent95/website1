/*原始图片上传*/
layui.use('upload', function () {
    layui.upload({
        url: '/admin/upload'
        , elem: '#img_file_pic'
        , method: 'post'
        , success: function (res) {
            if (res.flag == 0) {
                alert("上传失败");
            } else {
                img.src = res.url;
                $(".picImgPath").val(res.url);
            }
        }
    });
});
var _htm = "<img id='pic_img' src='/static/images/default/default.png' style='border-radius: 100%'> <div class='img_btns' > <input type='file' name='file' id='img_file_pic'><input type='hidden'  class='picImgPath' name='picPath'> </div>";

$(function () {
    var picPath = $(".default-pic_img").attr("src");
    $(".img_uploads").append(_htm);
    /*图片回显*/
    if (picPath == "") {
        $("#pic_img").attr("src", "/static/images/default/default.png");
    } else {
        $("#pic_img").attr("src", picPath);
        $(".picImgPath").val(picPath);
    }

});





