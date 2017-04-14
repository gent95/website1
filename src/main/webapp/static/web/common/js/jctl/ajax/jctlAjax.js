//上传超时时间
var _jcAjaxUploadTimeOut = 30000;
//目前上传等待时间
//var jcAjaxUploadDo;
//ajax上传文件iframe名称
var _jcAjaxUploadFrameName = "jcAjaxUpload";
//文件上传序号
var _jcAjaxUploadFrameNameNum = 0;

//拓展ajax
(function ($) {
    $.fn.extend({
        /**
         * 序列化提交参数
         */
        jcSerialize: function () {
            var data = "";
            $(this).each(function () {
                if ($(this).is('[name]') && !$(this).is('form')) {
                    if ($(this).is(':radio') || $(this).is(':checkbox')) {
                        if ($(this).is(':selected') || $(this).is(':checked')) {
                            data += "&" + $(this).serialize();
                        }
                    } else {
                        data += "&" + $(this).serialize();
                    }
                }
            });
            $(this).find('[name]').each(function () {
                if ($(this).is(':radio') || $(this).is(':checkbox')) {
                    if ($(this).is(':selected') || $(this).is(':checked')) {
                        data += "&" + $(this).serialize();
                    }
                } else {
                    data += "&" + $(this).serialize();
                }
            });
            return $.clearParams(data);
        },
        /**
         * 提交表单指定一个区域下的东西提交
         */
        jcAjax: function (params) {
            var thisElem = $(this);
            var defaultParams = {
                url: "",//提交连接
                type: "post",//'post','get'
                async: true,//false 同步，true 异步
                callback: null//回调方法
            };
            $.extend(defaultParams, params);
            $.ajax({
                // 后台处理程序
                url: defaultParams.url,
                // 数据发送方式
                type: defaultParams.type,
                // 接受数据格式
                dataType: "json",
                // false为同步模式
                async: defaultParams.async,
                // 要传递的数据
                data: thisElem.jcSerialize(),
                // 回传函数
                success: defaultParams.callback || function (result) {
                },
                error: function () {
                    var result = new Object();
                    result['flag'] = 0;
                    if ($.isJCFunction(defaultParams.callback)) {
                        var fun = eval(defaultParams.callback);
                        fun(result);
                    }
                }
            });
        },
        /**
         * 异步上传
         */
        jcAjaxUpload: function (params) {
            var defaultParams = {
                url: "",
                async: false,
                callback: null
            };
            $.extend(defaultParams, params);
            var formElem = $(this);
            if (!formElem.is('form')) {
                return;
            }
            var thisFrameName = _jcAjaxUploadFrameName + _jcAjaxUploadFrameNameNum;
            _jcAjaxUploadFrameNameNum++;
            formElem.attr("enctype", "multipart/form-data");
            formElem.attr('method', 'POST');
            formElem.attr('action', defaultParams.url);
            formElem.attr('target', thisFrameName);
            var frameElem = $('<iframe style ="display:none" name="' + thisFrameName + '"></iframe>');
            $('body').append(frameElem);
            formElem.submit();
            if (null != params.callback) {
                $.jcAjaxUploadResult(params.callback, frameElem);
            }
        },
        //循环读取json结果
        jcAjaxUploadResult: function (callback, frameElem, jcAjaxUploadDo) {
            if (null == jcAjaxUploadDo) {
                jcAjaxUploadDo = 0;
            }
            var frameName = frameElem.attr("name");
            var resultBody = $(window.frames[frameName].document).find('body');
            if (jcAjaxUploadDo >= _jcAjaxUploadTimeOut) {
                frameElem.remove();
                var errObj = {"uploadTimeOutErr": 1, "msg": "上传超时"};
                callback(errObj);
                return;
            } else {
                if (resultBody.is('body') && resultBody.text() != null && $.trim(resultBody.text()) != '') {
                    var outJsonStr = resultBody.text();
                    if ($.isJson(outJsonStr)) {
                        var resultJson = jQuery.parseJSON(outJsonStr);
                        callback(resultJson);
                    } else {
                        var errObj = {"uploadTimeOutErr": 1};
                        errObj.msg = resultBody.html();
                        callback(errObj);
                    }
                    frameElem.remove();
                    return;
                } else {
                    setTimeout(function () {
                        jcAjaxUploadDo += 100;
                        $.jcAjaxUploadResult(callback, frameElem, jcAjaxUploadDo);
                    }, 100);
                }
            }
        },
        /**
         * 全选
         * @param obj
         */
        jcCheckAll:function(obj){
            if($(obj).is(":checked")){
                $("[name=idsCheckbox]").attr("checked",true) ;
            }else{
                $("[name=idsCheckbox]").removeAttr("checked") ;
            }
        }



    })


    $.extend({});


})(jQuery);