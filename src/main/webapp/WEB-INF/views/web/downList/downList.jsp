<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="decorator" content="home"/>
    <title>集萃通联</title>
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            font-style: normal;
        }

        #content {
            margin: 0 auto;
            width: 1200px;
        }

        #content #nav {
            width: 1200px;
            height: 72px;
            margin-top: 30px;
            background-color: #23abf1;
            border: 1px solid #23abf1;
            border-bottom: none;
        }

        #content #nav ul {
            list-style: none;
            margin-left: 0px;
        }

        #content #nav ul li {
            float: left;
            width: 240px;
            line-height: 72px;
            position: relative;
        }

        #nav div {
            width: 240px;
            position: absolute;
            left: 0px;
            padding-bottom: 0px;
            float: left;
            height: 0;
            overflow: hidden;
            background-color: #23abf1;
            background: rgba(255, 255, 255, 1);
            border: 1px solid #23abf1;
            border-top: none;
            box-sizing: border-box;
        }

        #content #nav li .a {
            text-decoration: none;
            color: #FFFFFF;
            line-height: 72px;
            display: block;
            text-align: center;
        }

        #nav div a {
            text-decoration: none;
            line-height: 60px;
            display: block;
            text-align: center;
            color: #23abf1;
        }

        #nav div a:hover {
            color: #23abf1;
            background: #fdfcfc
        }

        #nav ul li a:hover {
            background: #23abf1;
            color: #ffffff;
        }
        .aa{
            color:#2b2b2b;
            text-decoration: none;
        }
        .aa:hover{
            color: #23ABF1;
        }
    </style>
</head>
<body>
<div style="font-family:'Microsoft YaHei UI'">
    <div id="content" style=" width:1200px; height:968px; margin:0 auto">
        <div id="hang" style=" width:1200px; height:80px; border-bottom:1px solid #e3e3e3">
            <div style="font-size:18px; color:#343434; float:left; margin-top:46px">技术支持&gt;</div>
            <div style="font-size:18px; color:#0068b7; float:left; margin-top:46px">资料下载</div>
        </div>

        <div id="nav">
            <ul id="supnav">

                <li>
                    <a href="#" class="a">按产品ｖ</a>
                    <div>
                        <a href="#">农业物联网监控系统</a>
                        <a href="#">水肥一体机</a>
                        <a href="#">大棚</a>
                    </div>
                </li>

                <li>
                    <a href="#" class="a">按行业ｖ</a>
                    <div>
                        <a href="#">农业物联网监控系统</a>
                        <a href="#">水肥一体机</a>
                        <a href="#">大棚</a>
                    </div>
                </li>

                <li>
                    <a href="#" class="a">按业务需求ｖ</a>
                    <div>
                        <a href="#">农业物联网监控系统</a>
                        <a href="#">水肥一体机</a>
                        <a href="#">大棚</a>
                    </div>
                </li>

                <li>
                    <a href="#" class="a">按技术热点ｖ</a>
                    <div>
                        <a href="#">农业物联网监控系统</a>
                        <a href="#">水肥一体机</a>
                        <a href="#">大棚</a>
                    </div>
                </li>

                <li>
                    <a href="#" class="a">其他ｖ</a>
                    <div>
                        <a href="#">农业物联网监控系统</a>
                        <a href="#">水肥一体机</a>
                        <a href="#">大棚</a>
                    </div>
                </li>
            </ul>
        </div>

        <div style=" width:1200px; height:720px; border:1px solid #e3e3e3; border-top:none; background-color:#fdfcfc; padding-top:30px;">
            <c:forEach items="${resDows}" var="resDow">
                <div style="width:1194px; height:118px; border-bottom:1px solid #e3e3e3; margin:0 auto;">
                    <div style="width:1128px; height:78px; margin:0 auto">
                        <div style=" width:1050px; height:20px; font-size:18px; color:#2b2b2b; float:left">
                            <a class="aa" href="/resourceDow/downtext?id=${resDow.id}">${resDow.name}</a>
                        </div>
                        <div style=" font-size:14px; color:#b0b0b0; float:left; margin-top:4px "><fmt:formatDate value="${resDow.addTime}" pattern="yyyy-MM-dd"/></div>
                        <div style=" font-size:12px; color:#ef8a23; margin-top:30px; float:left">${resDow.account}</div>
                        <a href="#">
                            <div style=" font-size:12px; color:#b0b0b0; margin-top:30px; float:left; margin-left:20px"><img src="${ctxStatic}/frontImg/content/eye.png" />${resDow.browsecount}</div>
                        </a>
                        <a href="#">
                            <div style=" font-size:12px; color:#b0b0b0; margin-top:30px; float:left; margin-left:30px"><img src="${ctxStatic}/frontImg/content/down.png" />${resDow.downloadcount}</div>
                        </a>
                        <a                                                                                                                                                                                 href="#">
                            <div style=" width:103px; height:44px; background-color:#55a1db; border-radius:3px; float:left; margin-left:822px; margin-top:10px;
                    	text-align:center; line-height:44px; color:#FFF">下载(${resDow.size})</div>
                        </a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<script type="text/javascript">
    var supnav = document.getElementById("supnav");
    var nav = document.getElementById("nav");
    var btns = document.getElementsByTagName("li");
    var subnavs = nav.getElementsByTagName("div");
    var paddingbottom = 0;
    var defaultHeight = 0;

    function drop(obj, ivalue) {
        var a = obj.offsetHeight;
        var speed = (ivalue - obj.offsetHeight) / 8;
        a += Math.floor(speed);
        obj.style.height = a + "px";
    }
    window.onload = function() {
        for(var i = 0; i < btns.length; i++) {
            btns[i].index = i;
            btns[i].onmouseover = function() {
                var osubnav = subnavs[this.index];
                var sublinks = osubnav.getElementsByTagName("a");
                if(osubnav.firstChild.tagName == undefined) {
                    var itarheight = parseInt(osubnav.childNodes[1].offsetHeight) * sublinks.length + paddingbottom;
                } else {
                    var itarheight = parseInt(osubnav.firstChild.offsetHeight) * sublinks.length + paddingbottom;
                }
                clearInterval(this.itimer);
                this.itimer = setInterval(function() {
                        drop(osubnav, itarheight);
                    },
                    30);
            }
            btns[i].onmouseout = function() {
                var osubnav = subnavs[this.index];
                clearInterval(this.itimer);
                this.itimer = setInterval(function() {
                        drop(osubnav, defaultHeight);
                    },
                    30);
            }
        }
    }
</script>
</body>
</html>