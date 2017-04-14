<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>灯具管理</title>
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
		<li class="active"><a href="${ctx}/light/lightlist/lightList/">灯具列表</a></li>
		<shiro:hasPermission name="light:lightlist:lightList:edit"><li><a href="${ctx}/light/lightlist/lightList/form">灯具添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="lightList" action="${ctx}/light/lightlist/lightList/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="32" class="input-medium"/>
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
				<th>名称</th>
				<th>路段</th>
				<th>功率</th>
				<th>灯杆粗细</th>
				<th>灯杆高度</th>
				<th>材质</th>
				<th>灯具类型</th>
				<th>管理人员</th>

				<shiro:hasPermission name="light:lightlist:lightList:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="lightList">
			<tr>
				<td><a href="${ctx}/light/lightlist/lightList/form?id=${lightList.id}">
					${lightList.id}
				</a></td>
				<td>
					${lightList.name}
				</td>
				<td>
					${lightList.road}
				</td>
				<td>
					${lightList.power}
				</td>
				<td>
					${lightList.width}
				</td>
				<td>
					${lightList.height}
				</td>
				<td>
					${lightList.texture}
				</td>
				<td>
					${lightList.lightType}
				</td>
				<td>
					${lightList.admin}
				</td>

				<shiro:hasPermission name="light:lightlist:lightList:edit"><td>
    				<a href="${ctx}/light/lightlist/lightList/form?id=${lightList.id}">修改</a>
					<a href="${ctx}/light/lightlist/lightList/delete?id=${lightList.id}" onclick="return confirmx('确认要删除该灯具吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>