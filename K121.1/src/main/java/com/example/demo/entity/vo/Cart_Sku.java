package com.example.demo.entity.vo;

import javax.persistence.Column;

import com.example.demo.utils.TimeUtil;

public class Cart_Sku {
	
	private Long id;		
	private String Oid;		//购买人Id
	private Long Sid;		//商品id
	private String title;	//商品名字
	private Integer num;	//商品数量
	private Integer status=0;	//是否购买 0未购买 1已购买
	private String addTime;	//添加数据时间
	
	
	private String bianma;//商品id
	private Double marketPrice;//市场价
	private Double price;//销售价
	private Double costPirce;//成本价
	private Integer availableStock;//可用库存
	private Integer frozenStock;//锁定库存   已下单 已付款 但是还未完全完成交易的库存
	private String guigeValueId1Name;//选项  颜色图片路径 
	private String skuMainPic;//预览图
	private String createTime;
	private String updateTime;
	private String guigeValueIdColorName;//选项  颜色名
	private Long guigeValueId1Id;//选项 规格名
	private String guigeValueId2Name;//选项 规格名
	private Long guigeValueId2Id;//选项 规格名id
	

	private String bigCategory;//大类
	private String smallCategory;//小类
	private String detail;//描述 图文描述 富文本
	private Long designerId;//设计师id 
	private int isDiscount;//0不是，1是   是否是打折产品
	private String discountDate;//活动时间
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getOid() {
		return Oid;
	}
	public void setOid(String oid) {
		Oid = oid;
	}
	public Long getSid() {
		return Sid;
	}
	public void setSid(Long sid) {
		Sid = sid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getAddTime() {
		return addTime;
	}
	public void setAddTime(String addTime) {
		this.addTime = addTime;
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
	@Override
	public String toString() {
		return "Cart_Sku [id=" + id + ", Oid=" + Oid + ", Sid=" + Sid + ", title=" + title + ", num=" + num
				+ ", status=" + status + ", addTime=" + addTime + ", bianma=" + bianma + ", marketPrice=" + marketPrice
				+ ", price=" + price + ", costPirce=" + costPirce + ", availableStock=" + availableStock
				+ ", frozenStock=" + frozenStock + ", guigeValueId1Name=" + guigeValueId1Name + ", skuMainPic="
				+ skuMainPic + ", createTime=" + createTime + ", updateTime=" + updateTime + ", guigeValueIdColorName="
				+ guigeValueIdColorName + ", guigeValueId1Id=" + guigeValueId1Id + ", guigeValueId2Name="
				+ guigeValueId2Name + ", guigeValueId2Id=" + guigeValueId2Id + ", bigCategory=" + bigCategory
				+ ", smallCategory=" + smallCategory + ", detail=" + detail + ", designerId=" + designerId
				+ ", isDiscount=" + isDiscount + ", discountDate=" + discountDate + "]";
	}
	
}
