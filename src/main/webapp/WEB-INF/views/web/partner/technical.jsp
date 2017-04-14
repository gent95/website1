<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>

<html>
	<head>
		<meta charset="UTF-8">
		<title>集萃通联</title>
		<meta name="decorator" content="home"/>
		<style>
			*{ padding: 0px; margin: 0px;}
			.nav_img{height: 400px; background-image: url(${ctxStatic}/frontImg/partner/jihuaBanner.png);}
			.part_lines{border-bottom: 1px solid #e3e3e3; margin-left: 358px; margin-right: 358px; height: 82px;}
			.line{border-bottom: 1px solid #e3e3e3; margin-left: 358px; margin-right: 358px; }
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
			.renzheng> div >div{ float: left; margin-right: 130px; background-image: url(${ctxStatic}/frontImg/partner/007.png); width:308px; height:392px;word-break: break-all; word-wrap: break-word;}
			.renzheng> div > div> p{margin-top:117px; margin-left: 30px; margin-right: 30px;line-height: 29px; letter-spacing:1px;font-family:MicrosoftYaHei ; font-size:16px; color: #343434; }
			.renzheng> div{ margin-left: 358px;}
			.renzheng> p{ text-align: center;font-family:MicrosoftYaHei ; font-size:26px; color: #343434;margin-top: 30px; margin-bottom: 30px;}
			.quanyi> p{ text-align: center;font-family:MicrosoftYaHei ; font-size:26px; color: #343434;margin-top: 60px; margin-bottom: 29px;}
			.detail{ margin-left: 358px; margin-bottom: 78px; width: 1178px;word-break: break-all; word-wrap: break-word;line-height: 29px; letter-spacing:1px;font-family:MicrosoftYaHei ; font-size:16px; color: #343434;}
		</style>
	</head>
	<body>
		<div>
		<div class="nav_img"></div>
		<div>
				<div class="part_lines" >

							<ol class="breadcrumb" style="list-style: none; padding-top: 45px;">
								<li><a href="#">合作伙伴计划</a></li>
								<li class="active" style="color: #0068b7;font-family:MicrosoftYaHei ; font-size:18px; ">技术认证</li>
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
				<div>
					<p>
						致力于第三方厂商产品与集萃通联科技互操作和互联互通测试，保障双方产品能够兼容运行，为客户提供既定的产品功能
					</p>
				</div>
				<div>
					<p>
						致力于将第三方厂商产品与集萃通联科技产品与解决方案进行端到端的集成验证，以向客户销售和推荐多样的、有价值的、且经过集萃通联科技测试验证的联合解决方案，提升客户购买信心
					</p>
				</div>
				<div>
					<p>
						第三方厂商产品基于集萃通联科技开放的产品能力和技术支持服务，为客户开发的具有差异化、竞争力的产品/解决方案，经测试认证有效调用了萃通联科技产品的技术能力
					</p>
				</div>
			</div>
		</div>
		</div>
	</body>
</html>



