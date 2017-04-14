<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>新闻管理</title>
    <link rel="stylesheet" href="${ctxStatic}/js/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${ctxStatic}/js/layui/css/global.css" media="all">
    <script src="${ctxStatic}/js/layui/layui.js" charset="utf-8"></script>
    <script>
        layui.use(['form', 'layedit', 'laydate'], function () {
            var form = layui.form()
                    , layer = layui.layer
                    , layedit = layui.layedit
                    , laydate = layui.laydate;

            //创建一个编辑器
            var editIndex = layedit.build('news_content',{
                uploadImage:{
                    url: '/admin/upload' //接口url
                }
            });
        });
    </script>
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>新闻编辑</legend>
</fieldset>
<form class="layui-form" action="${ctx}/website/newscontent/newsContext/save">
    <div class="layui-form-item layui-form-text">
        <div class="layui-input-block">
            <textarea class="layui-textarea layui-hide" name="context" lay-verify="content"
                      id="news_content"  >
                <c:choose>
                    <c:when test="${newsContext.context != ''}">
                        ${newsContext.context}
                    </c:when>
                </c:choose>
            </textarea>
        </div>
    </div>
    <c:choose>
        <c:when test="${newsContext.id != null}">
            <input type="hidden" name="id" value="${newsContext.id}">
        </c:when>
    </c:choose>

    <input type="hidden" name="newListId" value="${newsContext.newListId}">
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
        </div>
    </div>
</form>

<div>
</div>
</body>
</html>