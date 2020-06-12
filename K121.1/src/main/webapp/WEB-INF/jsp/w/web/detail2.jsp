<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>待发货详情</title>
	<link href="/static/css/detail2.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/jsp/w/web/header.jsp"%>
		<%@ include file="/WEB-INF/jsp/w/web/kong.jsp"%>
	</header>
	<div class="detail">
		<div class="detail_div">
			<div class="detail_jindu">
				<div class="detail_jindu_div">
					<div class="detail_jindu_div_title">提交订单</div>
					<div class="detail_jindu_div_img"><img alt="" src="../static/images/detail/pic1.png" style="width: calc(40px * 1);height: calc(40px * 1);"></div>
					<div class="detail_jindu_div_time">${details[0].orderDate }</div>
				</div>
				<div class="line1"></div>
				<div class="detail_jindu_div">
					<div class="detail_jindu_div_title">付款成功</div>
					<div class="detail_jindu_div_img"><img alt="" src="../static/images/detail/pic1.png" style="width: calc(40px * 1);height: calc(40px * 1);"></div>
					<div class="detail_jindu_div_time">${details[0].payDate }</div>
				</div>
				<div class="line2"></div>
				<div class="detail_jindu_div">
					<div class="detail_jindu_div_title">卖家发货</div>
					<div class="detail_jindu_div_img"><img alt="" src="../static/images/detail/pic2.png" style="width: calc(40px * 1);height: calc(40px * 1);"></div>
					<div class="detail_jindu_div_time"></div>
				</div>
				<div class="line3"></div>
				<div class="detail_jindu_div">
					<div class="detail_jindu_div_title">确认收货</div>
					<div class="detail_jindu_div_img"><img alt="" src="../static/images/detail/pic3.png" style="width: calc(26px * 1);height: calc(26px * 1);margin-top: 6px"></div>
					<div class="detail_jindu_div_time"></div>
				</div>
				<div class="line4"></div>
				<div class="detail_jindu_div">
					<div class="detail_jindu_div_title">评价</div>
					<div class="detail_jindu_div_img"><img alt="" src="../static/images/detail/pic3.png" style="width: calc(26px * 1);height: calc(26px * 1);margin-top: 6px"></div>
					<div class="detail_jindu_div_time"></div>
				</div>
			</div>
			<div class="detail_wuliuInfo">
				<div class="detail_wuliuInfo_title">
					<div class="detail_wuliuInfo_title_top">物流信息</div>
					<div class="detail_wuliuInfo_title_button"></div>
				</div>
				<div class="detail_wuliuInfo_line"></div>
				<div class="detail_wuliuInfo_context">
					<div class="detail_wuliuInfo_context_address">
						<div class="title">收货地址：</div>
						<div class="address">${details[0].contactAdress }</div>
						<div class="name">${details[0].contactName }</div>
						<div class="phone">${details[0].contactPhone }</div>
					</div>
					<!-- <div class="detail_wuliuInfo_context_mode">
						<div class="mode">发货方式：</div>
						<div class="mode_text">快递</div>
					</div> -->
					<!-- <div class="detail_wuliuInfo_context_num">
						<div class="num">运单号码：</div>
						<div class="num_text">201907021548963</div>
					</div> -->
				</div>
				<%-- <div class="detail_wuliuInfo_line"></div>
				<div class="detail_wuliuInfo_text">
					<!-- 循环这个div -->
					<div class="detail_wuliuInfo_info">
						<div><img alt="" src="../static/images/detail/pic4.png" style="width: 6px;height: 6px;margin-bottom: 3px"></div>
						<div class="wuliu_data">2019-07-05</div>
						<div class="wuliu_week">周五</div>
						<div class="wuliu_time">20:28:55</div>
						<div class="wuliu_context">包裹正在等待揽收</div>
					</div>
					<%for(int i=0;i<5;i++){%>
					<div class="detail_wuliuInfo_info">
						<div><img alt="" src="../static/images/detail/pic5.png" style="margin-bottom: 3px;position: relative;top:-19px;"></div>
						<div class="wuliu_data">2019-07-05</div>
						<div class="wuliu_week">周五</div>
						<div class="wuliu_time">20:28:55</div>
						<div class="wuliu_context">包裹正在等待揽收</div>
					</div>
					<% 
					} %>
					<div class="detail_wuliuInfo_info">
						<div style="margin-bottom: 3px;position: relative;top:-19px;right:4px;"><img alt="" src="../static/images/detail/pic7.png" ></div>
						<div class="wuliu_data" style="margin-left: 12px;">2019-07-05</div>
						<div class="wuliu_week">周五</div>
						<div class="wuliu_time">20:28:55</div>
						<div class="wuliu_context">包裹正在等待揽收</div>
					</div>
				</div> --%>
			</div>
			<div class="detail_orderInfo">
				<div class="cart_div">
					<div class="cart_title">订单信息</div>
					<div class="cart_line"></div>
					<div class="order_info">
						<div class="order_info_div">
							<div class="order_info_div_top">订单编号：</div>
							<div class="order_info_div_num">${details[0].oid }</div>
						</div>
						<div class="order_info_div">
							<div class="order_info_div_top">创建时间：</div>
							<div class="order_info_div_time">${details[0].orderDate}</div>
						</div>
						<div class="order_info_div">
							<div class="order_info_div_top">付款时间：</div>
							<div class="order_info_div_time_3">${details[0].payDate}</div>
						</div>
						<!-- <div class="order_info_div">
							<div class="order_info_div_top">发货时间：</div>
							<div class="order_info_div_time">2019-07-02 14:52:12</div>
						</div>
						<div class="order_info_div">
							<div class="order_info_div_top">成交时间：</div>
							<div class="order_info_div_time">2019-07-02 14:52:12</div>
						</div> -->
					</div>
					<div class="cart_line"></div>
					<div class="cart_img">
						<c:forEach items="${details}" var="u" varStatus="s">
						<div class="cart_img_context">
							<!-- <div class="cart_click"><img alt="" src="../static/images/cart/pic1.png" style="width:20px;height: 20px;"></div> -->
							<div class="cart_image"><img alt="" src="${u.skuMainPic }" style="width:calc(200px * 0.8928);height: calc(113px * 0.8928);"></div>
							<div class="cart_text">
								<div class="cart_text_top">${u.title }</div>
								<div class="cart_text_buttom">${u.guigeValueIdColorName }/${u.guigeValueId2Name }</div>
							</div>
							<div class="cart_price">
								<div class="cart_oldprice">￥${u.marketPrice }</div>
								<div class="cart_newprice">￥${u.price }</div>
							</div>
							<div class="cart_total">
								X${u.productNumber }
							</div>
							<div class="cart_shanchu">￥${u.productNumber*u.price }</div>
						</div>
					</c:forEach>
						<!-- <div class="cart_img_context">
							<div class="cart_click"><img alt="" src="../static/images/cart/pic1.png" style="width:20px;height: 20px;"></div>
							<div class="cart_image"><img alt="" src="../static/images/cart/pic2.png" style="width:calc(200px * 1);height: calc(113px * 1);"></div>
							<div class="cart_text">
								<div class="cart_text_top">云团沙发升级版</div>
								<div class="cart_text_buttom">灰白格/双人座右扶手</div>
							</div>
							<div class="cart_price">
								<div class="cart_oldprice">￥4599</div>
								<div class="cart_newprice">￥999</div>
							</div>
							<div class="cart_total">
								X1
							</div>
							<div class="cart_shanchu">￥4599</div>
						</div> -->
					</div>
					<div class="cart_line"></div>
					<div class="cart_buttom">
						<div class="shop_div">
							<div class="shop_allPrice">商品总价：</div>
							<div class="shop_price">￥${details[0].totol }</div>
						</div>
						<div class="shop_div">
							<div class="shop_allPrice">店铺优惠：</div>
							<div class="shop_price">￥${details[0].discount }</div>
						</div>
						<div class="shop_div">
							<div class="shop_real">实付款：</div>
							<div class="shop_real_div">￥${details[0].finalTotol }</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/w/web/mark.jsp"%>
	<%@ include file="/WEB-INF/jsp/w/web/footer.jsp"%>
</body>
</html>