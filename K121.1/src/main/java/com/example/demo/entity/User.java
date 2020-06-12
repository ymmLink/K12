package com.example.demo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * @author admin
 *
 */
@Entity
@Table(name="user")
@JsonIgnoreProperties(value={"hibernateLazyInitializer"}) 
public class User {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private String account;//账号
	private String password;//密码
	@Column(name="nick_name")
	private String nickName;//昵称
	@Column(name="avatar_url")
	private String avatarUrl;
	@Column(name="sex")
	private String sex;//2女，1男
	@Column(name="city")
	private String city;
	@Column(name="province")
	private String province;
	@Column(name="country")
	private String country;
	@Column(name="real_name")
	private String realName;
	@Column(name="phone_number")
	private String phoneNumber;
	@Column (name="email")
	private String email;
	private	String adress;//地址
	@Column(name="union_id")
	private String unionId;
	@Column (name="web_open_id")
	private String webOpenId;//网页openId
	@Column (name="official_open_id")
	private String officialOpenId;//公众号openId(此处作为qqopenid)
	private String zone;//地区
	private String uid;//该APP唯一id 手机号*。。
	private String signature;//个性签名
	private String identity;//身份
	private String stage;//年级
	private int guanzhu=0;//关注
	private int fans=0;//粉丝
	private int beCollect=0;//被收藏
	private int bePrint=0;//被打印
	private int coin;//上上币
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUnionId() {
		return unionId;
	}
	public void setUnionId(String unionId) {
		this.unionId = unionId;
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
	public String getAdress() {
		return adress;
	}
	public void setAdress(String adress) {
		this.adress = adress;
	}
	public String getZone() {
		return zone;
	}
	public void setZone(String zone) {
		this.zone = zone;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getSignature() {
		return signature;
	}
	public void setSignature(String signature) {
		this.signature = signature;
	}
	public String getIdentity() {
		return identity;
	}
	public void setIdentity(String identity) {
		this.identity = identity;
	}
	public String getStage() {
		return stage;
	}
	public void setStage(String stage) {
		this.stage = stage;
	}
	
	public int getGuanzhu() {
		return guanzhu;
	}
	public void setGuanzhu(int guanzhu) {
		this.guanzhu = guanzhu;
	}
	public int getFans() {
		return fans;
	}
	public void setFans(int fans) {
		this.fans = fans;
	}
	public int getBeCollect() {
		return beCollect;
	}
	public void setBeCollect(int beCollect) {
		this.beCollect = beCollect;
	}
	public int getBePrint() {
		return bePrint;
	}
	public void setBePrint(int bePrint) {
		this.bePrint = bePrint;
	}
	public int getCoin() {
		return coin;
	}
	public void setCoin(int coin) {
		this.coin = coin;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", account=" + account + ", password=" + password + ", nickName=" + nickName
				+ ", avatarUrl=" + avatarUrl + ", sex=" + sex + ", city=" + city + ", province=" + province
				+ ", country=" + country + ", realName=" + realName + ", phoneNumber=" + phoneNumber + ", email="
				+ email + ", adress=" + adress + ", unionId=" + unionId + ", webOpenId=" + webOpenId
				+ ", officialOpenId=" + officialOpenId + ", zone=" + zone + ", uid=" + uid + ", signature=" + signature
				+ ", identity=" + identity + ", stage=" + stage + ", guanzhu=" + guanzhu + ", fans=" + fans
				+ ", beCollect=" + beCollect + ", bePrint=" + bePrint + ", coin=" + coin + "]";
	}
	
	
	
}
