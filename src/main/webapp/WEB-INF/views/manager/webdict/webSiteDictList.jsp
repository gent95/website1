<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>字典参数管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".status").each(function () {
                        var status = $(this).text()
                        if (status == 1) {
                            $(this).html("<img src='${ctxStatic}/images/default/dui.png'/>");
                        } else {
                            $(this).html("<img src='${ctxStatic}/images/default/cuo.png'/>");
                        }
                    }
            )

        });
        function page(n, s) {
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/website/webdict/webSiteDict/">字典参数列表</a></li>
    <shiro:hasPermission name="website:webdict:webSiteDict:edit">
        <li><a href="${ctx}/website/webdict/webSiteDict/form">字典参数添加</a></li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="webSiteDict" action="${ctx}/website/webdict/webSiteDict/" method="post"
           class="breadcrumb form-search">
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
        <th>序号</th>
        <th>名称</th>
        <th>键</th>
        <th>值</th>
        <th>启用状态</th>
        <th>备注</th>
        <shiro:hasPermission name="website:webdict:webSiteDict:edit">
            <th>操作</th>
        </shiro:hasPermission>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="webSiteDict">
        <tr>
            <td>
                    ${webSiteDict.id}
            </td>
            <td>
                    ${webSiteDict.name}
            </td>
            <td>
                    ${webSiteDict.keyValue}
            </td>
            <td>
                    ${webSiteDict.lockValue}
            </td>
            <td class="status">
                    ${webSiteDict.status}
            </td>
            <td>
                    ${webSiteDict.remark}
            </td>
            <shiro:hasPermission name="website:webdict:webSiteDict:edit">
                <td>
                    <a class="btn btn-primary" href="${ctx}/website/webdict/webSiteDict/form?id=${webSiteDict.id}">修改</a>
                    <a class="btn btn-primary" href="${ctx}/website/webdict/webSiteDict/delete?id=${webSiteDict.id}"
                       onclick="return confirmx('确认要删除该字典参数吗？', this.href)">删除</a>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>