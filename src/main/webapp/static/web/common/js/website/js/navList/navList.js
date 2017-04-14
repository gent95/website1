$(function(){
    $(".img-nav").each(function(){
        var img = $(this).text();
        if(img != "" && img != null ){
            $(this).html("<img src='"+img+"' style='width: 80px;height: 50px'>")
        }
    })
})