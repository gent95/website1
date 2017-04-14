<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>导航内容管理</title>
    <meta name="decorator" content="default"/>
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/web/common/js/jsTree/css/style.css"/>
    <script type="text/javascript" src="${ctxStatic}/web/common/js/common/common.js"></script>
    <script type="text/javascript" src="${ctxStatic}/web/common/js/website/js/navContentList/navContentList.js"></script>
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/web/common/js/website/css/navlist/navlist.css"/>
    <link rel="stylesheet" href="${ctxStatic}/web/common/js/layui/css/layui-bootstrap.css" media="all">
    <link rel="stylesheet" href="${ctxStatic}/web/common/js/layui/css/global.css" media="all">
    <script src="${ctxStatic}/web/common/js/layui/layui.js" charset="utf-8"></script>
    <script>
        function doSearch(id){
            $.ajax({
                type: "post",
                url: "/manager/website/navlist/navList/content?id="+id,
                dataType: "json",
                success: function(result){
                    $("#title").val(result.title);
//                    if(result.contenr == null || result.contenr == ""){
                        $("#news_content").text("");
//                    }else {
                        $("#news_content").text(result.contenr);
//                    }
                    $("#navId").val(result.navId);
                    $("#id").val(result.id);
                    initEdit();
                }
            });
        }

    </script>
    <style>
        .layui-input-block {
            margin-left: 10px;
            width: 95%;
        }
    </style>
</head>
<body>
<div class="tree well" style="position: fixed;bottom: 70px;overflow-y: scroll;top: 10px;width:25%;height: 95%;margin: 0;">
    <ul id="jc_tree">
    </ul>
</div>
<div class="content">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;width: 95%">
        <legend>编辑</legend>
    </fieldset>

    <form  method="post" action="${ctx}/website/navcontent/navContent/save">
        <div>
            <label style="margin-left: 15px;font-size:18px;">标题</label>
            <div class="layui-input-block">
                <input id="title" type="text" name="title" value="${content.title}" lay-verify="title" placeholder="请输入标题" >
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <div class="layui-input-block">
            <textarea class="layui-textarea layui-hide" name="contenr" lay-verify="content"
                      id="news_content">
                <c:choose>
                    <c:when test="${navContent.contenr != ''}">
                        ${navContent.contenr}
                    </c:when>
                </c:choose>
            </textarea>
            </div>
        </div>
        <%--隐藏域--%>
        <input type="hidden" id="id" name="id" value="${navContent.id}">
        <input type="hidden" id="navId" name="navId" value="${navContent.navId}">
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
            </div>
        </div>
    </form>

</div>
</body>
</html>