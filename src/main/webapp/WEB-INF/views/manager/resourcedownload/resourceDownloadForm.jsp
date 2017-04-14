<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>资源下载管理</title>
	<meta name="decorator" content="default"/>
	<link rel="stylesheet" href="${ctxStatic}/js/layui/css/layui.css" media="all">
	<link rel="stylesheet" href="${ctxStatic}/js/layui/css/global.css" media="all">
	<script src="${ctxStatic}/js/layui/layui.js" charset="utf-8"></script>
	<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
	<script src="${ctxStatic}/js/jctl/ajax/ajaxImg.js" charset="utf-8"></script>
	<script type="text/javascript">
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
		<li><a href="${ctx}/website/resourcedownload/resourceDownload/">资源下载列表</a></li>
		<li class="active"><a href="${ctx}/website/resourcedownload/resourceDownload/form?id=${resourceDownload.id}">资源下载<shiro:hasPermission name="website:resourcedownload:resourceDownload:edit">${not empty resourceDownload.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="website:resourcedownload:resourceDownload:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form id="inputForm" modelAttribute="resourceDownload" action="${ctx}/website/resourcedownload/resourceDownload/save" method="post" class="form-horizontal">
		<input type="hidden" name="id" value="${resourceDownload.id}"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">导航编号：</label>
			<div class="controls">
				<sys:treeselect id="navList" name="navList.id" value="${resourceDownload.navList.id}" labelName="navList.name" labelValue="${resourceDownload.navList.name}"
								title="所属导航id" url="/website/navlist/navList/treeData" extId="${resourceDownload.navList.id}" cssClass="" allowClear="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">名称：</label>
			<div class="controls">
				<input type="text" name="name" htmlEscape="false" maxlength="255" class="input-xlarge " value="${resourceDownload.name}"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">下载路径：</label>
			<div class="controls">
				<input type="text" name="url" htmlEscape="false" maxlength="255" class="input-xlarge "value="${resourceDownload.url}"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">详情：</label>
			<div class="controls">
				<input type="text" name="account" htmlEscape="false" maxlength="500" class="input-xlarge " value="${resourceDownload.account}"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">浏览量：</label>
			<div class="controls">
				<input type="text" name="browsecount" htmlEscape="false" maxlength="11" class="input-xlarge" value="${resourceDownload.browsecount}"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">下载量：</label>
			<div class="controls">
				<input type="text" name="downloadcount" htmlEscape="false" maxlength="11" class="input-xlarge" value="${resourceDownload.downloadcount}"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">大小：</label>
			<div class="controls">
				<input type="text" name="size" htmlEscape="false" class="input-xlarge "value="${resourceDownload.size}"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">添加人：</label>
			<div class="controls">
				<input type="text" name="addUserId" htmlEscape="false" maxlength="20" class="input-xlarge  digits" value="${resourceDownload.addUserId}"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">添加时间：</label>
			<div class="controls">
				<input name="addTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${resourceDownload.addTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">修改人：</label>
			<div class="controls">
				<input type="text" name="updateUserId" htmlEscape="false" maxlength="20" class="input-xlarge  digits" value="${resourceDownload.updateUserId}"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">修改时间：</label>
			<div class="controls">
				<input name="updateTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${resourceDownload.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">内容：</label>
			<div class="layui-form-item layui-form-text">
					<div class="layui-input-block">
            <textarea  class="layui-textarea layui-hide" name="context" lay-verify="context"
					   id="news_content"  >
                <c:choose>
					<c:when test="${resourceDownload.context != ''}">
						${resourceDownload.context}
					</c:when>
				</c:choose>
            </textarea>
					</div>

			</div>
		</div>
		<div class="control-group">
			<label class="control-label">图片路径：</label>
			<div class="controls">
				<div class="img_upload">
				</div>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="website:resourcedownload:resourceDownload:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form>
</body>
</html>