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
		<li class="active"><a href="${ctx}/website/newscontent/newsContext/">新闻列表</a></li>
		<shiro:hasPermission name="website:newscontent:newsContext:edit"><li><a href="${ctx}/website/newscontent/newsContext/form">新闻添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="newsContext" action="${ctx}/website/newscontent/newsContext/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>序号</th>
				<th>news_id</th>
				<th>编辑框</th>
				<th>添加人</th>
				<th>添加时间</th>
				<th>修改人</th>
				<th>修改时间</th>
				<shiro:hasPermission name="website:newscontent:newsContext:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="newsContext">
			<tr>
				<td><a href="${ctx}/website/newscontent/newsContext/form?id=${newsContext.id}">
					${newsContext.id}
				</a></td>
				<td>
					${newsContext.newListId}
				</td>
				<td>
					${newsContext.context}
				</td>
				<td>
					${newsContext.addUserId}
				</td>
				<td>
					<fmt:formatDate value="${newsContext.addTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${newsContext.updateUserId}
				</td>
				<td>
					<fmt:formatDate value="${newsContext.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="website:newscontent:newsContext:edit"><td>
    				<a href="${ctx}/website/newscontent/newsContext/form?id=${newsContext.id}">修改</a>
					<a href="${ctx}/website/newscontent/newsContext/delete?id=${newsContext.id}" onclick="return confirmx('确认要删除该新闻吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>