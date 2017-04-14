<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<title>导航首页</title>
<link media="screen" rel="stylesheet" href="${ctxStatic}/web/css/index/demo.css"/>
<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
<script type="text/javascript">
jQuery(document).ready(function(){
	var qcloud={};
	$('[_t_nav]').hover(function(){
		var _nav = $(this).attr('_t_nav');
		clearTimeout( qcloud[ _nav + '_timer' ] );
		qcloud[ _nav + '_timer' ] = setTimeout(function(){
		$('[_t_nav]').each(function(){
		$(this)[ _nav == $(this).attr('_t_nav') ? 'addClass':'removeClass' ]('nav-up-selected');
		});
		$('#'+_nav).stop(true,true).slideDown(200);
		}, 150);
	},function(){
		var _nav = $(this).attr('_t_nav');
		clearTimeout( qcloud[ _nav + '_timer' ] );
		qcloud[ _nav + '_timer' ] = setTimeout(function(){
		$('[_t_nav]').removeClass('nav-up-selected');
		$('#'+_nav).stop(true,true).slideUp(200);
		}, 150);
	});
});
</script>

</head>
<body>
<div style="text-align:center;clear:both;">
</div>
<div class="head-v3">
	<div class="navigation-up">
		<div class="navigation-inner">
			<div class="navigation-v3">
				<ul>
					<li>
						<h2>
							<a href="#">首页</a>
						</h2>
					</li>
					<c:forEach var="nav" items="${nav}">
						<li class="" _t_nav="${nav.id}">
							<h2>
								<a href="#">${nav.name}</a>
							</h2>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>

	<div class="navigation-down">
        <%--二级节点的--%>
        <c:forEach var="secNav" items="${secNav}">
            <div id="${secNav.id}" class="nav-down-menu menu-1" style="display: none;" _t_nav="${secNav.id}">
                <c:forEach var="nodes" items="${secNav.nodes}">
                    <div class="navigation-down-inner">
                        <dl style="margin-left: 100px;">
                            <dt> <img src="${nodes.picPath}">${nodes.name}</dt>
                        </dl>
                    </div>
                </c:forEach>
            </div>
        </c:forEach>
        <%--三级节点的--%>
        <c:forEach var="secNav" items="${secNav}">
            <div id="${secNav.id}" class="nav-down-menu menu-1" style="display: none;" _t_nav="${secNav.id}">
                <c:forEach var="nodes" items="${secNav.nodes}">
                    <div class="navigation-down-inner">
                        <dl style="margin-left: 100px;">
                            <dt>${nodes.name}</dt>
                        </dl>
                        <c:forEach var="thrid" items="${nodes.nodes}">
                            <dd>
                                <a hotrep="hp.header.product.compute1" href="#">${thrid.name}</a>
                            </dd>
                        </c:forEach>
                    </div>
                </c:forEach>
            </div>
        </c:forEach>


	</div>
</div>

</body>
</html>