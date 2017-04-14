<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="decorator" content="home"/>
    <title>集萃通联</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${ctxStatic}/web/css/news/news.css">
    <script type="application/javascript" src="${ctxStatic}/jquery/jquery-1.8.3.min.js"></script>
    <script type="application/javascript" src="${ctxStatic}/web/js/news/newsIndex/newsIndex.js"></script>
    <script>
       $(function () {
           var ba = $("#banner").children().attr("src");
           if(ba == ""){
               $("#banner").remove();
           }
       })


    </script>

</head>

<body>
<header>
    <%--<%@ include file="/WEB-INF/views/modules/cms/front/themes/basic/layouts/default.jsp" %>--%>
    <div id="banner">
        <img src="${news.banner}"/>
    </div>
</header>
<article>
    <div id="hang" style=" width:1200px; height:80px; border-bottom:1px solid #e3e3e3">
        <div style="font-size:18px; color:#343434; float:left; margin-top:46px"> ${news.parentNavName}&gt;</div>
        <div style="font-size:18px; color:#0068b7; float:left; margin-top:46px">
            ${news.navName}
        </div>
    </div>

    <div id="content_tit">
        <p align="center">${news.contextTitle}</p>
        <div id="content_pub">
            <table width="100%">
                <tr>
                    <td><acronym >时间:&nbsp;&nbsp;
                        <fmt:formatDate value="${news.addTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                    </acronym></td>
                    <td><acronym >文章来源:&nbsp;&nbsp;集萃通联</acronym></td>
                    <td><acronym >点击量:&nbsp;&nbsp;1685</acronym></td>
                </tr>
            </table>
        </div>
    </div>
    <div id="content" style="font-size: 16px;">
        ${news.context}
    </div><br />
</article>
<%--<%@ include file="/WEB-INF/views/modules/cms/front/themes/basic/footer.jsp" %>--%>
</body>

</html>
