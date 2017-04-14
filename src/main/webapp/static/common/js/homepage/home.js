
//页面加载后执行
$(document).ready(function(){
	$(".ludeng").hover(function(){
		$(".ludeng").addClass("off");
		},function(){
		$(".ludeng").removeClass("off");
			});
	$(".huanjing").hover(function(){
		$(".huanjing").addClass("off");
		},function(){
		$(".huanjing").removeClass("off");
			});
	$(".wifi").hover(function(){
		$(".wifi").addClass("off");
		},function(){
		$(".wifi").removeClass("off");
			});
	
$(".shiping").hover(function(){
		$(".shiping").addClass("off");
		},function(){
		$(".shiping").removeClass("off");
			});
	
$(".meiti").hover(function(){
		$(".meiti").addClass("off");
		},function(){
		$(".meiti").removeClass("off");
			});
})
	
			function ludeng(){
				alert("路灯控制");
			}
			function huanjing(){
				alert("环境监测");
			}

			function wifi(){
				alert("无线WIFI");
			}

			function shipin(){
				alert("视频监控");
			}

			function meti(){
				alert("媒体屏幕");
			}






