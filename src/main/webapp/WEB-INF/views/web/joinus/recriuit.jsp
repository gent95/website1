<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>
<!DOCTYPE html>
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
        article {
            height: auto;
            width: auto;
            padding: 0 364px 0 364px;
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
        #content_tit p a{
            margin-right: 53px;
            width:74px;
            height:42px;
        }

        #content_txt {
            font-size: 16px;
            color: #343434;
            width: 1195px;
            margin: 0 auto 0 auto;
        }
    </style>
    <script type="text/javascript" src="${ctxStatic}/jquery/jquery-1.8.3.js" ></script>
    <script type="text/javascript" src="${ctxStatic}/web/common/js/common/layer/layer.js" ></script>
    <script type="text/javascript" src="${ctxStatic}/web/common/js/common/detail.js" ></script>
    <link rel="stylesheet" href="${ctxStatic}/web/css/joinUs/recruit.css" />
</head>

<body>
<div id="banner" style=" width:1920px; height:400px">
    <img src="${ctxStatic}/frontImg/staff/aboutBanner.png" />
</div>
<div class="context">
    <div class="xian" >
        <div style="font-size:18px; color:#343434; float:left; margin-top:46px">关于我们></div>
        <div style="font-size:18px; color:#0068b7; float:left; margin-top:46px">招聘职位</div>
    </div>
    <c:forEach items="${JoinUsList}" var="joinUs">
    <div class="show1" >
        <div style="float: left;">
            <a class="android" href="#" onclick="showDetail(${joinUs.id})">${joinUs.position}</a>
            <br/>
            <br/>
            <br/>
            <p>${joinUs.salary}    <span>经验${joinUs.suffer}年/ ${joinUs.education}/${joinUs.nature}</span></p>
        </div>
        <div style="float:left; width: 149px; text-align: center;">
            <p style="margin-left:0px;margin-top: 0px; font-size: 14px;color: #bababa; font-family: 'microsoft yahei';">发布时间:
                <fmt:formatDate value="${joinUs.createTime}" pattern="yyyy-MM-dd"/>
            </p>
            <div class="btn" style="margin-left:25px;margin-top:30px; width: 106px; height:30px; background-color: #0068B7;text-align: center; ">
                <a style="margin: 0px; color:white; text-decoration: none;text-align: center; font-size: 14px; font-family: 'microsoft yahei';" href="#">投个简历</a>
            </div>
        </div>
    </div>
    </c:forEach>
</div>
</body>

</html>