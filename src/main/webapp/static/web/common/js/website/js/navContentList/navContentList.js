$(function(){
    $.initJcTree("/manager/website/navlist/navList/treeContData");
    initEdit();
});

function initEdit(){
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form()
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate;

        //创建一个编辑器
        var editIndex = layedit.build('news_content', {
            height: 500,
            uploadImage: {
                url: '/admin/upload' //图片接口url
            }
        });
    });
}

function doClean(){
    $("#title").val("");
    $("#news_content").text("");
    $("#navId").val("");
}

//function doSearch(id){
//    $.ajax({
//        type: "post",
//        url: "/manager/website/navlist/navList/content?id="+id,
//        dataType: "json",
//        success: function(result){
//            $("#title").val(result.title);
//            $("#news_content").val(result.contenr);
//            $("#navId").val(result.navId);
//
//            var editIndex = layedit.build('news_content', {
//                uploadImage: {
//                    url: '/admin/editUpload' //图片接口url
//                }
//            });
//        }
//    });
//}




