<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>客户电话和邮箱管理管理</title>
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
		<li class="active"><a href="${ctx}/website/cusemlandphne/cusEmlAndPhe/">客户电话和邮箱管理列表</a></li>
		<shiro:hasPermission name="website:cusemlandphne:cusEmlAndPhe:edit"><li><a href="${ctx}/website/cusemlandphne/cusEmlAndPhe/form">客户电话和邮箱管理添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="cusEmlAndPhe" action="${ctx}/website/cusemlandphne/cusEmlAndPhe/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>公司名称：</label>
				<form:input path="companyName" htmlEscape="false" maxlength="255" class="input-medium"/>
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
				<th>导航</th>
				<th>公司地址</th>
				<th>邮编</th>
				<th>公司网址</th>
				<th>电话</th>
				<th>公司图片</th>
				<shiro:hasPermission name="website:cusemlandphne:cusEmlAndPhe:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="cusEmlAndPhe">
			<tr>
				<td><a href="${ctx}/website/cusemlandphne/cusEmlAndPhe/form?id=${cusEmlAndPhe.id}">
					${cusEmlAndPhe.id}
				</a></td>
				<td>
					${cusEmlAndPhe.navList.name}
				</td>
				<td>
					${cusEmlAndPhe.companyName}
				</td>
				<td>
					${cusEmlAndPhe.email}
				</td>
				<td>
					${cusEmlAndPhe.webAddr}
				</td>
				<td>
					${cusEmlAndPhe.phone}
				</td>
				<td>
					<img src="${cusEmlAndPhe.picPath}" width="80px" height="50px"/>
				</td>
				<shiro:hasPermission name="website:cusemlandphne:cusEmlAndPhe:edit"><td>
    				<a href="${ctx}/website/cusemlandphne/cusEmlAndPhe/form?id=${cusEmlAndPhe.id}">修改</a>
					<a href="${ctx}/website/cusemlandphne/cusEmlAndPhe/delete?id=${cusEmlAndPhe.id}" onclick="return confirmx('确认要删除该客户电话和邮箱管理吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>