<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>
<html>
<head>
    <title>集萃通联</title>
    <meta name="decorator" content="home"/>
    <style type="text/css">
        a {
            text-decoration: none;
        }

        .a {
            color: #343434;
        }

        .a:hover {
            color: #f18a22;
        }
        #banner {

            height: 400px;
            width: auto;
        }
        .showborder{
            border:1px solid #295a94;
            color:#295a94;
        }
        .noshowboder{
            border:1px solid #f18a22;
            color:#f18a22;
        }
        .pagination {margin:0px;padding: 0px;} .pagination .controls a{border:0;}
    </style>
    <link href="${ctxStatic}/common/jeesite.css" type="text/css" rel="stylesheet" />
    <link href="${ctxStatic}/bootstrap/2.3.1/css_cerulean/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="${ctxStatic}/bootstrap/2.3.1/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${ctxStatic}/common/jeesite.js" type="text/javascript"></script>
    <script type="application/javascript" src="${ctxStatic}/jquery/jquery-1.8.3.min.js"></script>
    <script type="application/javascript">
        $(function(){
            $(".contexts").children("div").eq(0).css({"margin-top":"55px","margin-right":"22px"});
            $(".contexts").children("div").eq(1).css({"margin-top":"55px"});
            $(".contexts").children("div").eq(2).css({"margin-top":"100px","margin-right":"22px"});
            $(".contexts").children("div").eq(3).css({"margin-top":"100px"});
            var navName=$(".navName").val();
            $(".navShow").append(navName);

            var title=$(".title").eq(0).val();
            var title1=$(".title").eq(1).val();
            var title2=$(".title").eq(2).val();
            var title3=$(".title").eq(3).val();
            $(".con").eq(0).html(title);
            $(".con").eq(1).html(title1);
            $(".con").eq(2).html(title2);
            $(".con").eq(3).html(title3);


        });
        function isnewShow(obj) {
            $(obj).removeClass("showborder");
            $(obj).addClass("noshowboder");
        }
        function Closenewshow(obj) {
            $(obj).removeClass("noshowboder");
            $(obj).addClass("showborder");
        }
        function page(n, s) {
            var navId=$(".navId").val();
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            var data={"navId":navId,"pageNo":n,"pageSize":s}
            $.ajax({
                url:"/wapsolution/applicationCase",
                type:"post",
                data:data/*,
                 success:function(data){
                 return data;
                 }*/
            })
        }
    </script>
</head>
<body>
<div style="font-family:'Microsoft YaHei UI'">
    <div id="banner" style="background: <c:if test="${type=='智慧农业'}">url(${ctxStatic}/frontImg/solution/nongyeBanner.png) no-repeat top</c:if>
    <c:if test="${type=='智慧园区'}">url(${ctxStatic}/frontImg/solution/yuanquBanner.png) no-repeat top</c:if>
    <c:if test="${type=='智慧社区'}">url(${ctxStatic}/frontImg/solution/shequBanner.png) no-repeat top</c:if>
            "></div>

    <div id="center" style=" width:1200px; height:785px; margin:0 auto">
        <div id="hang" style=" width:1200px; height:80px; border-bottom:1px solid #e3e3e3">
         <div style="font-size:18px; color:#343434; float:left; margin-top:46px">${type}&gt</div>
            <div style="font-size:18px; color:#0068b7; float:left; margin-top:46px" class="navShow"></div>
        </div>
        <form id="searchForm" method="post">
            <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
            <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
        <div style="width:1200px; height:654px" class="contexts">
            <input type="hidden" value="${page.count}" id="count"/>
            <c:forEach var="solution" items="${page.list}">
            <div style=" width:587px; height:217px; float:left; ">
                <div style="float:left; margin-right:24px"><img src="${solution.picPath}" /></div>
                <div style="width:280px; height:127px; float:left">
                    <div  class="con" style="margin-top:15px; line-height:27px; font-size:16px; font-family: 'Microsoft Yahei'">

                    </div>

                    <a href="/wapsolution/detail?id=${solution.id}&name=${type}">
                        <div class="showborder" onmouseover='isnewShow(this)' onmouseout='Closenewshow(this)' style="width:42px; height:19px; font-size:12px; padding-top:4px; padding-left:5px; float:left; margin-left:200px; margin-top:8px">
                            More&gt;
                        </div>
                    </a>
                </div>
                <input type="hidden" value="${solution.navList.name}" class="navName">
                <input type="hidden" value="${solution.navList.id}" class="navId">
            </div>
                <input type="hidden" value="${solution.title}" class="title">
            </c:forEach>
        </div>
        </form>
        <div class="pagination">${page}</div>
    </div>

</div>
</body>

</html>
