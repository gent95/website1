<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <style type="text/css">
        a{text-decoration: none;}
        *{
            margin: 0px;
            padding: 0px;
        }
        tr{font-family: "Microsoft Yahei"; font-size: 14px; font-weight: bold; text-align: center; }
        footer {
            height: 391px;
            background-color: #2a2c38;
            text-align: center;
            color: #FFFFFF;
        }

        #foot_tb {
            margin-bottom: 65px;
            padding-left: 473px;
            padding-top: 57px;
        }

        #foot_nav {
            border-top: #41434d solid 1px;
            padding-top: 30px;
            font-size: 14px;
            margin-bottom: 11px;
        }
        #foot_copy {
            font-size: 12px;
            color: #FFFFFF;
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
            <tr style="font-size:18px;">
                <td>
                    <a>行业动态</a>
                </td>
                <td>
                    <a>关于我们</a>
                </td>
                <td>
                    <a>联系我们</a>
                </td>
                <td>
                    <a >关注我们</a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="${frontPath}/wapNavList/newsList?navId=158">行业新闻</a>
                </td>
                <td>
                    <a href="${frontPath}/aboutus/company">网站简介</a>
                </td>
                <td>
                    <a href="${frontPath}/wappartner/coalitionPartner?navId=168">技术支持</a>
                </td>
                <td rowspan="4" >
                    <img style="margin-top: 15px;" src="${ctxStatic}/frontImg/homepage/erweima.png" />
                    <p style=" margin-top:11px;font-size: 12px; text-align: center; line-height: 25px; color:#ffffff; font-family: 'Microsoft Yahei'; font-weight: bold;">扫二维码关注<br />集萃通联官方微信</p>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="${frontPath}/wapNavList/newsList?navId=159">相关政策</a>
                </td>
                <td>
                    <a href="${frontPath}/wapNavList/newsList?navId=158">公司新闻</a>
                </td>
                <td>
                    <a href="${frontPath}/map">公司&地图</a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="${frontPath}/wapNavList/newsList?navId=160">展会活动</a>
                </td>
                <td>
                    <a href="${frontPath}/joinus/get">招聘职位</a>
                </td>

            </tr>
            <tr>
                <td colspan="3">
                    <a href="${frontPath}/aboutus/usIdea">我们的想法</a>
                </td>
            </tr>
        </table>
    </div>
    <div id="foot_nav">
        <nav>
            <a href="${frontPath}/wapIndex/privacy">法律声明</a>&nbsp;&nbsp;<span style="color: white;">|</span>&nbsp;
            <a href="${frontPath}/wapIndex/legal">隐私保护</a>&nbsp;&nbsp;<span style="color: white;">|</span>&nbsp;
            <a href="${frontPath}/map">联系我们</a>
        </nav>
    </div>
    <div id="foot_copy">Copyright&copy;2016 北京集萃通联科技有限公司</div>
</footer>
</body>