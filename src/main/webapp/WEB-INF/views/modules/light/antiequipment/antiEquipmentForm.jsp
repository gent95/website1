<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>防盗设备管理</title>
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
		<li><a href="${ctx}/light/antiequipment/antiEquipment/">防盗设备列表</a></li>
		<li class="active"><a href="${ctx}/light/antiequipment/antiEquipment/form?id=${antiEquipment.id}">防盗设备<shiro:hasPermission name="light:antiequipment:antiEquipment:edit">${not empty antiEquipment.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="light:antiequipment:antiEquipment:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="antiEquipment" action="${ctx}/light/antiequipment/antiEquipment/save" method="post" class="form-horizontal">
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
			<label class="control-label">配电柜：</label>
			<div class="controls">
				<form:input path="distributionBox" htmlEscape="false" maxlength="12" class="input-xlarge  digits"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">线缆编号：</label>
			<div class="controls">
				<form:input path="cableNum" htmlEscape="false" maxlength="12" class="input-xlarge  digits"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">布防/撒防状态：</label>
			<div class="controls">
				<%--<form:input path="defenseState" htmlEscape="false" maxlength="2" class="input-xlarge "/>--%>
				<form:select path="defenseState" htmlEscape="false" maxlength="2" class="input-xlarge ">
					<form:option value="1">已布防</form:option>
					<form:option value="0">未布防</form:option>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">管理员：</label>
			<div class="controls">
				<form:input path="admin" htmlEscape="false" maxlength="12" class="input-xlarge  digits"/>
				<%--管理员展示--%>
				<%--<c:forEach items="${page.list}" var="lightList">
					</c:forEcah>
				--%>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="light:antiequipment:antiEquipment:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>