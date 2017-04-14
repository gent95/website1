<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>产品管理</title>
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
		<li class="active"><a href="${ctx}/website/product/product/">产品列表</a></li>
		<shiro:hasPermission name="website:product:product:edit"><li><a href="${ctx}/website/product/product/form">产品添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="product" action="${ctx}/website/product/product/" method="post" class="breadcrumb form-search">
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
				<th>所属导航</th>
				<th>上级菜单</th>
				<th>图片路径</th>
				<th>标题</th>
				<th>内容</th>

				<th>是否显示</th>
				<shiro:hasPermission name="website:product:product:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="product">
			<tr>
				<td><a href="${ctx}/website/product/product/form?id=${product.id}">
					${product.navId}
				</a></td>
				<td>
					${product.navParent}
				</td>
				<td>
					${product.picPath}
				</td>
				<td>
					${product.title}
				</td>
				<td style=" overflow:hidden;text-overflow:ellipsis;">
					${product.context}
				</td>

				<td>
					<c:choose>
						<c:when test="${product.isShow == 1}">
							<img src='${ctxStatic}/images/default/dui.png'/>
						</c:when>
						<c:when test="${product.isShow == 0}">
							<img src='${ctxStatic}/images/default/cuo.png'/>
						</c:when>

					</c:choose>
				</td>
				<shiro:hasPermission name="website:product:product:edit"><td>
    				<a href="${ctx}/website/product/product/form?id=${product.id}">修改</a>
					<a href="${ctx}/website/product/product/delete?id=${product.id}" onclick="return confirmx('确认要删除该产品吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>