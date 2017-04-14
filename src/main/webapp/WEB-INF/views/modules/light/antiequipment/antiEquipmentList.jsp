<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>防盗设备管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".defenseState").each(function(){
			if($(this).text() == 1){
				$(this).text("已布防") ;
			}else{
				$(this).text("未布防") ;
			}
			});
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
		<li class="active"><a href="${ctx}/light/antiequipment/antiEquipment/">防盗设备列表</a></li>
		<shiro:hasPermission name="light:antiequipment:antiEquipment:edit"><li><a href="${ctx}/light/antiequipment/antiEquipment/form">防盗设备添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="antiEquipment" action="${ctx}/light/antiequipment/antiEquipment/" method="post" class="breadcrumb form-search">
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
				<th>名称</th>
				<th>路段</th>
				<th>配电柜</th>
				<th>线缆编号</th>
				<th>布防/撒防状态</th>
				<th>管理员</th>
				<shiro:hasPermission name="light:antiequipment:antiEquipment:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="antiEquipment">
			<tr>
				<td><a href="${ctx}/light/antiequipment/antiEquipment/form?id=${antiEquipment.id}">
					${antiEquipment.name}
				</a></td>
				<td>
					${antiEquipment.road}
				</td>
				<td>
					${antiEquipment.distributionBox}
				</td>
				<td>
					${antiEquipment.cableNum}
				</td>
				<td class="defenseState">
					${antiEquipment.defenseState}
				</td>
				<td>
					${antiEquipment.admin}
				</td>
				<shiro:hasPermission name="light:antiequipment:antiEquipment:edit"><td>
    				<a href="${ctx}/light/antiequipment/antiEquipment/form?id=${antiEquipment.id}">修改</a>
					<a href="${ctx}/light/antiequipment/antiEquipment/delete?id=${antiEquipment.id}" onclick="return confirmx('确认要删除该防盗设备吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>