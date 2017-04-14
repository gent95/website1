<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>
<html>

<head>

    <meta charset="utf-8" />
    <meta name="decorator" content="home"/>
    <title>集萃通联</title>
    <style type="text/css">
        * {
            margin: 0px;
            padding: 0px;
            text-decoration: none;
            font-family: "微软雅黑";
        }

        header {
            height: 482px;
            overflow: hidden;
        }

        #banner {
            <%--background: url(${ctxStatic}/frontImg/content/banner4.png) no-repeat top;--%>
            height: 400px;
            width: auto;
        }

        article {
            height: auto;
            width: auto;
            padding: 0 364px 0 364px;
        }

        #art_nav {
            font-size: 18px;
            height: 80px;
            border-bottom: solid #e3e3e3 1px;
            line-height: 100px;
        }

        #art_nav a {
            color: #0068b7;
        }

        #content_tit {
            font-size: 26px;
            padding-top: 26px;
            width: 1195px;
            margin: 0 auto 42px auto;
        }

        #content_tit p {
            margin-bottom: 30px;

        }

        #content_txt {
            font-size: 16px;
            color: #343434;
            width: 1195px;
            margin: 0 auto 0 auto;
        }

        footer {
            height: 391px;
            background-color: #2a2c38;
            text-align: center;
            color: #FFFFFF;
        }
        footer a {
            color: #FFFFFF;
        }
    </style>

    <script type="application/javascript" src="${ctxStatic}/jquery/jquery-1.8.3.min.js"></script>
    <script type="application/javascript">
        $(function(){
            var con=$("[name='con']").val();
            $("#content_txt").children().html(con);
        });
    </script>
</head>

<body>

<header>
    <div id="banner">
        <img src="${ctxStatic}/frontImg/content/banner4.png"/>
    </div>
</header>
<article>
    <%--<c:set var="size" value="${fn:length(product)}"/>--%>
    <div id="art_nav">
       服务&gt;
        <a href="javascript:void(0)">${serve.navParent}</a>
    </div>
    <div id="content_tit">
        <p>${serve.title}</p>
    </div>
        <input type="hidden" value="${serve.context}" name="con"/>
    <div id="content_txt">
        <p style="line-height: 30px;">
        </p>
    </div>
</article>
</body>
</html>