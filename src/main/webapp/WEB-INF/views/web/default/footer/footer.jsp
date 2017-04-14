<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="decorator" content="home"/>
    <title></title>
    <style type="text/css">
        a{text-decoration: none;}
        *{
            margin: 0px;
            padding: 0px;
        }
        footer {
            height: 391px;
            background-color: #2a2c38;
            text-align: center;
            color: #FFFFFF;
        }

        #foot_tb {
            margin-bottom: 71px;
            padding-left: 473px;
            padding-top: 57px;
        }

        #foot_nav {
            border-top: #41434d solid 1px;
            padding-top: 30px;
            font-size: 14px;
        }

        #foot_copy {
            font-size: 12px;
        }

        footer a {
            color: #FFFFFF;
        }
    </style>
</head>

<body>
<footer>
    <div id="foot_tb">
        <table width="993px" height="161px">
            <tr style="font-size:18px; font-weight: bold;">
                <td>
                    <a href="#">行业动态</a>
                </td>
                <td>
                    <a href="#">关于我们</a>
                </td>
                <td>
                    <a href="#">联系我们</a>
                </td>
                <td>
                    <a href="#">关注我们</a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="#">行业新闻</a>
                </td>
                <td>
                    <a href="#">网站简介</a>
                </td>
                <td>
                    <a href="#">技术支持</a>
                </td>
                <td rowspan="4">
                    <img src="${ctxStatic}/frontImg/homepage/erweima.png" />
                    <p style="font-size: 12px;">扫描关注<br />集萃通联官方微信</p>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="#">相关政策</a>
                </td>
                <td>
                    <a href="#">公司新闻</a>
                </td>
                <td>
                    <a href="#">销售代表</a>
                </td>

            </tr>
            <tr>
                <td>
                    <a href="#">展会活动</a>
                </td>
                <td>
                    <a href="#">招聘职位</a>
                </td>
                <td>
                    <a href="#">公司&地图</a>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <a href="#">我们的想法</a>
                </td>
            </tr>
        </table>
    </div>
    <div id="foot_nav">
        <nav>
            <a href="#">法律声明</a>|
            <a href="#">隐私保护</a>|
            <a href="#">联系我们</a>
        </nav>
    </div>
    <div id="foot_copy">Copyright&copy;2016 北京集萃通联科技有限公司</div>
</footer>
</body>