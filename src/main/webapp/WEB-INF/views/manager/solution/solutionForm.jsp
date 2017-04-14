<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>解决方案管理</title>
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

		layui.use('upload', function () {
			layui.upload({
				url: '/admin/upload'
				, elem: '#img_file'
				, method: 'post'
				, success: function (res) {
					if (res.flag == 0) {
						alert("上传失败");
					} else {
						img.src = res.url;
						$(".imgPath").val(res.url);
					}
				}
			});
		});

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
		<li><a href="${ctx}/website/solution/solution/">解决方案列表</a></li>
		<li class="active"><a href="${ctx}/website/solution/solution/form?id=${solution.id}">解决方案<shiro:hasPermission name="website:solution:solution:edit">${not empty solution.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="website:solution:solution:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form id="inputForm" modelAttribute="solution" action="${ctx}/website/solution/solution/save" method="post" class="form-horizontal">
		<input type="hidden" value="${solution.id}"  name="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">标题：</label>
			<div class="controls">
		<c:choose>
				<c:when test="${solution.title != ''}">
					<input name="title" class="input-xlarge" value="${solution.title}"/>
				</c:when>
				<c:otherwise>
					<input name="title" class="input-xlarge"/>
				</c:otherwise>
		</c:choose>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">内容：</label>
			<div class="layui-form-item layui-form-text">
				<div class="layui-input-block">
            <textarea  class="layui-textarea layui-hide" name="content" lay-verify="content"
					  id="news_content"  >
                <c:choose>
					<c:when test="${solution.content != ''}">
						${solution.content}
					</c:when>
				</c:choose>
            </textarea>
				</div>
			</div>

		</div>

		<div class="control-group">
			<label class="control-label">图片路径：</label>
			<div class="controls">
				<div class="img_upload" >
				</div>
			<img style="display: none;" class="default-pic" src="${solution.picPath}"/>
			</div>

		</div>
		<div class="control-group">
			<label class="control-label">所属导航：</label>
		<%--	<div class="controls">
				<sys:treeselect id="parent" name="navList.id" value="${solution.navList.id}" labelName="parent.name" labelValue="${solution.navList.name}"
								title="父级导航id" url="/website/navlist/navList/treeData" extId="${navList.id}" cssClass="" allowClear="true"/>
			</div>--%>
			<div class="controls">
				<sys:treeselect id="navList" name="navList.id" value="${solution.navList.id}" labelName="navList.name" labelValue="${solution.navList.name}"
								title="所属导航id" url="/website/navlist/navList/treeData" extId="${solution.navList.id}" cssClass="" allowClear="true"/>
			</div>

		</div>
	 <div class="form-actions">
        <shiro:hasPermission name="website:solution:solution:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
			</div>
	</form>
</body>
</html>