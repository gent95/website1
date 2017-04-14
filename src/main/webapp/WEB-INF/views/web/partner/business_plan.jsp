<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>

<html>
	<head>
		<meta charset="UTF-8">
		<meta name="decorator" content="home"/>
		<title>集萃通联</title>
		<style>
			*{ padding: 0px; margin: 0px;}
			.nav_img{height: 400px; background-image: url(${ctxStatic}/frontImg/partner/jihuaBanner.png);}
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
			.partner{height: 290px; margin-top: 30px;margin-left: 385px;}
			.partner> div{float: left; height: 225px;}
			.context_s{width: 710px;margin-left:32px; word-break: break-all; word-wrap: break-word;line-height: 29px; letter-spacing:2px;font-family:MicrosoftYaHei ; font-size:16px; color: #343434;}
			.line{border-bottom: 1px solid #e3e3e3; margin-left: 358px; margin-right: 358px; }
			.renzheng> div >div{ float: left; margin-right: 46px; width:265px; height:338px;word-break: break-all; word-wrap: break-word;text-align: center}
			.renzheng> div > div> p{ margin-bottom:30px;text-align: center;margin-top:107px; margin-left: 60px; margin-right: 60px;line-height: 29px; letter-spacing:1px;font-family:MicrosoftYaHei ; font-size:18px; color: #343434; }
			.renzheng> div{ margin-left: 358px; margin-bottom: 53px;}
			.renzheng> p{ text-align: center;font-family:MicrosoftYaHei; font-size:26px; color: #343434;margin-top: 30px; margin-bottom: 30px;}
			ul { font-size:18px; }
		</style>
	</head>

	<body>
		<div>
		<div class="nav_img"></div>
		<div>
				<div class="part_lines" >
					<ol class="breadcrumb" style="list-style: none; padding-top: 45px;">
								<li><a href="#">合作伙伴</a></li>
								<li class="active" style="color: #0068b7;font-family:MicrosoftYaHei ; font-size:18px; ">企业业务解决方案伙伴计划</li>
						</ol>
				</div>
		</div>
			<div class="partner">
			<div style="background-image: url(${ctxStatic}/frontImg/partner/006.png); width: 400px;"></div>
			<div class="context_s">
				面对市场上多样化的产品和解决方案，客户迫切需要高效的解决方案，应对业务挑战。
				&nbsp;<br>&nbsp;<br>
				针对客户多样化的需求，四大技术认证项目，通过开放实验室与广大伙伴一起构建高效的
				、经过严格验证的解决方案，帮助客户应对不断变化的业务挑战。如果您的产品能够与集
				萃通联优势互补，面向客户能够形成有竞争力的解决方案，均可参与其中。针对客户多样
				化的需求，四大技术认证项目，通过开放实验室与广大伙伴一起构建高效的、经过严格验
				证的解决方案，帮助客户应对不断变化的业务挑战。
			</div>
		</div>
		<div class="line"></div>
		<div class="renzheng" style="height: 483px;">
			<p style="text-align: center;">技术认证种类</p>
			<div>
				<div style="background-image:url(${ctxStatic}/frontImg/partner/01.png);">
					<p>生产者管理</p>
					<div style="text-align: center;">
						<ul>
							<li>·生产监控&nbsp;&nbsp;&nbsp;</li>
							<li>·信息推送&nbsp;&nbsp;&nbsp;</li>
							<li>·农业品推广</li>
						</ul>
					</div>
				</div>
				<div style="background-image:url(${ctxStatic}/frontImg/partner/02.png);">
					<p>物流业者管理</p>
					<div style="text-align: center;">
						<ul>
							<li>·实时定位&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
							<li>·异常信息推送</li>
							<li>·供应链管理&nbsp;&nbsp;&nbsp;</li>
						</ul>
					</div>
				</div>
				<div style="background-image:url(${ctxStatic}/frontImg/partner/03.png);">
					<p>消费者溯源</p>
					<div style="text-align: center;">
						<ul>
							<li>·企业信息</li>
							<li>·电子履历</li>
							<li>·过程查询</li>
						</ul>
					</div>
				</div>
				<div style="background-image:url(${ctxStatic}/frontImg/partner/04.png);">
					<p>监管者召回</p>
					<div style="text-align: center;">
						<ul>
							<li>·问题产品信息</li>
							<li>·产品定位&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
							<li>·一键召回&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		</div>
	</body>
</html>
