package com.example.demo.entity.vo;

import javax.persistence.Column;

public class PJ_User {
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
	private Integer sunsheet=0; //0不晒       1晒
	
	
	
	private String nickName;
	private String avatarUrl;
	private String sex;
	private String city;
	private String province;
	private String country;
	private String realName;
	private String phoneNumber;
	private String email;
	private	String adress;
	
	
	private Long id;             //数据库中Id
	private String title;//标题 产品名
	private String img;
	private String bigCategory;//大类
	private String smallCategory;//小类
	private String detail;//描述 图文描述 富文本
	private Long designerId;//设计师id 
	private int isDiscount;//0不是，1是   是否是打折产品
	private String discountDate;//活动时间
	
	
	private Long sid;             //数据库中Id
	private String bianma;//商品id
	private Double marketPrice;//市场价
	private Double price;//销售价
	private Double costPirce;//成本价
	private Integer availableStock;//可用库存
	private Integer frozenStock;//锁定库存   已下单 已付款 但是还未完全完成交易的库存
	private String skuMainPic;//预览图
	private String createTime;
	private String updateTime;
	private String guigeValueId1Name;//选项  图片路径
	private Long guigeValueId1Id;//选项 规格名
	private String guigeValueId2Name;//选项 规格名
	private Long guigeValueId2Id;//选项 规格名id
	private String guigeValueIdColorName;//选项  颜色名
	
	
	private Integer num;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
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
	public Long getSid() {
		return sid;
	}
	public void setSid(Long sid) {
		this.sid = sid;
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
	public String getGuigeValueIdColorName() {
		return guigeValueIdColorName;
	}
	public void setGuigeValueIdColorName(String guigeValueIdColorName) {
		this.guigeValueIdColorName = guigeValueIdColorName;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
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
	public Integer getSunsheet() {
		return sunsheet;
	}
	public void setSunsheet(Integer sunsheet) {
		this.sunsheet = sunsheet;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getAvatarUrl() {
		return avatarUrl;
	}
	public void setAvatarUrl(String avatarUrl) {
		this.avatarUrl = avatarUrl;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAdress() {
		return adress;
	}
	public void setAdress(String adress) {
		this.adress = adress;
	}
	@Override
	public String toString() {
		return "PJ_User [productId=" + productId + ", skuId=" + skuId + ", message=" + message + ", img01=" + img01
				+ ", img02=" + img02 + ", img03=" + img03 + ", img04=" + img04 + ", img05=" + img05 + ", img06=" + img06
				+ ", oid=" + oid + ", evaluateDate=" + evaluateDate + ", unionId=" + unionId + ", webOpenId="
				+ webOpenId + ", officialOpenId=" + officialOpenId + ", sunsheet=" + sunsheet + ", nickName=" + nickName
				+ ", avatarUrl=" + avatarUrl + ", sex=" + sex + ", city=" + city + ", province=" + province
				+ ", country=" + country + ", realName=" + realName + ", phoneNumber=" + phoneNumber + ", email="
				+ email + ", adress=" + adress + ", id=" + id + ", title=" + title + ", img=" + img + ", bigCategory="
				+ bigCategory + ", smallCategory=" + smallCategory + ", detail=" + detail + ", designerId=" + designerId
				+ ", isDiscount=" + isDiscount + ", discountDate=" + discountDate + ", sid=" + sid + ", bianma="
				+ bianma + ", marketPrice=" + marketPrice + ", price=" + price + ", costPirce=" + costPirce
				+ ", availableStock=" + availableStock + ", frozenStock=" + frozenStock + ", skuMainPic=" + skuMainPic
				+ ", createTime=" + createTime + ", updateTime=" + updateTime + ", guigeValueId1Name="
				+ guigeValueId1Name + ", guigeValueId1Id=" + guigeValueId1Id + ", guigeValueId2Name="
				+ guigeValueId2Name + ", guigeValueId2Id=" + guigeValueId2Id + ", guigeValueIdColorName="
				+ guigeValueIdColorName + ", num=" + num + "]";
	}
	
	
	
}
