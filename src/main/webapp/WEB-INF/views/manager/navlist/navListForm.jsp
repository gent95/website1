<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>导航管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#name").focus();
            $("#inputForm").validate({
                submitHandler: function (form) {
                    loading('正在提交，请稍等...');
                    form.submit();
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
    </script>

    <script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script src="${ctxStatic}/web/common/js/layui/layui.js" charset="utf-8"></script>
    <script src="${ctxStatic}/web/common/js/jctl/ajax/ajaxImg.js" charset="utf-8"></script>
    <script src="${ctxStatic}/web/common/js/website/js/navList/navList.js" charset="utf-8"></script>
    <link rel="stylesheet" href="${ctxStatic}/web/common/js/layui/css/layui-bootstrap.css" media="all">
    <link rel="stylesheet" href="${ctxStatic}/web/common/js/layui/css/global.css" media="all">
    <link rel="stylesheet" href="${ctxStatic}/web/common/js/layui/css/style.css">
    <script type="text/javascript">
        layui.use('upload', function () {
            layui.upload({
                url: '/admin/upload'
                , elem: '#img_files'
                , method: 'post'
                , success: function (res) {
                    if (res.flag == 0) {
                        alert("上传失败");
                    } else {
                        document.getElementById("pic_img").src = res.url;
                        $(".picImgPaths").val(res.url);
                    }
                }
            });
        });
        $(function () {
            var picPath = $(".default-pic_img").attr("src");
           if (picPath == "") {
                $("#pic_img").attr("src", "${ctxStatic}/images/default/default.png");
            } else {
                $("#pic_img").attr("src", picPath);
                $(".picImgPaths").val(picPath);
            }

        });

    </script>
<style>
    .img_btns >div {margin-top: -218px; margin-left: 45px;background-color: rgba(0, 0, 0, 0.1);color: rgba(255,255,255,1)}
</style>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/website/navlist/navList/">导航列表</a></li>
    <li class="active"><a
            href="${ctx}/website/navlist/navList/form?id=${navList.id}&parent.id=${navListparent.id}">导航<shiro:hasPermission
            name="website:navlist:navList:edit">${not empty navList.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="website:navlist:navList:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="navList" action="${ctx}/website/navlist/navList/save" method="post"
           class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">名称：</label>
        <div class="controls">
            <form:input path="name" htmlEscape="false" maxlength="255" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">英文名称：</label>
        <div class="controls">
            <form:input path="alias" htmlEscape="false" maxlength="255" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">链接：</label>
        <div class="controls">
            <form:input path="url" htmlEscape="false" maxlength="255" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">排序：</label>
        <div class="controls">
            <form:input path="ordrNum" htmlEscape="false" maxlength="11" class="input-xlarge "/>
        </div>
    </div>


    <div class="control-group">
        <label class="control-label">导航图标：</label>
        <div class="controls">
            <div class="img_upload">
            </div>
            <img style="display: none" class="default-pic" src="${imgCtx}${navList.picPath}">
        </div>
    </div>


    <div class="control-group">
        <label class="control-label">移动效果：</label>
        <div class="controls">

            <div class="img_upload_s">
                <img id="pic_img" src="${ctxStatic}/images/default/default.png" style="border-radius: 100%; width: 200px; height: 200px;">
                <div class="img_btns">
                <%--   <div class="layui-box layui-upload-buttons" style="margin-top: -218px; margin-left: 45px;">--%>
                    <input class="layui-upload-files" name="file" id="img_files" type="file">
                  <%--  </div>--%>
                    <input class="picImgPaths" name="picImg" type="hidden">
                </div>
            </div>

            <img style="display: none" class="default-pic_img" src="${imgCtx}${navList.picImg}">
        </div>
    </div>


    <%----%>
    <%--<div class="control-group">--%>
    <%--<label class="control-label">鼠标移上时的导航图标：</label>--%>
    <%--<div class="controls">--%>
    <%--<div class="img_upload">--%>
    <%--</div>--%>
    <%--<img style="display: none" class="default-pic" src="${navList.picPath}">--%>
    <%--</div>--%>
    <%--</div>--%>


    <div class="control-group">
        <label class="control-label">图标：</label>
        <div class="controls">
            <form:radiobutton path="type" checked="checked" value="1"/>导航标签
            <form:radiobutton path="type" value="2"/>导航图片
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">启用状态：</label>
        <div class="controls">
            <form:radiobutton path="status" checked="checked" value="1"/>启用
            <form:radiobutton path="status" value="0"/>不启用
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">父标签:</label>
        <div class="controls">
            <sys:treeselect id="parent" name="parent.id" value="${navList.parent.id}" labelName="parent.name"
                            labelValue="${navList.parent.name}"
                            title="父级导航id" url="/website/navlist/navList/treeData" extId="${navList.id}" cssClass=""
                            allowClear="true"/>
        </div>
    </div>

    <div class="form-actions">
        <shiro:hasPermission name="website:navlist:navList:edit"><input id="btnSubmit" class="btn btn-primary"
                                                                        type="submit"
                                                                        value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>