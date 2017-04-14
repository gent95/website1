<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>
<html>

<head>
    <meta charset="UTF-8">
    <title>集萃通联</title>
    <meta name="decorator" content="home"/>
    <%-- <link rel="stylesheet" href="/static/web/css/news/newsList/newsList.css" rel="stylesheet"/>--%>
    <style>
        .new_list {
            width: 1200px;
            height: 271px;
            margin-bottom: 23px;
        }

        .photo_list {
            height: auto;
            width:auto;
            float: left;
        }

        .new {
            height: auto;
            float: left;
        }
        .new_context {
            width: auto;
        }
        .new_title {
            height: auto;
            width: auto;
            float: left;
        }

        .new_title > .title > a{
            font-weight: bold;
            font-size: 20px;
            width: auto;
            float: left;
            text-decoration: none;
            color: #343434;
        }

        .new_title > .title > a:hover {
            font-weight: bold;
            color: #F18A22;
            font-size: 20px;
        }



        .new_context > p > div {
            line-height: 28px;
            color: #343434;
            font-size: 14px;
        }

        .date {
            color: #ADADAD;
            font-size: 14px;
            margin-top: 50px;
            float: left;
        }

        .ljxq {
            width: 123px;
            height: 42px;
            float: right;
            border: 2px solid #d8d8d8;
            float:right;
            margin-top: 30px;
            text-align: center;
        }

        .ljxq > p >a {
            font-size: 18px;
            color: #323232;
            margin: 0 auto;
            text-align: center;
            line-height: 42px;
        }

        .ljxq:hover {
            border: 2px solid #F18A22;
        }

        .ljxq > p > a:hover {
            color: #F18A22;
        }

        #aa {
            height: 23px;
            width: auto;
            background-color: #fbfbfb;
        }

        .new_b {
            width: 1200px;
            height: 250px;
            margin: 0 auto;
        }

        .new_b_list {
            width: 1200px;
            height: 198px;
        }

        .new_b_list_title {
            height: 20px;
            width: 1200px;
            font-weight: bold;
            font-size: 20px;
            margin-top: 26px;
        }

        .new_b_list_title:hover{
            height: 20px;
            width: 1200px;
            font-weight: bold;
            font-size: 20px;
            margin-top: 26px;
            color: #F18A22;
        }

        .new_b_list_context {
            font-size: 14px;
            color: #323232;
            margin-top: 24px;
            width: 1200px;
            height: 110px;
            line-height: 30px;
        }

        .sj {
            color: #ADADAD;
            font-size: 14px;
            margin-top: 16px;
            float: left;
        }

        .xq {
            width: 123px;
            height: 42px;
            float: left;
            border: 2px solid #d8d8d8;
            margin-left: 962px;
        }

        .xq p {
            font-size: 18px;
            color: #323232;
            margin: 0 auto;
            text-align: center;
            line-height: 42px;
        }

        .xq:hover {
            width: 123px;
            height: 42px;
            float: left;
            border: 2px solid #F18A22;
            margin-left: 962px;
        }

        .xq p:hover {
            font-size: 18px;
            color: #F18A22;
            margin: 0 auto;
            text-align: center;
            line-height: 42px;
        }

        #h {
            border-bottom: 1px solid #D8D8D8;
        }

        #fy {
            height: 55px;
            width: 1200px;
            margin: 0 auto;
        }

        #pagination-digg li {
            border: 0;
            margin: 0;
            padding: 0;
            font-size: 11px;
            list-style: none;
            /* savers */
            float: left;
        }

        #pagination-digg a {
            border: solid 1px #9aafe5;
            margin-right: 2px;
        }

        #pagination-digg .previous-off,
        #pagination-digg .next-off {
            border: solid 1px #DEDEDE;
            color: #888888;
            display: block;
            float: left;
            font-weight: bold;
            margin-right: 2px;
            padding: 3px 4px;
        }

        #pagination-digg .next a,
        #pagination-digg .previous a {
            font-weight: bold;
        }

        #pagination-digg .active {
            background: #2e6ab1;
            color: #FFFFFF;
            font-weight: bold;
            display: block;
            float: left;
            padding: 4px 6px;
            /* savers */
            margin-right: 2px;
        }

        #pagination-digg a:link,
        #pagination-digg a:visited {
            color: #0e509e;
            display: block;
            float: left;
            padding: 3px 6px;
            text-decoration: none;
        }

        #pagination-digg a:hover {
            border: solid 1px #0e509e;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
        }

        h2 {
            clear: both;
            border: 0;
            margin: 0;
            padding-top: 30px;
            font-size: 13px;
        }

        p {
            border: 0;
            margin: 0;
            padding: 0;
            padding-bottom: 20px;
        }

        ul {
            border: 0;
            margin: 0;
            padding: 0;
        }
    </style>
</head>

<body>
<%--<%@ include file="/WEB-INF/views/modules/cms/front/themes/basic/layouts/default.jsp" %>--%>
<div style="font-family:'Microsoft YaHei UI'; ">


    <div id="center" style=" width:1200px; height:auto; margin:0 auto">
        <div id="hang" style=" width:1200px; height:80px; border-bottom:1px solid #e3e3e3">
            <div style="font-size:18px; color:#343434; float:left; margin-top:46px">行业动态&gt;</div>
            <div style="font-size:18px; color:#0068b7; float:left; margin-top:46px">
                ${navList.name}
            </div>
        </div>

        <div id="top" style=" height:74px; font-size:26px; color:#343434; padding-top:31px ;"> ${navList.name}</div>
        <%--图片新闻--%>
        <c:forEach var="news" items="${news}">
            <div class="new_list">
                <c:if test="${news.picPath==''&&news.picPath==null}">
                </c:if>
                <c:if test="${news.picPath!=''&&news.picPath!=null}">
                    <div class="photo_list">
                        <img src="${ctxImg}${news.picPath}" style="width: 297px;height: 201px"/>

                    </div>
                </c:if>
                <div class="new" style='
                <c:if test="${news.picPath!=''&&news.picPath!=null}">width:795px;  margin-left: 35px;</c:if>
                <c:if test="${news.picPath==''&&news.picPath==null}">width:auto;  margin-left: 0px;</c:if>'>
                    <div class="new_title ">
                        <div class="title"><a href="${frontPath}/wapNews?id=${news.id}">${news.contextTitle}</a></div>

                        <div class="new_context ">
                            <p>
                            <div style="font-size: 14px;margin-top: 40px; line-height: 25px;">${news.title}</div>
                            </p>
                        </div>
                        <div class="date ">
                            <fmt:formatDate value="${news.addTime}" pattern=" yyyy年MM月dd日 E"/><br>
                        </div>
                        <a href="#">
                            <div class="ljxq ">
                                    <%--新闻详细路径--%>
                                <p><a href="${frontPath}/wapNews?id=${news.id}">了解详情&gt;&gt;</a></p>
                            </div>
                        </a>

                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <%--<%@ include file="/WEB-INF/views/modules/cms/front/themes/basic/footer.jsp" %>--%>
</body>

</html>