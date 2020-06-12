package com.example.demo.entity.vo;

import javax.persistence.Column;

import com.example.demo.utils.TimeUtil;

public class Order_Product {

	private String title;//标题 产品名
	private String bigCategory;//大类
	private String smallCategory;//小类
	private String detail;//描述 图文描述 富文本
	private Long designerId;//设计师id 
	private int isDiscount;//0不是，1是   是否是打折产品
	private String discountDate;//活动时间
	private String createTime=TimeUtil.getThisTime();//创建时间
	private String updateTime=TimeUtil.getThisTime();//修改时间
	private String img;//商品主图
	
	private String bianma;//商品id
	private Double marketPrice;//市场价
	private Double price;//销售价
	private Double costPirce;//成本价
	private Integer availableStock;//可用库存
	private Integer frozenStock;//锁定库存   已下单 已付款 但是还未完全完成交易的库存
	private String skuMainPic;//预览图
	private String guigeValueId1Name;//选项  图片路径
	private Long guigeValueId1Id;//选项 规格名
	private String guigeValueId2Name;//选项 规格名
	private Long guigeValueId2Id;//选项 规格名id
	private String guigeValueIdColorName;//选项  颜色名

	private Long productId;
	private int productNumber;
	private String oid;
	private Long skuId;
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
	public int getIsDiscount() {
		return isDiscount;
	}
	public void setIsDiscount(int isDiscount) {
		this.isDiscount = isDiscount;
	}
	public String getDiscountDate() {
		return discountDate;
	}
	public void setDiscountDate(String discountDate) {
		this.discountDate = discountDate;
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
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getBianma() {
		return bianma;
	}
	public void setBianma(String bianma) {
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
	public String getSkuMainPic() {
		return skuMainPic;
	}
	public void setSkuMainPic(String skuMainPic) {
		this.skuMainPic = skuMainPic;
	}
	public String getGuigeValueId1Name() {
		return guigeValueId1Name;
	}
	public void setGuigeValueId1Name(String guigeValueId1Name) {
		this.guigeValueId1Name = guigeValueId1Name;
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
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public Long getSkuId() {
		return skuId;
	}
	public void setSkuId(Long skuId) {
		this.skuId = skuId;
	}
	public String getGuigeValueIdColorName() {
		return guigeValueIdColorName;
	}
	public void setGuigeValueIdColorName(String guigeValueIdColorName) {
		this.guigeValueIdColorName = guigeValueIdColorName;
	}
	@Override
	public String toString() {
		return "Order_Product [title=" + title + ", bigCategory=" + bigCategory + ", smallCategory=" + smallCategory
				+ ", detail=" + detail + ", designerId=" + designerId + ", isDiscount=" + isDiscount + ", discountDate="
				+ discountDate + ", createTime=" + createTime + ", updateTime=" + updateTime + ", img=" + img
				+ ", bianma=" + bianma + ", marketPrice=" + marketPrice + ", price=" + price + ", costPirce="
				+ costPirce + ", availableStock=" + availableStock + ", frozenStock=" + frozenStock + ", skuMainPic="
				+ skuMainPic + ", guigeValueId1Name=" + guigeValueId1Name + ", guigeValueId1Id=" + guigeValueId1Id
				+ ", guigeValueId2Name=" + guigeValueId2Name + ", guigeValueId2Id=" + guigeValueId2Id
				+ ", guigeValueIdColorName=" + guigeValueIdColorName + ", productId=" + productId + ", productNumber="
				+ productNumber + ", oid=" + oid + ", skuId=" + skuId + "]";
	}
	
	
}
