<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>客户电话和邮箱管理管理</title>
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
	<script src="${ctxStatic}/js/layui/layui.js" charset="utf-8"></script>
	<script src="${ctxStatic}/js/jctl/ajax/ajaxImg.js" charset="utf-8"></script>
	<link rel="stylesheet" href="${ctxStatic}/js/layui/css/layui-bootstrap.css"  media="all">
	<link rel="stylesheet" href="${ctxStatic}/js/layui/css/global.css"  media="all">
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/website/cusemlandphne/cusEmlAndPhe/">客户电话和邮箱管理列表</a></li>
		<li class="active"><a href="${ctx}/website/cusemlandphne/cusEmlAndPhe/form?id=${cusEmlAndPhe.id}">客户电话和邮箱管理<shiro:hasPermission name="website:cusemlandphne:cusEmlAndPhe:edit">${not empty cusEmlAndPhe.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="website:cusemlandphne:cusEmlAndPhe:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="cusEmlAndPhe" action="${ctx}/website/cusemlandphne/cusEmlAndPhe/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">导航编号：</label>
			<div class="controls">
				<sys:treeselect id="navList" name="navList.id" value="${cusEmlAndPhe.navList.id}" labelName="navList.name" labelValue="${cusEmlAndPhe.navList.name}"
								title="所属导航id" url="/website/navlist/navList/treeData" extId="${cusEmlAndPhe.navList.id}" cssClass="" allowClear="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">公司地址：</label>
			<div class="controls">
				<form:input path="companyName" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">邮编：</label>
			<div class="controls">
				<form:input path="email" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">公司网址：</label>
			<div class="controls">
				<form:input path="webAddr" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">电话：</label>
			<div class="controls">
				<form:input path="phone" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">添加人：</label>
			<div class="controls">
				<form:input path="addUserId" htmlEscape="false" maxlength="20" class="input-xlarge  digits"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">添加时间：</label>
			<div class="controls">
				<input name="addTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${cusEmlAndPhe.addTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">修改人：</label>
			<div class="controls">
				<form:input path="updateUserId" htmlEscape="false" maxlength="20" class="input-xlarge  digits"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">修改时间：</label>
			<div class="controls">
				<input name="updateTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${cusEmlAndPhe.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<%--<div class="control-group">
			<label class="control-label">公司图片：</label>
			<div class="controls">
				<div class="img_upload">
				</div>
			</div>
		</div>--%>
		<div class="form-actions">
			<shiro:hasPermission name="website:cusemlandphne:cusEmlAndPhe:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>