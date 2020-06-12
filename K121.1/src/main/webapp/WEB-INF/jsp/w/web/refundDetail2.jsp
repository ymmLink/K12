<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>退款详情已经完成</title>
	<link href="/static/css/refundDetail2.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/jsp/w/web/header.jsp"%>
		<%@ include file="/WEB-INF/jsp/w/web/kong.jsp"%>
	</header>
	<div class="refundDetail">
		<div class="refundDetail_div">
			<div class="detail_jindu">
				<div class="detail_jindu_div">
					<div class="detail_jindu_div_title">提交退款申请</div>
					<div class="detail_jindu_div_img"><img alt="" src="../static/images/detail/pic1.png" style="width: calc(40px * 1);height: calc(40px * 1);"></div>
					<div class="detail_jindu_div_time">${refurnds[0].refundDate }</div>
				</div>
				<div class="line1"></div>
				<div class="detail_jindu_div">
					<div class="detail_jindu_div_title">退款受理中</div>
					<div class="detail_jindu_div_img"><img alt="" src="../static/images/detail/pic1.png" style="width: calc(40px * 1);height: calc(40px * 1);"></div>
					<div class="detail_jindu_div_time">${refurnds[0].refundDate }</div>
				</div>
				<div class="line2"></div>
				<div class="detail_jindu_div">
					<div class="detail_jindu_div_title">商家同意退款</div>
					<div class="detail_jindu_div_img"><img alt="" src="../static/images/detail/pic1.png" style="width: calc(40px * 1);height: calc(40px * 1);"></div>
					<div class="detail_jindu_div_time">${refurnds[0].disposeDate }</div>
				</div>
				<div class="line3"></div>
				<div class="detail_jindu_div">
					<div class="detail_jindu_div_title">退款成功</div>
					<div class="detail_jindu_div_img"><img alt="" src="../static/images/detail/pic2.png" style="width: calc(40px * 1);height: calc(40px * 1);"></div>
					<div class="detail_jindu_div_time"></div>
				</div>
			</div>
			<div class="refundDetail_zhong">
				<div class="refundDetail_zhong_label">订单信息</div>

				<div class="cart_line"></div>
				<div class="cart_img">
				<c:forEach items="${refurnds}" var="u" varStatus="s">
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
						<div class="shop_price">￥${refurnds[0].totol }</div>
					</div>
					<div class="shop_div">
						<div class="shop_allPrice">店铺优惠：</div>
						<div class="shop_price">￥${refurnds[0].discount }</div>
					</div>
					<div class="shop_div">
						<div class="shop_real">实付款：</div>
						<div class="shop_real_div">￥${refurnds[0].finalTotol }</div>
					</div>
				</div>
				
			</div>
			<div class="refundDetail_buttom">
				<div class="refundDetail_zhong_label">退货详情</div>
				<div class="cart_line"></div>
				<div class="refunDetail_buttom_div_top">
					<div class="refundDetail_buttom_text">
						<div class="label">是否收到货物</div>
						<div class="text">
							<c:if test="${refurnds[0].isRecieve==0}">未收到货物</c:if>
							<c:if test="${refurnds[0].isRecieve==1}">已收到货物</c:if>
						</div>
					</div>
					<div class="refundDetail_buttom_text">
						<div class="label">退款说明</div>
						<div class="text">${refurnds[0].refundExplain}</div>
					</div>
					<div class="refundDetail_buttom_text">
						<div class="label">退款金额</div>
						<div class="price">￥${refurnds[0].finalTotol }</div>
					</div>
					
				</div>
				<div class="cart_line"></div> 
				<div class="refunDetail_buttom_div_top">
					<div class="refundDetail_buttom_text">
						<div class="label">订单编号:</div>
						<div class="text">${refurnds[0].oid }</div>
					</div>
					<div class="refundDetail_buttom_text">
						<div class="label">创建时间:</div>
						<div class="text">${refurnds[0].orderDate}</div>
					</div>
					<div class="refundDetail_buttom_text">
						<div class="label">付款时间:</div>
						<div class="text">${refurnds[0].payDate}</div>
					</div>
					<div class="refundDetail_buttom_text">
						<div class="label">发货时间:</div>
						<div class="text">${refurnds[0].deliverDate}</div>
					</div>
					<div class="refundDetail_buttom_text">
						<div class="label">申请退款时间:</div>
						<div class="text">${refurnds[0].refundDate}</div>
					</div>
					<%-- <div class="refundDetail_buttom_text">
						<div class="label">退款完成时间:</div>
						<div class="text">${refurnds[0].finishRefundDate}</div>
					</div> --%>
				</div>
			</div>
			
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/w/web/mark.jsp"%>
	<%@ include file="/WEB-INF/jsp/w/web/footer.jsp"%>
</body>
</html>