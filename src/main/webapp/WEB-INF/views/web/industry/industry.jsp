<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>
<html >

	<head>
		<meta name="decorator" content="home"/>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>行业新闻</title>
	<style type="text/css" media="screen">
		
		#pagination-digg li { border:0; margin:0; padding:0; font-size:11px; list-style:none; /* savers */ float:left; }
		#pagination-digg a { border:solid 1px #9aafe5; margin-right:2px; }
		#pagination-digg .previous-off,#pagination-digg .next-off  { border:solid 1px #DEDEDE; color:#888888; display:block; float:left; font-weight:bold; margin-right:2px; padding:3px 4px; }
		#pagination-digg .next a,#pagination-digg .previous a { font-weight:bold; }	
		#pagination-digg .active { background:#2e6ab1; color:#FFFFFF; font-weight:bold; display:block; float:left; padding:4px 6px; /* savers */ margin-right:2px; }
		#pagination-digg a:link,#pagination-digg a:visited { color:#0e509e; display:block; float:left; padding:3px 6px; text-decoration:none; }
		#pagination-digg a:hover { border:solid 1px #0e509e; }
		
		body { font-family:Arial, Helvetica, sans-serif; font-size:12px; }
		h2{ clear:both; border:0; margin:0; padding-top:30px; font-size:13px; }
		p{ border:0; margin:0; padding:0; padding-bottom:20px; }
		ul{ border:0; margin:0; padding:0; }
	</style>

	<script>
		var pagnation=$("#pagnation");
		$(document).on("keydown",function(event){
			switch(event.keyCode){
				 case 37 : window.location.href = pagnation.find(".page-prev").attr("href");break;
				 case 39 : window.location.href = pagnation.find(".page-next").attr("href");break
			}
		});
	</script>
	</head>

	<body>
	<%--<%@ include file="/WEB-INF/views/modules/cms/front/themes/basic/layouts/default.jsp" %>--%>
		<div style="font-family:'Microsoft YaHei UI'">
			<div id="tittle" style="width:auto; height:82px;">

			</div>
			<div id="banner" style=" width:auto; height:400px; background-image:url(images/banner5.png)">
			</div>
			<div id="center" style=" width:1200px; height:1350px; margin:0 auto;">
				<div id="hang" style=" width:1200px; height:80px; border-bottom:1px solid #e3e3e3">
					<div style="font-size:18px; color:#343434; float:left; margin-top:46px">行业动态&gt</div>
					<div style="font-size:18px; color:#0068b7; float:left; margin-top:46px">行业新闻 </div>
				</div>
				<div id="top" style=" height:74px; font-size:26px; color:#343434; padding-top:31px ;">行业新闻</div>
				<div style=" height:1075px; width:1200px;">
					<div style=" width:380px; height:500px; border:1px solid #d2d2d2; float:left; margin-bottom:35px; border-radius:5px">
						<div style="font-size:24px; margin-top: 20px; margin-right:17px; padding-left:17px">2016年12月5日</div>
						<div style=" margin-top:20px; margin-left:17px">
							<img src="images/tupian4.png" />
						</div>
						<div style=" font-size:18px; margin-top:20px; padding-left:17px">
							<a href="#" style="color:#292929; text-decoration: none;">智慧城市项目正式启动</a>
						</div>
						<div style=" font-size:12px;  margin-top:20px; padding-left:17px; line-height:20px">
							<a href="#" style="color:#292929; text-decoration: none;">智慧城市项目正智慧城市项目正式启动智慧城市<br />项目正式启...</a>
						</div>
					</div>
					<div style=" width:380px; height:500px; border:1px solid #d2d2d2; float:left; margin-left:25px; margin-right:25px; margin-bottom:35px; border-radius:5px">
						<div style="font-size:24px; margin-top: 20px; margin-right:17px; padding-left:17px">2016年12月5日</div>
						<div style=" margin-top:20px; margin-left:17px">
							<img src="images/tupian3.png" />
						</div>
						<div style=" font-size:18px;margin-top:20px; padding-left:17px">
							<a href="#" style="color:#292929; text-decoration: none;">智慧城市项目正式启动</a>
						</div>
						<div style=" font-size:12px; margin-top:20px; padding-left:17px; line-height:20px">
							<a href="#" style="color:#292929; text-decoration: none;">智慧城市项目正智慧城市项目正式启动智慧城市<br />项目正式启...</a>
						</div>
					</div>
					<div style=" width:380px; height:500px; border:1px solid #d2d2d2; float:left; margin-bottom:35px; border-radius:5px">
						<div style="font-size:24px; margin-top: 20px; margin-right:17px; padding-left:17px">2016年12月5日</div>
						<div style=" margin-top:20px; margin-left:17px">
							<img src="images/tupian2.png" />
						</div>
						<div style=" font-size:18px;  margin-top:20px; padding-left:17px">
							<a href="#" style="color:#292929; text-decoration: none;">智慧城市项目正式启动</a>
						</div>
						<div style=" font-size:12px; margin-top:20px; padding-left:17px; line-height:20px">
							<a href="#" style="color:#292929; text-decoration: none;">智慧城市项目正智慧城市项目正式启动智慧城市<br />项目正式启...</a>
						</div>
					</div>
					<div style=" width:380px; height:500px; border:1px solid #d2d2d2; float:left; border-radius:5px">
						<div style="font-size:24px; margin-top: 20px; margin-right:17px; padding-left:17px">2016年12月5日</div>
						<div style=" margin-top:20px; margin-left:17px">
							<img src="images/tupian4.png" />
						</div>
						<div style=" font-size:18px;  margin-top:20px; padding-left:17px">
							<a href="#" style="color:#292929; text-decoration: none;">智慧城市项目正式启动</a>
						</div>
						<div style=" font-size:12px;  margin-top:20px; padding-left:17px; line-height:20px">
							<a href="#" style="color:#292929; text-decoration: none;">智慧城市项目正智慧城市项目正式启动智慧城市<br />项目正式启...</a>
						</div>
					</div>
					<div style=" width:380px; height:500px; border:1px solid #d2d2d2; float:left; margin-left:25px; margin-right:25px; border-radius:5px">
						<div style="font-size:24px; margin-top: 20px; margin-right:17px; padding-left:17px">2016年12月5日</div>
						<div style=" margin-top:20px; margin-left:17px">
							<img src="images/tupian3.png" />
						</div>
						<div style=" font-size:18px;  margin-top:20px; padding-left:17px">
							<a href="#" style="color:#292929; text-decoration: none;">智慧城市项目正式启动</a>
						</div>
						<div style=" font-size:12px; margin-top:20px; padding-left:17px; line-height:20px">
							<a href="#" style="color:#292929; text-decoration: none;">智慧城市项目正智慧城市项目正式启动智慧城市<br />项目正式启...</a>
						</div>
					</div>
					<div style=" width:380px; height:500px; border:1px solid #d2d2d2; float:left; border-radius:5px">
						<div style="font-size:24px; margin-top: 20px; margin-right:17px; padding-left:17px">2016年12月5日</div>
						<div style=" margin-top:20px; margin-left:17px">
							<img src="images/tupian2.png" />
						</div>
						<div style=" font-size:18px;  margin-top:20px; padding-left:17px">
							<a href="#" style="color:#292929; text-decoration: none;">智慧城市项目正式启动</a>
						</div>
						<div style=" font-size:12px;  margin-top:20px; padding-left:17px; line-height:20px">
							<a href="#" style="color:#292929; text-decoration: none;">智慧城市项目正智慧城市项目正式启动智慧城市<br />项目正式启...</a>
						</div>
					</div>
				</div>
				
				<div style="width: 300px; height: 20px; margin: 0 auto;">
					<ul id="pagination-digg">
					    <li class="previous-off">&laquo;上一页</li>
					      <li class="active">1</li>
					      <li><a href="?page=2">2</a></li>
					      <li><a href="?page=3">3</a></li>
					      <li><a href="?page=4">4</a></li>
					      <li><a href="?page=5">5</a></li>
					      <li><a href="?page=6">6</a></li>
					      <li><a href="?page=7">7</a></li>
					      <li class="next"><a href="?page=8">下一页 &raquo;</a></li>
					  </ul>
				</div>
			</div>
		</div>
	</body>
	<%--<%@ include file="/WEB-INF/views/modules/cms/front/themes/basic/footer.jsp" %>--%>

</html>