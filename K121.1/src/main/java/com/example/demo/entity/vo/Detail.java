package com.example.demo.entity.vo;

import javax.persistence.Column;

import com.example.demo.utils.TimeUtil;

public class Detail {
	
	private String title;//标题 产品名
	private String bigCategory;//大类/ 名字
	private String smallCategory;//小类 //商品种类 名字
	private Long productType;//商品种类 ID
	private String detail;//描述 图文描述 富文本
	private Long designerId;//设计师id 
	private Integer isDiscount=0;//0不是，1是   是否是打折产品
	private String discountDate;//活动时间 截止时间
	private String img;//商品主图
	private String createTime=TimeUtil.getThisTime();//创建时间
	private String updateTime=TimeUtil.getThisTime();//修改时间
	
	
	private Long bianma;//商品id
	private Double marketPrice;//市场价
	private Double price;//销售价
	private Double costPirce;//成本价
	private Integer availableStock;//可用库存
	private Integer frozenStock;//锁定库存   已下单 已付款 但是还未完全完成交易的库存
	private String guigeValueId1Name;//选项  颜色图片路径 
	private String skuMainPic;//预览图
	private String guigeValueIdColorName;//选项  颜色名
	private Long guigeValueId1Id;//选项 规格id
	private String guigeValueId2Name;//选项 规格名
	private Long guigeValueId2Id;//选项 规格名id
	
	
	private String oid;
	private String unionId;
	private String officialOpenId;
	private String webOpenId;
	private String orderDate;//下单时间
	private String payDate;//付款时间
	private String deliverDate;//发货时间
	private String ShipperCode;//快递公司简称
	private String LogisticCode;//物流单号
	private String receiveDate;//收货时间
	private String refundDate;//申请退款时间dispose_date
	private String disposeDate;//处理时间(同意或者不同意)
	private String finishRefundDate;//退款完成时间
	private String orderState;//订单状态
	private String totol;//原总额
	private String discount;//订单总折扣
	private String finalTotol;//折扣后订单总额
	private String contactName;
	private String contactPhone;
	private String contactAdress;
	private String deliverModel;//发货模式
	private String isRecieve;//是否收货 0未收货，1已收货
	private String refundExplain;//退款原因
	private String refundMoney;//退款金额
	private String disagreeReason;//商家不同意退款原因
	private String updataDate;//更新时间
	
	
	
