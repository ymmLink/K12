<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>物流详情</title>
	<link href="/static/css/logistics.css" rel="stylesheet" type="text/css" />
	 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/jsp/w/web/header.jsp"%>
		<%@ include file="/WEB-INF/jsp/w/web/kong.jsp"%>
	</header>
	<div class="logistics">
		<div class="logistics_div">
			<div class="detail_jindu">
				<div class="detail_jindu_div">
					<div class="detail_jindu_div_title">收件员已收货</div>
					<div class="detail_jindu_div_img"><img alt="" src="../static/images/detail/pic1.png" style="width: calc(40px * 1);height: calc(40px * 1);"></div>
					<div class="detail_jindu_div_time">${time1 }</div>
				</div>
				<div class="line1"></div>
				<div class="detail_jindu_div">
					<div class="detail_jindu_div_title">包裹已打包</div>
					<div class="detail_jindu_div_img"><img alt="" src="../static/images/detail/pic1.png" style="width: calc(40px * 1);height: calc(40px * 1);"></div>
					<div class="detail_jindu_div_time">${time2 }</div>
				</div>
				<div class="line2"></div>
				<div class="detail_jindu_div">
					<div class="detail_jindu_div_title">货物运输中</div>
					<div class="detail_jindu_div_img"><img alt="" src="../static/images/detail/pic2.png" style="width: calc(26px * 1);height: calc(26px * 1);margin-top: 6px"></div>
					<div class="detail_jindu_div_time"></div>
				</div>
				<div class="line3"></div>
				<div class="detail_jindu_div">
					<div class="detail_jindu_div_title">货物配送中</div>
					<div class="detail_jindu_div_img"><img alt="" src="../static/images/detail/pic3.png" style="width: calc(26px * 1);height: calc(26px * 1);margin-top: 6px"></div>
					<div class="detail_jindu_div_time"></div>
				</div>
				<div class="line4"></div>
				<div class="detail_jindu_div">
					<div class="detail_jindu_div_title">签收成功</div>
					<div class="detail_jindu_div_img"><img alt="" src="../static/images/detail/pic3.png" style="width: calc(26px * 1);height: calc(26px * 1);margin-top: 6px"></div>
					<div class="detail_jindu_div_time"></div>
				</div>
			</div>
			<div class="detail_wuliuInfo">
				<div class="detail_wuliuInfo_title">
					<div class="detail_wuliuInfo_title_top">物流信息</div>
					<div class="detail_wuliuInfo_title_button">已收件</div>
				</div>
				<div class="detail_wuliuInfo_line"></div>
				<div class="detail_wuliuInfo_context">
					<div class="detail_wuliuInfo_context_address">
						<div class="title">收货地址：</div>
						<div class="address">${orderLogistics.contactAdress }</div>
						<div class="name">${orderLogistics.contactName }</div>
						<div class="phone">${orderLogistics.contactPhone }</div>
					</div>
					<div class="detail_wuliuInfo_context_mode">
						<div class="mode">发货方式：</div>
						<div class="mode_text">${orderLogistics.deliverModel }</div>
					</div>
					<div class="detail_wuliuInfo_context_num">
						<div class="num">运单号码：</div>
						<div class="num_text">${orderLogistics.logisticCode }</div>
					</div>
				</div>
				<div class="detail_wuliuInfo_line"></div>
				<div class="detail_wuliuInfo_text">
					<c:forEach items="${traceList}" var="u" varStatus="s">
					<div class="detail_wuliuInfo_info">
						<div><img alt="" src="../static/images/detail/pic5.png" style="margin-bottom: 3px;position: relative;top:-19px;"></div>
						<div class="wuliu_data">${u.acceptTime.substring(0,10) }</div>
						<!-- <div class="wuliu_week">周五</div> -->
						<div class="wuliu_time">${u.acceptTime.substring(10,19) }</div>
						<div class="wuliu_context">${u.acceptStation }</div>
					</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/w/web/mark.jsp"%>
	<%@ include file="/WEB-INF/jsp/w/web/footer.jsp"%>
</body>
</html>