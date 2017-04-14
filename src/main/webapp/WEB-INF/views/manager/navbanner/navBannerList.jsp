<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>1管理</title>
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
		<li class="active"><a href="${ctx}/website/navbanner/navBanner/">1列表</a></li>
		<shiro:hasPermission name="website:navbanner:navBanner:edit"><li><a href="${ctx}/website/navbanner/navBanner/form">1添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="navBanner" action="${ctx}/website/navbanner/navBanner/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>导航表：</label>
				<form:select path="navId" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>轮播图</th>
				<th>导航表</th>
				<shiro:hasPermission name="website:navbanner:navBanner:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="navBanner">
			<tr>
				<td><a href="${ctx}/website/navbanner/navBanner/form?id=${navBanner.id}">
					${navBanner.picPath}
				</a></td>
				<td>
					${fns:getDictLabel(navBanner.navId, '', '')}
				</td>
				<shiro:hasPermission name="website:navbanner:navBanner:edit"><td>
    				<a href="${ctx}/website/navbanner/navBanner/form?id=${navBanner.id}">修改</a>
					<a href="${ctx}/website/navbanner/navBanner/delete?id=${navBanner.id}" onclick="return confirmx('确认要删除该1吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>