	private Long productId;
	private int productNumber;
	private Long skuId;
	private Integer evaluate=0;  //0未评价  1  已评价
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBigCategory() {
		return bigCategory;
	}
	public void setBigCategory(String bigCategory) {
		this.bigCategory = bigCategory;
	}
	public String getSmallCategory() {
		return smallCategory;
	}
	public void setSmallCategory(String smallCategory) {
		this.smallCategory = smallCategory;
	}
	public Long getProductType() {
		return productType;
	}
	public void setProductType(Long productType) {
		this.productType = productType;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public Long getDesignerId() {
		return designerId;
	}
	public void setDesignerId(Long designerId) {
		this.designerId = designerId;
	}
	public Integer getIsDiscount() {
		return isDiscount;
	}
	public void setIsDiscount(Integer isDiscount) {
		this.isDiscount = isDiscount;
	}
	public String getDiscountDate() {
		return discountDate;
	}
	public void setDiscountDate(String discountDate) {
		this.discountDate = discountDate;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	public Long getBianma() {
		return bianma;
	}
	public void setBianma(Long bianma) {
		this.bianma = bianma;
	}
	public Double getMarketPrice() {
		return marketPrice;
	}
	public void setMarketPrice(Double marketPrice) {
		this.marketPrice = marketPrice;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Double getCostPirce() {
		return costPirce;
	}
	public void setCostPirce(Double costPirce) {
		this.costPirce = costPirce;
	}
	public Integer getAvailableStock() {
		return availableStock;
	}
	public void setAvailableStock(Integer availableStock) {
		this.availableStock = availableStock;
	}
	public Integer getFrozenStock() {
		return frozenStock;
	}
	public void setFrozenStock(Integer frozenStock) {
		this.frozenStock = frozenStock;
	}
	public String getGuigeValueId1Name() {
		return guigeValueId1Name;
	}
	public void setGuigeValueId1Name(String guigeValueId1Name) {
		this.guigeValueId1Name = guigeValueId1Name;
	}
	public String getSkuMainPic() {
		return skuMainPic;
	}
	public void setSkuMainPic(String skuMainPic) {
		this.skuMainPic = skuMainPic;
	}
	public String getGuigeValueIdColorName() {
		return guigeValueIdColorName;
	}
	public void setGuigeValueIdColorName(String guigeValueIdColorName) {
		this.guigeValueIdColorName = guigeValueIdColorName;
	}
	public Long getGuigeValueId1Id() {
		return guigeValueId1Id;
	}
	public void setGuigeValueId1Id(Long guigeValueId1Id) {
		this.guigeValueId1Id = guigeValueId1Id;
	}
	public String getGuigeValueId2Name() {
		return guigeValueId2Name;
	}
	public void setGuigeValueId2Name(String guigeValueId2Name) {
		this.guigeValueId2Name = guigeValueId2Name;
	}
	public Long getGuigeValueId2Id() {
		return guigeValueId2Id;
	}
	public void setGuigeValueId2Id(Long guigeValueId2Id) {
		this.guigeValueId2Id = guigeValueId2Id;
	}
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public String getUnionId() {
		return unionId;
	}
	public void setUnionId(String unionId) {
		this.unionId = unionId;
	}
	public String getOfficialOpenId() {
		return officialOpenId;
	}
	public void setOfficialOpenId(String officialOpenId) {
		this.officialOpenId = officialOpenId;
	}
	public String getWebOpenId() {
		return webOpenId;
	}
	public void setWebOpenId(String webOpenId) {
		this.webOpenId = webOpenId;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getPayDate() {
		return payDate;
	}
	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}
	public String getDeliverDate() {
		return deliverDate;
	}
	public void setDeliverDate(String deliverDate) {
		this.deliverDate = deliverDate;
	}
	public String getShipperCode() {
		return ShipperCode;
	}
	public void setShipperCode(String shipperCode) {
		ShipperCode = shipperCode;
	}
	public String getLogisticCode() {
		return LogisticCode;
	}
	public void setLogisticCode(String logisticCode) {
		LogisticCode = logisticCode;
	}
	public String getReceiveDate() {
		return receiveDate;
	}
	public void setReceiveDate(String receiveDate) {
		this.receiveDate = receiveDate;
	}
	public String getRefundDate() {
		return refundDate;
	}
	public void setRefundDate(String refundDate) {
		this.refundDate = refundDate;
	}
	public String getDisposeDate() {
		return disposeDate;
	}
	public void setDisposeDate(String disposeDate) {
		this.disposeDate = disposeDate;
	}
	public String getFinishRefundDate() {
		return finishRefundDate;
	}
	public void setFinishRefundDate(String finishRefundDate) {
		this.finishRefundDate = finishRefundDate;
	}
	public String getOrderState() {
		return orderState;
	}
	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}
	public String getTotol() {
		return totol;
	}
	public void setTotol(String totol) {
		this.totol = totol;
	}
	public String getDiscount() {
		return discount;
	}
	public void setDiscount(String discount) {
		this.discount = discount;
	}
	public String getFinalTotol() {
		return finalTotol;
	}
	public void setFinalTotol(String finalTotol) {
		this.finalTotol = finalTotol;
	}
	public String getContactName() {
		return contactName;
	}
	public void setContactName(String contactName) {
		this.contactName = contactName;
	}
	public String getContactPhone() {
		return contactPhone;
	}
	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}
	public String getContactAdress() {
		return contactAdress;
	}
	public void setContactAdress(String contactAdress) {
		this.contactAdress = contactAdress;
	}
	public String getDeliverModel() {
		return deliverModel;
	}
	public void setDeliverModel(String deliverModel) {
		this.deliverModel = deliverModel;
	}
	public String getIsRecieve() {
		return isRecieve;
	}
	public void setIsRecieve(String isRecieve) {
		this.isRecieve = isRecieve;
	}
	public String getRefundExplain() {
		return refundExplain;
	}
	public void setRefundExplain(String refundExplain) {
		this.refundExplain = refundExplain;
	}
	public String getRefundMoney() {
		return refundMoney;
	}
	public void setRefundMoney(String refundMoney) {
		this.refundMoney = refundMoney;
	}
	public String getDisagreeReason() {
		return disagreeReason;
	}
	public void setDisagreeReason(String disagreeReason) {
		this.disagreeReason = disagreeReason;
	}
	public String getUpdataDate() {
		return updataDate;
	}
	public void setUpdataDate(String updataDate) {
		this.updataDate = updataDate;
	}
	public Long getProductId() {
		return productId;
	}
	public void setProductId(Long productId) {
		this.productId = productId;
	}
	public int getProductNumber() {
		return productNumber;
	}
	public void setProductNumber(int productNumber) {
		this.productNumber = productNumber;
	}
	public Long getSkuId() {
		return skuId;
	}
	public void setSkuId(Long skuId) {
		this.skuId = skuId;
	}
	public Integer getEvaluate() {
		return evaluate;
	}
	public void setEvaluate(Integer evaluate) {
		this.evaluate = evaluate;
	}
	@Override
	public String toString() {
		return "Detail [title=" + title + ", bigCategory=" + bigCategory + ", smallCategory=" + smallCategory
				+ ", productType=" + productType + ", detail=" + detail + ", designerId=" + designerId + ", isDiscount="
				+ isDiscount + ", discountDate=" + discountDate + ", img=" + img + ", createTime=" + createTime
				+ ", updateTime=" + updateTime + ", bianma=" + bianma + ", marketPrice=" + marketPrice + ", price="
				+ price + ", costPirce=" + costPirce + ", availableStock=" + availableStock + ", frozenStock="
				+ frozenStock + ", guigeValueId1Name=" + guigeValueId1Name + ", skuMainPic=" + skuMainPic
				+ ", guigeValueIdColorName=" + guigeValueIdColorName + ", guigeValueId1Id=" + guigeValueId1Id
				+ ", guigeValueId2Name=" + guigeValueId2Name + ", guigeValueId2Id=" + guigeValueId2Id + ", oid=" + oid
				+ ", unionId=" + unionId + ", officialOpenId=" + officialOpenId + ", webOpenId=" + webOpenId
				+ ", orderDate=" + orderDate + ", payDate=" + payDate + ", deliverDate=" + deliverDate
				+ ", ShipperCode=" + ShipperCode + ", LogisticCode=" + LogisticCode + ", receiveDate=" + receiveDate
				+ ", refundDate=" + refundDate + ", disposeDate=" + disposeDate + ", finishRefundDate="
				+ finishRefundDate + ", orderState=" + orderState + ", totol=" + totol + ", discount=" + discount
				+ ", finalTotol=" + finalTotol + ", contactName=" + contactName + ", contactPhone=" + contactPhone
				+ ", contactAdress=" + contactAdress + ", deliverModel=" + deliverModel + ", isRecieve=" + isRecieve
				+ ", refundExplain=" + refundExplain + ", refundMoney=" + refundMoney + ", disagreeReason="
				+ disagreeReason + ", updataDate=" + updataDate + ", productId=" + productId + ", productNumber="
				+ productNumber + ", skuId=" + skuId + ", evaluate=" + evaluate + "]";
	}
	
}
