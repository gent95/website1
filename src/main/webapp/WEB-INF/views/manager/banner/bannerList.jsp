<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>轮播图管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
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
    <li class="active"><a href="${ctx}/website/banner/banner/">轮播图列表</a></li>
    <shiro:hasPermission name="website:banner:banner:edit">
        <li><a href="${ctx}/website/banner/banner/form">轮播图添加</a></li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="banner" action="${ctx}/website/banner/banner/" method="post"
           class="breadcrumb form-search">
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
        <th>序号</th>
        <th>标题</th>
        <th>图片</th>
        <th>排序</th>
        <th>是否显示</th>
        <th>添加时间</th>
        <shiro:hasPermission name="website:banner:banner:edit">
            <th>操作</th>
        </shiro:hasPermission>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="banner">
        <tr>
            <td>
                    ${banner.id}
            </td>
            <td>
                    ${banner.title}
            </td>
            <td>
                <img src="${banner.picPath}" width="100px" height="50">
            </td>
            <td>
                    ${banner.orderNum}
            </td>
            <td class="showFlag">
                <c:choose>
                    <c:when test="${banner.showFlag == 1}">
                        <a href="${ctx}/website/banner/banner/changeStatus?id=${banner.id}&showFlag=${banner.showFlag}">
                            <img src='${ctxStatic}/images/default/dui.png'/>
                        </a>
                    </c:when>
                    <c:when test="${banner.showFlag == 0}">
                        <a href="${ctx}/website/banner/banner/changeStatus?id=${banner.id}&showFlag=${banner.showFlag}">
                            <img src='${ctxStatic}/images/default/cuo.png'/>
                        </a>
                    </c:when>
                </c:choose>
            </td>
            <td>
                <fmt:formatDate value="${banner.addTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <shiro:hasPermission name="website:banner:banner:edit">
                <td>
                    <a href="${ctx}/website/banner/banner/delete?id=${banner.id}"  onclick="return confirmx('确认要删除该轮播图吗？', this.href)" class="btn btn-primary">删除</a>
                    <a href="${ctx}/website/banner/banner/form?id=${banner.id}"   class="btn btn-primary">修改</a>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>