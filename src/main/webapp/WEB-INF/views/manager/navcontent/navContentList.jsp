<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>新闻管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/website/navcontent/navContent/">预览</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="navContent" action="${ctx}/website/navcontent/navContent/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>导航名称：</label>
				<form:input path="navName" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>标题：</label>
				<form:input path="title" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>序号</th>
				<th>导航名称</th>
				<th>关系类型</th>
				<th>标题</th>
				<th>内容</th>
				<shiro:hasPermission name="website:navcontent:navContent:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="navContent">
			<tr>
				<td>
					${navContent.id}
				</td>
				<td>
					${navContent.navName}
				</td>
				<td>
					${navContent.type}
				</td>
				<td>
					${navContent.title}
				</td>
				<td>
					${navContent.contenr}
				</td>
				<shiro:hasPermission name="website:navcontent:navContent:edit"><td>
    				<a href="${ctx}/website/navcontent/navContent/form?id=${navContent.id}">修改</a>
					<a href="${ctx}/website/navcontent/navContent/delete?id=${navContent.id}" onclick="return confirmx('确认要删除该新闻吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>