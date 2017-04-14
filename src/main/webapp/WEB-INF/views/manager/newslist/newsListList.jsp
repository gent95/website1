<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>列表管理</title>
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
    <link rel="stylesheet" href="${ctxStatic}/js/layui/css/layui-bootstrap.css" media="all">
</head>
<body>
<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/website/newslist/newsList/">列表列表</a></li>
    <shiro:hasPermission name="website:newslist:newsList:edit">
        <li><a href="${ctx}/website/newslist/newsList/form">列表添加</a></li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="newsList" action="${ctx}/website/newslist/newsList/" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>新闻标题：</label>
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
        <th>模块</th>
        <th>新闻摘要</th>
        <th>引导图</th>
        <th>排序</th>
        <th>状态</th>
        <th>首页推荐</th>
        <th>添加时间</th>
        <shiro:hasPermission name="website:newslist:newsList:edit">
            <th>操作</th>
        </shiro:hasPermission>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="newsList">
        <tr>
            <td>
                    ${newsList.id}
            </td>
            <td >
                    ${newsList.navName}
            </td>

            <td>
                    ${newsList.title}
            </td>
            <td>
                <img src="${newsList.picPath}" style="height: 50px;width: 80px">
            </td>
            <td>
                    ${newsList.orderNum}
            </td>
            <td>
                <c:choose>
                    <c:when test="${newsList.showFlag == 1}">
                        <img src='${ctxStatic}/images/default/dui.png'/>
                    </c:when>
                    <c:when test="  ${newsList.showFlag == 0}">
                        <img src='${ctxStatic}/images/default/cuo.png'/>
                    </c:when>

                </c:choose>

            </td>
            <td>
                <c:choose>
                    <c:when test="${newsList.recommend == 1}">
                        <a href="${ctx}/website/newslist/newsList/recommend?id=${newsList.id}"><img
                                src='${ctxStatic}/images/default/dui.png'/></a>
                    </c:when>
                    <c:when test="${newsList.recommend == 0}">
                        <a href="${ctx}/website/newslist/newsList/recommend?id=${newsList.id}"> <img
                                src='${ctxStatic}/images/default/cuo.png'/></a>
                    </c:when>
                </c:choose>
            </td>
            <td>
                <fmt:formatDate value="${newsList.addTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>

            <shiro:hasPermission name="website:newslist:newsList:edit">
                <td>
                    <a class="btn btn-primary" href="${ctx}/website/newslist/newsList/form?id=${newsList.id}">修改</a>
                    <a class="btn btn-primary"
                       href="${ctx}/website/newscontent/newsContext/form?newListId=${newsList.id}">内容</a>
                    <a class="btn btn-primary" href="${ctx}/website/newslist/newsList/delete?id=${newsList.id}"
                       onclick="return confirmx('确认要删除该列表吗？', this.href)">删除</a>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>