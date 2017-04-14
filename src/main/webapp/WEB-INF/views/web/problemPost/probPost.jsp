<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>
<html>

<head>
    <meta charset="utf-8" />
    <meta name="decorator" content="home"/>
    <title>问题提交</title>
    <style type="text/css">
        * {
            margin: 0px;
            padding: 0px;
            text-decoration: none;
            font-family: "微软雅黑";
        }

        header {
            height: 82px;
            overflow: hidden;
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
            margin-bottom: 46px;
        }

        #content_tit p {
            background-color: #fdfcfc;
            padding-top: 50px;
            padding-left: 46px;
        }

        #content_txt{
            width: 1200px;
        }

        #content_txt form {
            background-color: #fdfcfc;
            margin: 28px auto 43px auto;
            padding-left: 45px;
        }

        #content_txt form span{
            color: #f18a22;
        }

        #content_txt form div input{
            width: 1101px;
            border: solid 1px #E3E3E3;
        }

        #content_txt form div p{
            font-size: 18px;
        }

        .box{
            margin-bottom: 30px;
        }

        #sub:hover{
            cursor: pointer;
            color: #f18a22;
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
<article>
    <div id="art_nav">
        产品介绍&gt;
        <a href="#">农业物联网监控系统</a>
    </div>
    <div id="content_txt">
        <div id="content_tit">
            <p>问题提交</p>
        </div>
        <form action="/problemPost/postMsg" method="post">
            <div id="form_par">
                <div id="ch_1" class="box">
                    <p>问题&nbsp;&nbsp;&nbsp;&nbsp;<span>*</span></p><br />
                    <input name="question" type="text" placeholder="请简单描述以下你的问题" style="height: 58px;" />
                </div>

                <div id="ch_2" class="box">
                    <p>详情&nbsp;&nbsp;<span>*</span></p><br />
                    <textarea name="details" style="width: 1101px; height: 140px; border: solid 1px #E3E3E3;" placeholder="请详细描述您遇到的具体情况"></textarea>
                </div>

                <div id="ch_3" class="box">
                    <p>姓名&nbsp;&nbsp;<span>*</span></p><br />
                    <input name="name" type="text" placeholder="请简单描述以下你的问题" style="height: 58px;" />
                </div>

                <div id="ch_4" class="box">
                    <p>联系电话&nbsp;&nbsp;<span>*</span></p><br />
                    <input name="phone" type="text" placeholder="请简单描述以下你的问题" style="height: 58px;" />
                </div>

                <div id="ch_5" class="box">
                    <p>邮箱&nbsp;&nbsp;<span>*</span></p><br />
                    <input name="email" type="text" placeholder="请简单描述以下你的问题" style="height: 58px;" />
                </div>
            </div>
            <p style="width: 1001px; padding-left: 40%;">
                <input name="submit" id="sub" type="submit" value="提交" style="width:248px;height:60px;background-color: #0168b7; border: solid 1px #2A2C38; font-size: 18px; color: white; " />
            </p>
        </form>
    </div>
</article>
</body>

</html>
