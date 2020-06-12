package com.example.demo.entity.vo;

import javax.persistence.Column;

import com.example.demo.utils.TimeUtil;

public class evaluate_product {

	private Long productId;
	private Long skuId;
	private String message;
	private String img01;
	private String img02;
	private String img03;
	private String img04;
	private String img05;
	private String img06;
	private String oid;
	private String evaluateDate;
	private String unionId;
	private String webOpenId;
	private String officialOpenId;
	
	
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
	public Long getProductId() {
		return productId;
	}
	public void setProductId(Long productId) {
		this.productId = productId;
	}
	public Long getSkuId() {
		return skuId;
	}
	public void setSkuId(Long skuId) {
		this.skuId = skuId;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getImg01() {
		return img01;
	}
	public void setImg01(String img01) {
		this.img01 = img01;
	}
	public String getImg02() {
		return img02;
	}
	public void setImg02(String img02) {
		this.img02 = img02;
	}
	public String getImg03() {
		return img03;
	}
	public void setImg03(String img03) {
		this.img03 = img03;
	}
	public String getImg04() {
		return img04;
	}
	public void setImg04(String img04) {
		this.img04 = img04;
	}
	public String getImg05() {
		return img05;
	}
	public void setImg05(String img05) {
		this.img05 = img05;
	}
	public String getImg06() {
		return img06;
	}
	public void setImg06(String img06) {
		this.img06 = img06;
	}
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public String getEvaluateDate() {
		return evaluateDate;
	}
	public void setEvaluateDate(String evaluateDate) {
		this.evaluateDate = evaluateDate;
	}
	public String getUnionId() {
		return unionId;
	}
	public void setUnionId(String unionId) {
		this.unionId = unionId;
	}
	public String getWebOpenId() {
		return webOpenId;
	}
	public void setWebOpenId(String webOpenId) {
		this.webOpenId = webOpenId;
	}
	public String getOfficialOpenId() {
		return officialOpenId;
	}
	public void setOfficialOpenId(String officialOpenId) {
		this.officialOpenId = officialOpenId;
	}
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
	@Override
	public String toString() {
		return "evaluate_product [productId=" + productId + ", skuId=" + skuId + ", message=" + message + ", img01="
				+ img01 + ", img02=" + img02 + ", img03=" + img03 + ", img04=" + img04 + ", img05=" + img05 + ", img06="
				+ img06 + ", oid=" + oid + ", evaluateDate=" + evaluateDate + ", unionId=" + unionId + ", webOpenId="
				+ webOpenId + ", officialOpenId=" + officialOpenId + ", title=" + title + ", bigCategory=" + bigCategory
				+ ", smallCategory=" + smallCategory + ", productType=" + productType + ", detail=" + detail
				+ ", designerId=" + designerId + ", isDiscount=" + isDiscount + ", discountDate=" + discountDate
				+ ", img=" + img + ", createTime=" + createTime + ", updateTime=" + updateTime + ", bianma=" + bianma
				+ ", marketPrice=" + marketPrice + ", price=" + price + ", costPirce=" + costPirce + ", availableStock="
				+ availableStock + ", frozenStock=" + frozenStock + ", guigeValueId1Name=" + guigeValueId1Name
				+ ", skuMainPic=" + skuMainPic + ", guigeValueIdColorName=" + guigeValueIdColorName
				+ ", guigeValueId1Id=" + guigeValueId1Id + ", guigeValueId2Name=" + guigeValueId2Name
				+ ", guigeValueId2Id=" + guigeValueId2Id + "]";
	}
	
}
