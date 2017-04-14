<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title> ${site.title}</title>
    <meta charset="UTF-8">
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="decorator" content="home"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="renderer" content="webkit">
    <link rel="stylesheet" href="${ctxStatic}/managecss/hompage.css"/>
    <%--轮播--%>
    <link href="${ctxStatic}/web/css/home/banner.css" rel="stylesheet" type="text/css"/>
    <%--<script type="text/javascript" src="${ctxStatic}/jquery/jquery-1.8.3.min.js"></script>--%>
    <script type="text/javascript" src="${ctxStatic}/bootstrap/js/bootstrap.min.js"></script>
    <script type="application/javascript" src="${ctxStatic}/web/js/home/frontIndex.js"></script>

    <script type="application/javascript">
        $(function () {
            $(".context_right").find("div").eq(0).css("margin-top", "0px")
            $(".styleText").hover(function () {
                $(this).css("color", "#f18a22");
            }, function () {
                $(this).css("color", "");
            });
        })

    </script>
    <style>

    </style>
</head>
<body>
<div class="slider" id="slider">
    <div class="slider-inner">
        <c:forEach var="banner" items="${banner}">
            <div class="item">
                <a href="${frontPath}${banner.url}"><img class="img" src="${banner.picPath}"></a>
            </div>
        </c:forEach>
    </div>
</div>
<div class="divier-line">
    <p class="top_s">行业动态</p>
    <div class="line"></div>
    <div class="greed_line"></div>
    <p class="bottom_s">Company News</p>
</div>

<div style="height: 447px; width:100%; position: relative;">
    <div class="context">
        <%--hot news here--%>

        <div class="context_left"
             style="background-image: url(${hotNews.picPath});background-repeat:no-repeat;position: relative; width: auto; height: 394px;">
            <div class="styleText"
                 style=" margin:0px;margin-top:343px;text-align: center;background: rgba(0,0,0, 0.4);height: 50px; width:554px;">
                <a href="${frontPath}/wapNews?id=${hotNews.id}"
                   style="font-family:MicrosoftYaHei ; font-size:16px;">${hotNews.title}</a>
            </div>
        </div>
        <%--news list ,search three new for here --%>
        <div class="context_right">
            <c:forEach var="news" items="${news}">
                <div>
                    <img onclick="window.location.href='${frontPath}/wapNews?id=${news.id}'" src="${news.picPath}"/>
                    <div class="content_text ">
                        <div onclick="window.location.href='${frontPath}/wapNews?id=${news.id}'"
                             class="styleText" style="overflow:hidden">${news.title}</div>
                        <div class="styleTime"><fmt:formatDate value="${news.addTime}"
                                                               pattern="yyyy年-MM月-dd日 HH:mm:ss"/></div>
                        <div class="border_ss"><a href="${frontPath}/wapNews?id=${news.id}" class="colose">More></a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
</body>

</html>