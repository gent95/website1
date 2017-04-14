<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>解决方案管理</title>
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
		<li class="active"><a href="${ctx}/website/solution/solution/">解决方案列表</a></li>
		<shiro:hasPermission name="website:solution:solution:edit"><li><a href="${ctx}/website/solution/solution/form">解决方案添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="solution" action="${ctx}/website/solution/solution/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
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
				<th>编号</th>
				<th>标题</th>
				<th>内容</th>
				<th>图片路径</th>
				<shiro:hasPermission name="website:solution:solution:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="solution">
			<tr>
				<td><a href="${ctx}/website/solution/solution/form?id=${solution.id}">
					${solution.id}
				</a></td>
				<td>
					${solution.title}
				</td>
				<td>
					${solution.content}
				</td>
				<td>
					<img src="${solution.picPath}" style="height: 50px; width: 80px;"/>
				</td>
				<shiro:hasPermission name="website:solution:solution:edit"><td>
    				<a href="${ctx}/website/solution/solution/form?id=${solution.id}">修改</a>
					<a href="${ctx}/website/solution/solution/delete?id=${solution.id}" onclick="return confirmx('确认要删除该解决方案吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>