<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>搜索</title>
	<link href="/static/css/search.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../static/js/jquery-3.1.1.min.js"></script>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/jsp/w/web/header.jsp"%>
		<%@ include file="/WEB-INF/jsp/w/web/kong.jsp"%>
		
	</header>
	<div class="activity">
		<div class="activity_content">
			<div class="activity_title">搜索结果</div>
			
		</div>
		<div class="activity_img">
			<div class="activity_img_1">
			<c:forEach items="${sousuo}" var="u" varStatus="s">
				<div class="activity_img_1_1" onclick='click_produce(${u.bianma})' style='cursor:pointer'>
					<div><img alt="" src="${u.skuMainPic }" style="width: clac(321px * 0.711);height: calc(181px * 0.711);"></div>
					<div class="activity_img_info">
						<div class="activity_img_title">${u.title }</div>
						<%-- <div class="activity_img_oldprice">￥${u.marketPrice }</div> --%>
						<div class="activity_img_newprice">￥${u.price }</div>
					</div>
				</div>
			</c:forEach>
			</div>
		</div>
		<%@ include file="/WEB-INF/jsp/w/web/mark.jsp"%>
	</div>
	
	<%@ include file="/WEB-INF/jsp/w/web/footer.jsp"%>
	
</body>
<script type="text/javascript">
	onload=function(){
		
	}
	function click_produce(id){
		location.href = "/activity/cart?id="+id;
	}
</script>
</html>