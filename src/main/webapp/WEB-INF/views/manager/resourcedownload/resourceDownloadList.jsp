<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>资源下载管理</title>
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
		<li class="active"><a href="${ctx}/website/resourcedownload/resourceDownload/">资源下载列表</a></li>
		<shiro:hasPermission name="website:resourcedownload:resourceDownload:edit"><li><a href="${ctx}/website/resourcedownload/resourceDownload/form">资源下载添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="resourceDownload" action="${ctx}/website/resourcedownload/resourceDownload/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="255" class="input-medium"/>
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
				<th>导航名称</th>
				<th>名称</th>
				<th>下载路径</th>
				<th>详情</th>
				<th>浏览量</th>
				<th>下载量</th>
				<th>大小</th>
				<th>内容</th>
				<th>图片路径</th>
				<shiro:hasPermission name="website:resourcedownload:resourceDownload:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="resourceDownload">
			<tr>
				<td><a href="${ctx}/website/resourcedownload/resourceDownload/form?id=${resourceDownload.id}">
					${resourceDownload.id}
				</a></td>
				<td>
					${resourceDownload.navList.name}
				</td>
				<td>
					${resourceDownload.name}
				</td>
				<td>
					${resourceDownload.url}
				</td>
				<td>
					${resourceDownload.account}
				</td>
				<td>
					${resourceDownload.browsecount}
				</td>
				<td>
					${resourceDownload.downloadcount}
				</td>
				<td>
					${resourceDownload.size}
				</td>
				<td style=" overflow:hidden;text-overflow:ellipsis;">
					${resourceDownload.context}
				</td>
				<td>
					<img src="${resourceDownload.picPath}" width="100px" height="50px"/>
				</td>
				<shiro:hasPermission name="website:resourcedownload:resourceDownload:edit"><td>
    				<a href="${ctx}/website/resourcedownload/resourceDownload/form?id=${resourceDownload.id}">修改</a>
					<a href="${ctx}/website/resourcedownload/resourceDownload/delete?id=${resourceDownload.id}" onclick="return confirmx('确认要删除该资源下载吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>