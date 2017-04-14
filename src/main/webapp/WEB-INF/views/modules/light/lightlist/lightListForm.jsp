<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>灯具管理</title>
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
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/light/lightlist/lightList/">灯具列表</a></li>
		<li class="active"><a href="${ctx}/light/lightlist/lightList/form?id=${lightList.id}">灯具<shiro:hasPermission name="light:lightlist:lightList:edit">${not empty lightList.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="light:lightlist:lightList:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="lightList" action="${ctx}/light/lightlist/lightList/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">名称：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="32" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">路段：</label>
			<div class="controls">
				<form:input path="road" htmlEscape="false" maxlength="12" class="input-xlarge  digits"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">功率：</label>
			<div class="controls">
				<form:input path="power" htmlEscape="false" maxlength="32" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">灯杆粗细：</label>
			<div class="controls">
				<form:input path="width" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">灯杆高度：</label>
			<div class="controls">
				<form:input path="height" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">材质：</label>
			<div class="controls">
				<form:input path="texture" htmlEscape="false" maxlength="2" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">灯具类型：</label>
			<div class="controls">
				<form:input path="lightType" htmlEscape="false" maxlength="12" class="input-xlarge  digits"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">管理人员：</label>
			<div class="controls">
				<form:input path="admin" htmlEscape="false" maxlength="12" class="input-xlarge  digits"/>
			</div>
		</div>

		<div class="form-actions">
			<shiro:hasPermission name="light:lightlist:lightList:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>