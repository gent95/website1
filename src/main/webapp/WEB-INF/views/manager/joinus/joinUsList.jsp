<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>招聘职位管理</title>
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
	<style>
		table{
			table-layout:fixed;/* 只有定义了表格的布局算法为fixed，下面td的定义才能起作用。 */
		}
		td{
			width:100%;
			word-break:keep-all;/* 不换行 */
			white-space:nowrap;/* 不换行 */
			overflow:hidden;/* 内容超出宽度时隐藏超出部分的内容 */
			text-overflow:ellipsis;/* 当对象内文本溢出时显示省略标记(...) ；需与overflow:hidden;一起使用。*/
		}
	</style>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/website/joinus/joinUs/">招聘职位列表</a></li>
		<shiro:hasPermission name="website:joinus:joinUs:edit"><li><a href="${ctx}/website/joinus/joinUs/form">招聘职位添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="joinus" action="${ctx}/website/joinus/joinUs/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<%--<ul class="ul-form">
			<li><label>职位：</label>
				<form:input path="salary" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>--%>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>编号</th>
				<th>职位</th>
				<th>薪资</th>
				<th>经验</th>
				<th>学历</th>
				<th>工作性质</th>
				<th>岗位职责</th>
				<th>任职资格</th>
				<shiro:hasPermission name="website:joinus:joinUs:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="joinUs">
			<tr>
				<td><a href="${ctx}/website/joinus/joinUs/form?id=${joinUs.id}">
					${joinUs.id}
				</a></td>
				<td>
					${joinUs.position}
				</td>
				<td>
					${joinUs.salary}
				</td>
				<td>
						${joinUs.suffer}
				</td>
				<td>
						${joinUs.education}
				</td>
				<td style=" overflow:hidden;text-overflow:ellipsis;">
						${joinUs.nature}
				</td>
				<td style=" overflow:hidden;text-overflow:ellipsis;">
						${joinUs.postionStatement}
				</td>
				<td style=" overflow:hidden;text-overflow:ellipsis;">
						${joinUs.qualification}
				</td>
				<shiro:hasPermission name="website:joinus:joinUs:edit"><td>
    				<a href="${ctx}/website/joinus/joinUs/form?id=${joinUs.id}">修改</a>
					<a href="${ctx}/website/joinus/joinUs/delete?id=${joinUs.id}" onclick="return confirmx('确认要删除该解决方案吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>