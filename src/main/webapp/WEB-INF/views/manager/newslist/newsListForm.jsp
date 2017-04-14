<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>列表管理</title>
    <style>
        blockquote, body, button, dd, div, dl, dt, form, h1, h2, h3, h4, h5, h6, input, li, ol, p, pre, td, textarea, th, ul {
            margin: 0;
            padding: 0;
            -webkit-tap-highlight-color: rgba(0, 0, 0, 0)
        }
    </style>
    <meta name="decorator" content="default"/>
    <link rel="stylesheet" href="${ctxStatic}/web/common/js/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${ctxStatic}/web/common/js/layui/css/global.css" media="all">
    <script src="${ctxStatic}/web/common/js/layui/layui.js" charset="utf-8"></script>
    <script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script src="${ctxStatic}/web/common/js/jctl/ajax/ajaxImg.js" charset="utf-8"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            $("#inputForm").validate({
                submitHandler: function (form) {
                    var type = $("[name='type']").val();
                    if (type != 0) {
                        loading('正在提交，请稍等...');
                        form.submit();
                    } else {
                        alert("请选择类型！");
                    }
                },
                errorContainer: "#messageBox",
                errorPlacement: function (error, element) {
                    $("#messageBox").text("输入有误，请先更正。");
                    if (element.is(":checkbox") || element.is(":radio") || element.parent().is(".input-append")) {
                        error.appendTo(element.parent().parent());
                    } else {
                        error.insertAfter(element);
                    }
                }
            });
        });

        function check() {
            if ($("#title").val() == '') {
                alert("标题不能为空");
                return false;
            }
            if ($("#parentId").val() == '') {
                alert("导航不能为空");
                return false;
            } else {
                $(".old_navId").remove();
            }

        }

    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/website/newslist/newsList/">列表列表</a></li>
    <li class="active"><a href="${ctx}/website/newslist/newsList/form?id=${newsList.id}">列表<shiro:hasPermission
            name="website:newslist:newsList:edit">${not empty newsList.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="website:newslist:newsList:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="newsList" action="${ctx}/website/newslist/newsList/save" method="post"
           class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>

    <div class="control-group">
        <label class="control-label">摘要：</label>
        <div class="controls">
            <form:textarea path="title" htmlEscape="false" rows="3" maxlength="255" class="input-xlarge"/><span
                style="color: red">*</span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">父导航为:</label>
            <%--<div class="controls">--%>
            <%--<input  class="old_navId" type="hidden" name="navId" value=" ${newsList.navId}">--%>
            <%--<sys:treeselect id="parent" name="navId" value="${navList   .parent.id}" labelName="parent.name"--%>
            <%--labelValue="${navList.parent.name}"--%>
            <%--title="父级导航id" url="/website/navlist/navList/treeData" extId="${navList.id}" cssClass=""--%>
            <%--allowClear="true"/>--%>
            <%--<span style="color: red">*</span>--%>
            <%--</div>--%>
        <div class="controls">
            <sys:treeselect id="parent" name="navId" value="${newsList.navId}" labelName="parent.name"
                            labelValue="${newsList.navName}"
                            title="父级导航id" url="/website/navlist/navList/treeData" extId="${navList.id}" cssClass=""
                            allowClear="true"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">引导图：</label>
        <div class="controls">
            <div class="img_upload">
            </div>
            <img style="display: none" class="default-pic" src="${newsList.picPath}">
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">排序：</label>
        <div class="controls">
            <form:input path="orderNum" htmlEscape="false" maxlength="11" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">类型：</label>
        <div class="controls">
            <select name="type">
                <option value="0">请选择</option>
                <option value="1">行业新闻</option>
                <option value="2">相关政策</option>
                <option value="3">展会活动</option>
            </select>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">是否展示：</label>
        <div class="controls layui-input-block">
            <form:radiobutton path="showFlag" checked="checked" value="1"/>展示
            <form:radiobutton path="showFlag" value="0"/>不展示
        </div>
    </div>
    <form:input path="recommend" type="hidden" value="0"/>
    <div class="form-actions">
        <shiro:hasPermission name="website:newslist:newsList:edit">
            <input id="btnSubmit" onclick="check()" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;
        </shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>