<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>产品管理</title>
	<meta name="decorator" content="default"/>
	<link rel="stylesheet" href="${ctxStatic}/web/common/js/layui/css/layui.css" media="all">
	<link rel="stylesheet" href="${ctxStatic}/web/common/js/layui/css/global.css" media="all">
	<link rel="stylesheet" href="${ctxStatic}/web/common/js/layui/css/layui-bootstrap.css"  media="all">
	<script src="${ctxStatic}/web/common/js/layui/layui.js" charset="utf-8"></script>
	<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
	<script src="${ctxStatic}/web/common/js/jctl/ajax/ajaxImg.js" charset="utf-8"></script>
	<script type="text/javascript">
		$(document).ready(function() {
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
		<li><a href="${ctx}/website/product/product/">产品列表</a></li>
		<li class="active"><a href="${ctx}/website/product/product/form?id=${product.id}">产品<shiro:hasPermission name="website:product:product:edit">${not empty product.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="website:product:product:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="product" action="${ctx}/website/product/product/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<div class="control-group">
			<label class="control-label">父标签:</label>
			<div class="controls">
				<sys:treeselect id="parent" name="navId" value="${navList.parent.id}" labelName="parent.name" labelValue="${navList.parent.name}"
								title="父级导航id" url="/website/navlist/navList/treeData" extId="${navList.id}" cssClass="" allowClear="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">上级菜单：</label>
			<div class="controls">
				<form:input value="产品介绍" path="navParent" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">图片路径：</label>
			<div class="controls">
				<div class="img_upload">
				</div>
				<img style="display: none" class="default-pic" src="${product.picPath}">
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">标题：</label>
			<div class="controls">
				<form:input path="title" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">内容：</label>
			<div class="controls">
				<form:textarea path="context" htmlEscape="false" rows="4" class="input-xxlarge "/>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label">是否显示：</label>
			<div class="controls">
				<%--<form:radiobuttons path="isShow" items="${fns:getDictList('')}" itemLabel="label" itemValue="value" htmlEscape="false" class=""/>--%>
				<form:radiobutton path="isShow" value="1"/>显示
				<form:radiobutton path="isShow" value="0"/>不显示
			</div>
		</div>

		<div class="form-actions">
			<shiro:hasPermission name="website:product:product:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>