<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新闻资讯</title>
	<link href="/static/css/news.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/jsp/w/web/header.jsp"%>
		<%@ include file="/WEB-INF/jsp/w/web/kong.jsp"%>
		<script type="text/javascript" src="../static/js/jquery-3.1.1.min.js"></script>
	</header>
	<div class="news">
		<div class="news_div">
			<div class="news_1">
				
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/w/web/mark.jsp"%>
	<%@ include file="/WEB-INF/jsp/w/web/footer.jsp"%>
</body>
<script type="text/javascript">
	onload=function(){
		$("#news").css("color","rgba(255,255,255,1)")
		var url = "/news/onload";
		$.ajax({
			"url":url,
			"type":"GET",
			"dataType":"json",
			success:function(json){
				console.log(json)
				var list = json.objs;
				if(json.resInteger==200){
					for(var i=0;i<list.length;i++){
						var op = "<div class='news_img' onclick='click_news("+list[i].id+")'>"+
							"<div class='news_img_top'><img alt='' src='"+list[i].img+"' style='width: calc(420px * 0.8928);height:calc(236px * 0.8928);'></div>"+
							"<div class='news_context'>"+
								"<div class='news_data'>"+list[i].submitDate.substring(5)+"</div>"+
								"<div class='news_title'>"+list[i].title+"</div>"+
								"<div class='news_text'>"+list[i].describe+"</div>"+
								"<div style='cursor:pointer' class='news_mark' onclick='click_news("+list[i].id+")'>></div>"+
							"</div>"+
						"</div>";
						$(".news_1").append(op)
					}
				}else if(json.resInteger==600){
					alert("暂无新闻资讯");
				}
			},
			error:function(){
				alert("新闻初始化失败");
			},
		})
	}
	function click_news(id){
		location.href = "/news/toDetail?id="+id;
	}
</script>
</html>