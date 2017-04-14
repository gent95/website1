<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
	<title>导航内容管理</title>
	<meta name="decorator" content="default"/>
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/web/common/js/jsTree/css/style.css"/>
	<script type="text/javascript" src="${ctxStatic}/web/common/js/common/common.js"></script>
	<script type="text/javascript" src="${ctxStatic}/web/common/js/website/js/navContentList/navContentList.js"></script>
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/web/common/js/website/css/navlist/navlist.css"/>
	<link rel="stylesheet" href="${ctxStatic}/web/common/js/layui/css/layui-bootstrap.css" media="all">
	<link rel="stylesheet" href="${ctxStatic}/web/common/js/layui/css/global.css" media="all">
	<script src="${ctxStatic}/web/common/js/layui/layui.js" charset="utf-8"></script>
	<script src="${ctxStatic}/web/common/js/jctl/ajax/ajaxImg.js" charset="utf-8"></script>


	<script>
		function doSearch(id){
			$.ajax({
				type: "post",
				url: "${ctx}/website/navbanner/navBanner/content?navId="+id,
				dataType: "json",
				success: function(result){
					if(result.picPath =="" || result.picPath == null){
						$("#img").attr("src", "${ctxStatic}/images/default/default.png");
					}else {
						$("#img").attr("src",result.picPath);
						$(".imgPath").val(result.picPath);
					}
					$("#navId").val(id);
					$("#id").val(result.id);
				}
			});
		}

	</script>
	<style>
		.layui-input-block {
			margin-left: 10px;
			width: 95%;
		}
	</style>
</head>
<body>
<div class="tree well" style="position: fixed;bottom: 70px;overflow-y: scroll;top: 10px;width:25%;height: 95%;margin: 0;">
	<ul id="jc_tree">
	</ul>
</div>
<div class="content">
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;width: 95%">
		<legend>导航的轮播</legend>
	</fieldset>

	<form  method="post" action="${ctx}/website/navbanner/navBanner/save">
		<div class="control-group">
			<div class="controls">
				<div class="img_upload">
				</div>
				<img style="display: none" class="default-pic" src="${banner.picPath}">
			</div>
		</div>
		<%--隐藏域--%>
		<input type="hidden" id="id" name="id" value="${navContent.id}">
		<input type="hidden" id="navId" name="navId" value="${navContent.navId}">
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
			</div>
		</div>
	</form>

</div>
</body>
</html>