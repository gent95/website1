<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>

<html>
	<head>
		<meta charset="UTF-8">
		<meta name="decorator" content="default"/>
		<title></title>
		<link rel="stylesheet" href="${ctxStatic}/web/css/joinUs/recruit.css" />
		<script type="application/javascript" src="${ctxStatic}/jquery/jquery-1.8.3.min.js"></script>
		<script type="application/javascript">
            $(function(){
                var zhiwei=$("[name='zhiweis']").val();
				$(".zhiwei").children("div").html(zhiwei);

                var zige=$("[name='ziges']").val();
                $(".zige").children("div").html(zige);
            });
		</script>
	</head>
	<body>
		<div class="text_conter">
			<div style="color: #0068b7; font-size: 24px; font-family: 'microsoft yahei'; text-align: center;">
				${joinUs.position}
			</div>
			<input type="hidden" value="${joinUs.postionStatement}" name="zhiweis" />
			<input type="hidden" value="${joinUs.qualification}" name="ziges" />
			<div class="zhiwei">
				<p>岗位职责:</p>
				<div></div>
			</div>
			<div class="zige">
				<p>任职资格：</p>
			<div></div>
			</div>
			<div style="text-align: center; margin: 0 auto; margin-top: 5%;">
				<div style="width: 106px; height:30px; background-color: #0068B7;margin-left: 320px;">
					<a style=" text-decoration: none; color: white; font-size: 14px; font-family: 'microsoft yahei';" href="#">投个简历</a>
				</div>
			</div>
		</div>
	</body>
</html>
