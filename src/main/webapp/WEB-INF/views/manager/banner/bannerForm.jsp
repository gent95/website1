<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>轮播图管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
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
	<link rel="stylesheet" href="${ctxStatic}/web/common/js/layui/css/layui-bootstrap.css"  media="all">
	<link rel="stylesheet" href="${ctxStatic}/web/common/js/layui/css/global.css"  media="all">
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/website/banner/banner/">轮播图列表</a></li>
		<li class="active"><a href="${ctx}/website/banner/banner/form?id=${banner.id}">轮播图<shiro:hasPermission name="website:banner:banner:edit">${not empty banner.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="website:banner:banner:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="banner" action="${ctx}/website/banner/banner/save" method="post" class="form-horizontal">
		<form:hidden path="id" id="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">标题：</label>
			<div class="controls">
				<form:input path="title" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label">图片路径：</label>
			<div class="controls">
				<div class="img_upload">
				</div>
				<img style="display: none" class="default-pic" src="${imgCtx}${banner.picPath}">
			</div>
		</div>


		<div class="control-group">
			<label class="control-label">排序：</label>
			<div class="controls">
				<form:input path="orderNum" htmlEscape="false" maxlength="11" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">是否显示：</label>
			<div class="controls">
				<form:radiobutton path="showFlag" checked="checked" value="1"/>显示
				<form:radiobutton path="showFlag" value="0"/>不显示
			</div>
		</div>

		<div class="form-actions">
			<shiro:hasPermission name="website:banner:banner:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>