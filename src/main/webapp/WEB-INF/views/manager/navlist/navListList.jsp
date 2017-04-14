<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>导航管理</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<script type="text/javascript">
		$(document).ready(function() {
			var tpl = $("#treeTableTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
			var data = ${fns:toJson(list)}, ids = [], rootIds = [];
			for (var i=0; i<data.length; i++){
				ids.push(data[i].id);
			}
			ids = ',' + ids.join(',') + ',';
			for (var i=0; i<data.length; i++){
				if (ids.indexOf(','+data[i].parentId+',') == -1){
					if ((','+rootIds.join(',')+',').indexOf(','+data[i].parentId+',') == -1){
						rootIds.push(data[i].parentId);
					}
				}
			}
			for (var i=0; i<rootIds.length; i++){
				addRow("#treeTableList", tpl, data, rootIds[i], true);
			}
			$("#treeTable").treeTable({expandLevel : 5});

			$(".type").each(function () {
						var status = $(this).text();
						if (status == 1) {
							$(this).html("标签");
						} else if(status == 2) {
							$(this).html("图片");
						}else {
							$(this).css("color","red");
							$(this).html("--暂未设置--");
						}
					}
			);
			$(".status").each(function () {
						var status = $(this).text();
						var id= $(this).parent().eq(0).attr("id");
						if (status == 1) {
							$(this).html("<a href='/manager/website/navlist/navList/changeStatus?id="+id+"'><img src='${ctxStatic}/images/default/dui.png'/></a>");
						} else {
							$(this).html("<a href='/manager/website/navlist/navList/changeStatus?id="+id+"'><img src='${ctxStatic}/images/default/cuo.png'/></a>");
						}
					}
			);

		});
		function addRow(list, tpl, data, pid, root){
			for (var i=0; i<data.length; i++){
				var row = data[i];
				if ((${fns:jsGetVal('row.parentId')}) == pid){
					$(list).append(Mustache.render(tpl, {
						dict: {
						blank123:0}, pid: (root?0:pid), row: row
					}));
					addRow(list, tpl, data, row.id);
				}
			}
		}
	</script>
	<script type="application/javascript" src="${ctxStatic}/web/common/js/website/js/navList/navList.js"></script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/website/navlist/navList/">导航列表</a></li>
		<shiro:hasPermission name="website:navlist:navList:edit"><li><a href="${ctx}/website/navlist/navList/form">导航添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="navList" action="${ctx}/website/navlist/navList/" method="post" class="breadcrumb form-search">
		<ul class="ul-form">
			<li><label>名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="treeTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>序号</th>
				<th>名称</th>
				<th>英文名称</th>
				<th>排序</th>
				<th>类型</th>
				<th>图标</th>
				<th>状态</th>
				<shiro:hasPermission name="website:navlist:navList:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody id="treeTableList"></tbody>
	</table>
	<script type="text/template" id="treeTableTpl">
		<tr id="{{row.id}}" pId="{{pid}}">
			<td>
				{{row.id}}
			</td>
			<td>
				{{row.name}}
			</td>
			<td>
				{{row.alias}}
			</td>
			<td>
				{{row.ordrNum}}
			</td>
			<td class="type">
				{{row.type}}
			</td>
			<td class="img-nav">
				${imgCtx}{{row.picPath}}
			</td>

			<td class="status">
				{{row.status}}
			</td>


			<shiro:hasPermission name="website:navlist:navList:edit"><td>
				<a class="btn btn-primary" href="${ctx}/website/navlist/navList/delete?id={{row.id}}" onclick="return confirmx('确认要删除该导航及所有子导航吗？', this.href)">删除</a>
				<a class="btn btn-primary" href="${ctx}/website/navlist/navList/form?id={{row.id}}">修改</a>
				<a class="btn btn-primary" href="${ctx}/website/navlist/navList/form?parent.id={{row.id}}">添加下级导航</a>
			</td></shiro:hasPermission>
		</tr>
	</script>
</body>
</html>