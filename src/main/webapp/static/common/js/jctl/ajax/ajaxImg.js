
host = window.location.host;
var static = host+"/static";

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
var _htm = "<img id='img' src='"+static+"/images/default/default.png' style='border-radius: 100%'> <div class='img_btn' > <input type='file' name='file' id='img_file'><input type='hidden'  class='imgPath' name='picPath'> </div>";
$(function () {
    $(".img_upload").append(_htm);
})





