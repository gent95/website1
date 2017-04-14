<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>问题提交管理</title>
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
		<li class="active"><a href="${ctx}/website/problem/problemPost/">问题提交列表</a></li>
		<shiro:hasPermission name="website:problem:problemPost:edit"><li><a href="${ctx}/website/problem/problemPost/form">问题提交添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="problemPost" action="${ctx}/website/problem/problemPost/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>姓名：</label>
				<form:input path="name" htmlEscape="false" maxlength="50" class="input-medium"/>
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
				<th>问题</th>
				<th>详情</th>
				<th>姓名</th>
				<th>电话</th>
				<th>邮箱</th>
				<th>添加人</th>
				<th>添加时间</th>
				<th>修改人</th>
				<th>修改时间</th>
				<shiro:hasPermission name="website:problem:problemPost:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="problemPost">
			<tr>
				<td><a href="${ctx}/website/problem/problemPost/form?id=${problemPost.id}">
					${problemPost.id}
				</a></td>
				<td>
					${problemPost.question}
				</td>
				<td>
					${problemPost.details}
				</td>
				<td>
					${problemPost.name}
				</td>
				<td>
					${problemPost.phone}
				</td>
				<td>
					${problemPost.email}
				</td>
				<td>
					${problemPost.addUserId}
				</td>
				<td>
					<fmt:formatDate value="${problemPost.addTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${problemPost.updateUserId}
				</td>
				<td>
					<fmt:formatDate value="${problemPost.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="website:problem:problemPost:edit"><td>
    				<a href="${ctx}/website/problem/problemPost/form?id=${problemPost.id}">修改</a>
					<a href="${ctx}/website/problem/problemPost/delete?id=${problemPost.id}" onclick="return confirmx('确认要删除该问题提交吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>