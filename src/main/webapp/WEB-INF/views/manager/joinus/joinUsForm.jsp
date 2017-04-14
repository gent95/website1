<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>职位招聘管理</title>
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
            var editIndexs = layedit.build('news_contents',{
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
		<li><a href="${ctx}/website/joinus/joinUs/">职位招聘列表</a></li>
		<li class="active"><a href="${ctx}/website/joinus/joinUs/form?id=${solution.id}">职位招聘<shiro:hasPermission name="website:joinus:joinUs:edit">${not empty joinUs.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="website:joinus:joinUs:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form id="inputForm" modelAttribute="joinUs" action="${ctx}/website/joinus/joinUs/save" method="post" class="form-horizontal">
		<input type="hidden" value="${joinUs.id}"  name="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">职位：</label>
			<div class="controls">
		<c:choose>
				<c:when test="${joinUs.position != ''}">
					<input name="position" class="input-xlarge" value="${joinUs.position}"/>
				</c:when>
				<c:otherwise>
					<input name="position" class="input-xlarge"/>
				</c:otherwise>
		</c:choose>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">薪资：</label>
			<div class="controls">
				<c:choose>
					<c:when test="${joinUs.salary != ''}">
						<input name="salary" class="input-xlarge" value="${joinUs.salary}"/>
					</c:when>
					<c:otherwise>
						<input name="salary" class="input-xlarge"/>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">工作经验（年限）：</label>
			<div class="controls">
				<c:choose>
					<c:when test="${joinUs.suffer != ''}">
						<input name="suffer" class="input-xlarge" value="${joinUs.suffer}"/>
					</c:when>
					<c:otherwise>
						<input name="suffer" class="input-xlarge"/>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">学历：</label>
			<div class="controls">
				<c:choose>
					<c:when test="${joinUs.education != ''}">
						<input name="education" class="input-xlarge" value="${joinUs.education}"/>
					</c:when>
					<c:otherwise>
						<input name="education" class="input-xlarge"/>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">工作性质：</label>
			<div class="controls">
				<%--<c:choose>
					<c:when test="${joinUs.nature != ''}">
						<input name="nature" class="input-xlarge" value="${joinUs.nature}"/>
					</c:when>
					<c:otherwise>
						<input name="nature" class="input-xlarge"/>
					</c:otherwise>
				</c:choose>--%>
				<select name="nature">
					<option value="-1">请选择</option>
					<option value="全职"
					<c:if test="${joinUs.nature=='全职'}">
						selected="selected"
					</c:if>
					>全职</option>
					<option value="兼职"
						<c:if test="${joinUs.nature=='兼职'}">
								selected="selected"
						</c:if>
					>兼职</option>
				</select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">岗位职责：</label>
			<div class="layui-form-item layui-form-text">
				<div class="layui-input-block">
            <textarea  class="layui-textarea layui-hide" name="postionStatement" lay-verify="postionStatement"
					  id="news_content"  >
                <c:choose>
					<c:when test="${joinUs.postionStatement != ''}">
						${joinUs.postionStatement}
					</c:when>
				</c:choose>
            </textarea>
				</div>
			</div>

		</div>

		<div class="control-group">
			<label class="control-label">任职资格：</label>
			<div class="layui-form-item layui-form-text">
				<div class="layui-input-block">
            <textarea  class="layui-textarea layui-hide" name="qualification" lay-verify="qualification"
					   id="news_contents"  >
                <c:choose>
					<c:when test="${joinUs.qualification != ''}">
						${joinUs.qualification}
					</c:when>
				</c:choose>
            </textarea>
				</div>
			</div>

		</div>

	 <div class="form-actions">
        <shiro:hasPermission name="website:joinus:joinUs:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
			</div>
	</form>
</body>
</html>