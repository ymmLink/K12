<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新闻详情</title>
	<link href="/static/css/newsDetail.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../static/js/jquery-3.1.1.min.js"></script>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/jsp/w/web/header.jsp"%>
		<%@ include file="/WEB-INF/jsp/w/web/kong.jsp"%>
	</header>
	<div class="newsDetail">
		<div class="newsDetail_context">
			<div class="newsDetail_top">
				<div class="newsDetail_title">${news.title }</div>
				<div class="newsDetail_data">${news.submitDate }</div>
			</div>
			<div class="newsDetail_text">
				${news.detail }
				<!-- 把内容放在这 -->
				<!-- <div class="newsDetail_text_1">专注品质，从现代生活崇尚简约大气的角度出发，家具不仅仅是一件家具这么简单，更是一件工艺品的象征。这个美丽的极简主义收藏是由著名的日本工作室Nendo为中国生活品牌Zens设计的。今年一月在巴黎的Maison展览会上，这个功能主义家具和配件收藏品被分为三个系列：Picto、Chirp和Stone</div>
				<img alt="" src="../static/images/news/new1.png" style="width: calc(1344px * 1);height: calc(756px * 1)">
				<div class="newsDetail_text_1">由四种家具组成的家具收藏：一张桌子，一个凳子，一个小书架和一个容器。每件都有三角形底座，而顶部根据功能而变化；从用作架子的长方体和圆柱形顶部到用于桌子的线形顶部和用作座位的弯曲边缘顶部。皮托背后的灵感来源于汉字，汉字中的一个词有多种含义。
 这些精细的显示系统从日常观察中借鉴它们的外观。通过将单个花瓶和小容器描绘成小鸟，并把它们安放在电线或树形架子的图案上，表达了各种尺寸的鸟儿安息翅膀的图像。花瓶插在灰色面板上，可以根据使用情况进行添加和拆卸。</div>
				<img alt="" src="../static/images/news/new2.png" style="width: calc(1344px * 1);height: calc(756px * 1)">
				<img alt="" src="../static/images/news/new3.png" style="width: calc(1344px * 1);height: calc(756px * 1)"> -->
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/w/web/mark.jsp"%>
	<%@ include file="/WEB-INF/jsp/w/web/footer.jsp"%>
</body>
<script type="text/javascript">
	onload=function(){
		$("#news").css("color","rgba(255,255,255,1)")
		
	}
</script>
</html>