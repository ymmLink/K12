package com.example.demo.utils;

import java.io.File;
import java.io.IOException;
import java.util.Hashtable;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;

/**
 * 生成二维码
 */
public class MakeQrCode {
	private static String root="c://images";
	private static String root2="d://picture";
	/**
	 * @param url   二维码的地址
	 * @return
	 * @throws IOException
	 */
	public static String makeerweima(String url) throws IOException {
		//生成二维码
		//二维码路径
		//String text = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx3de1b3c3b550363d&redirect_uri=http%3a%2f%2fxbxy.xmyunxin.com%2fproduct!findall1.action%3fhuojia.id%3d"
		//	+id+"&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect";
		int width = 300;
		int height = 300;
		// 二维码的图片格式
		String format = "jpg";
		Hashtable<EncodeHintType, String> hints = new Hashtable<EncodeHintType, String>();
		// 内容所使用编码
		hints.put(EncodeHintType.CHARACTER_SET, "utf-8");
		BitMatrix bitMatrix = null;
		try {
			bitMatrix = new MultiFormatWriter().encode(url,
					BarcodeFormat.QR_CODE, width, height, hints);
		} catch (WriterException e1) {
			e1.printStackTrace();
		}
		// 生成二维码
		//String root = ServletActionContext.getServletContext().getRealPath(
		//		"/upload");
		File outputFile = new File(root + File.separator
				+ System.currentTimeMillis() + ".jpg");
		MatrixToImageWriter.writeToFile(bitMatrix, format, outputFile);
		return "/images/"+ outputFile.getName();
	}
	public static String makeerweima2(String url,String openId) throws IOException {
		//生成二维码
		//二维码路径
		//String text = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx3de1b3c3b550363d&redirect_uri=http%3a%2f%2fxbxy.xmyunxin.com%2fproduct!findall1.action%3fhuojia.id%3d"
		//	+id+"&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect";
		int width = 300;
		int height = 300;
		// 二维码的图片格式
		String format = "jpg";
		Hashtable<EncodeHintType, String> hints = new Hashtable<EncodeHintType, String>();
		// 内容所使用编码
		hints.put(EncodeHintType.CHARACTER_SET, "utf-8");
		BitMatrix bitMatrix = null;
		try {
			bitMatrix = new MultiFormatWriter().encode(url,
					BarcodeFormat.QR_CODE, width, height, hints);
		} catch (WriterException e1) {
			e1.printStackTrace();
		}
		// 生成二维码
		//String root = ServletActionContext.getServletContext().getRealPath(
		//		"/upload");
		File outputFile = new File(root + File.separator
				+ openId + ".jpg");
		MatrixToImageWriter.writeToFile(bitMatrix, format, outputFile);
		url="images/"+ outputFile.getName();
		return url;
	}
//	public static void main(String[] args) {
//		try {
//			makeerweima("https://www.baidu.com");//OK
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
//	}
}
