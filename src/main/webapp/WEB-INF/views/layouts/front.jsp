<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
    <title><sitemesh:title/></title>
    <link media="screen" rel="stylesheet" href="${ctxStatic}/web/css/index/style.css"/>
    <script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script type="application/javascript" src="${ctxStatic}/web/js/index/index.js"></script>
    <sitemesh:head/>

    <script>
        <%--$(function () {--%>
           <%--initNav(${fnc:getNavList()})--%>
            <%--initHover();--%>
        <%--})--%>
    </script>
</head>
<body onload="initNavList();">
<div style="text-align:center;clear:both;">
</div>
<div class="head-v3">
    <div class="navigation-up">
        <div class="navigation-inner">
            <div class="navigation-v3">
                <ul class="nav-temp">
                </ul>
            </div>
        </div>
    </div>

    <div class="navigation-down">

    </div>

</div>
<sitemesh:body/>
<%@ include file="/WEB-INF/views/web/foot/footer.jsp" %>
</body>
</html>