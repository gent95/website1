

(function ($) {
$.fn.extend({
    /**
     * 判断是否存在方法
     * @param funOrFunName
     * @returns {boolean}
     */
    isJCFunction:function(funOrFunName) {
        if (null != funOrFunName && funOrFunName !=undefined && (funOrFunName instanceof Function || (window[funOrFunName] !=undefined && eval(funOrFunName) instanceof Function))) {
            return true ;
        }else{
            return false ;
        }
    },
    /**
     * 判断是否json对象
     * @param jsonStr
     * @returns {boolean}
     */
    isJson:function(jsonStr){

        if(jsonStr == undefined || null==jsonStr || (typeof jsonStr =="string" &&  ($.trim(jsonStr)=="" || jsonStr=="[object Object]"))){
            return false ;
        }
        if(typeof jsonStr == 'object'){
            jsonStr = $.jsonToStr(jsonStr) ;
        }
        jsonStr = $.trim(jsonStr) ;
        var regularObj = new RegExp("^{.+:.+}$");
        var regularArr = new RegExp("^\\[.+,.+\\]$");
        var replaceOver = jsonStr.replace(regularObj,"").replace(regularArr,"") ;
        if(replaceOver==""){
            if(typeof jsonStr == 'object'){
                return jsonStr ;
            }else{
                try{
                    return $.parseJSON(jsonStr) ;
                }catch(e){
                    return false ;
                }
            }
        }else{
            return false ;
        }
    },


})
})(jQuery)


