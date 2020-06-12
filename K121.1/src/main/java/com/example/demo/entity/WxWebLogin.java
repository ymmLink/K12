package com.example.demo.entity;

public class WxWebLogin {
	public static String AppID="wxca2f2b126efe2122";//网页
	public static String AppSecret="964fcefa7e3de808e4da01501ad5fbb0";
	public static String OfficialAppID="wx2a1c0b0831fa8d92";//公众号
	public static String OfficialAppSecret="19fbe4d974de13ecf1e7dead6cbde9ee";
	public static String getAppID() {
		return AppID;
	}
	public static void setAppID(String appID) {
		AppID = appID;
	}
	public static String getAppSecret() {
		return AppSecret;
	}
	public static void setAppSecret(String appSecret) {
		AppSecret = appSecret;
	}
	public static String getOfficialAppID() {
		return OfficialAppID;
	}
	public static void setOfficialAppID(String officialAppID) {
		OfficialAppID = officialAppID;
	}
	public static String getOfficialAppSecret() {
		return OfficialAppSecret;
	}
	public static void setOfficialAppSecret(String officialAppSecret) {
		OfficialAppSecret = officialAppSecret;
	}
}
