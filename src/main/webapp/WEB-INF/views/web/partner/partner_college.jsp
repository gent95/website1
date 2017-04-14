<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>

<html>
	<head>
		<meta charset="UTF-8">

		<title>合作伙伴大学</title>
	</head>
	<style>
		*{ padding: 0px; margin: 0px;}
		.nav_img{height: 400px; background-image: url(${ctxStatic}/frontImg/partner/ziyuanBanner.png);}
		.part_lines{border-bottom: 1px solid #e3e3e3; margin-left: 358px; margin-right: 358px; height: 82px;}
		.partner{height:434px;}
		.breadcrumb > li + li:before {
			    color: #CCCCCC;
			    content: ">";
			    padding: 0 5px;
			    float: left;
			}
			.breadcrumb> li{
				float: left;
			}
			.breadcrumb> li> a{font-family:MicrosoftYaHei ; font-size:18px; color: #343434; text-decoration: none;}
			.partner{margin-top: 20px;}
			.partner> div{margin-left: 293px; width: 215px;height: 433px;float: left;}
			.partner> div> p{font-family:MicrosoftYaHei ; font-size:18px; color: #343434; margin: 0 auto;}
			.partner > div >div{font-family:MicrosoftYaHei ; font-size:16px; color: #343434; width: 207px; word-break: break-all; word-wrap: break-word;line-height: 25px; height: 99px; letter-spacing:2px;}
	</style>
	<body>
	<div>
		<div class="nav_img"></div>
		<div>
				<div class="part_lines" >
					<ol class="breadcrumb" style="list-style: none; padding-top: 45px;">
								<li><a href="#">合作伙伴</a></li>
								<li><a href="#">获取资源</a></li>
								<li class="active" style="color: #0068b7;font-family:MicrosoftYaHei ; font-size:18px; ">合作伙伴大学</li>
						</ol>
				</div>
		</div>
		<div class="partner" >
				<div>
					<p style="text-align: center;"><img src="${ctxStatic}/frontImg/partner/001.png" /></p>
					<p style="text-align: center;margin-top: 25px; margin-bottom: 30px;">北京工业大学</p>
					<div>爱国文化安宏伟韩国人更好玩而毫无二回头我去人头狗求我二球过去热帖未如期我饿</div>
				</div>
					<div>
					<p style="text-align: center;"><img src="${ctxStatic}/frontImg/partner/002.png" /></p>
					<p style="text-align: center;margin-top: 25px; margin-bottom: 30px;">北京大学</p>
					<div>爱国文化安宏伟韩国人更好玩而毫无二回头我去人头狗求我二球过去热帖未如期我饿</div>
				</div>
					<div>
					<p style="text-align: center;"><img src="${ctxStatic}/frontImg/partner/003.png" /></p>
					<p style="text-align: center;margin-top: 25px; margin-bottom: 30px;">北京人民大学</p>
					<div>爱国文化安宏伟韩国人更好玩而毫无二回头我去人头狗求我二球过去热帖未如期我饿</div>
				</div>
		</div>

		</div>
	</body>
</html>
