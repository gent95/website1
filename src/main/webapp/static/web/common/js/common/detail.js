
//页面加载后执行
$(document).ready(function(){
    /*  //移除页面F图标
     $("#userControl").children("li").first().remove()
     */
    /* //地图
     $(".android").click(function(){
     layer.open({
     title:"Android/App开发工程师",
     type: 2,
     area: ['850PX', '665PX'],
     fixed: false, //不固定
     maxmin: true,
     content:"detail.html"
     });
     });*/
})
function showDetail(obj){
    layer.open({
        title:false,
        type: 2,
        area: ['850PX', '665PX'],
        fixed: true, //不固定
        maxmin: true,
        offset: [180,550],
        content:"/joinus/detail?id="+obj
    });
}






